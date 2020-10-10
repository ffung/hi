FROM python:3-alpine as base

FROM base as builder

#Install dependencies
RUN mkdir /install
WORKDIR /install
COPY requirements.txt /requirements.txt
RUN pip install --prefix=/install -r /requirements.txt

#Install app
COPY . /app
RUN pip install --no-deps --prefix=/install /app

FROM base
COPY --from=builder /install /usr/local

EXPOSE 5000
CMD ["hi"]

