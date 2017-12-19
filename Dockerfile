FROM debian:8

RUN apt-get update
RUN apt-get -y install gearman-job-server=1.0.6-5 gearman-tools
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*

EXPOSE 4730

ENTRYPOINT [ "gearmand" ]
