#!/bin/bash
############################
# util script for security-sso-esia
# run
# security-sso-esia.sh all
# security-sso-esia.sh build
# security-sso-esia.sh importCerts
# security-sso-esia.sh deploy
# security-sso-esia.sh run
############################

########## Variables

rootSrcDir=./ # or full path: ~/workspaces/rbs
esiaOpenidAuthSrcDir=$rootSrcDir/esia-openid-auth # esia-openid-auth directory
installDir=~/development/security-sso-esia # install directory
jdkDir=~/development/jdk-11.0.6 # java jdk directory
keytool=$jdkDir/bin/keytool # keytool util

keystoreDir=$installDir/keystore
keystore=cacerts 
buildDir=$esiaOpenidAuthSrcDir/security-sso-esia/target
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

if [ $firstParam == "deploy" -o $firstParam == "all" ]; then
    mkdir -p $installDir 
    mkdir -p $installDir/keystore
    cp $buildDir/security-sso-esia-0.0.1-SNAPSHOT.war $installDir/security-sso-esia.war
fi

if [ $firstParam == "run" -o $firstParam == "all" ]; then
    cd $installDir
    java -Xmx1500M -Djava.security.egd=file:/dev/./urandom -jar ./security-sso-esia.war
fi

echo "done"
