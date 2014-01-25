#!/bin/bash
#Na eco1 
#1) wgraj klucze publiczne do .ssh/authorized_keys
#
#2) dla kazdego serwera stworz katalogi
#	mkdir -p SERVER_NAME/{ARCH,BACKUP,DUMP} 
#Reszta na kazdym serwerze, ktory chcesz backupowac
#I. Hot backupy z logami transakcji
#1) W postgresql.conf na serwerach ustaw:
#
#	wal_level = archive  ### Tylko dla wersji 9.0 i nowszych
#
#	archive_mode = on
#	archive_command = 'gzip -c %p | ssh test_backup@test.pl "dd of=SERVER_NAME/ARCH/%f.gz"'
#	archive_timeout = 900	# timeout w sekundach. Co tyle sekund log zostanie przeslany nawet jesli jeszcze nie jest pelny.
#
#2) Restart bazy danych. Powinny zaczac sie 
#
#3) Skopiuj backup.sh do katalogu ~postgres/
#4) Ustaw zmienne w backup.sh, sprawdz sciezke do psql i czy jest zainstalowany rsync.
#5) Uruchom backup.sh z konta postgres.
#6) Jesli zadzialaja to dodaj do crontaba raz na tydzien.

echo "1. Popraw sciezke do danych postgresa"
echo "     PG_DIR=\"/var/lib/postgresql/9.1\""
echo "2. Ustaw SERVER_NAME w BKP_DIR"
echo "      BKP_DIR=\"SERVER_NAME/BACKUP\""
echo "3. Sprawdz czy jest zainstalowany rsync"
echo "4. Sprawdz sciezke do psql"
echo 
echo "Jesli ok to usun te linie"
exit -1


NOW=`date +%Y%m%d-%H%M`
BKP_USER="test_backup"
BKP_DIR="SERVER_NAME/BACKUP"
BKP_HOST="test.pl"
PG_DIR="/var/lib/postgresql/8.4"

LOG=/var/lib/postgresql/backup.log

date >>$LOG
/usr/bin/psql -c "select pg_start_backup('Backup $NOW')" >>$LOG

rsync -avz --exclude '*pg_xlog*' ${PG_DIR}/main ${BKP_USER}@${BKP_HOST}:${BKP_DIR}/ >>$LOG 2>&1

/usr/bin/psql -c "select pg_stop_backup(), current_timestamp" >> $LOG

ssh ${BKP_USER}@${BKP_HOST} cp -al ${BKP_DIR}/main ${BKP_DIR}/main-${NOW} >>$LOG

echo >>$LOG
