#! /bin/bash
func(){

echo "0.exit"
echo "1.Enter new tasks"
echo "2.see before tasks"

read -p"select a number to do: " input

if [[ $input -eq 1 ]]; then
echo "command format taskName/taskDate YYYY-MM-DD hh:mm:ss"
read -p"enter your command as above: " cmd
IFS='/';
read -ra strCmd<<<"$cmd"

newTaskDate=$( date -d "${strCmd[1]}"  +'%Y-%m-%d %H:%M:%S' )


newTaskDate1=$( date -d "$newTaskDate" +'%s' )


  while [[ $newTaskDate1 -lt $(date +'%s') ]]
  do

  read -p"enter your command as above with Future Time: " cmd
IFS='/';
  read -ra strCmd<<<"$cmd"

newTaskDate=$( date -d "${strCmd[1]}"  +'%Y-%m-%d %H:%M:%S' )

newTaskDate1=$( date -d "$newTaskDate" +'%s' )
  done
  
echo "${strCmd[0]}   ${strCmd[1]}" >> tasks.txt
echo "your task is added"
func
elif [[ $input -eq 2 ]]; then
i=1


  while  read  line; do
  echo "Taskid: $i   TaskName and Date: $line "
  i=$((i+1))
  done < tasks.txt

func
elif [[ $input -eq  0 ]]; then
   echo "exited!"

else
   echo "wrong command"
   func
fi
}


func

