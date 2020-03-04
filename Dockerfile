FROM rstudio/r-session-complete:centos7-1.2.5033-1

# Identify the maintainer of an image
LABEL name="rstudio" \
    author="Roberto Villegas-Diaz" \
    maintainer="Roberto.VillegasDiaz@sdstate.edu"

# Install additional system packages
RUN yum update -y && \
    yum install -y \
    libjpeg-turbo-official && \
    yum clean all

# Install additional R packages
RUN /opt/R/${R_VERSION}/bin/R -e 'install.packages("jpeg",repos="http://cran.rstudio.com")'
RUN /opt/R/${R_VERSION}/bin/R -e 'if (!requireNamespace("BiocManager", quietly = TRUE)); install.packages("BiocManager")'
RUN /opt/R/${R_VERSION}/bin/R -e 'BiocManager::install("dada2")'

# Install additional Python packages
RUN /opt/python/${PYTHON_VERSION}/bin/pip install pytorch

# Expose port 8082
#EXPOSE 8082

# Download latest version from the repository
#RUN git clone https://github.com/gmod/jbrowse
#WORKDIR jbrowse
#RUN git checkout $(git describe --tags)
#RUN ./setup.sh

# Last is the actual command to start up NGINX within our Container
#CMD ["nginx", "-g", "daemon off;"]
#CMD npm run start
