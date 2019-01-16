FROM golang:latest
WORKDIR /root/
RUN git clone https://github.com/restic/restic
WORKDIR /root/restic
RUN make
RUN cp restic /usr/bin
WORKDIR /root
RUN rm -r -f restic
WORKDIR /mnt
RUN mkdir restic
VOLUME /mnt/restic
WORKDIR /
RUN mkdir data
VOLUME /data
ENV RESTIC_REPOSITORY /mnt/restic
ENV B2_ACCOUNT_ID unknown
ENV B2_ACCOUNT_KEY unknown
ENV RESTIC_REPOSITORY unknown
ENV RESTIC_PASSWORD_FILE unknown

#FROM alpine:latest
#RUN apk --no-cache add git
#WORKDIR /root/
#COPY --from=0 /go/src/github.com/alexellis/href-counter/app .
#CMD ["./app"]
