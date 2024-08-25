FROM texlive/texlive:latest

RUN tlmgr update --self && tlmgr install \
    latexmk \
    texliveonfly \
    && apt-get update && apt-get install -y \
    python3-pygments \
    && rm -rf /var/lib/apt/lists/*

RUN echo '#!/bin/bash\n\
tlmgr install "$@"' > /usr/local/bin/install-tex-packages && \
    chmod +x /usr/local/bin/install-tex-packages

# This would be settup in the docker-compose file
ENV WORKDIR=/project
WORKDIR $WORKDIR

CMD ["tail", "-f", "/dev/null"]