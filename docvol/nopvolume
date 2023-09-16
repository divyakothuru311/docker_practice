### creating a docker volumes in nopcommerce application

* create a container with name new1 with nopcommerce application in it.
* First build an image of application and then create container new1 with nop in it.
* ![preview](images/1.png)


```
 ##stage1
FROM alpine:3.18 AS downloader
ARG DOWNLOAD_URL="https://github.com/nopSolutions/nopCommerce/releases/download/release-4.60.4/nopCommerce_4.60.4_NoSource_linux_x64.zip"
ADD ${DOWNLOAD_URL} /nopCommerce/nopCommerce_4.60.4_NoSource_linux_x64.zip
RUN apk update && \
    apk add unzip && \
    cd /nopCommerce && \
    unzip nopCommerce_4.60.4_NoSource_linux_x64.zip && mkdir bin logs \
    && rm nopCommerce_4.60.4_NoSource_linux_x64.zip

##stage2
FROM mcr.microsoft.com/dotnet/runtime:7.0
LABEL author="divyak" project="nopCommerce" organization="learning"
WORKDIR /nopCommerce
RUN useradd -d /nopCommerce -s /bin/bash nop
COPY --chown=nop:nop --from=downloader /nopCommerce /nopCommerce
ENV ASPNETCORE_URLS="http://0.0.0.0:5000"
USER nop
EXPOSE 5000
WORKDIR /nopCommerce
CMD ["dotnet", "Nop.Web.dll"]                           
```

* now create a volume nopvolume.
* ![preview](images/2.png)
* now build an image of mysql from pulling it from docker hub registry.
* ![preview](images/3.png)
* you need to set the environmental variables for database 
* ![preview](images/4.png)
* ![preview](images/5.png)
* create another container for database and configure env variables in it as shown below.
* ![preview](images/6.png)
* every conatiner gets its own ipaddress
* here the ipaddress is of the database
* ![preview](images/7.png)
* command to check volumes 
* ![preview](images/8.png)
* to check whether the volume is mounted on the /var/lib/mysql
* the command is given below
* ![preview](images/9.png)
* by accessing the public ipaddress and the port number given by container access the application.
* ![preview](images/10.png)
* configure the credentials on the nop application as 
* admin@yourstore.com
* pswd: admin
* server name as ipaddress 172.17.0.5
* and configure the env variables in the home page.
* ![preview](images/14.png) 
* after configuring the details the app gets installed
* ![preview](images/11.png)
* once it gets installed it will restart so we need to start the container
* ![preview](images/13.png)
* now we can get access the database of the app as shown below
* ![preview](images/12.png)
  
