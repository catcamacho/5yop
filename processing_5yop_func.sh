#! /bin/bash

source ./SetUpHCPPipeline.sh

sub=4000
condition=fixation
hcppipe=/home/usr/camachoc/Desktop/HCPpipelines-4.1.3
hcpdir=/data/perlman/moochie/user_data/CamachoCat/5YOP/proc/hcp_proc
preprocdir=/data/perlman/moochie/user_data/CamachoCat/5YOP/proc/preprocessing
rawdir=/data/perlman/moochie/study_data/5YOP/MRI_processing
templatedir=${hcppipe}/global/templates

${hcppipe}/fMRIVolume/GenericfMRIVolumeProcessingPipeline.sh --path=${hcpdir} --subject=${sub} --fmritcs=${preprocdir}/lomo_proc_func/${sub}/${condition}/lomo_func_merged.nii.gz --fmriname=full_func_merged --fmrires=2 --biascorrection=NONE --dcmethod=NONE --processing-mode=LegacyStyleData --gdcoeffs=NONE

/home/usr/camachoc/Desktop/5YOP/hcp_proc/scripts/GenericfMRISurfaceProcessingPipeline.sh --path=/data/perlman/moochie/user_data/CamachoCat/5YOP/hcp_proc --subject=3000 --fmriname=full_func_merged --lowresmesh=32 --fmrires=2 --smoothingFWHM=2 --grayordinatesres=2 #--regname=FS

#/home/usr/camachoc/Desktop/5YOP/hcp_proc/scripts/GenericfMRIVolumeProcessingPipeline.sh --path=/data/perlman/moochie/user_data/CamachoCat/5YOP/hcp_proc --subject=3000 --fmritcs=/data/perlman/moochie/user_data/CamachoCat/5YOP/hcp_proc/3000/func/merged_fixation/merged_fixation_func.nii.gz --fmriname=fixation --fmrires=2 --biascorrection=NONE --dcmethod=NONE --processing-mode=LegacyStyleData --gdcoeffs=NONE

#/home/usr/camachoc/Desktop/5YOP/hcp_proc/scripts/GenericfMRISurfaceProcessingPipeline.sh --path=/data/perlman/moochie/user_data/CamachoCat/5YOP/hcp_proc --subject=3000 --fmriname=fixation --lowresmesh=32 --fmrires=2 --smoothingFWHM=2 --grayordinatesres=2 --regname=FS

#/home/usr/camachoc/Desktop/5YOP/hcp_proc/scripts/GenericfMRIVolumeProcessingPipeline.sh --path=/data/perlman/moochie/user_data/CamachoCat/5YOP/hcp_proc --subject=3000 --fmritcs=/data/perlman/moochie/user_data/CamachoCat/5YOP/hcp_proc/3000/func/merged_movie/merged_movie_func.nii.gz --fmriname=movie --fmrires=2 --biascorrection=NONE --dcmethod=NONE --processing-mode=LegacyStyleData --gdcoeffs=NONE

#/home/usr/camachoc/Desktop/5YOP/hcp_proc/scripts/GenericfMRISurfaceProcessingPipeline.sh --path=/data/perlman/moochie/user_data/CamachoCat/5YOP/hcp_proc --subject=3000 --fmriname=movie --lowresmesh=32 --fmrires=2 --smoothingFWHM=2 --grayordinatesres=2 --regname=FS

#/home/usr/camachoc/Desktop/5YOP/hcp_proc/scripts/GenericfMRIVolumeProcessingPipeline.sh --path=/data/perlman/moochie/user_data/CamachoCat/5YOP/hcp_proc --subject=3000 --fmritcs=/data/perlman/moochie/user_data/CamachoCat/5YOP/hcp_proc/3000/func/firstvol.nii.gz.nii.gz --fmriname=firstvol --fmrires=2 --biascorrection=NONE --dcmethod=NONE --processing-mode=LegacyStyleData --gdcoeffs=NONE

#/home/usr/camachoc/Desktop/5YOP/hcp_proc/scripts/GenericfMRISurfaceProcessingPipeline.sh --path=/data/perlman/moochie/user_data/CamachoCat/5YOP/hcp_proc --subject=3000 --fmriname=firstvol --lowresmesh=32 --fmrires=2 --smoothingFWHM=2 --grayordinatesres=2 --regname=FS


#wb_command -cifti-correlation /data/perlman/moochie/user_data/CamachoCat/5YOP/hcp_proc/3000/MNINonLinear/Results/fixation/fixation_Atlas.dtseries.nii /data/perlman/moochie/user_data/CamachoCat/5YOP/hcp_proc/3000/MNINonLinear/Results/fixation/fixation_Atlas.dconn.nii

#wb_command -cifti-correlation /data/perlman/moochie/user_data/CamachoCat/5YOP/hcp_proc/3000/MNINonLinear/Results/movie/movie_Atlas.dtseries.nii /data/perlman/moochie/user_data/CamachoCat/5YOP/hcp_proc/3000/MNINonLinear/Results/movie/movie_Atlas.dconn.nii
