FROM rocker/shiny

MAINTAINER Florian Endel "florian@endel.at"

## debian packages
RUN DEBIAN_FRONTEND=noninteractive \
  && apt-get -y update \
  && apt-get -y dist-upgrade \
  && apt-get -y --no-install-recommends install \
    xml2 libxml2 libxml2-dev libxml2-utils xml-core \ 
    libssl-dev \ 
    # texlive
    texlive texlive-latex-recommended texlive-latex-extra texlive-fonts-recommended texlive-font-utils texlive-extra-utils prosper \ 
    # latex related tools
    poppler-utils ghostscript psutils t1utils texlive-pstricks dot2tex ps2eps \
    # fonts
    fonts-droid-fallback fonts-ipafont-mincho fonts-ipafont-gothic fonts-arphic-ukai fonts-arphic-uming fonts-nanum lmodern tipa fonts-liberation tex-gyre fonts-texgyre \
    # general tools
    htop debhelper git \ 
  && apt-get autoclean \ 
  && rm -rf /var/lib/apt/lists/* 
  
  #&& mkdir /srv/shiny-server/log \
  #&& sed -i 's%var%srv/shiny-server%g' /etc/shiny-server/shiny-server.conf 

  # syntax highlighting: python-pygments

## R packages

RUN R -e "install.packages(c('acepack', 'assertthat', 'base64enc', 'BH', 'bitops', 'brglm', 'Cairo', 'car', 'caTools', 'chron', 'classInt', 'colorspace', 'curl', 'data.table', 'DBI', 'devtools', 'dichromat', 'digest', 'docopt', 'dplyr', 'e1071', 'evaluate', 'forestplot', 'formatR', 'Formula', 'ggplot2', 'git2r', 'gridExtra', 'gtable', 'highr', 'Hmisc', 'htmltools', 'htmlwidgets', 'httpuv', 'httr', 'jsonlite', 'knitr', 'labeling', 'latticeExtra', 'lazyeval', 'leaflet', 'lme4', 'lubridate', 'magrittr', 'markdown', 'MatrixModels', 'memoise', 'mime', 'minqa', 'munsell', 'nloptr', 'openssl', 'pbkrtest', 'plyr', 'png', 'profileModel', 'quantreg', 'R6', 'raster', 'RColorBrewer', 'Rcpp', 'RcppEigen', 'reshape2', 'rmarkdown', 'saves', 'scales', 'shiny', 'shinyBS', 'shinyjs', 'sp', 'SparseM', 'stargazer', 'stringi', 'stringr', 'tabplot', 'tidyr', 'whisker', 'withr', 'xtable', 'yaml', 'zoo'), repos='https://cran.rstudio.com/')"


## shiny application

#RUN cp -R /usr/local/lib/R/site-library/shiny/examples/* /srv/shiny-server/
