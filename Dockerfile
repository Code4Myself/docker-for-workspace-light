#
#  base-image:tag 
# 
FROM python:3.8

#
# time zone to Asia/Tokyo
#
ENV TZ=Asia/Tokyo

#
# upgrade pip and instlal required python packages 
# 
RUN pip install --upgrade pip && \
    pip install jupyter geopandas pandas numpy seaborn matplotlib folium keplergl sodapy shapely

# 
# install rust, cargo, and additional codes for rust build
# 
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y --default-toolchain stable
ENV PATH="/root/.cargo/bin:$PATH"

#
# install excavator
#
RUN apt update -y \
    && apt install -y build-essential \
    && cargo install --git https://github.com/ichnion/excavator --branch develop

#
# create working directory for jupyter notebook 
#
WORKDIR /workdir

#
# listen port of container
#
EXPOSE 8888

#
# ENTRYPOINT: startup command when launching container(without overwriting 'docker run')
# "jupyter-notebook" => launching command jupyter-notebook 
# "--ip=0.0.0.0" => no IP restriction 
# "--port=8888" => port number 
# ”--no-browser” => no browser 
# "--allow-root" => add root credential, only for personal use
# "--NotebookApp.token=''" => launch withouth token  
#
ENTRYPOINT ["jupyter-notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token=''"]

#
# CMD: startup command when launching container(with overwriting 'docker run')
# "--notebook-dir=/workdir" => working directory of juypter notebook
#
CMD ["--notebook-dir=/workdir"]

#
# docker builder prune
# docker build -t codeformyself_excavator_ws_image:2022.01 .
# docker save codeformyself_excavator_ws_image -o codeformyself_excavator_ws_image.tar
# 