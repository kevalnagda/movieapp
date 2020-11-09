FROM ubuntu:18.04

# BASIC SYSTEM SETUP
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y wget nginx

ENV HOME /home

# SET PROJECT DIRECTORY
ENV PROJECT_DIR $HOME/movieapp
RUN mkdir PROJECT_DIR
WORKDIR $PROJECT_DIR

COPY . $PROJECT_DIR

# SET UP NGINX
RUN rm /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
COPY nginx.conf /etc/nginx/sites-available/movieapp
RUN ln -s /etc/nginx/sites-available/movieapp /etc/nginx/sites-enabled/

# SET UP MINICONDA
ENV CONDA_DIR $HOME/miniconda3
RUN wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
    bash ./Miniconda3-latest-Linux-x86_64.sh -b -p $CONDA_DIR && \
    rm Miniconda3-latest-Linux-x86_64.sh

ENV PATH $CONDA_DIR/bin:$PATH

RUN conda env create -f environment.yml
RUN conda clean --all --yes

EXPOSE 80

CMD [ "/bin/bash", "entrypoint.sh" ]