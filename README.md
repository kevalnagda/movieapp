# Movieapp

A Dockerized Flask application backed with Gunicorn and Nginx.

## Description

The Dockerfile image allows you to run a movie quote generator Flask application in Python that runs with Gunicorn and Nginx in a single container.

[Flask app with Gunicorn and Nginx](https://kevalnagda.github.io/flask-app-with-wsgi-and-nginx) contains a detailed explanation of steps on how to setup a Flask web application with Gunicorn and Nginx.

## Installation

**Prerequisites:**
- Docker >= 19.03.13

To install Docker Engine follow steps given in [Install Docker Engine](https://docs.docker.com/engine/install/).

## Usage

**To build the project from scratch:**

1. Clone the project locally

```
git clone https://github.com/kevalnagda/movieapp.git
```

2. Go to the project directory

```
cd movieapp
```

3. Build Docker image from the Dockerfile

```
docker build -t moviequotesapp .
```

4. Run a Docker container based on the image you just created

```
docker run moviequotesapp
```

5. Visit `http://<container_ip_address>:80`. `container_ip_address` is usually `172.17.0.2`.
Else you can check it by executing `docker inspect <container id> | grep "IPAddress"`.

**To run project from the Docker image:**

1. Pull the Docker image locally

```
docker pull kevalnagda/movieapp
```

2. Run a Docker container based on the image you just pulled

```
docker run kevalnagda/movieapp
```

3. Visit `http://<container_ip_address>:80`. `container_ip_address` is usually `172.17.0.2`.
Else you can check it by executing `docker inspect <container id> | grep "IPAddress"`.

## Screenshot

The runnning application should look like:

![](https://github.com/kevalnagda/movieapp/blob/main/images/screenshot.png)
