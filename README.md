# docker-kaitai

[![CircleCI](https://circleci.com/gh/blacktop/docker-kaitai.png?style=shield)](https://circleci.com/gh/blacktop/docker-kaitai) [![License](http://img.shields.io/:license-mit-blue.svg)](http://doge.mit-license.org) [![Docker Stars](https://img.shields.io/docker/stars/blacktop/kaitai.svg)](https://hub.docker.com/r/blacktop/kaitai/) [![Docker Pulls](https://img.shields.io/docker/pulls/blacktop/kaitai.svg)](https://hub.docker.com/r/blacktop/kaitai/) [![Docker Image](https://img.shields.io/badge/docker%20image-127MB-blue.svg)](https://hub.docker.com/r/blacktop/kaitai/)

> Kaitai Struct Docker Image

---

## Dependencies

- [ubuntu:bionic](https://hub.docker.com/_/ubuntu/)

## Image Tags

```bash
REPOSITORY               TAG                 SIZE
blacktop/kaitai          latest              127MB
blacktop/kaitai          0.8                 127MB
```

## Getting Started

```
$ docker run --rm -v `pwd`:/usr/share/kaitai-struct blacktop/kaitai:0.8 -t python mach_o.ksy
```

## Issues

Find a bug? Want more features? Find something missing in the documentation? Let me know! Please don't hesitate to [file an issue](https://github.com/blacktop/docker-kaitai/issues/new)

## CHANGELOG

See [`CHANGELOG.md`](https://github.com/blacktop/docker-kaitai/blob/master/CHANGELOG.md)

## Contributing

[See all contributors on GitHub](https://github.com/blacktop/docker-kaitai/graphs/contributors).

Please update the [CHANGELOG.md](https://github.com/blacktop/docker-kaitai/blob/master/CHANGELOG.md) and submit a [Pull Request on GitHub](https://help.github.com/articles/using-pull-requests/).

## License

MIT Copyright (c) 2018 **blacktop**
