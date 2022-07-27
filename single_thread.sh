dtype="pmem"

echo "" > single_node_${dtype}W.txt
echo "" > single_node_${dtype}R.txt

for var in {65..1300..65}
do
	/home/kau/STREAM_FRW/autoscript.sh $var 1 > tmp.txt
	cat tmp.txt | grep Write: | cut -d ':' -f2 | cut -d '.' -f1 | xargs >> single_node_${dtype}W.txt
	cat tmp.txt | grep Read: | cut -d ':' -f2 | cut -d '.' -f1 | xargs >> single_node_${dtype}R.txt
	echo $var
done
