IMAGE_FAMILY := "common-cu110-ubuntu-2004"
ZONE := "us-west1-b"
INSTANCE_NAME := "stable-diffusion"
INSTANCE_TYPE := "n1-standard-4"

create_instance:
    gcloud compute instances create $(INSTANCE_NAME) \
        --zone=$(ZONE) \
        --image-family=$(IMAGE_FAMILY) \
        --image-project=deeplearning-platform-release \
        --maintenance-policy=TERMINATE \
        --accelerator="type=nvidia-tesla-t4,count=1" \
        --machine-type=$(INSTANCE_TYPE) \
        --boot-disk-size=120GB \
        --boot-disk-type=pd-ssd \
        --provisioning-model=SPOT \
        --instance-termination-action=STOP \
        --metadata="install-nvidia-driver=True"

# make create_instance
