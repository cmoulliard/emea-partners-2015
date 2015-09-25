#!/usr/bin/env bash

file=emea-partners
TMPDIR=tmp
gitsha=$(git log --pretty=format:'%h' -n 1)
index_file=slideshow/generated/index.html
talk_name="Red Hat EMEA Partners 2015"

echo "Create tmp dir"
mkdir $TMPDIR

echo "Generate HTML"
hyla generate -c slideshow/conference-redhat.yaml

echo "Create Tar file"
rm $TMPDIR/$file.tar.gz
tar zcf $TMPDIR/$file.tar.gz slideshow/generated

echo "File compressed"
ls $TMPDIR/$file.tar.gz