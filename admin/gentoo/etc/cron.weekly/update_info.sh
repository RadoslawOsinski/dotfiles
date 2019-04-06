#!/bin/bash 

touch zawartosc_maila;
EMAIL_SUBJECT="Raport gentoo dla $(hostname) z dnia $(date '+%F')";

echo -n " * Aktualizacja drzewa portage ====> " > zawartosc_maila
#emerge --sync &> /dev/null && echo -ne "OK\n" >> zawartosc_maila || echo -e "ERROR\n" >> zawartosc_maila

echo -e "\n * Dostępne aktualizacje:" >> zawartosc_maila
emerge -puv world >> zawartosc_maila 2>/dev/null; SUCCESS=$?
if [ ${SUCCESS} -eq 0 ]; then
	echo -e "\nNic więcej nie pozostało do aktualizacji.\n\n" >> zawartosc_maila
else
	echo -e "\nPrzykro mi, nie można rozwiązać zależności. Prawdopodobnie wymagane paczki są zamaskowane. Musisz rozwiązać to ręcznie.\n\n" >> zawartosc_maila
fi

echo "Z poważaniem, twoje gentoo :)" >> zawartosc_maila

touch calosc;
echo -e "From:radoslaw.osinski@gmail.com\n" >> calosc;
echo -e "RCPT To: radoslaw.osinski@gmail.com\n" >> calosc;
#echo -e "Subject: ${EMAIL_SUBJECT}\n" >> calosc;
echo -e "To: radoslaw.osinski@gmail.com\n" >> calosc;
#echo -e "MIME-Version: 1.0" >> calosc;
#echo -e "Content-Type: text/plain; charset=\"iso-8859-2\"" >> calosc;
#echo -e "Content-Transfer-Encoding: 8bit" >> calosc;
cat zawartosc_maila >> calosc;
echo -e "\n." >> calosc;

cat calosc | sendmail -f radoslaw.osinski@gmail.com radoslaw.osinski@gmail.com
rm calosc;
rm zawartosc_maila;
