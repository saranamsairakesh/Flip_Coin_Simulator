headsCount=0
tailsCount=0

for((i=1;i<=10;i++))
do
	flip=$(($RANDOM%2))
	if [ $flip -eq 1 ]
	then
		headsCount=$(($headsCount+1))
	else
		tailsCount=$(($tailsCount+1))
	fi
done

echo "In 10 flips Heads Count= "$headsCount", Tails Count= "$tailsCount
