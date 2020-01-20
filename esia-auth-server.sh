#!/bin/bash
############################
# util script for esia-auth-server
# run:
# esia-auth-server.sh all
# esia-auth-server.sh build
# esia-auth-server.sh importCerts
# esia-auth-server.sh deploy
# esia-auth-server.sh run
############################

########## Variables

rootSrcDir=./ # or full path: ~/workspaces/rbs
esiaOpenidAuthSrcDir=$rootSrcDir/esia-openid-auth # esia-openid-auth directory
installDir=~/development/esia-auth-server # install directory
jdkDir=~/development/jdk-11.0.6 # java jdk directory
keytool=$jdkDir/bin/keytool # keytool util

keystoreDir=$installDir/keystore
keystore=cacerts 
buildDir=$esiaOpenidAuthSrcDir/esia-auth-server/target
datadbDir=/data/postgres

firstParam=${1}

if [ $firstParam == "build" -o $firstParam == "all" ]; then
    cd $esiaOpenidAuthSrcDir
    mvn clean install -DskipTests=true
fi

# import certs
if [ $firstParam == "importCerts" -o $firstParam == "all" ]; then
    mkdir -p $keystoreDir 
    cp $buildDir/classes/cert/* $keystoreDir/
    $keytool -noprompt -storepass changeit -keystore $keystore -import -file \
        $buildDir/classes/cert/root -alias root

    $keytool -noprompt -storepass changeit -keystore $keystore -import -file \
        $buildDir/classes/cert/lets-encrypt-x3-cross-signed.pem -alias lets-encrypt-x3-cross-signed

    $keytool -noprompt -storepass changeit -keystore $keystore -import -file \
        $buildDir/classes/cert/comodorsaorganizationvalidationsecureserverca.crt -alias \
        comodorsaorganizationvalidationsecureserverca
fi

#if [ $firstParam == "initdb" -o $firstParam == "all" ]; then
    #mkdir -p $datadbDir 
    #COPY docker/scripts/0-init-db.sh /docker-entrypoint-initdb.d/
    #COPY docker/scripts/1-schema-postgres.sql /docker-entrypoint-initdb.d/
    #COPY docker/scripts/2-data-postgres.sql /docker-entrypoint-initdb.d/
#fi

if [ $firstParam == "deploy" -o $firstParam == "all" ]; then
    mkdir -p $installDir 
    mkdir -p $installDir/keystore
    cp $buildDir/esia-mock-server-0.0.1-SNAPSHOT.war $installDir/security-sso-esia.war
fi

if [ $firstParam == "run" -o $firstParam == "all" ]; then
    cd $installDir
    java -Xmx1G -Djava.security.egd=file:/dev/./urandom -jar ./esia-mock-server.war
fi

echo "done"
