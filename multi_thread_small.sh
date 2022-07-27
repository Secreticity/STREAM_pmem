echo "" > thread_increment_small_file_pmem-triad.txt

for var in {1..80}
do
	/home/kau/STREAM/autoscript.sh 1 $var | grep Copy: | cut -d ':' -f2 | cut -d '.' -f1 | xargs >> thread_increment_small_file_pmem-copy.txt
	echo $var
done
