FROM abeltramo/cms

COPY ./cms.conf /usr/local/etc/cms.conf

EXPOSE 29000

HEALTHCHECK --interval=10s --timeout=1s --retries=5 CMD nc -z log 29000 || exit 1

CMD cmsDropDB -y &&\
    cmsInitDB &&\
    cmsAddAdmin -p admin alepollo93 &&\
    cmsLogService