#!/bin/bash
# Author : Arjun Shrinivas
# Purpose : To know the modification history of a specific file

echo -e "Usage : $0 <filename>"
FILE=$1
 
USERS=`grep /bin/bash /etc/passwd | grep -v root | awk -F: '{print $1}'`
USERNAME=`echo $USERS`
 
if [[ ! -z results.txt ]]
then
        :> results.txt
fi
for i in `echo $USERS`
 do
        HISTORY="/home/$i/.bash_history"
	ENCDATE=`sed -ne '/'"$FILE"'/{x;p;d;}' -e x $HISTORY | grep -v ^[a-z] | tail -n1`
        if [[ ! -z $ENCDATE ]]
        then
		COMMAND=`sed -ne '/'"$ENCDATE"'/,+1p' $HISTORY | tail -n1`
		MODDATE=`echo $ENCDATE | tr '#' '@'`
		DATE=`date -d $MODDATE +'%F %T'`
                echo -e "$i\t$DATE\t$COMMAND"
        fi
 done
