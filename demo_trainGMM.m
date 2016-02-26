% Reference:
%  Jianbo Yang, Xin Yuan, Xuejun Liao, Patrick Llull, David J. Brady, Guillermo Sapiro and Lawrence Carin 
%  ¡°Video Compressive Sensing Using Gaussian Mixture Models ¡±  
%  IEEE Transactions on Image Processing (TIP)  vol. 23, no. 11, pp. 4863-4878.
% 
% Author:
%  Jianbo Yang,  the department of Electrical and Computer Engineering, Duke University
%  https://sites.google.com/site/jbysite/
% 
% Version history:
%  version 1.0 (July 10, 2014)
%  version 1.1 (Oct. 14, 2014)
 
 
clc
clear
close all

% You may build up your own training data 'data0' using the following
% commented code.

% T = 8; % CS ratio
% patchSize = [8 8 T];
% data0 = [];
% M = size(Xt,3)/T;  % 'Xt' is the 3D training video
% for m = 1:M
%     temp = video2patches_fast(Xt(:,:,(m-1)*T+1:m*T), patchSize(1), patchSize(2), patchSize(3), 8, 8);
%     data0 = [data0 temp];
% end
% clear Xt
        
        
[n N] = size(data0);  
C = 20;
options = statset('Display','iter','MaxIter',200);
obj = gmdistribution.fit(data0',C,'Regularize',10^-4,'Options',options);
pai = obj.PComponents;
Mu = obj.mu';
Sig = obj.Sigma;
[pais,index] = sort(pai,'descend');

save(['model_P' num2str(patchSize(1)) 'X' num2str(patchSize(2)) 'X' num2str(patchSize(3)) '_C' num2str(C)],'pai','Sig','Mu')