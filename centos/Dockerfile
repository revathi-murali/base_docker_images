ARG CENTOS_VERSION

FROM centos:${CENTOS_VERSION}

RUN yum -y update; yum clean all
# Install basic packages
RUN yum -y install ca-certificates curl jq make

# Necessary for installing pip
RUN yum -y install epel-release && yum clean all
RUN yum -y install python-pip && yum clean all

# Install awscli for secret manager
RUN pip install --upgrade pip awscli