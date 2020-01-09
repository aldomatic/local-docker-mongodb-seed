
## Import seed data to a local MongoDB container

### Run a local MongoDB container
We need to give the /seed-data/mongodb-boot.sh script permissions so we can run it locally.

`chmod 755 /seed-data/mongodb-boot.sh`

Then we can run. `./seed-data/mongodb--boot.sh` This will start up local container running mongodb.

### Import data into the local MongoDB container
We need to give the /seed-data/mongodb-seed.sh script permissions so we can run it locally.

`chmod 755 /seed-data/mongodb-seed.sh`

The script can be run anytime you want to import new seed data. If a new collection is introduced we just need to modify the script so it knows to import it.

Here is what the script contains.

    1. Here we remove the current seed data from within the container
    docker exec -it mongodb rm -rf seed-data/data

	2. Here we copy over any new data from our host into the container
    docker cp data mongodb:seed-data

	3. Here we run the native mongo import command for each collection (.json)
    docker exec -it mongodb mongoimport -d moonwalk -c people --drop --file seed-data/data/people.json
    docker exec -it mongodb mongoimport -d moonwalk -c post --drop --file seed-data/data/post.json

### Connecting to the container from within your application.
You can access this database from `localhost:27017`. I was able administer this local database using a tool like MongoDB Compass.
