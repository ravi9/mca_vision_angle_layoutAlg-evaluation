
clear all;

linesCount = csvread('linescount.csv');

dimensionRedAlgList = {'MatlabCMDS'; 'PCA'; 'LDA'; 'MDS'; 'ProbPCA'; 'FactorAnalysis';...
    'Sammon'; 'Isomap'; 'LandmarkIsomap'; 'LLE'; 'Laplacian'; 'HessianLLE';...
    'LTSA'; 'DiffusionMaps'; 'KernelPCA'; 'SNE'; 'SymSNE';...
    'tSNE'; 'NPE'; 'LPP'; 'SPE'; 'LLTSA'; 'CCA'; 'MVU'; 'LandmarkMVU';...
    'FastMVU'; 'LLC'; 'GPLVM'; 'Autoencoder';...
    'NCA'; 'MCML'; 'LMNN'};

a = dir(fullfile('.','Data/*.atts'));

algSummaryMeanStdev = {};

%main(['Data' filesep 'image41.pgm.atts'], MinGap, dimRedAlg);
for i=1:length(dimensionRedAlgList)
    %     main(sprintf('Data/%s', a(i).name));
    dimRedAlg = dimensionRedAlgList{i}
    resultDir = ['Results_dimRedAlg_' dimRedAlg];
    
    oFiles = dir(fullfile('.',[resultDir filesep '*.mat']));
    algResultsSummary = {};
    
    % Variables to calculate mean and std
    validPdd = [];
    validPff = [];
    validTvision = [];
    validTmag = [];
    
    for j=1:length(a),
        if (~(strcmp(a(j).name ,'airfield_edges.pgm.pgm.atts') == 1 || strcmp(a(j).name, '220.pgm.atts') == 1))
            
            imageFileNm = a(j).name;
            oFile = [resultDir filesep imageFileNm '_AllOutput.mat'];
            
            if (exist(oFile, 'file') == 2)
                load(oFile,'Pd', 'Pf', 't_vision', 't_magnet');
                
                %%Find detection rate at 10% false alarm
                ii = find(Pf <= 0.1, 1);
                if (ii == length(Pf)), ii = ii -1; end;
                pdd = Pd(ii); pff = Pf(ii);
                
                validPdd = [validPdd; pdd];
                validPff = [validPff; pff];
                validTvision = [validTvision; t_vision];
                validTmag = [validTmag; t_magnet];
                
            else
                pdd = -1;
                pff = -1;
                t_vision = -1;
                t_magnet = -1;
                
            end
            
            algResultsSummary = [algResultsSummary; ...
                imageFileNm num2cell(linesCount(j))...
                num2cell(t_vision) num2cell(t_magnet) num2cell(pdd) num2cell(pff)];
            
        end
    end
    
    %SAVE THE ALGORITHM OUTPUT
    xcelFileName = [dimRedAlg '_res_linesCnt_Tvision_Tmag_pdd_pff.csv'];
    cell2csv(['xcel_out' filesep xcelFileName], algResultsSummary)
    
    %CALC MEAN, STD FOR EACH ALG
    pddMean = mean(validPdd);
    pffMean = mean(validPff);
    tvisionMean = mean(validTvision);
    tmagMean = mean(validTmag);
    
    pddStdev = std(validPdd);
    pffStdev = std(validPff);
    tvisionStdev = std(validTvision);
    tmagStdev = std(validTmag);
    
    numImg = size(validPdd,1);
    
    algSummaryMeanStdev = [algSummaryMeanStdev;...
        dimRedAlg num2cell(numImg) ...
        num2cell(tvisionMean) num2cell(tmagMean) num2cell(pddMean) num2cell(pffMean) ...
        num2cell(tvisionStdev) num2cell(tmagStdev) num2cell(pddStdev) num2cell(pffStdev)];
end


%SAVE THE ALGORITHM MEAN, STD OUTPUT
xcelFileName = ['_allAlg_NumImg_tvisionMean_tmagMean_pddMean_pffMean_tvisionStd_tmagStd_pddStd_pffStd.csv']
cell2csv(['xcel_out' filesep xcelFileName], algSummaryMeanStdev);

