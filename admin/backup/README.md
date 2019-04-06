Encrypted backup procedure
===

* (Stap executed only once) Encrypt backup file system:
```
[root@rmo rmo]# cryptsetup -y -v luksFormat /dev/sdb3
UWAGA: urządzenie /dev/sdb3 już zawiera sygnaturę superbloku 'ext4'.

WARNING!
========
To nieodwołalnie nadpisze dane na /dev/sdb3.

Are you sure? (Type uppercase yes): YES
Hasło dla /dev/sdb3:
Weryfikacja hasła:
Existing 'ext4' superblock signature on device /dev/sdb3 will be wiped.
Klucz numer 0 utworzony.
Polecenie się powiodło.
```
---
* (Stap executed only once) Create file system with gparted.
---
* Mount encrypted file system:

The first step is to get the name of the encrypted partition, with the following command:
```
blkid | grep crypto
```
sample output:
```
/dev/sdb3: UUID="bc595f3a-44a9-4119-8a34-5ca6552e6863" TYPE="crypto_LUKS" PARTUUID="000822c7-03"
```
Now we know the name of the partition "/dev/sdb3". The next step is to open the partition and set up a mapping name:
```
cryptsetup luksOpen /dev/sdb3/ decryptedFolder
```
You have to enter the passphrase to decrypt the partition. Feel free to change the mapping name decryptedFolder to whatever you want. The mapped partition is now available in /dev/mapper/decryptedFolder but it isn’t mounted. The last step is create a mount point and to mount the mapped partition:
```
mkdir /mnt/decryptedFolder
mount /dev/mapper/decryptedFolder /mnt/decryptedFolder
```
---
* Backup or restore by customBackup.sh or restoreFromCustomBackup.txt
---
* Unmount encrypted file system:
```
umount /mnt/decryptedFolder
cryptsetup luksClose decryptedFolder
```
