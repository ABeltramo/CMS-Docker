FROM ubuntu:xenial

# PREREQUISITE

RUN apt-get update
RUN apt-get install -y build-essential openjdk-8-jre openjdk-8-jdk fpc \
    gettext python2.7 iso-codes shared-mime-info stl-manual cgroup-lite
RUN apt-get install -y python-dev libpq-dev libcups2-dev libyaml-dev \
     libffi-dev python-pip
# also needed
RUN apt-get install -y git sudo

# INSTALLATION

RUN git clone --recursive -b v1.3 https://github.com/cms-dev/cms.git
RUN pip install --upgrade pip
RUN cd cms && \
	./prerequisites.py install --as-root
RUN usermod -a -G cmsuser root
RUN cd cms/ && pip2 install -r requirements.txt
RUN cd cms && ./setup.py install

COPY ./cms.conf /usr/local/etc/cms.conf

EXPOSE 29000

CMD cmsDropDB -y &&\
    cmsInitDB &&\
    cmsAddAdmin -p admin admin &&\
    cmsLogService
