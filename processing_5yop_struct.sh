#! /bin/bash

source ./SetUpHCPPipeline.sh

sub=3000
hcppipe=/home/usr/camachoc/Desktop/HCPpipelines-4.1.3
hcpdir=/data/perlman/moochie/user_data/CamachoCat/5YOP/proc/hcp_proc
preprocdir=/data/perlman/moochie/user_data/CamachoCat/5YOP/proc/preprocessing
export SUBJECTS_DIR=/data/perlman/moochie/user_data/CamachoCat/5YOP/proc/freesurfer
rawdir=/data/perlman/moochie/study_data/5YOP/MRI_processing
templatedir=${hcppipe}/global/templates

#recon-all -s ${sub} -i ${rawdir}/${sub}/ANAT_NIFTIS/t1w_1.nii.gz -i ${rawdir}/${sub}/ANAT_NIFTIS/t1w_2.nii.gz -i ${rawdir}/${sub}/ANAT_NIFTIS/t1w_3.nii.gz -i ${rawdir}/${sub}/ANAT_NIFTIS/t1w_4.nii.gz -i ${rawdir}/${sub}/ANAT_NIFTIS/t1w_5.nii.gz -autorecon1

#mri_convert ${SUBJECTS_DIR}/${sub}/mri/T1.nii.gz ${SUBJECTS_DIR}/${sub}/mri/t1.nii.gz 

#./PreFreeSurferPipeline.sh --path=${hcpdir} --subject=${sub} --t1=${SUBJECTS_DIR}/${sub}/mri/t1.nii.gz --t2=${rawdir}/${sub}/ANAT_NIFTIS/t2w_1.nii.gz --t1template=${templatedir}/MNI152_T1_1mm.nii.gz --t1templatebrain=${templatedir}/MNI152_T1_1mm_brain.nii.gz --t1template2mm=${templatedir}/MNI152_T1_2mm.nii.gz --t2template=${templatedir}/MNI152_T2_1mm.nii.gz --t2templatebrain=${templatedir}/MNI152_T2_1mm_brain.nii.gz --templatemask=${templatedir}/MNI152_T1_1mm_brain_mask.nii.gz --template2mmmask=${templatedir}/MNI152_T1_2mm_brain_mask_dil.nii.gz --brainsize=150 -${hcppipe}/global/config/T1_2_MNI152_2mm.cnf --echodiff=NONE --SEPhaseNeg=NONE --SEPhasePos=NONE --seechospacing=NONE --seunwarpdir=NONE --gdcoeffs=NONE

#./FreeSurferPipeline.sh --subject=${sub} --t1w-image=${hcpdir}/${sub}/T1w/T1w_acpc_dc_restore.nii.gz --t1w-brain=${hcpdir}/${sub}/T1w/T1w_acpc_dc_restore_brain.nii.gz --t2=${hcpdir}/${sub}/T1w/T2w_acpc_dc_restore.nii.gz --no-conf2hires --subject-dir=${hcpdir}/${sub}/T1w

## edit surfaces

./FreeSurferPipeline.sh --subject=${sub} --existing-subject --no-conf2hires --subject-dir=${hcpdir}/${sub}/T1w --extra-reconall-arg=-show-edits

./PostFreeSurferPipeline.sh --path=${hcpdir} --subject=${sub} --surfatlasdir=${hcppipe}/global/templates/standard_mesh_atlases --grayordinatesdir=${hcppipe}/global/templates/91282_Greyordinates --grayordinatesres=2 --hiresmesh=164 --lowresmesh=32 --subcortgraylabels=${hcppipe}/global/config/FreeSurferSubcorticalLabelTableLut.txt --freesurferlabels=${hcppipe}/global/config/FreeSurferAllLut.txt --refmyelinmaps=${hcppipe}/global/templates/standard_mesh_atlases/Conte69.MyelinMap_BC.164k_fs_LR.dscalar.nii


#/home/usr/camachoc/Desktop/5YOP/hcp_proc/scripts/GenericfMRIVolumeProcessingPipeline.sh --path=/data/perlman/moochie/user_data/CamachoCat/5YOP/hcp_proc --subject=3000 --fmritcs=/data/perlman/moochie/user_data/CamachoCat/5YOP/hcp_proc/3000/func/full_data/full_func_merged.nii.gz --fmriname=full_func_merged --fmrires=2 --biascorrection=NONE --dcmethod=NONE --processing-mode=LegacyStyleData --gdcoeffs=NONE

