# SlingHealth APP

## Introduction ##

Our team is creating an application for the Texas A&M Obstacle Course Racing (TAMUOCR) organization. This application will enable each member to keep track of their own individual progress by logging in their personal times as well as record their completion of a particular workout. In addition, members will also be able to compare their personal record times by viewing a daily/weekly leaderboard. Members will also have the option of liking or “fistbumping” other members’ workout results as well as being able to favorite certain workouts.

## Requirements

This code has been run and tested on:

- ruby 3.1.2p20
- Rails 7.0.3
- Ruby Gems - 1.1.4
- PostgreSQL - 13.7
- Nodejs - v16.15.0
- Yarn - 1.22.18
- Docker (Latest Container)

## External Deps

- Docker - Download latest version at https://www.docker.com/products/docker-desktop
- Heroku CLI - Download latest version at https://devcenter.heroku.com/articles/heroku-cli
- Git - Downloat latest version at https://git-scm.com/book/en/v2/Getting-Started-Installing-Git
- GitHub Desktop (Not needed, but HELPFUL) at https://desktop.github.com/


## Installation

Download this code repository by using git:
    ```
    git clone https://github.com/lsamso/SlingHeath-Mentor-App.git
    cd SlingHeath-Mentor-App
    ```
## Tests

An RSpec test suite is available and can be ran using:

`rspec spec/`

You can run all the test cases by running. This will run both the unit and integration tests.
`rspec .`

## Execute Code

Run the following code in Powershell if using windows(including wsl) or the terminal using Linux/Mac.
Open a terminal and run the following command:

    docker run -it --volume "${PWD}:/SlingHealth-dev" \
    --name slinghealth \
    -e DATABASE_USER=group_name \
    -e DATABASE_PASSWORD=kool_koalas \
    -p 3000:3000 \
    paulinewade/csce431:latest

Install the app

    cd SlingHealth-dev
    bundle install     
    rails db:create
    rails db:migrate

Run the app

    `rails s -b 0.0.0.0`

Once the server is running, you can access it at:

- [http://localhost:3000/](http://localhost:3000/)

Stop the Container

Please check if the container is running:

    `docker stop slinghealth && docker rm slinghealth`

## Environmental Variables/Files
You create the .env in the main directory,
- GOOGLE_CLIENT_ID = <YOUR_GOOGLE_CLIENT_ID>
- GOOGLE_CLIENT_SECRET = <YOUR_GOOGLE_CLIENT_SECRET>

You can create your client id and secret in - [https://console.cloud.google.com/apis/credentials](https://console.cloud.google.com/apis/credentials).

In Authorized JavaScript origins section, you add - [http://localhost:3000](http://localhost:3000)

In Authorized redirect URIs section, you add: -[http://localhost:3000/auth/google_oauth2/callback](http://localhost:3000/auth/google_oauth2/callback)