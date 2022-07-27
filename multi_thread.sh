echo "" > thread_increment_large_file_pmem-copyR.txt
echo "" > thread_increment_large_file_pmem-copyW.txt

for var in {1..10}
do
	/home/kau/STREAM_FRW/autoscript.sh 52 $var > tmp.txt
	cat tmp.txt | grep Read: | cut -d ':' -f2 | cut -d '.' -f1 | xargs >> thread_increment_large_file_pmem-copyR.txt
	cat tmp.txt | grep Write: | cut -d ':' -f2 | cut -d '.' -f1 | xargs >> thread_increment_large_file_pmem-copyW.txt
	echo $var
done
