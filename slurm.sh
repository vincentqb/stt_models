#! /bin/bash

#SBATCH --job-name=torchaudiomodel
#SBATCH --output=/checkpoint/%u/jobs/deepspeech--other-%j.out
#SBATCH --error=/checkpoint/%u/jobs/deepspeech--other-%j.err
#SBATCH --signal=USR1@600
#SBATCH --open-mode=append
#SBATCH --partition=learnfair
#SBATCH --time=4320
#SBATCH --mem-per-cpu=5120
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --gres=gpu:8
#SBATCH --cpus-per-task=80
# 2x (number of data workers + number of GPUs requested)

# PYTHONWARNINGS='ignore:semaphore_tracker:UserWarning'

# CMD="python main.py --num-workers 0 --batch-size 32 --train-data-urls train-clean-100 train-clean-360 train-other-500 --num-epochs 200 --window-stride 20 --optimizer adam --learning-rate 3e-4 --log-steps 100 --checkpoint test"
CMD="python main.py --num-workers 0 --batch-size 256 --train-data-urls train-clean-100 train-clean-360 train-other-500 --num-epochs 200 --window-stride 20 --optimizer adam --learning-rate 3e-4 --log-steps 100 --checkpoint test"

>&2 echo $CMD
eval $CMD

# sbatch slurm.sh
