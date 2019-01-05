#!/bin/bash -i

. ~/.bashrc

fastq=$1
prefix=$2
startk=$3


if [ ! $# -eq 3 ]
then
	echo -e "The script takes exactly three arguments: 1) input fastq file 2) prefix for output files 3) start k-mer length"
	echo -e "Example: ./bless_iterate_over_ks.sh seqs.fastq.gz prefix 21"
	exit 1
fi


#######

endk=$(( startk + 20 ))
kmercountok=0
ok=0
k=$startk
while [ $ok -eq 0 ]
do
	echo -e "\n$(date)\tRunning bless with k=$k\n"
	#/src/bless/v1p02/bless -read $fastq -kmerlength $k -notrim -prefix $prefix-k$k > bless-k$k.log	
	bless -read $fastq -kmerlength $k -notrim -prefix $prefix-k$k > bless-k$k.log	

	count=$(ls -hlrt bless-k* |wc -l)

	if [ "$kmercountok" -eq 0 ]
	then
		kmercount=$(cat bless-k$k.log | grep "Number of unique solid k-mers" | perl -ne 'chomp; @a=split(" "); print "$a[-1]\n"')
		echo -e "$(date)\tNumber of unique solid k-mers (k=$k): Ns = $kmercount"
		#check if number of kmers/4^k < 0.0001
		out=$(echo $(cat bless-k$k.log | grep "k-mer length" | perl -ne 'chomp; @a=split(" "); print "$a[-1]\n"') $kmercount | perl -ne 'chomp; @a=split(" "); $res=($a[1]/(4**$a[0])); if ($res < 0.0001){print "$res -> OK!\n"}else{print "$res -> NOT OK!\n"}')
		echo -e "$(date)\tChecking criterion: Ns / 4 ^ k < 0.0001 .."
		echo -e "$(date)\t$kmercount / 4 ^ $k = $out"
		if [ "$(echo "$out" | grep "NOT" |wc -l)" -eq "0" ]
		then
			kmercountok=1
			echo -e "$(date)\tWill now search for the k-mer length at which the number of corrected bases is maximal"
		else
			rm -v $prefix-k$k*
		fi
		echo -e "$(date)\tmoving on to next k"
		
	else
		first=$(ls -hrlt bless-k* | tail -n 2 | perl -ne 'chomp; @a=split(" "); print "$a[-1]\n"'| head -n 1)
		second=$(ls -hrlt bless-k* | tail -n 2 | perl -ne 'chomp; @a=split(" "); print "$a[-1]\n"'| tail -n 1)
		#echo $first $second
		firstk=$(cat $first | grep "k-mer length" | perl -ne 'chomp; @a=split(" "); print "$a[-1]\n"')
		secondk=$(cat $second | grep "k-mer length" | perl -ne 'chomp; @a=split(" "); print "$a[-1]\n"')
		#echo $firstk $secondk
		firstcount=$(cat $first | grep "Number of corrected errors" | perl -ne 'chomp; @a=split(" "); print "$a[-1]\n"')
		secondcount=$(cat $second | grep "Number of corrected errors" | perl -ne 'chomp; @a=split(" "); print "$a[-1]\n"')
		#echo $firstcount $secondcount

		echo -e "$(date)\tChecking number of corrected errors - k=$firstk vs. k=$secondk"
		
		if [ "$firstcount" -gt "$secondcount" ]
		then
			echo -e "$(date)\t$firstk is the winner - $firstcount > $secondcount"
			echo -e "$(date)\tDone!\n"
			rm $prefix-k$secondk*
			ok=1
		else
			echo -e "$(date)\t$secondk is the winner - $firstcount < $secondcount"
			echo -e "$(date)\tmoving on to next k"
			rm $prefix-k$firstk*
		fi

	fi

	if [ "$(( k + 2 ))" -gt "$endk" ]
	then
		ok=1
		echo -e "Reached upper k-mer limit ($endk)\n"
	fi

	k=$(( k + 2 ))

done

