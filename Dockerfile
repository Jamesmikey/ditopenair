FROM rstudio/plumber
MAINTAINER aqi.ditnet.ac.tz

RUN R -e "install.packages('openair', lib='./lib')"

CMD ["/ditopenair/main.R"]