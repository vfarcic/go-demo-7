# go-demo-7

## Image (manual)

```bash
make linux

VERSION=[...] # Replace `[...]` with the version/tag

docker image build -t vfarcic/go-demo-7 .

docker image tag vfarcic/go-demo-7 vfarcic/go-demo-7:$VERSION

docker image push vfarcic/go-demo-7

docker image push vfarcic/go-demo-7:$VERSION
```