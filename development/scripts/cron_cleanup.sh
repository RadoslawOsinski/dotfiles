#!/bin/bash
#czyszczenie backupow calych serwerow
rm -f `find /backup/DB/DUPMS/ -type f -mtime +360`;
find /backup/DB/DUPMS/test/ -type d -mtime +90 | xargs rm -R;

#usuwane starych archive logow dla test starszych niz 3 miesiace
find /backup/DB/test/ARCH -type f -mtime +60 | xargs rm;

