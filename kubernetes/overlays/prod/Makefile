KUBECTL_DEPLOY_CONTEXT ?= 'k8s-sandbox'

SECRET_PATH ?= secret/rubin/usdf-lfa/

all: apply

ensure-context:
	if [ '$(shell kubectl config current-context)' != $(KUBECTL_DEPLOY_CONTEXT) ]; then echo "Configured deployment context inccorect; expecting $(KUBECTL_DEPLOY_CONTEXT)."; exit 1; fi

secrets:
	mkdir -p etc/.secrets/
	for i in url client-id secret-key; do vault kv get -format=table  --field=$$i $(SECRET_PATH)/summit-s3 > etc/.secrets/summit-$$i; done
	for i in url client-id secret-key; do vault kv get -format=table  --field=$$i $(SECRET_PATH)/usdf-s3 > etc/.secrets/usdf-$$i; done

clear-secrets:
	rm -rf etc/.secrets/

run-apply:
	kubectl apply -k .

run-dump:
	kubectl kustomize .

apply: ensure-context secrets run-apply clear-secrets

dump: ensure-context secrets run-dump clear-secrets
