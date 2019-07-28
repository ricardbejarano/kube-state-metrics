<p align=center><img src=https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/160/apple/198/chart-with-downwards-trend_1f4c9.png width=120px></p>
<h1 align=center>kube-state-metrics (container image)</h1>
<p align=center>Minimal container image of Kubernetes' <a href=https://github.com/kubernetes/kube-state-metrics>kube-state-metrics</a> server</p>


## Tags

### Docker Hub

Available on [Docker Hub](https://hub.docker.com) as [`ricardbejarano/kube-state-metrics`](https://hub.docker.com/r/ricardbejarano/kube-state-metrics):

- [`1.7.1-glibc`, `1.7.1`, `glibc`, `master`, `latest` *(Dockerfile.glibc)*](https://github.com/ricardbejarano/kube-state-metrics/blob/master/Dockerfile.glibc)
- [`1.7.1-musl`, `musl` *(Dockerfile.musl)*](https://github.com/ricardbejarano/kube-state-metrics/blob/master/Dockerfile.musl)

### Quay

Available on [Quay](https://quay.io) as:

- [`quay.io/ricardbejarano/kube-state-metrics-glibc`](https://quay.io/repository/ricardbejarano/kube-state-metrics-glibc), tags: [`1.7.1`, `master`, `latest` *(Dockerfile.glibc)*](https://github.com/ricardbejarano/kube-state-metrics/blob/master/Dockerfile.glibc)
- [`quay.io/ricardbejarano/kube-state-metrics-musl`](https://quay.io/repository/ricardbejarano/kube-state-metrics-musl), tags: [`1.7.1`, `master`, `latest` *(Dockerfile.musl)*](https://github.com/ricardbejarano/kube-state-metrics/blob/master/Dockerfile.musl)


## Features

* Super tiny (`glibc`-based is `~42.9MB` and `musl`-based is `~41.5MB`)
* Compiled from source during build time
* Binary pulled from official website
* Built `FROM scratch`, see [Filesystem](#filesystem) for an exhaustive list of the image's contents
* Reduced attack surface (no shell, no UNIX tools, no package manager...)


## Building

- To build the `glibc`-based image: `docker build -t kube-state-metrics:glibc -f Dockerfile.glibc .`
- To build the `musl`-based image: `docker build -t kube-state-metrics:musl -f Dockerfile.musl .`


## Filesystem

The images' contents are:

### `glibc`

Based on the [glibc](https://www.gnu.org/software/libc/) implementation of `libc`. Dynamically linked.

```
/
├── etc/
│   ├── group
│   └── passwd
├── kube-state-metrics
├── lib/
│   └── x86_64-linux-gnu/
│       ├── libc.so.6
│       └── libpthread.so.0
└── lib64/
    └── ld-linux-x86-64.so.2
```

### `musl`

Based on the [musl](https://www.musl-libc.org/) implementation of `libc`. Statically linked.

```
/
├── etc/
│   ├── group
│   └── passwd
├── kube-state-metrics
└── lib/
    └── ld-musl-x86_64.so.1
```


## License

See [LICENSE](https://github.com/ricardbejarano/kube-state-metrics/blob/master/LICENSE).
