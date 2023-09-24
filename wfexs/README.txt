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

podman play kube test-wfexs.yml
podman pod logs -f test-trefx

# [Stop & Cleanup]

podman pod stop test-trefx
podman pod rm test-trefx

#
# Run Workflow
#

mkdir ./var

../../WfExS-backend/WfExS-backend.py --log-file ./var/ds.log --local-config ds_config.yaml stage --workflow-config ds_workflow-stage.yaml

../../WfExS-backend/WfExS-backend.py --log-file ./var/ds.log --local-config ds_config.yaml execute --workflow-config ds_workflow-stage.yaml
