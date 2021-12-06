# start plumber
FROM trestletech/plumber

#install devtools
RUN R -e "install.packages('devtools')"

# install openair
RUN R -e "require(devtools)"
RUN R -e ".libPaths()"
RUN R -e "installed.packages()"
RUN R -e "install_github('davidcarslaw/openair')"

# copy model and scoring script
RUN mkdir /app

COPY main.R /app

WORKDIR /app

# plumb and run server
EXPOSE 8000
ENTRYPOINT ["R", "-e", \
    "pr <- plumber::plumb('/app/main.R'); pr$run(host='0.0.0.0', port=8080)"]