#running the application as nop user(not root)
FROM mcr.microsoft.com/dotnet/sdk:7.0
LABEL author="divyak" project="nopCommerce" organization="learning"
RUN apt update && apt install unzip -y
RUN useradd -ms /bin/bash nop
USER nop
WORKDIR /nopCommerce
ADD --chown=nop:nop https://github.com/nopSolutions/nopCommerce/releases/download/release-4.60.4/nopCommerce_4.60.4_NoSource_linux_x64.zip /nopCommerce/nopCommerce_4.60.4_NoSource_linux_x64.zip
RUN cd /nopCommerce
RUN unzip nopCommerce_4.60.4_NoSource_linux_x64.zip
RUN mkdir bin logs
EXPOSE 5000
CMD ["dotnet","Nop.Web.dll","--urls","http://0.0.0.0:5000"]


#docker file using args for user nop 
FROM mcr.microsoft.com/dotnet/sdk:7.0
LABEL author="divyak" project="nopCommerce" organization="learning"
ARG user=nop
ARG group=nop
ARG uid=1000
ARG gid=1000
ARG DOWNLOAD_URL=https://github.com/nopSolutions/nopCommerce/releases/download/release-4.60.2/nopCommerce_4.60.2_NoSource_linux_x64.zip
ARG HOME_DIR=/nopCommerce
RUN apt update && apt install unzip -y 
# Create user nop
RUN groupadd -g ${gid} ${group} \
    && useradd -d "$HOME_DIR" -u ${uid} -g ${gid} -m -s /bin/bash ${user}
USER ${user}
WORKDIR ${HOME_DIR}
ADD --chown=${user}:${group} ${DOWNLOAD_URL} ${HOME_DIR}/nopCommerce_4.60.2_NoSource_linux_x64.zip
RUN  unzip ${HOME_DIR}/nopCommerce_4.60.2_NoSource_linux_x64.zip && \
    mkdir ${HOME_DIR}/bin && mkdir ${HOME_DIR}/logs
EXPOSE 5000
ENV ASPNETCORE_URLS="http://0.0.0.0:5000"
# ENV TEST="default"
CMD ["dotnet","Nop.Web.dll"]
            