<p align="center"><img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/160/apple/198/chart-with-downwards-trend_1f4c9.png" width="120px"></p>
<h1 align="center">kube-state-metrics (container image)</h1>
<p align="center">Built-from-source container image of <a href="https://kubernetes.io/">Kubernetes</a>' <a href="https://github.com/kubernetes/kube-state-metrics">kube-state-metrics</a></p>


## Tags

### Docker Hub

Available on Docker Hub as [`docker.io/ricardbejarano/kube-state-metrics`](https://hub.docker.com/r/ricardbejarano/kube-state-metrics):

- [`2.2.0`, `latest` *(Dockerfile)*](Dockerfile)

### RedHat Quay

Available on RedHat Quay as [`quay.io/ricardbejarano/kube-state-metrics`](https://quay.io/repository/ricardbejarano/kube-state-metrics):

- [`2.2.0`, `latest` *(Dockerfile)*](Dockerfile)


## Features

* Compiled from source during build time
* Built `FROM scratch`, with zero bloat
* Statically linked to the [`musl`](https://musl.libc.org/) implementation of the C standard library
* Reduced attack surface (no shell, no UNIX tools, no package manager...)
* Runs as unprivileged (non-`root`) user


## Building

```bash
docker build --tag ricardbejarano/kube-state-metrics --file Dockerfile .
```


## License

MIT licensed, see [LICENSE](LICENSE) for more details.
