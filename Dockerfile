FROM continuumio/miniconda3

MAINTAINER Yichao.Li@stjude.org

USER root

WORKDIR /app

ADD . /app

RUN conda config --add channels defaults
RUN conda config --add channels bioconda
RUN conda config --add channels conda-forge
RUN conda config --set channel_priority flexible
RUN conda create -n genome_editing -c cheng_lab easy_prime

RUN echo "conda activate genome_editing" >> ~/.bashrc
SHELL ["/bin/bash", "--login", "-c"]
RUN echo `which python`
RUN pip install xgboost==1.4.0
RUN pip install dash-bootstrap-components==0.12.2
RUN pip install dash==1.20.0
RUN pip install dash-bio==0.2.0
RUN pip install dash-core-components==1.16.0
RUN pip install dash-html-components==1.1.3
RUN pip install dash-renderer==1.9.1
RUN pip install dash-table==4.11.3
RUN pip install Werkzeug==2.0.0


EXPOSE 80

CMD ["./run.sh"]
