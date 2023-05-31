ROOT_DIR="/home/webui/stable-diffusion-webui"
MODELS_DIR="$ROOT_DIR/models"

cd /home/webui

# item generation script
git clone https://github.com/adjarar/rpg_item_generation.git

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
        
# SD models  
gdown https://civitai.com/api/download/models/67584 && \
mv 67584 fantassifiedIcons_fantassifiedIconsV20.safetensors
