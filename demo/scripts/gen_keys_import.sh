#!/usr/bin/env bash

rm -rf gerrit-admin-ssh
rm -rf gerrit-users-ssh-keys

echo "Delete secrets in oc"
oc project default
oc delete secrets gerrit-admin-ssh
oc delete secrets gerrit-users-ssh-keys
oc delete secrets jenkins-git-ssh
oc delete secrets jenkins-master-ssh

echo "Gen keys for admin" 
mkdir gerrit-admin-ssh
cd gerrit-admin-ssh/
ssh-keygen -b 4096 -t rsa -f ssh-key -q -N "" -C "admin@fabric8.io"
cd ..

echo "Gen keys for jenkins, sonar users"
mkdir gerrit-users-ssh-keys
cd gerrit-users-ssh-keys
ssh-keygen -b 4096 -t rsa -f jenkins-master-ssh -q -N "" -C "jenkins@fabric8.io"
ssh-keygen -b 4096 -t rsa -f sonarqube-ssh -q -N "" -C "sonar@fabric8.io"
cd ..

echo "Import keys generated"
gofabric8 secrets -y