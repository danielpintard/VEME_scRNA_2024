#!/bin/bash

# Arrays of file IDs and file names
file_ids=("1iN0dpYonMwxzp7FhnphM8t0Rc9AJj5Mw" "1eV_fVVBfOydwyojrFlXREACMxBPafLtz" "1Rx8kFwbAb4GDkrkQruyDMUuVlmlPISmf" "1ZrlvM8ZV_WQFsSGUjxDwDk31GodbzADV" "1E1MslSlpY_dU--AMGf6gIBLM9Zqv7HSh" "1tAeBrp_wlf2R-iJ7UnQ6Uh4bOxQfH3WT")
file_names=("GSE171524_downsample.h5ad" "GSE171524_clustered.h5ad" "GSE171524_integrated.h5ad" "GSE171524_post_qc.h5ad" "model.pt" "adata.h5ad")

# Folder to save the files
output_folder="data"
mkdir -p $output_folder

# Start time
start_time=$SECONDS

# Download each file and measure time
for i in "${!file_ids[@]}"; do
    file_id=${file_ids[$i]}
    file_name=${file_names[$i]}
    
    echo "Downloading ${file_name}..."
    file_start_time=$SECONDS
    
    gdown "https://drive.google.com/uc?id=${file_id}" -O "${output_folder}/${file_name}"
    
    file_elapsed_time=$(($SECONDS - $file_start_time))
    echo "Downloaded ${file_name} in ${file_elapsed_time} seconds."
done

# Total elapsed time
total_elapsed_time=$(($SECONDS - $start_time))
echo "Total time: ${total_elapsed_time} seconds."

mkdir -p 'model'
mv data/adata.h5ad model/; mv data/model.pt model/