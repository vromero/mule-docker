# Mule ESB Dockerfile
Docker Image packaging for MuleESB http://www.mulesoft.org


## How to use
```
docker pull vromero/mule
```

### Build

By default the following command will build mule-ce 3.9.0

```
docker build .
```

You can parameterize the build to create an image based on other mule image like

```
docker build . --build-arg mule_version=3.8.1
```


### Usage

For a simple application using 8081 port as HTTP

```
docker run -d --name myMuleInstance -P -v ~/myAppsDir:/opt/mule/apps -v ~/myLogsDir:/opt/mule/logs vromero/mule
```

#### Noteworthy mount points

| Mount point       | Description                                                     |
|------------------ |-----------------------------------------------------------------|
|/opt/mule/apps     | Mule Application deployment directory                           |
|/opt/mule/domains  | Mule Domains deployment directory                               |
|/opt/mule/conf     | Configuration directory                                         |
|/opt/mule/logs     | Logs directory                                                  |


#### Exposed ports

| Port | Description                                                     |
|----- |-----------------------------------------------------------------|
| 8081 | Default HTTP port                                               |


This means only exposed port is 8081, if the application has other needs you should use `-p` rather than `-P` 

```
-p 1234:1234
```

