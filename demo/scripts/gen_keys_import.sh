#!/usr/bin/env bash

rm -rf gerrit-admin-ssh
rm -rf gerrit-users-ssh-keys

oc login -u admin -p admin https://172.28.128.4:8443

echo ">> Delete secrets in oc"
oc delete secrets gerrit-admin-ssh
oc delete secrets gerrit-users-ssh-keys
oc delete secrets jenkins-master-ssh

echo ">> Generate new keys for admin"
mkdir gerrit-admin-ssh
cd gerrit-admin-ssh/
ssh-keygen -b 4096 -t rsa -f ssh-key -q -N "" -C "admin@fabric8.io"
cd ..

echo ">> Genenate new keys for jenkins & sonar users"
mkdir gerrit-users-ssh-keys
cd gerrit-users-ssh-keys/
ssh-keygen -b 4096 -t rsa -f id-admin-rsa -q -N "" -C "admin@fabric8.io"
ssh-keygen -b 4096 -t rsa -f id-jenkins-rsa -q -N "" -C "jenkins@fabric8.io"
ssh-keygen -b 4096 -t rsa -f id-sonar-rsa -q -N "" -C "sonar@fabric8.io"
cd ..

echo ">> Import keys generated"
gofabric8 secrets -y