init:
        @echo "initialize remote statefile"
        cd layers/$(LAYER) && rm -rf .terraform/modules/ && terraform init -reconfigure -no-color

validate: init
        @echo "running terraform validate"
        cd layers/$(LAYER) && \
        terraform validate -var "aws_accesskey=$aws_accesskey" -var "aws_secretkey=$aws_secretkey"

plan: validate
        @echo "plan the terraform file"
        cd layers/$(LAYER) && \
        terraform plan -var "aws_accesskey=$aws_accesskey" -var "aws_secretkey=$aws_secretkey"

apply: plan
        @echo "applying terraform files"
        cd layers/$(LAYER) && \
        terraform apply -var "aws_accesskey=$aws_accesskey" -var "aws_secretkey=$aws_secretkey" -auto-approve

plan-destroy: destroy
        @echo "running terraform destroy"
        cd layers/$(LAYER) && \
        terraform plan -var "aws_accesskey=$aws_accesskey" -var "aws_secretkey=$aws_secretkey" -destroy

destroy: init
        @echo "running terraform destroy"
        cd layers/$(LAYER) && \
        terraform destroy -var "aws_accesskey=$aws_accesskey" -var "aws_secretkey=$aws_secretkey" -auto-approve