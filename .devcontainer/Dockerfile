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

WORKDIR /workspace

ARG USERNAME
ARG UID
ARG GID
RUN set -eux; \
    # Remove existing user with same UID, if any \
    if getent passwd "$UID" > /dev/null; then \
    userdel -r $(getent passwd "$UID" | cut -d: -f1); \
    fi; \
    # Remove existing group with same GID, if any \
    if getent group "$GID" > /dev/null; then \
    groupdel $(getent group "$GID" | cut -d: -f1); \
    fi; \
    # Create the group and user \
    groupadd -g "$GID" "$USERNAME"; \
    useradd -m -u "$UID" -g "$GID" -s /bin/bash "$USERNAME"; \
    echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers; \
    echo "$USERNAME:$USERNAME" | chpasswd; \
    echo "root:root" | chpasswd; \
    chown -R "$UID:$GID" /workspace

USER $UID:$GID
