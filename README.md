# docker for workspace
workspace preparation with docker container withoug anaconda

## Summary
For the quickstart environment of excavator with jupyter-notebook, 

---

## Preparation 
### 0. install docker 
- please access to docker official, and try download & install 
-- https://docs.docker.com/get-docker/

### 1. clone this repository 
```bash
# clone repository
git clone https://github.com/Code4Myself/docker-for-workspace-light.git

# move to repository directory
cd docker-for-workspace-light
```

### 2. Build docker image 
- run this command on your env.
```bash
# build docker image
docker build -t codeformyself_excavator_ws_light_image:2022.01 .
```

---

## start working env

### 1. launch docker container

- move to working directory ( **Takeout** directory is located above directory )
```bash 
cd ../
```

- launch docker container
```bash
# for MacOS 
docker run -it -p 8888:8888 --rm --name codeformyself_excavator_ws_container --mount type=bind,src="`pwd`",dst=/workdir codeformyself_excavator_ws_light_image:2022.01
```

```bash
# for Windows
docker run -it -p 8888:8888 --rm --name codeformyself_excavator_ws_container --mount type=bind,src="%cd%",dst=/workdir codeformyself_excavator_ws_light_image:2022.01
```

### 2. access jupyter-notebook via browser
- http://localhost:8888/

