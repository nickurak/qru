Quick and dirty docker container for generating QR codes on the terminal, using libqrencode.

It can read from stdin:

```
echo https://nickurak.ca/ | docker run --rm -i atrus/qru -
```

It can read a single param:

```
docker run --rm atrus/qru "Hello"
```

It also serves as a pretty short example of how to use multi-stage docker builds. See the `Dockerfile` for details.
