FROM --platform=linux/amd64 registry.fedoraproject.org/fedora-minimal:36

ENV GOLANG_VERSION=1.19

RUN microdnf -y install wget && \
    microdnf -y install tar && \
    microdnf -y install gzip && \
    microdnf clean all

WORKDIR /usr/local/
 
COPY ./go1.19.linux-amd64.tar.gz .

# run the untar
RUN wget https://go.dev/dl/go1.19.linux-amd64.tar.gz && \
    tar -xf go1.19.linux-amd64.tar.gz

ENV GO111MODULE="on"    
ENV GOROOT=/usr/local/go
ENV PATH=$GOPATH/bin:$GOROOT/bin:$PATH 

