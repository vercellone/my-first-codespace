# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.245.2/containers/debian/.devcontainer/base.Dockerfile

# [Choice] Debian version (use bullseye on local arm64/Apple Silicon): bullseye, buster
ARG VARIANT="bullseye"
FROM mcr.microsoft.com/vscode/devcontainers/base:0-${VARIANT}

# ** [Optional] Uncomment this section to install additional packages. **
# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install --no-install-recommends <your-package-list-here>

RUN pwsh -Command Set-PSRepository -Name PSGallery -InstallationPolicy Trusted && \
    pwsh -Command Install-Module -Name Az -Scope AllUsers -Repository PSGallery && \
    pwsh -Command Install-Module -Name Pester -Scope AllUsers -Repository PSGallery && \
    pwsh -Command Set-PSRepository -Name PSGallery -InstallationPolicy Untrusted

CMD [ "pwsh" ]