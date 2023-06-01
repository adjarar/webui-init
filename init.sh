ROOT_DIR="/home/webui/stable-diffusion-webui"
MODELS_DIR="$ROOT_DIR/models"

cd /home/webui

# per instance ssh key
cat ~/.ssh/authorized_keys | md5sum | awk '{print $1}' > ssh_key_hv; echo -n $VAST_CONTAINERLABEL | md5sum | awk '{print $1}' > instance_id_hv; head -c -1 -q ssh_key_hv instance_id_hv > ~/.vast_api_key;

# item generation script
git clone https://github.com/adjarar/rpg_img_generate.git

# download the vastai script
cd rpg_img_generate
wget https://raw.githubusercontent.com/vast-ai/vast-python/master/vast.py -O vast; chmod +x vast;

# copy webui settings
git clone https://github.com/adjarar/webui-settings.git
mv webui-settings/* stable-diffusion-webui
rm -rf webui-settings

# Install extensions
cd $ROOT_DIR/extensions
git clone https://github.com/Coyote-A/ultimate-upscale-for-automatic1111.git 
git clone https://github.com/Mikubill/sd-webui-controlnet.git
git clone https://github.com/yfszzx/stable-diffusion-webui-images-browser.git
git clone https://github.com/pkuliyi2015/multidiffusion-upscaler-for-automatic1111.git

# VAE
wget -q -P $MODELS_DIR/VAE \
        https://huggingface.co/stabilityai/sd-vae-ft-ema-original/resolve/main/vae-ft-ema-560000-ema-pruned.ckpt \
        https://huggingface.co/stabilityai/sd-vae-ft-mse-original/resolve/main/vae-ft-mse-840000-ema-pruned.ckpt
        
# download SD models
cd $MODELS_DIR/Stable-diffusion
gdown https://civitai.com/api/download/models/67584 && \
mv 67584 fantassifiedIcons_fantassifiedIconsV20.safetensors
