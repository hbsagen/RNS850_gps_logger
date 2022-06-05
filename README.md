# RNS850 GPS Logger
Logs the position of the car to a SD card.  
There are two versions, Appending and NewFile:  
Appending creates one GPS file and appends every trip to this file.  
NewFile creates a new file for each trip.  
Either versions create a Position files (or more) in the gps-log directory on the SD card.


# Usage  
Copy either the content of NewFile or Appending to the root of a FAT32 SD card.  
Wait 3 - 4 minutes after boot of RNS850 before inserting SD card. A VW logo will appear after a few seconds. Press a button or twist a knob on the RNS850 to remove the VW logo and start the script.  
This must be done after every restart of the RNS850. I am working on a solution for permanent logging.

# Converting the Positions file to a .gpx file
Drag the Positions file from the gps-log directory on the SD card to the "drop_Positions_here.bat" file (on your computer). Make sure the "Positions_to_gpx.py" is in the same folder as hte .bat file.  
The .gpx file can the be imported to a maaping tool, as ArcGis Pro or other software.
