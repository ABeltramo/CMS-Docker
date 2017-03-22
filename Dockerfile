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
RUN cd cms &&\
    pip2 install -r requirements.txt &&\
	./prerequisites.py install --as-root --no-conf -y &&\
    python setup.py install
RUN usermod -a -G cmsuser root

COPY ./log/cms.conf /usr/local/etc/cms.conf

# COPY OII TASKS

RUN mkdir contest
COPY ./contest/ contest/

CMD cmsImportContest -i contest/ &&\
    cmsResourceService -a 1
