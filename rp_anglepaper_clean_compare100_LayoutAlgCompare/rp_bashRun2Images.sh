#!/bin/bash
#SBATCH --job-name=matlab_MCAVision
#SBATCH --time=12:00:00
#SBATCH --output=/work/r/ravi1/EMT/rp_anglepaper_clean_compare100_LayoutAlgCompare/gridlogs/output.%j.log

module purge
module load apps/matlab/r2015a
cd /home/r/ravi1
matlab -nodisplay -r "cd /work/r/ravi1/EMT/rp_anglepaper_clean_compare100_LayoutAlgCompare; rp_gridMain_Run2Img('$1', '$2', $3)"
