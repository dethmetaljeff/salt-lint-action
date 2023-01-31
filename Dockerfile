FROM python:3.9-buster

LABEL "maintainer"="Jeff Engleman <dethmetaljeff@gmail.com>"
LABEL "repository"="https://github.com/dethmetaljeff/salt-lint-action"
LABEL "homepage"="https://github.com/dethmetaljeff/salt-lint-action"

# Update APT packages
RUN apt-get update && apt-get upgrade -y -o DPkg::Options::=--force-confold

# Install salt-lint
RUN pip install salt-lint

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
