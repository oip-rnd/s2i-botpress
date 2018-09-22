FROM centos/nodejs-8-centos7:latest

ENV BOTPRESS_VERSION=10 \
    NAME=botpress \
    NODEJS_VERSION=8 \
    YARG_ARGS=start \
    NPM_CONFIG_PREFIX=$HOME/.npm-global \
    PATH=$HOME/node_modules/.bin/:$HOME/.npm-global/bin/:$PATH

ENV SUMMARY="Platform for building and running Botpress $BOTPRESS_VERSION bot applications" \
    DESCRIPTION="Botpress available as container is a base platform for \
building and running various Botpress bots using Node.js $NODEJS_VERSION engine and frameworks."

LABEL summary="$SUMMARY" \
      description="$DESCRIPTION" \
      io.k8s.description="$DESCRIPTION" \
      io.k8s.display-name="Botpress $BOTPRESS_VERSION" \
      io.openshift.expose-services="8080:http" \
      io.openshift.tags="builder,$NAME,$NAME$BOTPRESS_VERSION" \
      io.openshift.s2i.scripts-url="image:///usr/libexec/s2i" \
      io.s2i.scripts-url="image:///usr/libexec/s2i" \
      com.redhat.dev-mode="DEV_MODE:false" \
      com.redhat.deployments-dir="${APP_ROOT}/src" \
      com.redhat.dev-mode.port="DEBUG_PORT:5858"\
      com.redhat.component="oip-$NAME$BOTPRESS_VERSION-container" \
      name="centos/$NAME-$BOTPRESS_VERSION-centos7" \
      version="$BOTPRESS_VERSION" \
      maintainer="OIP Core Team <oip-core-team@lab-nxtit.com>" \
      help="For more information visit https://github.com/oip-rnd/s2i-botpress-container" \
      usage="s2i build <SOURCE-REPOSITORY> centos/$NAME-$BOTPRESS_VERSION-centos7:latest <APP-NAME>"

# Copy the S2I scripts from this image to $STI_SCRIPTS_PATH
COPY ./s2i/bin/ $STI_SCRIPTS_PATH

# Set the default CMD to print the usage of the language image
CMD $STI_SCRIPTS_PATH/usage

