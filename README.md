SP Farm
================

Setup environment list
-----------

```
# HomeBrew 
https://docs.brew.sh/Installation.html

# Postgres
brew install postgresql 

# Git 
brew install git

# Ruby/Rails/Rbenv/Ruby-Build 
brew install rails rbenv ruby-build

# Heroku (For deployment)
brew install heroku/brew/heroku
```



Setup project
-----------
```
# setup .env (Copy .env.example)
cp .env.example .env
```


```
bundle install
bundle exec rake db:create
bundle exec rake db:migrate
bundle exec rake db:seed 
```

Run project
-----------
```
# start Rails server 
rails s
```
Check at browser: 
[localhost:3000](localhost:3000)
