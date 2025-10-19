# FROST OGC Demo Server
This is a fully functional FROST server with a Postgres database which was set up to test and compare OGC compliance within various realtime products. 

## Requirements
* Docker
* Operating System: The scripts are created for OSX but the set up is platform independent. If you're not using OSX then you can run "docker compose up -d" instead

## Installing
Install by running ./start-container.sh from the command prompt. This will configure a docker container that contains both FROST server as well as the database. 

## Running
Test the instance by opening the Web-UI/debug-localhost.html file in a browser. Use the index.html file if you're installing it on a server.
