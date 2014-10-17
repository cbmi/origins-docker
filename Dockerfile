FROM dockerfile/ubuntu

MAINTAINER Byron Ruth <b@devel.io>

# Install dependencies
RUN apt-get -qq update
RUN apt-get -qq install -y python3 python3-pip

# Origins is not yet available on PyPi
RUN pip3 -q install "https://github.com/cbmi/origins/tarball/cff84415#egg=origins"

WORKDIR /origins
ADD default.json /origins/conf/

EXPOSE 5000

ENTRYPOINT ["origins", "--config", "/origins/conf/default.json"]
