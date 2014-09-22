FROM dockerfile/ubuntu

MAINTAINER Byron Ruth <b@devel.io>

# Install dependencies
RUN apt-get -qq update
RUN apt-get -qq install -y python3 python3-pip

# Install Origins from source (for now)
RUN pip3 -q install "https://github.com/cbmi/origins/tarball/master#egg=origins"

WORKDIR /origins

ADD default.json /origins/conf/

VOLUME ["/origins/conf"]

EXPOSE 5000

ENTRYPOINT ["origins", "--config", "/origins/conf/default.json"]
