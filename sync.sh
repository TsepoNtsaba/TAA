AFRICA="$(TZ='Africa/Johannesburg' date)"
wget -q --tries=0 --timeout=20 --spider http://google.com
if [[ $? -eq 0 ]]; then
	echo "Raspberry pi number one is ONLINE on ${AFRICA}" >> /home/pi/Desktop/TAA/report_one.txt
else
	echo "Raspberry pi number one is OFFLINE on ${AFRICA}" >> /home/pi/Desktop/TAA/report_one.txt
fi

cd /home/pi/Downloads/copy/armv6h
./CopyConsole -daemon -u=transportaa100@gmail.com -p='transport100' -root=/home/pi/Desktop/TAA/ 


