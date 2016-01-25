README_layout_alg_comparision

README for rp_anglepaper_clean_compare100_LayoutAlgCompare.

Code Folder: rp_anglepaper_clean_compare100_LayoutAlgCompare
Github URL: https://github.com/ravi9/mca_vision_angle_layoutAlg-evaluation

Input Data Folder: Data. The folder Data contains all the images in .atts format.

Different layout algorithms to generate the layout for the placement of the nanomagnets for nanomagnetic computation are evaluated. The different layout generation algorithm implementation is based on Matlab Toolbox for Dimensionality Reduction (http://lvdmaaten.github.io/drtoolbox/)

Prerequisites:
1.	Matlab Toolbox for Dimensionality Reduction (http://lvdmaaten.github.io/drtoolbox/)
a.	Instructions on how to install Matlab Toolbox for Dimensionality Reduction can be found here: http://lvdmaaten.github.io/drtoolbox/#usage
2.	Access to CIRCE grid. To request account on CIRCE, see here: http://www.rc.usf.edu/
3.	Knowledge of submitting jobs to CIRCE computing grid. Beginner guide to submit jobs on CIRCE computing grid are available here: https://cwa.rc.usf.edu/projects/research-computing/wiki/Guide_to_Slurm


Assumptions:
Matlab Toolbox for Dimensionality Reduction is installed at /home/r/ravi1/EMT/drtoolbox/ .

If the Matlab Toolbox for Dimensionality Reduction is installed elsewhere, please edit line#3 in the file: rp_gridMain_Run2Img.m

Steps to run the comparison:
1.  To launch experiments on CIRCE grid with min_gap 20nm, run: rp_sbatchCmds_20.sh


Execution Workflow:
The dataset (Data) contains 101 images as attribute files (.atts). The submission script (rp_sbatchCmds_20.sh) launches 51 jobs. Each job has 2 images as input along with the min_gap value. Each job invokes script rp_bashRun2Images_ sbatch.sh.
The rp_bashRun2Images_ sbatch.sh script is used to submit the job for SLURM(CIRCE grid).
The rp_bashRun2Images_ sbatch.sh script loads Matlab, and launches the MATLAB script rp_gridMain_Run2Img.m

The Matlab script rp_gridMain_Run2Img.m launches the matlab script: main.m, which invokes Matlab Toolbox for Dimensionality Reduction.  The Matlab script main.m prepares the affinity matrix and invokes all the Dimensionality Reduction algorithms. The results are stored in individual folders Results_dimRedAlg_<dimensionality reduction alg name>

To summarize, the order of execution workflow:

1.	rp_sbatchCmds_20.sh
2.	rp_bashRun2Images_ sbatch.sh
3.	rp_gridMain_Run2Img.m
4.	main.m



Description of files:

1.	Results_dimRedAlg_<alg-name>: Results folder of a specific dimensionality algorithm.
2.	Data: Contains the dataset. 101 Images in .atts format
3.	rp_qsubCmds_20.sh: Shell script to launch the experiments using qsub command
4.	rp_sbatchCmds_20.sh: Shell script to launch the experiments using sbatch command
5.	rp_bashRun2Images_sbatch.sh: Shell script which loads Matlab, and launches the MATLAB script rp_gridMain_Run2Img.m
6.	rp_bashRun2Images.sh: Shell script which loads Matlab 2015a, and launches the MATLAB script rp_gridMain_Run2Img.m with time limit of 12 hours
7.	Main_driver_iterateAlg.m: Used for testing purpose on laptop which calls main.m and iterated over all dimensionality algorithms.
8.	rp_resultAnalyser_layoutAlg.m: Parses all the results and creates excel files of the statistics.
9.	rp_gridMain_Run2Img.m: Matlab script call Matlab script: main.m, which invokes Matlab Toolbox for Dimensionality Reduction.
10.	main.m: Matlab function which performs vision computing, iterating through all the dimensionality algorithms.
11.	Main_driver.m: Matlab file for testing purpose on local computer.
12.	gridlogs: This folder contains the logs generated while running the jobs on CIRCE
13.	xcel_out: Excel files with results summary

