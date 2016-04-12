# Check for files modified within past 24 hrs.
echo -e "Usage : sh $0 <filename>"
FILE=$1

USERS=`grep /bin/bash /etc/passwd | grep -v root | awk -F: '{print $1}'`
USERNAME=`echo $USERS`

if [[ ! -z results.txt ]]
then
	:> results.txt
fi
for i in $USERNAME
 do
	HISTORY="/home/$i/.bash_history"
	RESULT=`grep $FILE $HISTORY`
	if [[ ! -z $RESULT ]]
	then
		echo $i
	fi
 done
