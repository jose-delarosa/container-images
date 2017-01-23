# SSH access with public/private certificates

SSH to a container with a private SSH certificate

## Configuration

  - Use your own public/private certificates
  - Place certificate in the container when its built (See Dockerfile).
  - Uses default port 22, but you can use a different one by editing /etc/ssh/sshd_config

## Run example

```bash
$ docker run -d -p 22:22 sshd
```
