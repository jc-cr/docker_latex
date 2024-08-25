FROM texlive/texlive:latest

# Install additional packages
RUN tlmgr update --self && tlmgr install \
    latexmk \
    texliveonfly \
    && apt-get update && apt-get install -y \
    python3-pygments \
    && rm -rf /var/lib/apt/lists/*

# Create a script to install additional TeX packages
RUN echo '#!/bin/bash\n\
tlmgr install "$@"' > /usr/local/bin/install-tex-packages && \
    chmod +x /usr/local/bin/install-tex-packages

WORKDIR /latex_project

# Keep the container running
CMD ["tail", "-f", "/dev/null"]
