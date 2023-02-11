## Lima

Docker on Lima のための設定ファイルを置いておきます。

## 初回設定

```sh
# install lima
brew install lima

# create vm
limactl start ~/.config/lima/docker_x86_64.yml

# create docker context using lima
docker context create lima-docker_x86_64 --docker "host=unix:///Users/oky123/.lima/docker_x86_64/sock/docker.sock"
```

以下を`~/.zshrc`に追記

```sh
export DOCKER_HOST=unix://${HOME}/.lima/docker_x86_64/sock/docker.sock
```

読み直して docker が実行できる確認

```sh
source ~/.zshrc
docker run hello-world
```
