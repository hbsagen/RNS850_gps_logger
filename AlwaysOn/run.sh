sdcard=`ls /mnt|grep sdcard.*t`

SDPath=/mnt/$sdcard

mount -u $SDPath

$SDPath/_utils/showScreen $SDPath/_screens/scriptStart.png

#BoS ---------------------------------------

mount -uw /mnt/efs-system
mount -uw /mnt/nav

cp -V -r /mnt/nav/gemmi/run_gemmi.sh $SDPath/backup/

df / >> "$SDPath/paths"

#EoS ------------------------------------------------------

$SDPath/_utils/showScreen $SDPath/_screens/scriptDone.png
