#!/bin/sh

#echo "About to sync folders"

sudo rsync -rtvu --delete /home/pi/Desktop/TAA/ /home/pi/Desktop/TAACPY/ 

#echo "Folder sync complete :)"

# get rid of the cursor so we don't see it when videos are running
setterm -cursor off

# set here the path to the directory containing your videos
VIDEOPATH="/home/pi/Desktop/TAACPY/limpopo" 

# you can normally leave this alone
SERVICE="omxplayer"

# now for our infinite loop!
# COUNTER=0

# #echo $COUNTER >> /home/pi/Desktop/TAACPY/report.txt

while true; do
	# #echo $COUNTER >> /home/pi/Desktop/TAACPY/report.txt
	# if [ "$COUNTER" -eq 3 ]
	# then
        	# #echo "Copying Files" > /home/pi/Desktop/TAACPY/report.txt
        	# sudo cp -R /home/pi/Desktop/TAA/* /home/pi/Desktop/TAACPY
	# fi
	# COUNTER=$[$COUNTER +1]

	#let COUNTER+=1
        #if [$COUNTER -eq 2]
        #then
	##echo "Copying Files (**,)" >> /home/pi/Desktop/TAACPY/report.txt
        #sudo cp -R /home/pi/Desktop/TAA/* /home/pi/Desktop/TAACPY
	#fi

        if ps ax | grep -v grep | grep $SERVICE > /dev/null
        then
        sleep 1;
else
        for entry in $VIDEOPATH/*
        do
                clear
                omxplayer -o hdmi $entry > /dev/null
		AFRICA="$(TZ='Africa/Johannesburg' date)"
		echo "Played video: $entry at $(AFRICA)" >> /home/pi/Desktop/TAA/report_five.txt
        done
fi

#echo "About to sync folders"

sudo rsync -rtvu --delete /home/pi/Desktop/TAA/ /home/pi/Desktop/TAACPY/

#echo "Folder sync complete :)"

done
