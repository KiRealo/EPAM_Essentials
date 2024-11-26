#! /bin/bash

echo "Please, write name of file: "
read fileName

cat poem > $fileName
cat poem
echo "Task finished" >&2
