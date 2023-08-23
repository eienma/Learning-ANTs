#!/bin/bash
echo "Begin spatial normalization"

antsApplyTransforms -e 3 -d 3 -i ../func/filtered_func_data.nii.gz \
-o func2standard.nii.gz \
-r ../standard.nii.gz  \
-t reg_a2t_0GenericAffine.mat -t reg_a2t_1Warp.nii.gz \
-t reg_f2a_0GenericAffine.mat -t reg_f2a_1Warp.nii.gz


echo "End spatial normalization"