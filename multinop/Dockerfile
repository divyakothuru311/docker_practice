FROM alpine:3.18 AS downloader
ARG DOWNLOAD_URL="https://github.com/nopSolutions/nopCommerce/releases/download/release-4.60.4/nopCommerce_4.60.4_NoSource_linux_x64.zip"
ADD ${DOWNLOAD_URL} /nopCommerce/nopCommerce_4.60.4_NoSource_linux_x64.zip
RUN apk update && \
    apk add unzip && \
    cd /nopCommerce && \
    unzip nopCommerce_4.60.4_NoSource_linux_x64.zip && mkdir bin logs \
    && rm nopCommerce_4.60.4_NoSource_linux_x64.zip

FROM mcr.microsoft.com/dotnet/runtime:7.0
LABEL author="divyak" project="nopCommerce" organization="learning"
WORKDIR /nopCommerce
RUN useradd -d /nopCommerce -s /bin/bash nop
COPY --chown=nop:nop --from=downloader /nopCommerce /nopCommerce
ENV ASPNETCORE_URLS="http://0.0.0.0:5000"
USER nop
EXPOSE 5000
WORKDIR /nopCommerce
CMD ["dotnet", "Nop.Web.dll"]                                                                                                  ~                               