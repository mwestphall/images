FROM htcondor/submit

ENV UPSTREAM_RAW=https://raw.githubusercontent.com/htcondor/htcondor/b3132e353c4e0b265117701823f7bf3c219e90ce

RUN yum install -y pip && pip install jupyterlab

# Copy the modified annex source files from https://github.com/htcondor/htcondor/pull/3668
# into the htcondor site-packages directory 
RUN curl -o /usr/libexec/condor/annex/spark.fragment -L $UPSTREAM_RAW/src/condor_scripts/annex/spark.fragment && \
    curl -o /usr/lib64/python3.9/site-packages/htcondor_cli/annex_validate.py -L $UPSTREAM_RAW/src/condor_tools/htcondor_cli/annex_validate.py

# Move the htcondor supervisord file and then reference it from our own submit file
RUN mv /etc/supervisord.conf /etc/supervisord-condor.conf
COPY supervisord.conf /etc/supervisord.conf
