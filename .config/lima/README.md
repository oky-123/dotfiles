## Lima

Docker on Limaのための設定ファイルを置いておきます。

## 初回設定

```sh
limactl start ~/.config/lima/docker_x86_64.yml
docker context create lima-docker_x86_64 --docker "host=unix:///Users/oky123/.lima/docker_x86_64/sock/docker.sock"
```

以下を`~/.zshrc`に追記
```sh
export DOCKER_HOST=unix://${HOME}/.lima/docker_x86_64/sock/docker.sock
```

読み直してdockerが実行できる確認

```sh
source ~/.zshrc
docker run hello-world
```
