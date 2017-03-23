FROM ubuntu:xenial

# PREREQUISITE

RUN apt-get update
RUN apt-get install -y build-essential openjdk-8-jre openjdk-8-jdk \
    gettext python2.7 iso-codes shared-mime-info stl-manual cgroup-lite \
    python-dev libpq-dev libcups2-dev libyaml-dev libffi-dev python-pip \
    git sudo netcat

# INSTALLATION

RUN git clone --recursive -b v1.3 https://github.com/cms-dev/cms.git
RUN pip install --upgrade pip
RUN cd cms &&\
    pip2 install -r requirements.txt &&\
	./prerequisites.py install --as-root --no-conf -y &&\
    python setup.py install
RUN usermod -a -G cmsuser root