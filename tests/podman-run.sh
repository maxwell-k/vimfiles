podman run -ti \
  --volume "$PWD":/root/.vim:Z \
  --workdir /root/.vim \
  --env PATH=/usr/sbin:/usr/bin:/sbin:/bin:/root/.local/bin \
  alpine:edge \
  sh -c "apk add vim npm ansible git beancount \
    && ansible-playbook -i, site.yaml \
    && tests/run.sh"
