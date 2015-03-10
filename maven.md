  vim: ft=markdown

# 常用
## 生成 javadoc
mvn javadoc:jar

## copy 依赖jar包
mvn dependency:copy-dependencies  -Dmdep.useRepositoryLayout =true 
mvn dependency:copy-dependencies  

## maven war copy classes lib 到 src目录

    mvn compile war:inplace

## 安装到本地仓库
mvn install:install-file -DgroupId=com.lifeix -DartifactId=lifeix-l06 -Dversion=0.0.1  -Dpackaging=jar -Dfile=/home/lifeix/workspace/lifeix-automail/lib/lifeix_memcached_SNAPSHOT_20120319.jar
mvn -o   参数o, offline模式, 不下载更新文件

1. 使用maven命令：mvn dependency:sources 下载依赖包的源代码。

2. 使用参数： -DdownloadSources=true 下载源代码jar。 -DdownloadJavadocs=true 下载javadoc包。

3. maven 打包时指定main()方法的class
4. maven 打包包含所有需要的jar包
5. maven 打包exclude某个目录下resource及classes
6. maven 发布 mvn package source:jar javadoc:jar deploy

# maven 创建webapp

1、安装Maven2.0.4；
    2、运行mvn；
         这个主要是为了能够在%user_profile%/目录下创建.m目录。这个目录是maven的默认工作目录。
    3、创建一个基本的eclipse项目；
         mvn archetype:create -DgroupId=org.powersoft -DartifactId=app
         mvn eclipse:eclipse
    4、创建一个webapp；
         mvn archetype:create -DgroupId=org.powersoft -DartifactId=hrms -DarchetypeArtifactId=maven-archetype-webapp
    5、将生成的src/main下的webapp目录拷贝到在第3步中创建的eclipse项目中的src/main目录下；
         这个将作为web的根目录
    6、将以上创建的项目导入到eclisep工程中；





# Eclipse导入已存在的maven项目

在导入之前需要在项目根目录下面执行如下命令：

普通 Eclipse 项目执行 ： mvn eclipse:eclipse Eclipse

web 项目执行 ： mvn eclipse:eclipse –Dwtpversion=1.0

然后通过Eclipse的maven插件中选择导入已存在的maven项目即可将其导入。

学习过程中的问题：

安装好m2eclipse插件后一般会报错误：Eclipse is running in a JRE, but a JDK is required Some Maven plugins may not work when importing projects or updating source folders.

解决方式为：

1.创建一个Eclipse的启动的快捷方式，在其启动路径后添加-vm 你的JDK安装路径\bin\javaw.exe

2.在eclipse的安装目录下打开eclipse.ini中的-vmargs上面添加-vm 你的JDK安装路径\bin\javaw.exe

eclipse导入创建的web项目问题

在用eclipse导入web项目时 如果eclipse安装了wtp插件在会自动将其转化为eclipse认得到的web项目，在项目上面点击右键run as 的run on server可以用，但是当eclipse没有安装wtp插件时run on server则不用，此时的解决方式为用命令行切换到项目的根目录然后执行 mvn eclipse:eclipse –Dwtpversion=1.0即可解决。







# 配置文件


    <project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
        xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/maven-v4_0_0.xsd">
        <modelVersion>4.0.0</modelVersion>
        <groupId>com.lifeix.web</groupId>
        <artifactId>lifeix-web</artifactId>
        <version>6.1.1-release</version>
        <packaging>war</packaging>

        <profiles>
            <profile>
                <id>development</id>
                <activation>
                    <activeByDefault>true</activeByDefault>
                </activation>

                <properties> <!-- 替换resource文件内容时用的变量  -->
                    <deployer.enviroment>development</deployer.enviroment>
                </properties>
                <build>
                    <finalName>${project.artifactId}</finalName>
                    <resources>
                        <resource>
                            <directory>src/main/resources</directory>
                            <filtering>true</filtering>
                        </resource>
                    </resources>
                </build>
            </profile>
        <profiles>
        <dependencies>
            <dependency>
              <groupId>javaee</groupId>
              <artifactId>javaee-api</artifactId>
              <version>5</version>
            </dependency>
            <dependency>
              <groupId>com.lifeix</groupId>
              <artifactId>lifeix-pintimes</artifactId>
              <version>0.8.2-SNAPSHOT</version>
              <!-- 排除某个依赖 -->
              <exclusions>  
                 <exclusion>      
                      <groupId>commons-logging</groupId>          
                      <artifactId>commons-logging</artifactId>  
                 </exclusion>  
              </exclusions>  
            </dependency>
        </dependencies>

        <build><!-- 设置编译出的名字 -->
          <finalName>lifeix-eatables</finalName>
        </build>
    </project>
