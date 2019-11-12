# Facebook Clone

## Description
Build Facebook using Ruby on Rails! Not all Facebook features are available

## Live Demo

[Check a live version on Heroku](#)

## Authors:
* [Ansar](https://github.com/ansaryergesh)
* [Amanda](https://github.com/vieiramanda11)

## Features

    + User
        - Sign up / login / logout / reset password
        - Profile Page
        - CRUD functions for posts (C- create, R-read, U-update, D-delete)
        - <b> has many Posts </b> 
    + Posts
        - CRUD
        - Post display with the post content, author, comments and likes
        - <b> belongs to a User
    + Comments
        - CRUD functions(association with Post)
    + Likes
        - Like(:+1:) / Dislike(:-1:) post
    + Recieve Notifications
        - Comments on your posts.
        - Likes for your comments / posts.
        - Friendship requests and acceptance.

## Entity Relationship Diagram (ERD)
![alt text](docs/ERD - Facebook.jpeg)


## How To Use

To clone and run this application, you'll need [Git](https://git-scm.com), <b>Ruby '2.6.3' </b>, <b>Rails'~> 5.2.3' </b> and for Datebase used <b> PostgreSql</b>. Included <b> rspec </b> testing From your command line:

```bash
# Clone this repository
$ git clone https://github.com/vieiramanda11/facebook-clone.git

# Go into the repository
$ cd facebook-clone

# Install dependencies
$ bundle install --without production

#  Create and Migrate the database
$ rails db:create
$ rails db:migrate

# Testing with rspec
$ rspec

# Run the app
$ rails s
```


