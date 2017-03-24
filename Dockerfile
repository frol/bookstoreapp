FROM frolvlad/alpine-oraclejdk8:full
#FROM anapsix/alpine-java
VOLUME /tmp

ENV HOST ${HOST:-192.168.99.100}

ENV BUCKET_NAME ${BUCKET_NAME:-books}

ADD target/bookstore-1.0.0-SNAPSHOT.jar app.jar
RUN sh -c 'touch /app.jar'
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]
