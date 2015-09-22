#!/usr/bin/env bash

rm -rf gerrit-admin-ssh
rm -rf gerrit-users-ssh-keys

mkdir gerrit-admin-ssh
cd gerrit-admin-ssh/
ssh-keygen -b 4096 -t rsa -f ssh-key -q -N "" -C "admin@fabric8.io"
cd ..

mkdir gerrit-users-ssh-keys
cd gerrit-users-ssh-keys
ssh-keygen -b 4096 -t rsa -f jenkins-master-ssh -q -N "" -C "jenkins@fabric8.io"
ssh-keygen -b 4096 -t rsa -f sonarqube-ssh -q -N "" -C "sonar@fabric8.io"
cd ..

gofabric8 secrets