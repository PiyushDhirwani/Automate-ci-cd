FROM mysql:latest
WORKDIR /app
COPY . /app
RUN sudo apt update && \
    sudo apt install python3 python3-pip && \
    pip3 install -e .


ENV MYSQL_ROOT_PASSWORD=password
ENV MYSQL_DATABASE=CDSlite
ENV MYSQL_USER=Piyush
ENV MYSQL_PASSWORD=password

RUN chmod u+x CreateAndAdd.sh && \
    ./CreateAndAdd.sh

EXPOSE 3306

CMD ["python3", "app.py"]

ENTRYPOINT ["python3", "app.py"]