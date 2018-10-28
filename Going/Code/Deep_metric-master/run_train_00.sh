#!/usr/bin/env bash

CUDA_VISIBLE_DEVICES=2 python train.py -data cub  -net bn   -alpha 40 -k 16  -lr 1e-5 -dim 512   -num_instances 8 -BatchSize 128 -loss knnsoftmax  -epochs 801 -log_dir cub_knnsoftmax  -save_step 100
python test.py  -data cub -r  checkpoints/cub_knnsoftmax/200_model.pkl >cub_knnsoft__512.txt
python test.py  -data cub -r  checkpoints/cub_knnsoftmax/400_model.pkl >>cub_knnsoft__512.txt
python test.py  -data cub -r  checkpoints/cub_knnsoftmax/600_model.pkl >>cub_knnsoft__512.txt
python test.py  -data cub -r  checkpoints/cub_knnsoftmax/800_model.pkl >>cub_knnsoft__512.txt