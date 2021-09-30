%% build 18
finalDS.eighteenAQ = cell(5,5);

for ph1=1:size(finalDS.eighteenAQ, 1)
clear data1 sess1_data
data1 = finalData(1).imagingData(:,ph1);
sess1_data = finalData(1).tcurveData(ph1);

    for ph2 = 1:size(finalDS.eighteenAQ, 2) 
        clear data2 sess2_data
        if ph1==ph2    
            data2 = finalData(1).imagingData(:,ph2);
            sess2_data = finalData(1).tcurveData(ph2);
            ACC_Analysis_Input_Revised;
            ACC_Analysis_LR_RL_Revised;  
            finalDS.eighteenAQ{ph1,ph2} =  corrMatrix2;
        else
          if isempty(finalDS.eighteenAQ{ph1,ph2})
              data2 = finalData(1).imagingData(:,ph2);
              sess2_data = finalData(1).tcurveData(ph2);  
              ACC_Analysis_Input_Revised;
              ACC_Analysis_LR_Revised;  
              finalDS.eighteenAQ{ph1,ph2} =  corrMatrix2; 
              ACC_Analysis_Input_Revised;
              ACC_Analysis_RL_Revised;  
              finalDS.eighteenAQ{ph2,ph1} =  corrMatrix2;
          end
        end
    end
end
%% build 19

finalDS.nineteenAQ = cell(4,4);
for ph1=1:size(finalDS.nineteenAQ, 1)
clear data1 sess1_data
data1 = finalData(2).imagingData(:,ph1);
sess1_data = finalData(2).tcurveData(ph1);

    for ph2 = 1:size(finalDS.nineteenAQ, 2) 
        clear data2 sess2_data
        if ph1==ph2    
            data2 = finalData(2).imagingData(:,ph2);
            sess2_data = finalData(2).tcurveData(ph2);
            ACC_Analysis_Input_Revised;
            ACC_Analysis_LR_RL_Revised;  
            finalDS.nineteenAQ{ph1,ph2} =  corrMatrix2;
        else
          if isempty(finalDS.nineteenAQ{ph1,ph2})
              data2 = finalData(2).imagingData(:,ph2);
              sess2_data = finalData(2).tcurveData(ph2);  
              ACC_Analysis_Input_Revised;
              ACC_Analysis_LR_Revised;  
              finalDS.nineteenAQ{ph1,ph2} =  corrMatrix2;
              ACC_Analysis_Input_Revised;
              ACC_Analysis_RL_Revised;  
              finalDS.nineteenAQ{ph2,ph1} =  corrMatrix2;
          end
        end
    end
end

%% build 20
finalDS.twentyAQ = cell(7,7);

for ph1=1:size(finalDS.twentyAQ, 1)
clear data1 sess1_data
data1 = finalData(3).imagingData(:,ph1);
sess1_data = finalData(3).tcurveData(ph1);

    for ph2 = 1:size(finalDS.twentyAQ, 2) 
        clear data2 sess2_data
        if ph1==ph2    
            data2 = finalData(3).imagingData(:,ph2);
            sess2_data = finalData(3).tcurveData(ph2);
            ACC_Analysis_Input_Revised;
            ACC_Analysis_LR_RL_Revised;  
            finalDS.twentyAQ{ph1,ph2} =  corrMatrix2;
        else
          if isempty(finalDS.twentyAQ{ph1,ph2})
              data2 = finalData(3).imagingData(:,ph2);
              sess2_data = finalData(3).tcurveData(ph2);  
              ACC_Analysis_Input_Revised;
              ACC_Analysis_LR_Revised;  
              finalDS.twentyAQ{ph1,ph2} =  corrMatrix2;
              ACC_Analysis_Input_Revised;
              ACC_Analysis_RL_Revised;  
              finalDS.twentyAQ{ph2,ph1} =  corrMatrix2;
          end
        end
    end
end

%% build 22
finalDS.twentytwoAQ = cell(5,5);

for ph1=1:size(finalDS.twentytwoAQ, 1)
clear data1 sess1_data
data1 = finalData(5).imagingData(:,ph1);
sess1_data = finalData(5).tcurveData(ph1);

    for ph2 = 1:size(finalDS.twentytwoAQ, 2) 
        clear data2 sess2_data
        if ph1==ph2    
            data2 = finalData(5).imagingData(:,ph2);
            sess2_data = finalData(5).tcurveData(ph2);
            ACC_Analysis_Input_Revised;
            ACC_Analysis_LR_RL_Revised;  
            finalDS.twentytwoAQ{ph1,ph2} =  corrMatrix2;
        else
          if isempty(finalDS.twentytwoAQ{ph1,ph2})
              data2 = finalData(5).imagingData(:,ph2);
              sess2_data = finalData(5).tcurveData(ph2);  
              ACC_Analysis_Input_Revised;
              ACC_Analysis_LR_Revised;  
              finalDS.twentytwoAQ{ph1,ph2} =  corrMatrix2;
              ACC_Analysis_Input_Revised;
              ACC_Analysis_RL_Revised;  
              finalDS.twentytwoAQ{ph2,ph1} =  corrMatrix2;
          end
        end
    end
