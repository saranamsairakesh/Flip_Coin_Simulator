headsCount=0
tailsCount=0

function flipCoin(){
	flip=$1
   if [ $flip -eq 1 ]
   then
      headsCount=$(($headsCount+1))
   else
      tailsCount=$(($tailsCount+1))
   fi
	echo $headsCount","$tailsCount
}

while [ $headsCount -ne 21 ] && [ $tailsCount -ne 21 ]
do
	flipResult="$( flipCoin $(($RANDOM%2)) )"
	headsCount=$( echo $flipResult | awk -F , '{print $1}')
	tailsCount=$( echo $flipResult | awk -F , '{print $2}')
done

diff=$(($headsCount-$tailsCount))
echo $headsCount","$tailsCount

function winner(){
	diff=$1
	if [ $diff -gt 0 ]
   then
      echo "Heads win on Tails by "$diff
   else
      echo "Tails win on Heads by "$((-1*$diff))
   fi
}

if [ $diff -eq 0 ]
then
	echo "Heads equals to Tails. So it's a TIE"
	while [ $diff -ne 2 ] && [ $diff -ne -2 ]
	do
		flip=$(($RANDOM%2))
   	if [ $flip -eq 1 ]
   	then
      	headsCount=$(($headsCount+1))
   	else
   	   tailsCount=$(($tailsCount+1))
	   fi
		diff=$(($headsCount-$tailsCount))
	done
	echo "$( winner $(($diff)) )"
else
	echo "$( winner $(($diff)) )"
fi
