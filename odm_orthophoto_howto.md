# ODM Orthophoto (GeoTIFF) — Install & Run Guide

Tested on **Ubuntu 24.04**. Produces a GeoTIFF orthophoto only — no 3D models, no point clouds.

---

## 1. Install Docker

```bash
sudo apt update
sudo apt install -y docker.io
sudo usermod -aG docker $USER
```

**Log out and back in** for the group change to take effect, then verify:

```bash
docker run hello-world
```

---

## 2. (GPU only) Install NVIDIA Container Toolkit

Skip this section if you have no NVIDIA GPU.

First confirm your GPU is visible to the OS:

```bash
nvidia-smi
```

Then install the toolkit and restart Docker:

```bash
sudo apt install -y nvidia-container-toolkit
sudo systemctl restart docker
```

Verify Docker can see the GPU:

```bash
docker run --rm --gpus all nvidia/cuda:12.0-base nvidia-smi
```

You should see your GPU listed in the output.

---

## 3. Pull the ODM Docker image

**Without GPU:**
```bash
docker pull opendronemap/odm
```

**With GPU:**
```bash
docker pull opendronemap/odm:gpu
```

---

## 4. Set up your data directory

ODM expects this structure under a datasets root — here we use `/mnt/odm_datasets`:

```
/mnt/odm_datasets/
└── my_survey/
    └── images/    ← place your drone JPEGs or TIFFs here
```

Create it:

```bash
mkdir -p /mnt/odm_datasets/my_survey/images
```

Rsync your images in:

```bash
rsync -av user@remote:/path/to/images/ /mnt/odm_datasets/my_survey/images/
```

---

## 5. Run ODM

Replace `my_survey` with your project folder name.
Adjust `--orthophoto-resolution` to match your target GSD in cm/pixel (e.g. `2` for 2 cm/px, `5` for 5 cm/px).

**Without GPU:**
```bash
docker run -ti --rm \
  -v /mnt/odm_datasets:/datasets \
  opendronemap/odm \
  --project-path /datasets my_survey \
  --skip-3dmodel \
  --skip-report \
  --orthophoto-resolution 5
```

**With GPU:**
```bash
docker run -ti --rm \
  -v /mnt/odm_datasets:/datasets \
  --gpus all \
  opendronemap/odm:gpu \
  --project-path /datasets my_survey \
  --skip-3dmodel \
  --skip-report \
  --orthophoto-resolution 5 \
  --feature-type sift
```

The `--feature-type sift` flag enables GPU-accelerated feature extraction, which is the main computational bottleneck. Early in the log output you should see a line confirming the GPU was found.

### Optional: fast preview run

Add `--fast-orthophoto` to skip point cloud generation entirely and go straight to the orthophoto from sparse reconstruction. Much faster, lower quality — useful for a quick sanity check on a new dataset:

```bash
  --fast-orthophoto
```

---

## 6. Output

When processing completes, your GeoTIFF will be at:

```
/mnt/odm_datasets/my_survey/odm_orthophoto/odm_orthophoto.tif
```

Open it in **QGIS**. Do not use Photoshop or GIMP — they do not understand the geospatial metadata embedded in the file.
