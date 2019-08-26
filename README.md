# README
Reindeer Hunt Manager application, for managing the Sacred Heart annual Reindeer Hunt, and other similar competitions.

[![Build Status](https://travis-ci.com/KyleRAnderson/Reindeer-Hunt-Manager.svg?branch=master)](https://travis-ci.com/KyleRAnderson/Reindeer-Hunt-Manager)

Use Ruby 2.6.3

1. [Setup](#Setup)
1. [History](#History)

# Setup
Steps for a linux environment. These steps have been adapted from many sources.

## Install Ruby
We used [chruby](https://github.com/postmodern/chruby) and [ruby-install](https://github.com/postmodern/ruby-install) to install ruby.
Follow the installation steps for both:
### Install Chruby
Note: I only followed the steps for each of the following headings, and did not go through the subheadings either.
1. [Install](https://github.com/postmodern/chruby/blob/master/README.md#install)
1. [Setup](https://github.com/postmodern/chruby/blob/master/README.md#setupsh)
1. [Configuration](https://github.com/postmodern/chruby/blob/master/README.md#Configuration)
1. While doing the previous step, add the ruby version (ruby-2.6.3) to the `~/.bashrc` file for a default ruby version to be loaded. Write the following to this file:
```
chruby ruby-2.6.3
```

### Install Ruby-install
1. [Install](https://github.com/postmodern/ruby-install/blob/master/README.md#install)

### Installing Ruby 2.6.3
Execute the following after a terminal restart because of the previous steps.
```
ruby-install ruby-2.6.3
```

#### Installing gems
**Required gems**
```bash
gem install rails bundler
```
**Optional gems for development with VSCode**
```bash
gem install rubocop solargraph
```

## Install nodejs and npm
```bash
sudo apt-get install nodejs npm
```

## Setup postgresql 
*Not that these steps can be done in parallel to everything else*

### Install postgresql
```
sudo apt-get install postgresql postgresql-contrib libpq-dev
```

### Setup automatic server starting
*Note: This step is optional. If you don't want to start postgres on system startup, you will need to manually do start it each time before using the app with `sudo service postgresql start`.*

```bash
update-rc.d postgresql enable    # Makes postgresql start on boot.
```

### Configure postgres
Start the server before anything else can be done
```
sudo service postgresql start
```
Add a user with both `createdb` and login permissions which the app will use. The username has to be the same as your linux username.
```bash
su                                                        # Login as the root user. If you need to change your password, run `sudo passwd root`.
  su - postgres                                           # Login as postgres 
    psql                                                  # Enter postgresql console
      CREATE ROLE <YOUR_USERNAME> WITH CREATEDB LOGIN;    # Create the role and give it permission to create databases and login.
      \du                                                 # Check that your user role is setup correctly. There should be a listing for your role name with createdb permission.
```
Once these steps have been completed, you can exit the `psql` console with CTRL-D, then exit the postgres user with CTRL-D, then click CTRL-D again to exit the root account.

## Install Yarn
```bash
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get install yarn
yarn install
```

## Beginning development
Change directory to the location where you have cloned the app. Run the following.
```bash
cd <LOCATION>              # Change directory to the app.
bundle install             # Install all the required gems with the bundler.
rails db:create db:migrate # Create and migrate the database.
rails server               # Start the server.
```


# History
This application is a work in progress web-based version of the original [Reindeer Hunt Manager](https://gitlab.com/kyle_anderson/Reindeer-Hunter) which was created in C# with Windows Presentation Foundations (WPF).
