FROM fedora:latest

RUN dnf install python3 python3-pip -y ; pip3 install flask

ENV msg="good morning"

COPY app.py /test/app.py

WORKDIR /test

EXPOSE 5000

CMD ["flask","run","--host=0.0.0.0"]
