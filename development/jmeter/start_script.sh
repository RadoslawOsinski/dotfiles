#!/bin/sh
export JAVA_HOME="/root/java-se-8u41-ri";
pwd_folder="$(pwd)";
resultFileName="AppExample1_results_$(date +"%F_%H-%M-%S").csv";
echo "Rezultaty sa/beda w pliku: '$pwd_folder/$resultFileName'";
echo "nohup sh ./jmeter.sh -n -t AppExample1_Performance.jmx -l $resultFileName &";
nohup sh ./jmeter.sh -n -t AppExample1_Performance.jmx -l $resultFileName &
