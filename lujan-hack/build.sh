DATE=$(date '+%Y-%m-%d')
FULL_TAG=724664234782.dkr.ecr.us-east-1.amazonaws.com/library/hardened/seldonio/mlserver:1.6.1-sklearn-${DATE}
podman build -t ${FULL_TAG} .
