#!/bin/bash

echo This Script is now installing a Stable Diffusion cpu only variant. 

mkdir -p models/ldm/stable-diffusion-v1/
mkdir -p outputs/extras-samples
mkdir -p outputs/img2img-samples/samples
mkdir -p outputs/txt2img-samples/samples

conda install pytorch torchvision torchaudio cpuonly -c pytorch
conda env create -f environment-cpuonly.yaml
conda activate sdco

pip install pynvml gradio keras-unet fairseq basicsr facexlib
pip install -e git+https://github.com/CompVis/taming-transformers.git@master#egg=taming-transformers
pip install -e git+https://github.com/openai/CLIP.git@main#egg=clip
pip install -e git+https://github.com/TencentARC/GFPGAN#egg=GFPGAN
pip install -e git+https://github.com/xinntao/Real-ESRGAN#egg=realesrgan
pip install -e git+https://github.com/hlky/k-diffusion-sd#egg=k_diffusion
wget https://huggingface.co/CompVis/stable-diffusion-v-1-4-original/resolve/main/sd-v1-4.ckpt
mkdir -p models/ldm/stable-diffusion-v1/
cp sd-v1-4.ckpt models/ldm/stable-diffusion-v1/model.ckpt
rm sd-v1-4.ckpt
wget https://github.com/TencentARC/GFPGAN/releases/download/v1.3.0/GFPGANv1.3.pth
cp GFPGANv1.3.pth src/gfpgan/experiments/pretrained_models/GFPGANv1.3.pth
rm GFPGANv1.3.pth
