FROM rstudio/plumber
MAINTAINER Docker User <jamesmichaely@gmail.com>

RUN R -e "install.packages('openair')"

RUN R -e "library('openair')"

COPY main.R /app

CMD ["/app/main.R"]