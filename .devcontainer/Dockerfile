FROM texlive/texlive:latest-full

RUN apt-get update && apt-get install -y --no-install-recommends \
    sudo \
    ssh \
    nano \
    vim \
    latex-cjk-all \
    fonts-noto-cjk \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN echo "root:root" | chpasswd

ARG USERNAME
ARG UID
ARG GID
RUN groupadd --gid $GID $USERNAME && \
    adduser --uid $UID --gid $GID $USERNAME && \
    echo "${USERNAME} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
USER $USERNAME

WORKDIR /workspace
