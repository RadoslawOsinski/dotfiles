CATALINA_PID="$CATALINA_BASE/tomcat.pid";
JAVA_OPTS="$JAVA_OPTS -server -Xdebug -server -Dspring.profiles.active=prod -Dsome.app.conf.dir=$CATALINA_HOME/conf/someApp -Dlogback.configurationFile=$CATALINA_HOME/conf/someApp/logback.xml -Dlogback.log.location=$CATALINA_HOME/logs -Duser.timezone=Europe/Warsaw -XX:+PrintGCTimeStamps -XX:+PrintGCDateStamps -XX:+PrintGCDetails -Xloggc:$CATALINA_HOME/logs/java_gc.log";

# JMX settings DEV without SSL
export CATALINA_OPTS="$CATALINA_OPTS -Dcom.sun.management.jmxremote.port=9001 -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.authenticate=false -Djava.rmi.server.hostname=`hostname`"
