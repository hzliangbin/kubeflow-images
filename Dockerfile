FROM gcr.io/kubeflow-images-public/tensorflow-1.12.0-notebook-gpu:v0.5.0

MAINTAINER liangbin620@pingan.com.cn

WORKDIR /home/install

USER root

RUN apt-get update \
 && pip install --upgrade pip \
 && pip --no-cache-dir install opencv-python==3.4.2.17 \
 && pip --no-cache-dir install torch==1.0.1.post2 \
 && pip --no-cache-dir install torchvision \
 && pip --no-cache-dir install tornado \ 
 && apt-get install -y default-jdk 
 
EXPOSE 8888
USER jovyan
ENTRYPOINT ["tini", "--"]
CMD ["sh","-c", "jupyter notebook --notebook-dir=/home/jovyan --ip=0.0.0.0 --no-browser --allow-root --port=8888 --NotebookApp.token='' --NotebookApp.password='' --NotebookApp.allow_origin='*' --NotebookApp.base_url=${NB_PREFIX}"]
