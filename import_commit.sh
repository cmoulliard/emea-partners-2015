#!/usr/bin/env bash

file=emea-partners
index_file=slideshow/generated/index.html
talk_name="Red Hat EMEA Partners 2015"

echo "Create Tar file"
rm $TMPDIR/$file.tar.gz
tar zcf $TMPDIR/$file.tar.gz slideshow/generated

echo "Checkout to gh-pages"
git checkout gh-pages
rm -rf slideshow

echo "Uncompress"
tar zxf $TMPDIR/$file.tar.gz slideshow/generated

touch slideshow/generated/index.html

echo "Add index page"
echo << _EOF_ > $index_file
<html>
  <head>
    <title>Index of presentations</title>
  </head>
  <body bgcolor=white>
    
    <p>Index : the $talk_name talks. </p>
    <ul>
      <li><a href="slideshow/generated/simplify-integration-development.html">How Red Hat middleware technology can simply Integration Projetc Development</a>.
      <li><a href="slideshow/generated/continuous-delivery.html">Continuous Delivery</a>.
    </ul>

  </body>
</html>
_EOF_

echo "Commit to github and checlout to master"
git commit -m "Update web content" -a
git push
git checkout master