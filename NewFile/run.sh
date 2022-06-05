sdcard=`ls /mnt|grep sdcard.*t`

SDPath=/mnt/$sdcard

mount -u $SDPath

$SDPath/_utils/showScreen $SDPath/_screens/scriptStart.png

mount -uw /mnt/efs-system

gpsindex=`cat "$SDPath/gps-log/gpsindex.txt"`

gpsindex=$(($gpsindex+1))

echo -ne "$gpsindex" > $SDPath/gps-log/gpsindex.txt

cat /dev/ndr/name/sensor/GPS/AllGps >> "$SDPath/gps-log/Positions$gpsindex" &