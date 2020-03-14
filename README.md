# docker-vue-cli

## Requirements

- [Docker][docker]
- [Docker Compose][dockercompose] (optional)

## Installation

```console
$ docker pull aminnairi/vue-cli
```

## Basic usage

### [Docker][docker]

```console
$ docker run --volume "$PWD":/home/user/project aminnairi/vue-cli
```

### [Docker Compose][dockercompose]

```yaml
version: "3"

services:
    vue:
        image: aminnairi/vue-cli
        volumes:
            - .:/home/user/project
```

```console
$ docker-compose run vue
```

## [Vue UI][vueui]

I recommend using [Vue UI][vueui] for its simplicity.

### [Docker][docker]

```console
$ docker run --volume "$PWD":/home/user/project --publish 8000:8000 --publish 8080:8080 aminnairi/vue-cli ui --host 0.0.0.0 --port 8000
```

### [Docker Compose][dockercompose]

```yaml
 
# Version of the API to use
version: "3"

services:
    ui:
        # Docker image to use
        image: aminnairi/vue-cli
        # Command run when starting the service
        command: ui --host 0.0.0.0 --port 8000
        volumes:
            # Project folder to mount
            - .:/home/user/project
        ports:
            # Port for the Vue UI interface
            - 8000:8000
            # Port for your Vue application
            - 8080:8080
```

```console
$ docker-compose up ui
```

## 

[docker]: https://www.docker.com/
[dockercompose]: https://docs.docker.com/compose/
[vueui]: https://cli.vuejs.org/guide/creating-a-project.html#using-the-gui
