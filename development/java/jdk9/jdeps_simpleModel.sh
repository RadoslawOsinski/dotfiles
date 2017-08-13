#!/bin/bash

export JAVA9_HOME="/home/rmo/BinaryPrograms/jdk-9";

echo -e "current dir: `pwd`\n";
#echo -e "files for compile:\n";
#find ./src/main/java/ -name *.java;

echo -e "\ncompiling\n";
$JAVA9_HOME/bin/jdeps \
-cp "/home/rmo/.gradle/caches/modules-2/files-2.1/org.hibernate/hibernate-core/5.2.10.Final/b46a4ba34b52d335cc45c0f33d029f782f7db887/hibernate-core-5.2.10.Final.jar:\
/home/rmo/.gradle/caches/modules-2/files-2.1/org.hibernate.validator/hibernate-validator/6.0.1.Final/3e11599ff2adbbcbfae9575a7831bc12eb0af171/hibernate-validator-6.0.1.Final.jar:\
/home/rmo/.gradle/caches/modules-2/files-2.1/org.springframework/spring-context/5.0.0.M5/b231685a5eebf5aff487cb08ad4e7e5fd1667193/spring-context-5.0.0.M5.jar:\
/home/rmo/.gradle/caches/modules-2/files-2.1/org.apache.commons/commons-lang3/3.6/9d28a6b23650e8a7e9063c04588ace6cf7012c17/commons-lang3-3.6.jar:\
/home/rmo/.gradle/caches/modules-2/files-2.1/org.hibernate.javax.persistence/hibernate-jpa-2.1-api/1.0.0.Final/5e731d961297e5a07290bfaf3db1fbc8bbbf405a/hibernate-jpa-2.1-api-1.0.0.Final.jar:\
/home/rmo/.gradle/caches/modules-2/files-2.1/org.springframework/spring-web/5.0.0.M5/ffeea21f3b1edfa2471c796edd43de666080800a/spring-web-5.0.0.M5.jar:\
/home/rmo/.gradle/caches/modules-2/files-2.1/org.springframework/spring-tx/5.0.0.M5/c38abe13f307ccf1e1ba1fb23179bcbdc9bb90b5/spring-tx-5.0.0.M5.jar:\
/home/rmo/.gradle/caches/modules-2/files-2.1/org.flywaydb/flyway-core/4.2.0/1cbe078e49e81ef13b5eafd54552feac0a55c19e/flyway-core-4.2.0.jar:\
/home/rmo/.gradle/caches/modules-2/files-2.1/com.hazelcast/hazelcast/3.8.2/183011482deb1d7fb4de5da9d7935cfb5a4c3184/hazelcast-3.8.2.jar:\
/home/rmo/.gradle/caches/modules-2/files-2.1/org.slf4j/slf4j-api/1.7.25/da76ca59f6a57ee3102f8f9bd9cee742973efa8a/slf4j-api-1.7.25.jar:\
/home/rmo/.gradle/caches/modules-2/files-2.1/org.springframework/spring-beans/5.0.0.M5/eb3e70c22f71df6428e8b347d203d7d7be4df750/spring-beans-5.0.0.M5.jar:\
/home/rmo/.gradle/caches/modules-2/files-2.1/org.springframework/spring-core/5.0.0.M5/8e807781d3ddcc9443e2f75387eb0cb2d14bd3d3/spring-core-5.0.0.M5.jar:\
/home/rmo/.gradle/caches/modules-2/files-2.1/org.springframework/spring-orm/5.0.0.M5/c98f49aaac21eeeb4ca8b62a1085df747542bf20/spring-orm-5.0.0.M5.jar:\
/home/rmo/.gradle/caches/modules-2/files-2.1/org.springframework/spring-jdbc/5.0.0.M5/895e229d03177a42eb51ec80332d160562fc3cf2/spring-jdbc-5.0.0.M5.jar" \
build/classes;