end

%% Traj matrix (within session)

trajMatrix = cell(21, 1);
%18
trajMatrix(1) = finalDS.eighteenAQ(1,1);
trajMatrix(2) = finalDS.eighteenAQ(2,2);
trajMatrix(3) = finalDS.eighteenAQ(3,3);
trajMatrix(4) = finalDS.eighteenAQ(4,4);
trajMatrix(5) = finalDS.eighteenAQ(5,5);
%19
trajMatrix(6) = finalDS.nineteenAQ(1,1);
trajMatrix(7) = finalDS.nineteenAQ(2,2);
trajMatrix(8) = finalDS.nineteenAQ(3,3);
trajMatrix(9) = finalDS.nineteenAQ(4,4);
%20
trajMatrix(10) = finalDS.twentyAQ(1,1);
trajMatrix(11) = finalDS.twentyAQ(2,2);
trajMatrix(12) = finalDS.twentyAQ(3,3);
trajMatrix(13) = finalDS.twentyAQ(4,4);
trajMatrix(14) = finalDS.twentyAQ(5,5);
trajMatrix(15) = finalDS.twentyAQ(6,6);
trajMatrix(16) = finalDS.twentyAQ(7,7);
%22
trajMatrix(17) = finalDS.twentytwoAQ(1,1);
trajMatrix(18) = finalDS.twentytwoAQ(2,2);
trajMatrix(19) = finalDS.twentytwoAQ(3,3);
trajMatrix(20) = finalDS.twentytwoAQ(4,4);
trajMatrix(21) = finalDS.twentytwoAQ(5,5);


for st=1:length(trajMatrix)
    A = trajMatrix{st, 1};
    A(isnan(A))=0;
    trajMatrix(st,1) = {A};
end
trajMatrix = trajMatrix(:);

trajMatrixAvg = trajMatrix{1};
for i=2:size(trajMatrix, 1)
    trajMatrixAvg = trajMatrixAvg + cell2mat(trajMatrix(i));
end
trajMatrixAvg = trajMatrixAvg ./ size(trajMatrix, 1);
figure;
imagesc(trajMatrixAvg); colormap jet; caxis([-0.2 0.4]); axis off;  

%% SS matrix - subsampled
ssMatrix = cell(7,2);

ssMatrix(1:3, 1) = finalDS.nineteenAQ(1, 2:4); % 19 lr
ssMatrix(1:3, 2) = finalDS.nineteenAQ(2:4, 1); % 19 rl
ssMatrix(4:7, 1) = finalDS.twentyAQ(3, 4:7); % 20 lr
ssMatrix(4:7, 2) = finalDS.twentyAQ(4:7, 3); % 20 rl

for st=1:length(ssMatrix)
    A = ssMatrix{st, 1};
    A(isnan(A))=0;
    ssMatrix(st,1) = {A};
end

for st=1:length(ssMatrix)
    A = ssMatrix{st, 2};
    A(isnan(A))=0;
    ssMatrix(st,2) = {A};
end
ssMatrix = ssMatrix(:);

ssMatrixAvg = ssMatrix{1};
for i=2:size(ssMatrix, 1)
    ssMatrixAvg = ssMatrixAvg + cell2mat(ssMatrix(i));
end
ssMatrixAvg = ssMatrixAvg ./ size(ssMatrix, 1);

figure;
imagesc(ssMatrixAvg); colormap jet; caxis([-0.2 0.4]); axis off;  

%% Post shock matrix subsampled

postMatrix = cell(7,2);
postMatrix(1:3, 1) = finalDS.eighteenAQ(2, 3:5); 
postMatrix(1:3, 2) = finalDS.eighteenAQ(3:5, 2); 
postMatrix(4:5, 1) = finalDS.nineteenAQ(2, 3:4);  
postMatrix(4:5, 2) = finalDS.nineteenAQ(3:4, 2);  
postMatrix(6:7, 1) = finalDS.twentyAQ(4, 5:6);  
postMatrix(6:7, 2) = finalDS.twentyAQ(5:6, 4); 

for st=1:length(postMatrix)
    A = postMatrix{st, 1};
    A(isnan(A))=0;
    postMatrix(st,1) = {A};
end

for st=1:length(postMatrix)
    A = postMatrix{st, 2};
    A(isnan(A))=0;
    postMatrix(st,2) = {A};
end

postMatrix = postMatrix(:);
postMatrixAvg = postMatrix{1};
for i=2:size(postMatrix, 1)
    postMatrixAvg = postMatrixAvg + cell2mat(postMatrix(i));
end
postMatrixAvg = postMatrixAvg ./ size(postMatrix, 1);

