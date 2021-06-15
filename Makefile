#Tags

TERRAFORM_VERSION=0.15.4

help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

terraform-init: ## Run terraform init to download all necessary plugins
	docker container run --rm \
	--mount type=bind,src=$$PWD,target=/app \
	--mount type=bind,src=$$HOME/.ssh,target=/root/.ssh \
	-w /app/ \
	-e GOOGLE_APPLICATION_CREDENTIALS=/app/Terraform/credentials.json \
	hashicorp/terraform:$(TERRAFORM_VERSION) \
	-chdir=Terraform init -upgrade=true


terraform-plan: ## Run terraform plan, to prepare the infraestructure
	docker container run --rm \
	--mount type=bind,src=$$PWD,target=/app \
	--mount type=bind,src=$$HOME/.ssh,target=/root/.ssh \
	-w /app/ \
	-e GOOGLE_APPLICATION_CREDENTIALS=/app/Terraform/credentials.json \
	hashicorp/terraform:$(TERRAFORM_VERSION) \
	-chdir=Terraform plan -out="terraform_plan"

terraform-new-workspace-canary: ## Create workspace CANARY for tests
	docker container run --rm \
	--mount type=bind,src=$$PWD,target=/app \
	--mount type=bind,src=$$HOME/.ssh,target=/root/.ssh \
	-w /app/ \
	-e GOOGLE_APPLICATION_CREDENTIALS=/app/Terraform/credentials.json \
	hashicorp/terraform:$(TERRAFORM_VERSION) \
	-chdir=Terraform workspace new canary

terraform-new-workspace-stable: ## Create workspace STABLE for final release
	docker container run --rm \
	--mount type=bind,src=$$PWD,target=/app \
	--mount type=bind,src=$$HOME/.ssh,target=/root/.ssh \
	-w /app/ \
	-e GOOGLE_APPLICATION_CREDENTIALS=/app/Terraform/credentials.json \
	hashicorp/terraform:$(TERRAFORM_VERSION) \
	-chdir=Terraform workspace new stable


terraform-select-workspace-stable: ## Select workspace stable
	docker container run --rm \
	--mount type=bind,src=$$PWD,target=/app \
	--mount type=bind,src=$$HOME/.ssh,target=/root/.ssh \
	-w /app/ \
	-e GOOGLE_APPLICATION_CREDENTIALS=/app/Terraform/credentials.json \
	hashicorp/terraform:$(TERRAFORM_VERSION) \
	-chdir=Terraform workspace select stable

terraform-select-workspace-canary: ## Select workspace canary
	docker container run --rm \
	--mount type=bind,src=$$PWD,target=/app \
	--mount type=bind,src=$$HOME/.ssh,target=/root/.ssh \
	-w /app/ \
	-e GOOGLE_APPLICATION_CREDENTIALS=/app/Terraform/credentials.json \
	hashicorp/terraform:$(TERRAFORM_VERSION) \
	-chdir=Terraform workspace select canary


terraform-apply: ## Run terraform apply, apply the PLAN
	docker container run --rm \
	--mount type=bind,src=$$PWD,target=/app \
	--mount type=bind,src=$$HOME/.ssh,target=/root/.ssh \
	-w /app/ \
	-e GOOGLE_APPLICATION_CREDENTIALS=/app/Terraform/credentials.json \
	hashicorp/terraform:$(TERRAFORM_VERSION) \
	-chdir=Terraform apply "terraform_plan"

terraform-destroy: ## Run terraform destroy, destroy applied PLAN
	docker container run --rm \
	--mount type=bind,src=$$PWD,target=/app \
	--mount type=bind,src=$$HOME/.ssh,target=/root/.ssh \
	-w /app/ \
	-e GOOGLE_APPLICATION_CREDENTIALS=/app/Terraform/credentials.json \
	hashicorp/terraform:$(TERRAFORM_VERSION) \
	-chdir=Terraform destroy -auto-approve


terraform-cli: ## Run terraform container to manage CLI commands
	docker container run --rm \
	--mount type=bind,src=$$PWD,target=/app \
	--mount type=bind,src=$$HOME/.ssh,target=/root/.ssh \
	-w /app/ \
	-e GOOGLE_APPLICATION_CREDENTIALS=/app/Terraform/credentials.json \
	hashicorp/terraform:$(TERRAFORM_VERSION) \
	sh