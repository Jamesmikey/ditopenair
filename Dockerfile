FROM rstudio/plumber
MAINTAINER Docker User <jamesmichaely@gmail.com>

RUN R -e "install.packages('openair')"

RUN R -e "install.packages('tibble')"

RUN R -e "library('openair')"


# copy model and scoring script
RUN mkdir /app

COPY main.R /app

CMD ["/app/main.R"]