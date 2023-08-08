FROM ubuntu:mantic

ARG DEBIAN_FRONTEND=noninteractive

ENV TZ=America/Denver

RUN apt-get update

RUN apt-get install -f -y git python 3 python3-pip fontconfig libdmtx0b nano

RUN ln -s /usr/bin/python3 /usr/bin/python

RUN git clone --depth=1 https://github.com/DigitalWarrior/brother_ql_web_grocy.git

WORKDIR ./brother_ql_web

RUN rm -r .git

RUN python3 -m pip install --no-cache-dir -r requirements.txt

EXPOSE 8013

VOLUME /brother_ql_web

CMD ["python3","-u","brother_ql_web.py", "--model", "QL-720NW", "tcp://192.168.1.98" ]