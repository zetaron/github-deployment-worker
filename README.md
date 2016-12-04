# GitHub deployment worker

## Setup
### ${PRODUCT}-${ENVIRONMENT}-secrets
If your deployment relies on docker you have to do some setting up.

1. create a volume named like the headline (replacing the variables as needed).
2. create a directory called **docker-certs** inside that volumes root.
3. add the {ca,cert,key}.pem files into that directory
4. create a file called **DOCKER_CERT_PATH** in the root of the volume and set its content to **/var/cache/secrets/docker-certs**
5. create a file called **DOCKER_TLS_VERIFY** in the root of the volume and set its content to **1**

The secret wrapper is now able to setup the environment properly and your docker commands should succede.
