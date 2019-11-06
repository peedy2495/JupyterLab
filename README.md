[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://github.com/peedy2495/Jupyterlab/blob/master/LICENSE)
![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/peedy2495/jupyterlab)
[![Docker Pulls](https://img.shields.io/docker/pulls/peedy2495/jupyterlab.svg)](https://hub.docker.com/r/peedy2495/jupyterlab/)


## Jupterlab Docker container

**This Docker container runs as root user!** It can be helpful when e.g. the popular jupyter/datascience-notebook image does not work because it runs as Jovyan user.

#### Included packages

- ipywidgets : gui widgets for user interaction
- jupyterlab_latex : LaTeX language support
- plotly : create interactive diagrams
- bokeh : interactive visualization library
- numpy : fundamental package for scientific computing
- scipy : ecosystem for mathematics, science, and engineering
- numexpr : fast numerical expression evaluator for NumPy
- patsy : describing statistical models and building design matrices
- scikit-learn : efficient ML-tools for data mining and data analysis
- scikit-image : collection of algorithms for image processing
- matplotlib : the most popular way to create diagrams
- ipython : rich toolkit to help you using Python interactively
- pandas : handle all kinds of structured data
- xlrd : handle M$-Excel files
- sympy : library for symbolic mathematics
- seaborn : statistical data visualization
- nose : easier to write, find and run tests
- ray : fast parallel computation for your code
- jupyterlab-git : any questions? ;-)

#### Installed Jupyterlab extensions
- [Jupyter Widgets](https://ipywidgets.readthedocs.io/en/latest/examples/Widget%20Basics.html)
- [@jupyterlab/latex](https://github.com/jupyterlab/jupyterlab-latex)
- [@jupyterlab/plotly-extension](https://github.com/jupyterlab/jupyter-renderers/tree/master/packages/plotly-extension)
- [@mflevine/jupyterlab_html](https://github.com/mflevine/jupyterlab_html)
- [jupyterlab-drawio](https://github.com/QuantStack/jupyterlab-drawio)
- [jupyterlab-spreadsheet](https://github.com/quigleyj97/jupyterlab-spreadsheet)
- [jupyterlab_bokeh](https://github.com/bokeh/jupyterlab_bokeh)
- [@jupyterlab/toc](https://www.npmjs.com/package/@jupyterlab/toc)
- [@jupyterlab/git](https://www.npmjs.com/package/@jupyterlab/git)

### Your notebooks

Volumes can be mounted into /notebooks folder e.g.  

    docker run -v /home/myuser/notebooks:/notebooks --rm -it -p 8888:8888 peedy2495/jupyterlab

If the folder contains a requirements.txt file, it will be installed automatically when the container starts up.
Pull/Update to latest version

    docker pull peedy2495/jupyterlab:latest

### Run

    docker run --rm -it -p 8888:8888 peedy2495/jupyterlab

or if you want to define your own password

    docker run --rm -it -p 8888:8888 -e PASSWORD="<your_secret>" peedy2495/jupyterlab

### Build from source

    docker build -t peedy2495/jupyterlab .
