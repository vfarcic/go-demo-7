# go-demo-7

## Image (manual)

```bash
make linux

docker image build -t vfarcic/go-demo-7 .

VERSION=[...] # Replace `[...]` with the version/tag

docker image tag vfarcic/go-demo-7 vfarcic/go-demo-7:$VERSION

docker image push vfarcic/go-demo-7

docker image push vfarcic/go-demo-7:$VERSION
```