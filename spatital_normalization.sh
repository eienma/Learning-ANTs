#!/bin/bash
echo "Begin spatial normalization"

echo "Begin anatomical to standard"
antsRegistrationSyN.sh -d 3 -f ../standard.nii.gz -m ../anat/sub-08_T1w_brain.nii.gz -o reg_a2t_ -t 'r'

echo "Begin functional to anatomical"
antsRegistrationSyN.sh -d 3 -f ../anat/sub-08_T1w_brain.nii.gz  -m ../func/example_func.nii.gz -t 'r' -o reg_f2a_

echo "Begin functional to standard"
antsApplyTransforms -d 3 -i reg_f2a_Warped.nii.gz  -o example_fun2standard.nii.gz -r ../standard.nii.gz -t reg_a2t_0GenericAffine.mat

echo "End spatial normalization"