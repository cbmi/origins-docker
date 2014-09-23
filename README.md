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

## Deployment

Read about getting started with and deploying Origins on the [wiki](https://github.com/cbmi/origins/wiki/).
