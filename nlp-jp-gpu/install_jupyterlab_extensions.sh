#!/bin/bash

jupyter labextension install \
    @lckr/jupyterlab_variableinspector \
    @jupyterlab/plotly-extension \
    @jupyterlab/toc \
    @jupyterlab/katex-extension \
    #jupyterlab_tensorboard \
    #@jupyter-widgets/jupyterlab-manager@0.38 \
    #@krassowski/jupyterlab_go_to_definition
#jupyter serverextension enable --py jupyterlab_tensorboard
#jupyter serverextension enable --py --sys-prefix widgetsnbextension
