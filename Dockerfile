FROM nvcr.io/nvidia/pytorch:21.11-py3

WORKDIR /app

COPY gfpgan gfpgan

WORKDIR /app/gfpgan

RUN apt-get update \
    && apt-get install -y --no-install-recommends libgl1 \
    && source activate base \
    && pip install --no-cache-dir \
    basicsr \
    facexlib \
    realesrgan \
    && mkdir -p experiments/pretrained_models \
    && mkdir results

ADD https://github.com/TencentARC/GFPGAN/releases/download/v0.2.0/GFPGANCleanv1-NoCE-C2.pth experiments/pretrained_models/GFPGANCleanv1-NoCE-C2.pth

ADD https://github.com/xinntao/facexlib/releases/download/v0.1.0/detection_Resnet50_Final.pth /opt/conda/lib/python3.8/site-packages/facexlib/weights/detection_Resnet50_Final.pth

ADD https://github.com/xinntao/Real-ESRGAN/releases/download/v0.2.1/RealESRGAN_x2plus.pth /opt/conda/lib/python3.8/site-packages/realesrgan/weights/RealESRGAN_x2plus.pth

WORKDIR /app
