FROM adoptopenjdk:8-jre

RUN apt-get update \
	&& DEBIAN_FRONTEND=noninteractive \
	&& apt-get install -y curl \
	&& apt-get clean 

RUN addgroup --gid 1000 minecraft \
  && adduser --system --shell /bin/false --uid 1000 --ingroup minecraft --home /minecraft minecraft

ADD ./scripts/initJar.sh /initJar.sh

RUN chmod +x /initJar.sh

EXPOSE 25565 25565

VOLUME [ "/minecraft" ]

ADD ./serverConfig/eula.txt /minecraft/eula.txt

ADD ./serverConfig/server.properties /minecraft/server.properties

RUN chmod +wr /minecraft/server.properties
RUN chmod +wr /minecraft/eula.txt

ADD ./assets/forge-1.12.2-installer.jar /minecraft/forge-1.12.2-installer.jar
ADD ./mods /minecraft/mods
ADD ./config /minecraft/config

WORKDIR /minecraft

CMD [ "/initJar.sh" ]