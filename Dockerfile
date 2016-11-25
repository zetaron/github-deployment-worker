FROM zetaron/docker-deployment-worker:1.0.0
MAINTAINER Fabian Stegemann

LABEL org.label-schema.schema-version="1.0" \
      org.label-schema.name="github-deployment-worker" \
      org.label-schema.description="Downloads a repository snapshot using the `/var/cache/deployment/deployment-event.json`s `.deployment.sha` and executes the `deploy` service declared inside the `docker-compose.deploy.yml` file, reporting status back to GitHub." \
      org.label-schema.url="https://github.com/zetaron/github-deployment-worker" \
      org.label-schema.vcs-url="https://github.com/zetaron/github-deployment-worker" \
      org.label-schema.version="1.0.0" \
      org.label-schema.docker.cmd="docker run -d -v $SECRET_VOLUME_NAME:/var/cache/secrets:ro -v $DEPLOYMENT_CACHE_VOLUME_NAME:/var/cache/deployment zetaron/github-deployment-worker:1.0.0"

RUN apk add --no-cache \
    jq

COPY . /usr/bin

ENTRYPOINT ["/usr/bin/secret-wrapper", "deploy"]
