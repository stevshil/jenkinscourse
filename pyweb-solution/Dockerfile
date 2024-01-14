FROM python:3.12-alpine3.19
# Create the directory to serve the application
RUN mkdir /app
# Update pip
RUN pip install --upgrade pip
# Add the files to the container
ADD requirements.txt main.py /app/
ADD static /app/static
# Set the working directory
WORKDIR /app
RUN ls
# Install the relevant library dependencies
RUN pip install -r requirements.txt
# Start the application
ENTRYPOINT [ "python","/app/main.py" ]