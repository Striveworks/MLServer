pushd runtimes/xgboost
poetry lock
popd

pushd runtimes/huggingface
poetry lock
popd

pushd runtimes/sklearn
poetry lock
popd

poetry lock

version=$(sed 's/^__version__ = "\(.*\)"/\1/' ./mlserver/version.py)
tag=${version}-sklearn-$(date '+%Y-%m-%d')
./hack/build-image.sh ${version} sklearn || true
podman tag localhost/seldonio/mlserver:${version}-sklearn 724664234782.dkr.ecr.us-east-1.amazonaws.com/library/hardened/seldonio/mlserver:${tag}
podman push 724664234782.dkr.ecr.us-east-1.amazonaws.com/library/hardened/seldonio/mlserver:${tag}
