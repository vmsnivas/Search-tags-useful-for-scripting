# Check for files modified within past 24 hrs.

FILE=$1

#username=`pwd | cut -d'/' -f2` # pwd is your current directory /home/user/
USERS=`grep /bin/bash /etc/passwd | grep -v root | awk -F: '{print $1}'`
USERNAME=`echo $USERS`

if [[ ! -z results.txt ]]
then
	:> results.txt
fi
for i in $USERNAME
 do
	HISTORY="/home/$i/.bash_history"
#	echo $HISTORY
#	echo -e "$i : `grep $FILE $HISTORY`"
	RESULT=`grep $FILE $HISTORY`
	if [[ ! -z $RESULT ]]
	then
		echo $i
	fi
#	echo $RESULT >> results.txt
 done

 #for i in $modifiedfiles
 # do 
 #   check=`grep  $i /home/user/.bash_history`
 #     if [ "$check" != " " ] 
 #     then 
 #       echo "file $i modified by $username "
 #     fi
 # done
