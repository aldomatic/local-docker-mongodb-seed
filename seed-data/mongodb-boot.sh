# make sure this file has permissions to run locally.
# chmod 755 [filename]

# connect to the local database using localhost:27017/moonwalk

# run mongodb docker image
docker run -d -p 27017:27017 --name mongodb mongo
