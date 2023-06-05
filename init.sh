ROOT_DIR="/root/stable-diffusion-webui"
MODELS_DIR="$ROOT_DIR/models"


# per instance ssh key
cat ~/.ssh/authorized_keys | md5sum | awk '{print $1}' > ssh_key_hv; echo -n $VAST_CONTAINERLABEL | md5sum | awk '{print $1}' > instance_id_hv; head -c -1 -q ssh_key_hv instance_id_hv > ~/.vast_api_key;

cd $ROOT_DIR

# item generation script
git clone https://github.com/adjarar/rpg_img_generate.git

# download the vastai script
cd rpg_img_generate
wget https://raw.githubusercontent.com/vast-ai/vast-python/master/vast.py -O vast
chmod +x vast

cd /root

# copy webui settings
git clone https://github.com/adjarar/webui-settings.git
chmod +x webui-settings/webui.sh
mv -f webui-settings/* $ROOT_DIR
rm -rf webui-settings

# download SD models
cd $MODELS_DIR/Stable-diffusion
gdown https://civitai.com/api/download/models/67584 && \
mv 67584 fantassifiedIcons_fantassifiedIconsV20.safetensors
