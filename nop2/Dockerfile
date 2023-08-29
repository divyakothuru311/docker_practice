FROM mcr.microsoft.com/dotnet/sdk:7.0
LABEL author "learning"
RUN apt update && apt install unzip
WORKDIR /nopCommerce
ADD https://github.com/nopSolutions/nopCommerce/releases/download/release-4.60.4/nopCommerce_4.60.4_NoSource_linux_x64.zip /nopCommerce/nopCommerce_4.60.4_NoSource_linux_x64.zip
RUN unzip /nopCommerce/nopCommerce_4.60.4_NoSource_linux_x64.zip
RUN mkdir /nopCommerce/bin
RUN mkdir /nopCommerce/logs
EXPOSE 5000
CMD ["dotnet","Nop.Web.dll","--urls","http://0.0.0.0:5000"]
                                                                                                                                                                                                  