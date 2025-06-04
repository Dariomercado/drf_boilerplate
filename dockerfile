FROM python:3.9

#install SSH client
RUN apt-get update && apt-get install -y openssh-client

#set environment variables
ENV PYTHONUNBUFFERED 1

# set work directory
WORKDIR /app

#copy requirements file
COPY requirements.txt /app/requirements.txt

#install dependencies
RUN pip install -r requirements.txt

#copy the application to the working directory
COPY . /app

# start the ssh tunnel
CMD python manager.py runserver 0.0.0.0.8000