figure;
imagesc(postMatrixAvg); colormap jet; caxis([-0.2 0.4]); axis off;  

%% SS matrix
%{
ssMatrix = cell(20,2);
ssMatrix(1:3, 1) = finalDS.eighteenAQ(1, 2:4); % 18 lr
ssMatrix(1:3, 2) = finalDS.eighteenAQ(2:4, 1); % 18 rl
ssMatrix(4:6, 1) = finalDS.nineteenAQ(1, 2:4); % 19 lr
ssMatrix(4:6, 2) = finalDS.nineteenAQ(2:4, 1); % 19 rl
ssMatrix(7:8, 1) = finalDS.twentyAQ(1, 4:5); % 20 lr
ssMatrix(7:8, 2) = finalDS.twentyAQ(4:5, 1); % 20 rl
ssMatrix(9:11, 1) = finalDS.twentyAQ(2, 4:6); % 20 lr
ssMatrix(9:11, 2) = finalDS.twentyAQ(4:6, 2); % 20 rl
ssMatrix(12:15, 1) = finalDS.twentyAQ(3, 4:7); % 20 lr
ssMatrix(12:15, 2) = finalDS.twentyAQ(4:7, 3); % 20 rl
ssMatrix(16:17, 1) = finalDS.twentytwoAQ(1, 3:4); %% 22 lr
ssMatrix(16:17, 2) = finalDS.twentytwoAQ(3:4, 1); % 22 rl
ssMatrix(18:20, 1) = finalDS.twentytwoAQ(2, 3:5); % 22 lr
ssMatrix(18:20, 2) = finalDS.twentytwoAQ(3:5, 2); % 22 rl

for st=1:length(ssMatrix)
    A = ssMatrix{st, 1};
    A(isnan(A))=0;
    ssMatrix(st,1) = {A};
end

for st=1:length(ssMatrix)
    A = ssMatrix{st, 2};
    A(isnan(A))=0;
    ssMatrix(st,2) = {A};
end
ssMatrix = ssMatrix(:);

ssMatrixAvg = ssMatrix{1};
for i=2:size(ssMatrix, 1)
    ssMatrixAvg = ssMatrixAvg + cell2mat(ssMatrix(i));
end
ssMatrixAvg = ssMatrixAvg ./ size(ssMatrix, 1);

figure;
imagesc(ssMatrixAvg); colormap jet; caxis([-0.2 0.4]); axis off;  
%}
%% Post shock matrix
%{

postMatrix = cell(18,2);
% 18
postMatrix(1:3, 1) = finalDS.eighteenAQ(2, 3:5); % 
postMatrix(1:3, 2) = finalDS.eighteenAQ(3:5, 2); %
postMatrix(4:5, 1) = finalDS.eighteenAQ(3, 4:5); % 
postMatrix(4:5, 2) = finalDS.eighteenAQ(4:5, 3); % 
postMatrix(6, 1) = finalDS.eighteenAQ(4, 5); % 
postMatrix(6, 2) = finalDS.eighteenAQ(5, 4); % 
%19
postMatrix(7:8, 1) = finalDS.nineteenAQ(2, 3:4); % 
postMatrix(7:8, 2) = finalDS.nineteenAQ(3:4, 2); % 
postMatrix(9, 1) = finalDS.nineteenAQ(3, 4); % 
postMatrix(9, 2) = finalDS.nineteenAQ(4, 3); % 
%20
postMatrix(10:12, 1) = finalDS.twentyAQ(4, 5:7); % 
postMatrix(10:12, 2) = finalDS.twentyAQ(5:7, 4); %
postMatrix(13:14, 1) = finalDS.twentyAQ(5, 6:7); % 
postMatrix(13:14, 2) = finalDS.twentyAQ(6:7, 5); % 
postMatrix(15, 1) = finalDS.twentyAQ(6, 7); % 
postMatrix(15, 2) = finalDS.twentyAQ(7, 6); % 
%22
postMatrix(16:17, 1) = finalDS.twentytwoAQ(3, 4:5); % 
postMatrix(16:17, 2) = finalDS.twentytwoAQ(4:5, 3); % 
postMatrix(18, 1) = finalDS.twentytwoAQ(4, 5); % 
postMatrix(18, 2) = finalDS.twentytwoAQ(5, 4); % 


for st=1:length(postMatrix)
    A = postMatrix{st, 1};
    A(isnan(A))=0;
    postMatrix(st,1) = {A};
end

for st=1:length(postMatrix)
    A = postMatrix{st, 2};
    A(isnan(A))=0;
    postMatrix(st,2) = {A};
end

postMatrix = postMatrix(:);
postMatrixAvg = postMatrix{1};
for i=2:size(postMatrix, 1)
    postMatrixAvg = postMatrixAvg + cell2mat(postMatrix(i));
end
postMatrixAvg = postMatrixAvg / size(postMatrixAvg, 1);

figure;
imagesc(postMatrixAvg); colormap jet; axis off;  
%}



    