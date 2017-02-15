# SSH access with public/private keys

This container doesn't do anything except run the sshd daemon. It can be used as an isolated environment accessed remotely to retrieve or drop files for archival. Volume-mounted storage can be provided as persistent storage.

## Configuration

  - Place public key in the container when its built or volume-mount directory with public key in it.
  - Listens to default port 22, but you can use a different port by editing /etc/ssh/sshd_config

## Run examples

Map to a non-default port.

```bash
$ docker run -d -p 2022:22 sshd
```

Volume-mount public SSH key:

```bash
$ docker run -d -p 2022:22 -v /home/user/.ssh:/home/user/.ssh sshd
```
