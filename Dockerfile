FROM microsoft/azure-cli

RUN  curl -fsSL https://storage.googleapis.com/kubernetes-release/release/v1.14.2/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
    && curl -fsSL https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.7.0/kubeseal-linux-amd64 -o /usr/local/bin/kubeseal \
    && curl -fsSL https://raw.githubusercontent.com/helm/helm/master/scripts/get -o /usr/local/bin/install_helm.sh \
    && chmod +x /usr/local/bin/kubectl /usr/local/bin/kubeseal /usr/local/bin/install_helm.sh \
    && install_helm.sh \
    && rm /usr/local/bin/install_helm.sh \
    && echo -e "\n" >> ~/.bashrc \
    && echo "source /usr/share/bash-completion/bash_completion" >> ~/.bashrc \
    && echo "source <(kubectl completion bash)" >> ~/.bashrc \
    && curl -fsSL https://releases.hashicorp.com/terraform/0.11.3/terraform_0.11.3_linux_amd64.zip -o ./terraform_0.11.3_linux_amd64.zip \
    && unzip terraform_0.11.3_linux_amd64.zip \
    && mv terraform /usr/bin \
    && rm terraform_0.11.3_linux_amd64.zip \
    && apk add --no-cache bash-completion
