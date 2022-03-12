FROM fedora:latest

RUN dnf install python3 python3-pip -y ; pip3 install flask

COPY app.py /test/app.py

WORKDIR /test

EXPOSE 5000

ENV msg="good evening"

CMD ["flask","run","--host=0.0.0.0"]
