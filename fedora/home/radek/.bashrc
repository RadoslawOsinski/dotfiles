# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

#crashing screen
export VDPAU_NVIDIA_NO_OVERLAY=1;
# Put your fun stuff here.
#cat ....../funy_picture.txt
#export JDK_HOME="/usr/lib/jvm/oracle-jdk-bin-1.7";
export JDK_HOME="/usr/java/latest/";
export JAVA_HOME="$JDK_HOME";
export JRE_HOME="$JDK_HOME";

export GRADLE_HOME="/home/radek/....../gradle-1.10/bin";
export M2_HOME="/home/radek/....../apache-maven-3.1.0";
export M2=$M2_HOME/bin;
#export ORACLE_HOME="/u01/app/oracle/product/11.2.0/xe";
#export ORACLE_SID="XE";
export MW_HOME="/home/radek/....../wls12120";

#export TOMCAT_HOME="/home/radek/demonstracja/apache-tomcat-7.0.8"
#export TOMCAT_HOME="/home/radek/....../apache-tomcat-7.0.16";
#export CATALINA_HOME=$TOMCAT_HOME;
#export CATALINA_BASE=$TOMCAT_HOME;
#export JBOSS_HOME="/home/radek/......./jboss/jboss-6.0.0.Final";
#export ANDROID_SDK_PATH="/home/radek/....../android-sdk-linux_x86";

#export PATH=$PATH:$ANDROID_SDK_PATH/tools;
export PATH=$M2:$PATH;
export PATH=$JDK_HOME:$PATH;
export PATH=$GRADLE_HOME:$PATH;
#export PATH=$ORACLE_HOME/bin:$PATH
