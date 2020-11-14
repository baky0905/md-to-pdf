FROM ubuntu:18.04
ENV TZ=Europe/Kiev
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

LABEL "com.github.actions.name"="docx to md generator"
LABEL "com.github.actions.description"="Create mds files from docx."

RUN apt-get update
RUN apt-get -y install pandoc
RUN apt-get -y install git
#RUN apt-get -y install texlive-latex-base
#RUN apt-get -y install texlive-fonts-recommended

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
