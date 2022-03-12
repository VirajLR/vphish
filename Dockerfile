FROM debian:latest
LABEL MAINTAINER="https://github.com/VirajLR/vphish"

WORKDIR /vphish/
ADD . /vphish

RUN apt update && \
    apt full-upgrade -y && \
    apt install -y curl unzip wget && \
    apt install --no-install-recommends -y php && \
    apt clean
CMD ["./vphish.sh"]
