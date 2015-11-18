
%%
% close all;
% sTic = tic
% startTime = datestr(now)
% main(['Data' filesep 'image41.pgm.atts'], 20)
% endTime = datestr(now)
% elapsedTime = toc(sTic)

%%

%addpath(genpath('/Users/ravi/Documents/MATLAB/drtoolbox'));

%Skipped={'KernelLDA'; 'ManifoldChart'; 'CFA'};
dimensionRedAlgList = {'PCA'; 'LDA'; 'MDS'; 'ProbPCA'; 'FactorAnalysis';...
    'Sammon'; 'Isomap'; 'LandmarkIsomap'; 'LLE'; 'Laplacian'; 'HessianLLE';...
    'LTSA'; 'DiffusionMaps'; 'KernelPCA'; 'SNE'; 'SymSNE';...
    'tSNE'; 'NPE'; 'LPP'; 'SPE'; 'LLTSA'; 'CCA'; 'MVU'; 'LandmarkMVU';...
    'FastMVU'; 'LLC'; 'GPLVM'; 'Autoencoder';...
    'NCA'; 'MCML'; 'LMNN'};

a = dir(fullfile('.','Data/*.atts')); % Creates a list of atts files
sTic = tic;
startTime = datestr(now)

MinGap = 20;

for i=1:length(dimensionRedAlgList)
%     main(sprintf('Data/%s', a(i).name));
    dimRedAlg = dimensionRedAlgList{i}
    %check if result directory exist, else create a resultdirectory
    resDir = ['Results_dimRedAlg_' dimRedAlg ];
    if (exist(resDir) ~= 7)
        mkdir(resDir);
    end

    resCoodDir = ['Results_dimRedAlg_' dimRedAlg filesep 'Coords_Data'];
    if (exist(resCoodDir) ~= 7)
        mkdir(resCoodDir);
    end

    resVisionDotsDir = ['Results_dimRedAlg_' dimRedAlg filesep 'VisionDots_Data'];
    if (exist(resVisionDotsDir) ~= 7)
        mkdir(resVisionDotsDir);
    end

    %if exist(['Results_dimRedAlg_' dimRedAlg filesep 'image41.pgm.atts_AllOutput.mat']) == 0
          main(['Data' filesep 'image41.pgm.atts'], MinGap)
    %end

end;

%RocAnalysis (['Results_dimRedAlg_' dimRedAlg filesep]);
% RocAnalysis (['Results_mingap_' num2str(MinGap) filesep]);
startTime
endTime = datestr(now)
elapsedTime = toc(sTic);
disp(['Time taken for image41 for all 34 alg is ' num2str(elapsedTime) ' (sec)']);

