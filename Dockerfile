FROM registry.access.redhat.com/ubi8/ubi-minimal
ADD epel-release-latest-8.noarch.rpm /tmp/epel-release-latest-8.noarch.rpm
ADD make-4.2.1-10.el8.x86_64.rpm /tmp/make.rpm
ADD compat-openssl10-1.0.2o-3.el8.x86_64.rpm /tmp/compat.rpm
ADD oc /usr/bin/oc
ENV BUILD_PACKAGES \
  sshpass \
  bash \
  curl \
  tar \
  openssh \ 
  git \ 
  python3 \ 
  wget \
  findutils

RUN rpm -i /tmp/epel-release-latest-8.noarch.rpm && \
  microdnf install -y ${BUILD_PACKAGES} && \
  python3 -m pip install --upgrade pip && \
  pip3 --trusted-host pypi.org --trusted-host files.pythonhosted.org install setuptools-rust ansible && \
  rpm -i /tmp/make.rpm && \
  rpm -i /tmp/compat.rpm && \
  rm -f /tmp/*.rpm
 
ENV ANSIBLE_GATHERING=smart \
ANSIBLE_INVENTORY_UNPARSED_FAILED=true \
ANSIBLE_HOST_KEY_CHECKING=false \ 
ANSIBLE_RETRY_FILES_ENABLED=false \
ANSIBLE_SSH_PIPELINING=true \
PYTHONPATH=/ansible/lib \ 
PATH=/ansible/bin:$PATH

RUN microdnf clean all
