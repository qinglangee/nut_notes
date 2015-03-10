  vim: ft=markdown
# 配置

## 调试模式启动
    ./catalina.sh jpda start   
便可启动调试模式，默认启动端口是8000，也可以在catalina.sh中增加 JPDA_ADDRESS= 8888  参数用以指定其他端口。


调试模式启动java程序
java -Xdebug -Xrunjdwp:transport=dt_socket,server=y,address="8000" -jar 
     test.jar

## 开启JMX监控

用以下参数启动应用

    java \
    -Dcom.sun.management.jmxremote \
    -Dcom.sun.management.jmxremote.port=12345 \
    -Dcom.sun.management.jmxremote.authenticate=false \
    -Dcom.sun.management.jmxremote.ssl=false \
    -jar /usr/share/doc/openjdk-6-jre-headless/demo/jfc/Notepad/Notepad.jar
下面的配置增加了验证, 并可以在localhost以外监控

    java \
    -Djava.rmi.server.hostname=192.168.3.14 \
    -Dcom.sun.management.jmxremote \
    -Dcom.sun.management.jmxremote.port=12345 \
    -Dcom.sun.management.jmxremote.authenticate=true \
    -Dcom.sun.management.jmxremote.password.file=/etc/java-6-openjdk/management/jmxremote.password \
    -Dcom.sun.management.jmxremote.access.file=/etc/java-6-openjdk/management/jmxremote.access \
    -Dcom.sun.management.jmxremote.ssl=true \
    -Djavax.net.ssl.keyStore=$YOUR_KEY_STORE \
    -Djavax.net.ssl.keyStorePassword=$YOUR_KEY_STORE_PASSWORD \
    -Djavax.net.ssl.trustStore=$YOUR_TRUST_STORE \
    -Djavax.net.ssl.trustStorePassword=$YOUR_TRUST_STORE_PASSWORD \
    -Dcom.sun.management.jmxremote.ssl.need.client.auth=true \
    -jar /usr/share/doc/openjdk-6-jre-headless/demo/jfc/Notepad/Notepad.jar




refs:  
[Monitoring and Managing Tomcat][1]    


[1]: http://tomcat.apache.org/tomcat-6.0-doc/monitoring.html
