ARG CENTOS_VERSION

FROM centos:${CENTOS_VERSION}

RUN yum -y update; yum clean all

# Install basic packages
RUN yum install -y ca-certificates curl jq make which wget

# Necessary packages for installing pip
RUN yum install -y https://centos7.iuscommunity.org/ius-release.rpm \
    && yum install -y python36u python36u-libs python36u-devel python36u-pip 

# Install pip
RUN python3.6 -m pip install pipenv && \
    pip3.6 install --upgrade pip && \
    if [ ! -e /usr/bin/pip ]; then ln -s pip3.6 /usr/bin/pip ; fi

# Install awscli for accessing secretsmanager
RUN pip install awscli
