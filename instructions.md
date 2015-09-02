# Generate the Slideshow

hyla generate -c slideshow/conference-redhat.yaml

# hyla generate -c demo/conference-redhat.yaml

# Move content to Github io

https://help.github.com/articles/creating-project-pages-manually/

## Create tar file of the HTML files generated 

    ./generate_tar.sh
    
## Create gh-pages branch (one time)

    git checkout --orphan gh-pages
    git rm -rf slideshow 
    git rm .gitignore
    rm -rf slideshow  
    
## Add content  - first time

    ./import_site.sh
    git add slideshow
    git commit -m "Update web content" -a
    
## Add content - next time
    
    git checkout gh-pages
    ./import_site.sh
    git commit -m "Update web content" -a
    git push
    
    