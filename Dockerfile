FROM rocker/r-base:latest

ENV script_name extract_prices.R

RUN apt-get update && apt-get install -y \
sudo \
pandoc \
pandoc-citeproc \
libcurl4-gnutls-dev \
libcairo2-dev \
libxt-dev \
libssl-dev \
libssh2-1-dev \
build-essential \
libxml2-dev

RUN R -e "install.packages('Rtools', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('glue', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('dplyr', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('readr', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('curl')"
RUN R -e "install.packages('httr')"
RUN R -e "install.packages('xml2')"
RUN R -e "install.packages(c('aws.s3'), repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('janitor')"
RUN R -e "install.packages('tidyr')"

RUN mkdir -p /code

COPY get_script.R /code

CMD Rscript /code/get_script.R $script_name