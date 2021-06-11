# docker for workspace
workspace preparation with docker container

## Summary
For the quickstart environment of excavator with jupyter-notebook, 

## 1. Build docker image 
run this command on your env.
```
docker build -t codeformyself_excavator_ws_image .
```


## 2. Run docker container

for MacOS 
```
docker run -it -p 8888:8888 --rm --name codeformyself_excavator_ws_container --mount type=bind,src="`pwd`",dst=/workdir codeformyself_excavator_ws_image 
```

for Windows
```
docker run -it -p 8888:8888 --rm --name codeformyself_excavator_ws_container --mount type=bind,src="%cd%",dst=/workdir codeformyself_excavator_ws_image 
```

## 3. access jupyter-notebook via browser
- http://localhost:8888/

