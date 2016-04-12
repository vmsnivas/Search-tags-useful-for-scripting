# Check for files modified within past 24 hrs.

modifiedfiles=`find . -mtime -0`

username=`pwd | cut -d'/' -f2` # pwd is your current directory /home/user/
for i in $modifiedfiles
  do 
    check=`grep  $i /home/user/.bash_history`
      if [ "$check" != " " ] 
      then 
        echo "file $i modified by $username "
      fi
  done
