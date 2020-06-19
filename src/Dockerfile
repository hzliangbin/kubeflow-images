FROM node:10.15.0 as nodeportal

WORKDIR /build_dir

ARG npm_registry=https://registry.npmjs.org
ENV NPM_CONFIG_REGISTRY=${npm_registry}

COPY src/portal/package.json /build_dir
COPY src/portal/package-lock.json /build_dir
COPY ./docs/swagger.yaml /build_dir

RUN apt-get update \
    && apt-get install -y --no-install-recommends python-yaml=3.12-1 \
    && python -c 'import sys, yaml, json; y=yaml.load(sys.stdin.read()); print json.dumps(y)' < swagger.yaml > swagger.json \
    && npm install

COPY ./LICENSE /build_dir
COPY src/portal /build_dir

RUN ls -la \
    && npm run build_lib \
    && npm run link_lib \
    && npm run release



