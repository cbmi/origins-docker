# Origins

Dockerfile for the Origins services.

## Dependencies

- Redis
- Neo4j (see [origins-neo4j-docker](https://github.com/cbmi/origins-neo4j-docker/))

## Usage

The bare usage requires an Origins command to be run, either `serve` or `events`.

```
docker run -d -p 5000:5000 --link neo4j:neo4j --link redis:redis bruth/origins [serve | events]
```

The default config file assumes the `redis` and `neo4j` containers will be linked. This can be changed by supplying an alternate config:

```
docker run -d -p 5000:5000 --link neo4j:neo4j --link redis:redis -v /path/on/host:/origins/conf bruth/origins [serve | events] --config /origins/conf/alt.json
```

### Deployment

Below is a [Fig](http://fig.sh) config file containing all the necessary components for deploying an Origins service.

```yaml
# Redis instance
redis:
    image: dockerfile/redis
    detach: true
    volumes:
        - /data/redis:/data

# Neo4j; pre-configured for Origins
neo4j:
    image: bruth/origins-neo4j
    privileged: true
    detach: true
    volumes:
        - /data/neo4j:/neo4j/data

# Origins service
service:
    image: bruth/origins
    ports:
        - 5000:5000
    links:
        - redis:redis
        - neo4j:neo4j
    command:
        - serve

# Origins events daemon
events:
    image: bruth/origins
    links:
        - redis:redis
    command:
        - events
```
