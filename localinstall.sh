echo 'localinstall.sh' >> .gitignore
echo '.solargraph.yml' >> .gitignore

gem install ripper-tags
ripper-tags -R --exclude=vendor

gem install solargraph
