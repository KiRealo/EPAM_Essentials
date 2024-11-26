#! /bin/bash/

echo "write file name: "
read input
size=$(stat -c %s "$input") | sizeKB=$((size / 1000))
echo $sizeKB
until [ $sizeKB -gt 1024 ]; do
	sizeKB=$((sizeKB * 2))
	echo $sizeKB
done


