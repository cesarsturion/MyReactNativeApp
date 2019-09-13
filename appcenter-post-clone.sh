#!/usr/bin/env bash

# Example: Install App Center CLI
npm install -g appcenter-cli

# Download and unzip the Scanner for your CI
export SONAR_SCANNER_VERSION=4.0.0.1744
export SONAR_SCANNER_HOME=$HOME/.sonar/sonar-scanner-$SONAR_SCANNER_VERSION-macosx
rm -rf $SONAR_SCANNER_HOME
mkdir -p $SONAR_SCANNER_HOME
curl -sSLo $HOME/.sonar/sonar-scanner.zip https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-$SONAR_SCANNER_VERSION-macosx.zip
unzip $HOME/.sonar/sonar-scanner.zip -d $HOME/.sonar/
rm $HOME/.sonar/sonar-scanner.zip
export PATH=$SONAR_SCANNER_HOME/bin:$PATH
export SONAR_SCANNER_OPTS="-server"

echo "Instalacao concluida"

ls -lha /Users/vsts/.sonar/sonar-scanner-4.0.0.1744-linux/jre/bin

echo "executando o uname"
uname -a

echo "Chamando a execução do sonar-scannner"

sonar-scanner \
  -Dsonar.projectKey=MyReactNativeApp \
  -Dsonar.organization=cesarsturion \
  -Dsonar.sources=. \
  -Dsonar.host.url=https://sonarcloud.io \
  -Dsonar.login=1e458952656abd66762a6969103d9a7108de0ed1 \
  -Dsonar.exclusions='test/**,node_modules/**,android/**,ios/**' 

