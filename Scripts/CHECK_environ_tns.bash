#!/bin/bash
#
# FOR Oracle on Linux
# CHECK ENVIRONMENT VARIABLE NAMED tns
###########################################################################

this_script=$( basename $0 | awk -F"." '{ print $1 }' )
this_PID=$$
ps -ef | grep ora_pmon_ | grep -v grep > /tmp/${this_PID}

cat /dev/null > /tmp/${this_PID}.00
output=${this_script}.out ; cat /dev/null > ${output}
while read -r line
do
  pid=$( echo $line | awk '{ print $2 }' )
  pmon=$( echo $line | awk '{ print $NF }' )
  echo "${pmon}^${pid}" >> /tmp/${this_PID}.00
  strings /proc/${pid}/environ | grep -i tns > /tmp/${this_PID}.00

  echo "## CHECKING TNS environ FOR ${pid} | ${pmon}" | tee -a ${output}
  if [[ $( wc -l /tmp/${this_PID}.00 | awk '{ print $1 }' ) -eq 0 ]] ; then
    echo "-- NO TNS environment FOUND FOR {pmon}" >> ${output}
  else
    sed "s/^/-- /" /tmp/${this_PID}.00
  fi

done < /tmp/${this_PID}

rm /tmp/${this_PID}
rm /tmp/${this_PID}.00

