FROM dockerfile/ubuntu

MAINTAINER Byron Ruth <b@devel.io>

# Default environment variables
ENV ORIGINS_HOST 0.0.0.0
ENV ORIGINS_NEO4J_HOST neo4j

# Install dependencies
RUN apt-get -qq update
RUN apt-get -qq install -y python3 python3-pip

# Origins is not yet available on PyPi
RUN pip3 -q install "https://github.com/cbmi/origins/tarball/457baa1709411c7d0b59eb8f997bb882fc01cbde#egg=origins"

EXPOSE 5000

ENTRYPOINT ["origins", "serve"]
