# Mule ESB Dockerfile
Docker Image packaging for MuleESB http://www.mulesoft.org

Fork of [vromero/mule](https://github.com/vromero/mule-docker/tree/master) Docker image for supporting **MuleESB 3.8.1**

### Usage

For a simple application using 8081 port as HTTP

```
docker run -d --name muleEsb381 -p 8081:8081 -v ~/myAppsDir:/opt/mule/apps -v ~/myLogsDir:/opt/mule/logs andreacomo/mule
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
