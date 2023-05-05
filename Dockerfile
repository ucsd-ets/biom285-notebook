# 1) choose base container
# generally use the most recent tag

# base notebook, contains Jupyter and relevant tools
# See https://github.com/ucsd-ets/datahub-docker-stack/wiki/Stable-Tag 
# for a list of the most current containers we maintain
ARG BASE_CONTAINER=ucsdets/datahub-base-notebook:2023.1-stable

FROM $BASE_CONTAINER

LABEL maintainer="UC San Diego ITS/ETS <ets-consult@ucsd.edu>"

# 2) change to root to install packages
USER root

RUN apt-get -y install htop

# 3) install packages using notebook user
USER jovyan

#RUN R -e "install.packages(c('BiocManager', 'knitr', 'rmarkdown', 'WGCNA', 'ggplot2', 'dplyr'), repos='http://cran.rstudio.com/')" && \
#    R -e "install.packages('bio3d', repos='http://cran.rstudio.com/')" && \
#    R -e "BiocManager::install()" && \
#    R -e "BiocManager::install(c('DESeq2', 'AnnotationDbi', 'pathview', 'gage', 'gageData'))"
    
#RUN R -e "update.packages(ask = FALSE, repos = 'http://cran.rstudio.com/')"

# RUN conda install -y scikit-learn

RUN pip install --no-cache-dir networkx scipy

# Override command to disable running jupyter notebook at launch
# CMD ["/bin/bash"]
