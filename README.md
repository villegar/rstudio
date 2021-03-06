# Rstudio
Customised Docker container for RStudio.

To pull the image to your local machine, use the following command:
```bash
docker pull villegar/rstudio
```

<br />

To create a new container using previously downloaded image:
```bash
# replace <username> with an username of your choice
# replace <password> with a password of your choice
# replace <local> with a port of your choice
docker container run -e USER=<username> \
                     -e PASSWORD=<password> \ 
                     -p <local>:8787 \
                     --name rstudio -d villegar/rstudio:latest
```
e.g.
```bash
docker container run -e USER=villegar -e PASSWORD=666 -p 8787:8787 --name rstudio -d villegar/rstudio:latest
```

<br />

Using a web browser, navigate to https://localhost:<port\>

<br />

To modify the newly created container:
```bash
docker container exec -it rstudio bash
```

<br />

To stop the container:
```bash
docker container stop rstudio
```

<br />

To remove the container from local storage:
```bash
docker container rm rstudio
```

