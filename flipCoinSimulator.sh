headsCount=0
tailsCount=0

while [ 5 -eq 5 ]
do
	flip=$(($RANDOM%2))
	if [ $flip -eq 1 ]
	then
		headsCount=$(($headsCount+1))
	else
		tailsCount=$(($tailsCount+1))
	fi
	if [ $headsCount -eq 21 ] || [ $tailsCount -eq 21 ]
	then
		break
	fi
done

if [ $headsCount -eq $tailsCount ]
then
	echo "Heads=Tails. So it's a TIE"
elif [ $headsCount -gt $tailsCount ]
then
	echo "Heads win on Tails by "$(($headsCount-$tailsCount))
else
	echo "Tails win on Heads by "$(($tailsCount-$headsCount))
fi
