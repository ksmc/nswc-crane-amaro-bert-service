FROM tensorflow/tensorflow:1.12.0-gpu-py3
ENV DEBIAN_FRONTEND noninteractive

ARG BERT_S3_BUCKET_ARG=foo
ARG AWS_ACCESS_KEY_ID_ARG=foo
ARG AWS_SECRET_ACCESS_KEY_ARG=foo

ENV BERT_S3_BUCKET=${BERT_S3_BUCKET_ARG}
ENV AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID_ARG}
ENV AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY_ARG}

RUN pip install bert-serving-server[http] awscli

RUN mkdir -p /app
COPY ./entrypoint.sh /app
RUN aws s3 cp ${BERT_S3_BUCKET} /app --recursive
WORKDIR /app
ENTRYPOINT ["/app/entrypoint.sh"]
CMD []
HEALTHCHECK --timeout=5s CMD curl -f http://localhost:8125/status/server || exit 1