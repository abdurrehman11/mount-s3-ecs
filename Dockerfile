FROM python:3.9

RUN apt-get update -y && \
    apt-get install wget -y && \ 
    apt-get clean 

RUN wget https://s3.amazonaws.com/mountpoint-s3-release/latest/x86_64/mount-s3.deb && \
    apt install ./mount-s3.deb -y && \ 
    rm -f mount-s3.deb 

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt 

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./app /code/app

RUN chmod +x /code/app/my_script.sh  

ENTRYPOINT [ "python", "/code/app/my_script.py" ]
