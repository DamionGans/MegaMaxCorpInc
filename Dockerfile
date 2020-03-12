FROM ubuntu:18.04
RUN apt-get update && apt-get install -y git
RUN git clone https://github.com/DamionGans/MegaMaxCorpInc.git
RUN cd MegaMaxCorpInc/src && bash installVM.sh