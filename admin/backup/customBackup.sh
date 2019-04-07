#!/bin/bash
# Backup script for my computer.
# Author: Radoslaw Osinski<Radoslaw.Osinski@gmail.com>

basename=`basename $0`

# these are the commands we actually need for the backup
command_list=(date echo /usr/bin/find grep hostname sh /bin/tar which)

# verify that each command we use exists. if one can't be found use $PATH and make a suggestion if possible.
for command in ${command_list[@]}; do
        if [ ! -x "`which $command 2>&1`" ]; then
                echo -e "\nERROR: $command not found! "
                base=`basename $command`
                if [ "`which $base 2>&1 | grep "no \`basename $command\` in"`" != "" ]; then
                        echo -e "ERROR: $base is not in your \$PATH."
                fi
                exit -1
        fi
done

# the find_command
find_command="/usr/bin/find /root /etc /home"

# where to put the backup
backupLocation=/mnt/decryptedFolder

# backup file name
backupName=$backupLocation/`hostname`_`date +\%Y\%m\%dT\%H\%M`.tar.gz;

# find the files/folder to backup
find_command="($find_command)"

tar_command="$find_command | /bin/tar --gzip --preserve-permissions --create --absolute-names --totals --ignore-failed-read --file $backupName --no-recursion -T -"

echo -e "\n* Please wait while the backup is being created.\n"

# do the backup.
sh -c "$tar_command"

# finished, clean up
echo -e "\n* backup is done"

# Integrity check
echo -e "* Checking integrity"

if [ "`gzip --test $backupName 2>&1`" != "" ]; then
        echo -e "* Integrity check failed. Re-run the script and check your hardware."
        exit -1
fi

# everything went smoothly"
echo -e "* Everything went smoothly. You successfully created a backup."
