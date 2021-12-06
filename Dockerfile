FROM rstudio/plumber
MAINTAINER Docker User <jamesmichaely@gmail.com>

RUN R -e "install.packages('openair')"

CMD ["/app/plumber.R"]