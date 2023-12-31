# 1) choose base container
# generally use the most recent tag

# base notebook, contains Jupyter and relevant tools
# See https://github.com/ucsd-ets/datahub-docker-stack/wiki/Stable-Tag 
# for a list of the most current containers we maintain
ARG BASE_CONTAINER=ghcr.io/ucsd-ets/scipy-ml-notebook:2023.4-stable

FROM $BASE_CONTAINER

LABEL maintainer="UC San Diego ITS/ETS <ets-consult@ucsd.edu>"

# 2) change to root to install packages
USER root
 
# Install g++ using apt-get
# Explanation: You switch to the root user to perform system-level installations.
# The g++ package is required for C++ compilation.
RUN apt-get update && apt-get install -y g++

# 3) install packages using notebook user
RUN useradd -u 1001 ayeddanapudi
USER ayeddanapudi

# RUN conda install -y scikit-learn

#RUN pip install --no-cache-dir networkx scipy
#RUN pip install --no-cache-dir git+https://github.com/nicolasdugue/DirectedLouvain.git@master
#RUN pip install --no-cache-dir git+https://github.com/pybind/pybind11.git@master 


# Override command to disable running jupyter notebook at launch
# CMD ["/bin/bash"]
