FROM python:3.7

ARG PORT
ENV PYTHON_VERSION=${PORT}
ENV JUPYTERLAB_VERSION=1.1.4

# Build-time metadata as defined at http://label-schema.org
ARG BUILD_DATE
ARG VCS_REF
ARG APP_VCS_REF

LABEL maintainer="Peedy2495 <peedy2495@nomail.net>" \
      jupyterlab-version=$JUPYTERLAB_VERSION \
      python-version=$PYTHON_VERSION \
      app-vcs-url="https://github.com/jupyterlab/jupyterlab" \
      app-vcs-ref=$APP_VCS_REF \
      vcs-url-orig="https://github.com/jupyterlab/jupyterlab.git" \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.name="jupyterlab-docker" \
      org.label-schema.description="JupyterLab computational environment" \
      org.label-schema.url="https://jupyterlab.readthedocs.io/en/stable/#" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/peedy2495/JupyterLab.git" \
      org.label-schema.docker.cmd="docker run --detach --publish 0.0.0.0:8888:8888 -v /home/:/notebooks" \
      org.label-schema.schema-version="1.0"

RUN git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it && \
  bash ~/.bash_it/install.sh --silent

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
  apt-get upgrade -y && \
  apt-get install -y nodejs texlive-latex-extra texlive-xetex && \
  rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade \
    jupyterlab==$JUPYTERLAB_VERSION \
    ipywidgets \
    jupyterlab_latex \
    plotly \
    bokeh \
    numpy \
    scipy \
    numexpr \
    patsy \
    scikit-learn \
    scikit-image \
    matplotlib \
    ipython \
    pandas \
    xlrd \
    sympy \
    seaborn \
    nose \
    ray \
    jupyterlab-git && \
    jupyter labextension install \
    @jupyter-widgets/jupyterlab-manager \
    @jupyterlab/latex \
    @mflevine/jupyterlab_html \
    jupyterlab-drawio \
    @jupyterlab/plotly-extension \
    jupyterlab_bokeh \
    jupyterlab-spreadsheet \
    @jupyterlab/git

COPY bin/entrypoint.sh /usr/local/bin/
COPY config/ /root/.jupyter/

EXPOSE 8888
VOLUME /notebooks
WORKDIR /notebooks
ENTRYPOINT ["entrypoint.sh"]


