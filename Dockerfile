# The first instruction is what image we want to base our container on
# We Use an official Python runtime as a parent image
FROM python:3.6

# The enviroment variable ensures that the python output is set straight
# to the terminal with out buffering it first
ENV PYTHONUNBUFFERED 1

# Add Arguments
ARG NAME

# Set Environment Variable
ENV NAME=${NAME}

# create root directory for our project in the container
RUN mkdir /app

# Copy the current directory contents into the container at /TwitterAnalysis
ADD . /app

# Set the working directory to /app
WORKDIR /app

# Install any needed packages specified in requirements.txt
RUN pip install -r requirements.txt

# Run to create migrations for changes
# RUN python manage.py makemigrations

# Run to create migrations for changes in setiment app
# RUN python manage.py makemigrations sentiment

# Run to apply those changes to the database
# RUN python manage.py migrate

# expose the port 80
EXPOSE 80

# define the default command to run when starting the container using Django
# Uncomment the next two lines to use django to render app and comment gunicorn command
# ENTRYPOINT ["python", "manage.py"]
# CMD ["runserver", "0.0.0.0:8000"]

# define the default command to run when starting the container using gunicorn
CMD ["gunicorn", "--bind", ":80", "helloworld.wsgi:application"]