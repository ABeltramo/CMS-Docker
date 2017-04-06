FROM abeltramo/cms

COPY ./cms.conf /usr/local/etc/cms.conf

CMD cmsImportContest -i /tmp/contest/ &&\
    cmsResourceService -a 1