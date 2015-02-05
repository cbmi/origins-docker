# Origins

Dockerfile for the Origins services.

## Dependencies

- Neo4j (see [origins-neo4j-docker](https://github.com/cbmi/origins-neo4j-docker/))

## Usage

The default usage assumes the neo4j container will be linked as `neo4j`.

```
docker run -d -p 5000:5000 --link neo4j:neo4j dbhi/origins
```

## Environment

- `ORIGINS_HOST` - Host to bind to. Set to 0.0.0.0 for this image.
- `ORIGINS_PORT` - Port to bind to. Defaults to 5000
- `ORIGINS_NEO4J_HOST` - Host of the Neo4j REST service. Set to `neo4j` for this image.
- `ORIGINS_NEO4J_PORT` - Port of the Neo4j REST service.
- `ORIGINS_DEBUG` - Set to `true` to turn on debug logging.

## Deployment

Read about getting started with and deploying Origins on the [wiki](https://github.com/cbmi/origins/wiki/).
