echo 'repoinstall.sh' >> .git/info/exclude
echo '.solargraph.yml' >> .git/info/exclude

gem install ripper-tags
ripper-tags -R --exclude=vendor

gem install solargraph
