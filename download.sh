#!/bin/bash

# Arrays of file IDs and file names
file_ids=("1yuzFqBh0e_HEimeYYTYG-O8aFGGZZjcm" "14RL8Q55oe2RowVIfaAU2QycC4mfRYRPU" "1GmzlAQ7mRLqQTeMCHpb2PAz67_kydpT0" "13nhDDgyQhGGRRmcTBY1yV-OVbPvSljos" "1hPWLMSse7hWD_gfArsU5Wtwy6ugKSVee" "1QeUNDlR9BTAa7LUJjUjPgnoVkereXi01")
file_names=("GSE171524_downsample.h5ad" "GSE171524_clustered.h5ad" "GSE171524_integrated.h5ad" "GSE171524_post_qc.h5ad" "model.pt" "adata.h5ad")

# Folder to save the files
output_folder="data"
mkdir -p $output_folder

# Download each file
for i in "${!file_ids[@]}"; do
    file_id=${file_ids[$i]}
    file_name=${file_names[$i]}
    gdown "https://drive.google.com/uc?id=${file_id}" -O "${output_folder}/${file_name}"
done

# Move specific files to a new directory
mkdir -p 'model'
mv data/adata.h5ad model/
mv data/model.pt model/


