FROM rocker/verse:3.6.2

# Identify the maintainer of an image
LABEL name="rstudio" \
    author="Roberto Villegas-Diaz" \
    maintainer="Roberto.VillegasDiaz@sdstate.edu"

# Install additional system packages
RUN apt-get update -y && \
    apt-get install -y libpng-dev && \
    apt-get install -y libjpeg-dev && \
    apt-get install -y libcurl4-openssl-dev 
RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt-get install -y python3.7 && \
    apt-get upgrade -y python3-setuptools && \
    apt-get install -y python3-pip && \
    apt-get install -y python3-wheel
RUN apt-get clean -y

# Install additional R packages
RUN R -e 'install.packages("jpeg",repos="http://cran.rstudio.com")'
RUN R -e 'if (!requireNamespace("BiocManager", quietly = TRUE)) install.packages("BiocManager",repos="http://cran.rstudio.com")'
RUN R -e 'BiocManager::install("dada2")'

# Install additional Python packages
RUN wget -q https://bootstrap.pypa.io/get-pip.py
RUN python get-pip.py && rm get-pip.py
#RUN pip3 install --upgrade pip
#RUN pip3 install torch torchvision

# Expose port 8787
#EXPOSE 8787

# Download latest version from the repository
#RUN git clone https://github.com/gmod/jbrowse
#WORKDIR jbrowse
#RUN git checkout $(git describe --tags)
#RUN ./setup.sh

# Last is the actual command to start up NGINX within our Container
#CMD ["nginx", "-g", "daemon off;"]
#CMD npm run start
