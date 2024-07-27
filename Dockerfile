ARG DOCKER_IMAGE
FROM $DOCKER_IMAGE

ARG GRADLE_BIN
ARG ENV_CONTEXT 
ARG TIMEZONEREGION
ARG TIMEZONECITY

USER root

COPY $GRADLE_BIN /app/app.jar

ENV PARAM -D"java.security.egd=file:/dev/./urandom" \
  -D"user.timezone=$TIMEZONEREGION/$TIMEZONECITY"

ENV ENV_CONTEXT $ENV_CONTEXT  

RUN apk add tzdata \
  && cp /usr/share/zoneinfo/$TIMEZONEREGION/$TIMEZONECITY /etc/localtime \
  && mkdir -p /app/config 

RUN echo '#!/bin/sh' > /entrypoint.sh \
	&& echo 'set -x' >> /entrypoint.sh \
	&& echo 'sh -c "cd /app; exec java \
  $PARAM \
  -jar app.jar \
  --server.servlet.context-path=/$ENV_CONTEXT"' >>/entrypoint.sh \
	&& chmod a+x /entrypoint.sh
	 
ENTRYPOINT /entrypoint.sh

USER 1000
