
%%
close all;
sTic = tic
startTime = datestr(now)

%main(['Data' filesep 'image41.pgm.atts'], 20);
main(['Data' filesep 'image10.pgm.atts'], 20)

endTime = datestr(now)
elapsedTime = toc(sTic)

%%

%addpath(genpath('/Users/ravi/Documents/MATLAB/drtoolbox'));

% a = dir(fullfile('.','Data/*.atts')); % Creates a list of atts files
% sTic = tic;
% startTime = datestr(now)
% 
% MinGap = 20;
% 
% for i=1:length(a),
%     %     main(sprintf('Data/%s', a(i).name));
%     if (~(strcmp(a(i).name ,'airfield_edges.pgm.pgm.atts') == 1 || strcmp(a(i).name, '220.pgm.atts') == 1))
%         a(i).name
%         main(['Data' filesep 'image41.pgm.atts'], MinGap, dimRedAlg)
%         %main(['Data' filesep a(i).name], MinGap, dimRedAlg)
%     end
% end;
% 
% %RocAnalysis (['Results_dimRedAlg_' dimRedAlg filesep]);
% % RocAnalysis (['Results_mingap_' num2str(MinGap) filesep]);
% startTime
% endTime = datestr(now)
% elapsedTime = toc(sTic);
% disp(['Time taken for 1 full exp run ??? with alg is ' num2str(elapsedTime) ' (sec)']);

