#! /bin/bash

if test -z `which mediainfo`; then
	echo "install mediainfo" && exit
fi

if test ! -z $1; then
	if test -d $1; then
		dirname=$1
	else
		echo "first parameter must be a directory" && exit
	fi
else
	echo "error: directory name required" && exit
fi

output="list.csv"

if test -f ${output}; then
	if test ! -w ${output}; then
		echo "cant write in output file ${output}"
	fi
fi

echo "\"Filename\";\"Extension\";\"Size\";\"Change time\";\"Duration\"" > ${output}

ls -a ${dirname} | while read file; do

	if test "${file}" != "." && test "${file}" != ".."; then
		#if test ! -d "${dirname}/${file}"; then
			extension=`echo ${file} | grep "\." | sed -e 's/.*\.//i'`
			fileinfo=`ls -ld "${dirname}/${file}"`
			size=`echo ${fileinfo} | awk '{print $5/1024 " KiB"}'`
			changetime=`echo ${fileinfo} | awk '{print $6 " " $7 " " $8}'`
			duration=`mediainfo "${dirname}/${file}" | egrep '^Duration' | sed -e 's/.*:.//i'`
			echo "\"${file}\";\"${extension}\";\"${size}\";\"${changetime}\";\"${duration}\"" >> ${output}
		#fi
	fi

done
