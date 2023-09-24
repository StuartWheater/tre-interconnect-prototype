#
# Generate crypt4gh keys
#

mkdir ./cert

crypt4gh-keygen --sk ./cert/ds.key --pk ./cert/ds.pub

Passphrase 'trefx'

#
# Run Minio
#

# Start (in kude dir)

rm -rf minio-data
tar xf minio-data.tar.gz

podman play kube ds-minio.yml
podman pod logs -f ds-minio

# [Stop & Cleanup]

podman pod stop ds-minio
podman pod rm ds-minio

#
# Run Workflow
#

mkdir ./var

../../WfExS-backend/WfExS-backend.py --log-file ./var/ds.log --local-config ds_config.yaml stage --workflow-config ds_workflow-stage.yaml

../../WfExS-backend/WfExS-backend.py --log-file ./var/ds.log --local-config ds_config.yaml execute --workflow-config ds_workflow-stage.yaml
