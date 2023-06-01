#!/bin/bash

set -eu

mvn clean package -DskipTests

mvn install:install-file \
  -Dfile="$(pwd)/target/swagger-codegen-generators-1.0.42-SNAPSHOT.jar" \
  -DgroupId=io.swagger.codegen.v3 \
  -DartifactId=swagger-codegen-generators \
  -Dversion=myVersion \
  -Dpackaging=jar

pushd ../swagger-codegen
mvn clean package -DskipTests
popd
