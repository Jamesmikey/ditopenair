FROM rstudio/plumber
MAINTAINER aqi.ditnet.ac.tz

RUN R -e "install.packages('openair')"

CMD ["/ditopenair/main.R"]