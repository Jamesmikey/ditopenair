# start plumber
FROM trestletech/plumber


RUN apt-get update -qq && apt-get install -y --no-install-recommends \
  git-core \
  libssl-dev \
  libcurl4-gnutls-dev \
  curl \
  libsodium-dev \
  libxml2-dev

RUN install2.r plumber
RUN install2.r devtools
RUN install2.r openair


# copy model and scoring script
RUN mkdir /app

COPY main.R /app

WORKDIR /app

# plumb and run server
EXPOSE 8000
ENTRYPOINT ["R", "-e", \
    "pr <- plumber::plumb('/app/main.R'); pr$run(host='0.0.0.0', port=8080)"]