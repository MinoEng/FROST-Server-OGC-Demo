# FROST OGC Demo Server
This is a fully functional FROST server with a Postgres database which was set up to test and compare OGC compliance within various realtime products. It features a realtime user interface that can be used to post data to the FROST server and to see updates using MQTT. 

## Requirements
* Docker
* Operating System: The scripts are created for OSX but the set up is platform independent. If you're not using OSX then you can run "docker compose up -d" instead

## Installing
Install by running ./start-container.sh from the command prompt. This will configure a docker container that contains both FROST server as well as the database. Run the "init-sensor.sh" script if you want to create a sample sensor once the containers are running. 

## Running
Test the instance by opening the Web-UI/debug-localhost.html file in a browser. Use the index.html file if you want to run the realtime client on a web server.

## Author
This Github repository was created by Minos Engström in 2025. 