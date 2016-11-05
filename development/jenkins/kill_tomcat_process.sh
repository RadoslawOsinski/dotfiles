function killtomcat()
{
    runningTomcatPid=ps -ef | grep tomcat | grep -v grep | awk '{ print $2 }' | tail -1
    kill -9 $runningTomcatPid
}