#/home/usr/camachoc/Desktop/5YOP/hcp_proc/scripts/GenericfMRISurfaceProcessingPipeline.sh --path=/data/perlman/moochie/user_data/CamachoCat/5YOP/hcp_proc --subject=3000 --fmriname=full_func_merged --lowresmesh=32 --fmrires=2 --smoothingFWHM=2 --grayordinatesres=2 --regname=FS

#/home/usr/camachoc/Desktop/5YOP/hcp_proc/scripts/GenericfMRIVolumeProcessingPipeline.sh --path=/data/perlman/moochie/user_data/CamachoCat/5YOP/hcp_proc --subject=3000 --fmritcs=/data/perlman/moochie/user_data/CamachoCat/5YOP/hcp_proc/3000/func/merged_fixation/merged_fixation_func.nii.gz --fmriname=fixation --fmrires=2 --biascorrection=NONE --dcmethod=NONE --processing-mode=LegacyStyleData --gdcoeffs=NONE

#/home/usr/camachoc/Desktop/5YOP/hcp_proc/scripts/GenericfMRISurfaceProcessingPipeline.sh --path=/data/perlman/moochie/user_data/CamachoCat/5YOP/hcp_proc --subject=3000 --fmriname=fixation --lowresmesh=32 --fmrires=2 --smoothingFWHM=2 --grayordinatesres=2 --regname=FS

#/home/usr/camachoc/Desktop/5YOP/hcp_proc/scripts/GenericfMRIVolumeProcessingPipeline.sh --path=/data/perlman/moochie/user_data/CamachoCat/5YOP/hcp_proc --subject=3000 --fmritcs=/data/perlman/moochie/user_data/CamachoCat/5YOP/hcp_proc/3000/func/merged_movie/merged_movie_func.nii.gz --fmriname=movie --fmrires=2 --biascorrection=NONE --dcmethod=NONE --processing-mode=LegacyStyleData --gdcoeffs=NONE

#/home/usr/camachoc/Desktop/5YOP/hcp_proc/scripts/GenericfMRISurfaceProcessingPipeline.sh --path=/data/perlman/moochie/user_data/CamachoCat/5YOP/hcp_proc --subject=3000 --fmriname=movie --lowresmesh=32 --fmrires=2 --smoothingFWHM=2 --grayordinatesres=2 --regname=FS

#/home/usr/camachoc/Desktop/5YOP/hcp_proc/scripts/GenericfMRIVolumeProcessingPipeline.sh --path=/data/perlman/moochie/user_data/CamachoCat/5YOP/hcp_proc --subject=3000 --fmritcs=/data/perlman/moochie/user_data/CamachoCat/5YOP/hcp_proc/3000/func/firstvol.nii.gz.nii.gz --fmriname=firstvol --fmrires=2 --biascorrection=NONE --dcmethod=NONE --processing-mode=LegacyStyleData --gdcoeffs=NONE

#/home/usr/camachoc/Desktop/5YOP/hcp_proc/scripts/GenericfMRISurfaceProcessingPipeline.sh --path=/data/perlman/moochie/user_data/CamachoCat/5YOP/hcp_proc --subject=3000 --fmriname=firstvol --lowresmesh=32 --fmrires=2 --smoothingFWHM=2 --grayordinatesres=2 --regname=FS


#wb_command -cifti-correlation /data/perlman/moochie/user_data/CamachoCat/5YOP/hcp_proc/3000/MNINonLinear/Results/fixation/fixation_Atlas.dtseries.nii /data/perlman/moochie/user_data/CamachoCat/5YOP/hcp_proc/3000/MNINonLinear/Results/fixation/fixation_Atlas.dconn.nii

#wb_command -cifti-correlation /data/perlman/moochie/user_data/CamachoCat/5YOP/hcp_proc/3000/MNINonLinear/Results/movie/movie_Atlas.dtseries.nii /data/perlman/moochie/user_data/CamachoCat/5YOP/hcp_proc/3000/MNINonLinear/Results/movie/movie_Atlas.dconn.nii
