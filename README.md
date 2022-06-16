# RNS850 GPS Logger
Based on the work of [Mafketel](https://github.com/Mafketel/audi-mmi-3g-gps-logging)  

Logs the position of the car to a SD card.  
There are three versions, Appending, NewFile and AlwaysOn:
Appending creates one GPS file and appends every trip to this file.  
NewFile creates a new file for each trip.  
Either versions create a Position files (or more) in the gps-log directory on the SD card.  
AlwaysOn uses a 2nd SD card in slot 2, and will always start witht the RNS850 without the user doing anything.  
AlwaysOn logs to the root of the SD card in slot 2 in a file called Positions



# Usage for Appending or NewFile
Copy either the content of NewFile or Appending to the root of a FAT32 SD card.  
Wait 3 - 4 minutes after boot of RNS850 before inserting SD card. A VW logo will appear after a few seconds. Press a button or twist a knob on the RNS850 to remove the VW logo and start the script.  
This must be done after every restart of the RNS850. I am working on a solution for permanent logging.

# Usage for AlwaysOn
AlwaysOn need to be installed to the RNS850  
1. Insert an empty SD card in slot 2, formatted as FAT32
2. Copy the files from AlwyasOn to the root of another SD card
3. Run the files as they are from slot 1, wait for the confirmation (upside down VW logo)
4. Insert the SD card from slot 1 into a computer. Open the file "paths" on the SD card
5. See if you can find "/mnt/sdcard20/", if it's there, continue
6. Move the run.sh from the folder 2 to the root, overwriting the run.sh already there
7. Insert the SD card in slot 1 and wait for the confirmation (upside down VW logo)
8. After reebooting the RNS850 should log the positions to the card in slot 2

If you could not find "/mnt/sdcard20/" in the paths folder, you need to change the "/mnt/sdcard20/" in nav/run_gemmi.sh to the ones you have at line 15 and 17. There will be two entires, one is correct, the other is for slot 2. Then continue with point 6.  


# Converting the Positions file to a .gpx file
Drag the Positions file from the gps-log directory on the SD card to the "drop_Positions_here.bat" file (on your computer). Make sure the "Positions_to_gpx.py" is in the same folder as hte .bat file.  
The .gpx file can the be imported to a maaping tool, as ArcGis Pro or other software.

# Other possible values to log:
Change $dstPath and $gpsindex as needed.  
  
cat /dev/ndr/name/sensor/Accelerometer/Internal3Daccelerometer >> "$dstPath/gps-log/Internal3Daccelerometer$gpsindex" &  
cat /dev/ndr/name/sensor/GPS/AllGps >> "$dstPath/gps-log/AllGps$gpsindex" &  
cat /dev/ndr/name/sensor/GPS/AntennaState >> "$dstPath/ndrnamesensor/AntennaState" &  
cat /dev/ndr/name/sensor/GPS/Date >> "$dstPath/ndrnamesensor/Date" &  
cat /dev/ndr/name/sensor/GPS/EastSpeed >> "$dstPath/ndrnamesensor/EastSpeed" &  
cat /dev/ndr/name/sensor/GPS/Fix >> "$dstPath/ndrnamesensor/Fix" &  
cat /dev/ndr/name/sensor/GPS/HDOP >> "$dstPath/ndrnamesensor/HDOP" &  
cat /dev/ndr/name/sensor/GPS/Heading >> "$dstPath/ndrnamesensor/Heading" &  
cat /dev/ndr/name/sensor/GPS/Height >> "$dstPath/ndrnamesensor/Height" &  
cat /dev/ndr/name/sensor/GPS/HorizontalPositionError >> "$dstPath/ndrnamesensor/HorizontalPositionError" &  
cat /dev/ndr/name/sensor/GPS/Latitude >> "$dstPath/ndrnamesensor/Latitude" &  
cat /dev/ndr/name/sensor/GPS/Longitude >> "$dstPath/ndrnamesensor/Longitude" &  
cat /dev/ndr/name/sensor/GPS/LowLevel >> "$dstPath/ndrnamesensor/LowLevel" &  
cat /dev/ndr/name/sensor/GPS/NorthSpeed >> "$dstPath/ndrnamesensor/NorthSpeed" &  
cat /dev/ndr/name/sensor/GPS/PDOP >> "$dstPath/ndrnamesensor/PDOP" &  
cat /dev/ndr/name/sensor/GPS/SatelliteInfo >> "$dstPath/ndrnamesensor/SatelliteInfo" &  
cat /dev/ndr/name/sensor/GPS/SatellitesUsed >> "$dstPath/ndrnamesensor/SatellitesUsed" &  
cat /dev/ndr/name/sensor/GPS/SatellitesVisible >> "$dstPath/ndrnamesensor/SatellitesVisible" &  
cat /dev/ndr/name/sensor/GPS/SignalQuality >> "$dstPath/ndrnamesensor/SignalQuality" &  
cat /dev/ndr/name/sensor/GPS/Speed >> "$dstPath/ndrnamesensor/Speed" &  
cat /dev/ndr/name/sensor/GPS/Time >> "$dstPath/ndrnamesensor/Time" &  
cat /dev/ndr/name/sensor/GPS/VDOP >> "$dstPath/ndrnamesensor/VDOP" &  
cat /dev/ndr/name/sensor/GPS/VerticalPositionError >> "$dstPath/ndrnamesensor/VerticalPositionError" &  
cat /dev/ndr/name/sensor/GPS/VerticalSpeed >> "$dstPath/ndrnamesensor/VerticalSpeed" &  
cat /dev/ndr/name/sensor/Gyro/InternalGyro >> "$dstPath/gps-log/InternalGyro$gpsindex" &  
cat /dev/ndr/name/sensor/Version/Date >> "$dstPath/ndrnamesensor/versiondate" &  
cat /dev/ndr/name/sensor/Version/Identifier >> "$dstPath/ndrnamesensor/versionIdentifier" &  
cat /dev/ndr/name/sensor/WheelCounter/AllWheels >> "$dstPath/gps-log/AllWheels$gpsindex" &  
cat /dev/ndr/name/sensor/ReverseGear >> "$dstPath/gps-log/ReverseGear$gpsindex" &  
cat /dev/ndr/name/sensor/Temperature >> "$dstPath/gps-log/Temperature$gpsindex" &  
