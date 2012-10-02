#!/bin/sh

DELETE=/bin/rm
dir=/home/admin/papertrailarchive/

if [ -d "$dir" ]; then
	s3cmd sync s3://papertrailarchive.mysquawkbox.com/ $dir --skip-existing
	find /home/admin/papertrailarchive/papertrail/ -type f -mtime +3 | xargs $DELETE -f
	echo "Sync from s3 Papertrail Log to storm successful"
else
	#mkdir $dir
	#s3cmd sync s3://papertrailarchive.mysquawkbox.com/ $dir --skip-existing
	echo "Sync from s3 Papertrail Log not successful"
fi
