FROM abeltramo/cms

COPY ./cms.conf /usr/local/etc/cms.conf

# COPY OII TASKS

RUN mkdir contest
COPY ./contest/ contest/

CMD cmsImportContest -i contest/ &&\
    cmsResourceService -a 1