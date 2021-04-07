ARG BASE_CONTAINER=jupyter/scipy-notebook
FROM jupyter/scipy-notebook:latest

USER root

# autosklearn requires swig, which no other image has
RUN apt-get update && \
    apt-get install -y --no-install-recommends swig && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*


USER $NB_UID

RUN pip install --quiet --no-cache-dir auto-sklearn
