if [ $# -lt 1 ]; then
    echo "Usage: $0 <host>"
    exit 1
fi

export CI_HOST="$1"
export AZ_RESOURCE_GROUP="PCP_Builds"
export AZ_LOCATION="eastus"
export AZ_VM_SIZE="Standard_F2s_v2"
export AZ_IMAGE="image-${CI_HOST}"
export AZ_PLAN_INFO=""
[ ! -z ${BUILD_ID+x} ] && export AZ_VMSS="build-${BUILD_ID}-${CI_HOST}"
export AZ_STORAGE_ACCOUNT="pcpstore"
export AZ_STORAGE_URL="https://pcpstore.blob.core.windows.net"
export AZ_STORAGE_CONTAINER="vhd-images"

bintray_subject="pcp"
bintray_package="pcp"
bintray_params=""

if [ -e "hosts/${CI_HOST}/env.sh" ]; then
    . "hosts/${CI_HOST}/env.sh"
fi