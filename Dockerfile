FROM rstudio/plumber
MAINTAINER aqi.ditnet.ac.tz

RUN R -e "install.packages('openair', lib='/etc/R/Renviron')"

CMD ["/ditopenair/main.R"]