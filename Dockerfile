FROM centos/nodejs-8-centos7:latest

# Copy the S2I scripts from this image to $STI_SCRIPTS_PATH
COPY ./s2i/bin/ $STI_SCRIPTS_PATH

# Set the default CMD to print the usage of the language image
CMD $STI_SCRIPTS_PATH/usage

