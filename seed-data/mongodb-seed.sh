# make sure this file has permissions to run locally.
# chmod 755 [filename]

# delete current seed data in the container so we can update it with new seed data
docker exec -it mongodb rm -rf seed-data/data

# copy over seed data into container
docker cp data mongodb:seed-data

# drop collections so we can re-import new data
docker exec -it mongodb mongoimport -d moonwalk -c people --drop --file seed-data/data/people.json
docker exec -it mongodb mongoimport -d moonwalk -c post --drop --file seed-data/data/post.json
