[![nlpsandbox.io](https://nlpsandbox.github.io/nlpsandbox-themes/banner/Banner@3x.png)](https://nlpsandbox.io)

# NLP Sandbox Notebooks

[![GitHub Release](https://img.shields.io/github/release/nlpsandbox/notebooks.svg?color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge&logo=github)](https://github.com/nlpsandbox/notebooks/releases)
[![GitHub CI](https://img.shields.io/github/workflow/status/nlpsandbox/notebooks/CI.svg?color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge&logo=github)](https://github.com/nlpsandbox/notebooks)
[![GitHub License](https://img.shields.io/github/license/nlpsandbox/notebooks.svg?color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge&logo=github)](https://github.com/nlpsandbox/notebooks/blob/main/LICENSE)
[![Docker Pulls](https://img.shields.io/docker/pulls/nlpsandbox/notebooks.svg?color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge&label=pulls&logo=docker)](https://hub.docker.com/r/nlpsandbox/notebooks)
[![Discord](https://img.shields.io/discord/770484164393828373.svg?color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge&label=Discord&logo=discord)](https://nlpsandbox.io/discord "Realtime support / chat with the community and the team")

## Introduction

This repository provides a portable development environment that includes
RStudio and Jupyter. This environment aims to support NLP Sandbox users who
develop or apply tools that intereact with the NLP Sandbox ecosystem.

For example, try the example notebooks included with this repository to perform
analysis using data stored in a local or remote instance of the NLP Sandbox Data
Node. See the Section [Notebooks](#Notebooks) for the list of example notebooks
included with this repository.

The Docker image [nlpsandbox/notebooks] that comes with this project is based on
the image [sagebionetworks/rstudio].

## Requirements

- [Docker Engine] >= 19.03.0
- [Synapse.org] user account

## Specification

- Notebooks version: 0.2.0
- NLP Sandbox schemas version: 1.2.0
- RStudio version: 4.1.0
- JupyterLab version: 3.2.1

## Notebooks

Example notebooks for RStudio:

Notebook | Description
-------- | -----------
[notebook.Rmd](notebooks/rstudio/notebook.Rmd)         | Default RStudio notebook.
[r-and-python.Rmd](notebooks/rstudio/r-and-python.Rmd) | Shows how to use R and Python together.
[data-node.Rmd](notebooks/rstudio/data-node.Rmd)       | Interact with an NLP Sandbox Data Node instance.

Example notebooks for Jupiter:

Notebook | Description
-------- | -----------
[hello-world.ipynb](notebooks/jupyter/hello-world.ipynb) | Hello World notebook.

> Important: Please make sure when you write your own notebooks that no
> sensitive information ends up being publicly available. Please check with the
> information security officer of your organization to confirm that the approach
> described here can be applied to your use case.

## Usage

Create the configuration file.

    cp .env.example .env

Specify in the config file what IDE should be used.

    # Notebook IDE ("rstudio" or "jupyter")
    IDE=rstudio

You can either pull the Docker image [nlpsandbox/notebooks] or build it using
the information included in `docker-compose.yml`. To pull the image and start
the IDE:

    docker compose pull
    docker compose up

If you want to build the image before starting the IDE, for instance after
customizing `Dockerfile`:

    docker compose up --build

To access the IDE, open your browser and follow the instructions below.

- RStudio: Navigate to http://localhost:8787
  - Authentication: see config file (`.env`)
- Jupyter: Navigate to http://localhost:8888
  - Authentication: use token displayed in the terminal when Jupyter started

### Stop the IDE

To stop the IDE, enter `Ctrl+C` followed by `docker compose down`.  If running
in detached mode, you will only need to enter `docker compose down`.

Tips:

- Add `-d` or `--detach` as in `docker compose up -d` to run in the background.
- If the command `docker compose` is missing, try `docker-compose`.

## Open the RStudio project

In RStudio, open the RStudio project provided by this repository by clicking on
the button `Project: (None)` > `Open Project...` on the top-right corner, then
select the file `nlpsandbox/nlpsandbox.Rproj`. You should now be able to open
and run the notebook `r-and-python.Rmd`. This will confirm that you can
successfully use R and Python togehter.

## Configuring the CI/CD workflow

The [CI/CD workflow] of this repository builds the Docker image
[nlpsandbox/notebooks] and pushes it to Docker Hub.

If you decide to use this repository as a GitHub template, you will need to
update the environment variables defined at the top of the [CI/CD workflow]. You
also need to create the following [GitHub Secrets].

- `DOCKERHUB_USERNAME`: Your Docker Hub username.
- `DOCKERHUB_TOKEN`: A personal access token (PAT) that has the permissions to
  push the image.

## Versioning

### GitHub tags

This repository uses [semantic versioning] to track the releases of this
project. This repository uses "non-moving" GitHub tags, that is, a tag will
always point to the same git commit once it has been created.

### Docker image and GitHub Pages

The artifact published by this repository are the Docker image
[nlpsandbox/notebooks] and HTML notebooks published to GitHub Pages.

The table below describes the GH Pages tags available.

| Tag name                    | Moving | Description
|-----------------------------|--------|------------
| `latest`                    | Yes    | Latest stable release.
| `edge`                      | Yes    | Latest commit made to the default branch.
| `edge-<sha>`                | No     | Same as above with the reference to the git commit.
| `<major>.<minor>.<patch>`   | No     | Stable release.

You should avoid using a moving tag like `latest` when deploying containers in
production, because this makes it hard to track which version of the image is
running and hard to roll back.

## License

[Apache License 2.0]

<!-- Links -->

[NLPSandbox.io]: https://nlpsandbox.io
[semantic versioning]: https://semver.org/
[Apache License 2.0]: https://github.com/nlpsandbox/notebooks/blob/main/LICENSE
[renv.lock]: renv.lock
[conda/i2b2-phi-dataset/environment.yml]: conda/i2b2-phi-dataset/environment.yml
[CI/CD workflow]: .github/workflows/ci.yml
[Docker Engine]: https://docs.docker.com/engine/install/
[docker.synapse.org/syn22277123/i2b2-phi-dataset]: https://www.synapse.org/#!Synapse:syn25813728
[2014 i2b2 NLP De-identification Challenge]: https://dx.doi.org/10.1016%2Fj.jbi.2015.06.007
[2014 i2b2 NLP De-identification Challenge Dataset]: https://portal.dbmi.hms.harvard.edu/projects/n2c2-nlp/
[NLP Sandbox schemas]: https://github.com/nlpsandbox/nlpsandbox-schemas
[Synapse.org]: https://synapse.org
[NLP Sandbox Data Node]: https://github.com/nlpsandbox/data-node
[NLP Sandbox CLI]: https://github.com/nlpsandbox/nlpsandbox-client
[GitHub Secrets]: https://docs.github.com/en/actions/reference/encrypted-secrets
[sagebionetworks/rstudio]: https://github.com/Sage-Bionetworks/docker-rstudio
[nlpsandbox/notebooks]: https://hub.docker.com/repository/docker/nlpsandbox/notebooks
