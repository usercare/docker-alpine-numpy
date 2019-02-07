FROM python:3.7-alpine
ARG NUMPY_VERSION=1.16.1
ARG SCIPY_VERSION=1.2.0
ARG PANDAS_VERSION=0.23.4
RUN apk add --no-cache openblas libstdc++ && \
    apk add --no-cache --virtual .build-deps gcc g++ python3-dev openblas-dev && \
    python3 -m pip install numpy==${NUMPY_VERSION} --no-cache-dir && \
    python3 -m pip install pandas==${PANDAS_VERSION} --no-cache-dir && \
    python3 -m pip install scipy==${SCIPY_VERSION} --no-cache-dir && \
    apk --purge del .build-deps
