clearvars -except finalDS 
close all
warning('off')

%% Normalize firing rates and Shift Correlation Values Up 


for pt=1:size(finalDS.eighteenAQ, 2)
    for qt=1:size(finalDS.eighteenAQ, 1)
        matrix = finalDS.eighteenAQ{qt, pt};
        if ~isempty(matrix)
      %      finalDS.eighteenAQ{qt,pt} = matrix ./ max(abs(matrix(:))); %normalize firing rate
            finalDS.eighteenAQ{qt,pt} = (matrix + 1) / 2; % shift correlation values 
        end
    end
end
for pt=1:size(finalDS.nineteenAQ, 2)
    for qt=1:size(finalDS.nineteenAQ, 1)
        matrix = finalDS.nineteenAQ{qt, pt};
        if ~isempty(matrix)
        %    finalDS.nineteenAQ{qt,pt} = matrix ./ max(abs(matrix(:)));
            finalDS.nineteenAQ{qt,pt} = (matrix + 1) / 2;
        end
    end
end
for pt=1:size(finalDS.twentyAQ, 2)
    for qt=1:size(finalDS.twentyAQ, 1)
        matrix = finalDS.twentyAQ{qt, pt};
        if ~isempty(matrix)
        %    finalDS.twentyAQ{qt,pt} = matrix ./ max(abs(matrix(:)));
            finalDS.twentyAQ{qt,pt} = (matrix + 1) / 2;
        end
    end
end
for pt=1:size(finalDS.twentytwoAQ, 2)
    for qt=1:size(finalDS.twentytwoAQ, 1)
        matrix = finalDS.twentytwoAQ{qt, pt};
        if ~isempty(matrix)
         %   finalDS.twentytwoAQ{qt,pt} = matrix ./ max(abs(matrix(:)));
            finalDS.twentytwoAQ{qt,pt} = (matrix + 1) / 2;
        end
    end
end
%% interval experience pairs (going down one column at a time - refer to matrix on slides)
interval_experience_18_LR = [0 2; 0 6; 1 6.5; 0 7; 2 7; 1 7.5; 0 8; 3 7.5; 2 8; 1 8.5; 0 9]; %LR
interval_experience_18_RL = [0 2; 0 6; 1 6.5; 2 7; 3 7.5; 0 7; 1 7.5; 2 8; 0 8; 1 8.5; 0 9]; %RL

interval_experience_19_LR = [0 5; 0 6; 2 7; 0 8; 3 7.5; 1 8.5; 0 9]; % LR
interval_experience_19_RL = [0 5; 0 6; 2 7; 3 7.5; 0 8; 1 8.5; 0 9]; % RL

interval_experience_20_LR = [0 6; 0 7; 1 7.5; 0 8; 3 8.5; 2 9; 0 10; 4 9; 3 9.5; 1 10.5; 0 11]; % LR
interval_experience_20_RL = [0 6; 0 7; 1 7.5; 3 8.5; 4 9; 0 8; 2 9; 3 9.5; 0 10; 1 10.5; 0 11]; % RL

interval_experience_22_LR = [0 3; 1 3.5; 0 4; 0 8; 1 8.5; 0 9; 2 9; 1 9.5; 0 10]; % LR
interval_experience_22_RL = [0 3; 1 3.5; 0 4; 0 8; 1 8.5; 2 9; 0 9; 1 9.5; 0 10]; % RL

repetitions = 17*17;

ss_int_exp_18 = [4 4; 5 4.5; 6 5];
ss_int_exp_19 = [1 5.5; 3 6.5; 4 7];
ss_int_exp_20 = [1 6.5; 2 7; 4 8; 5 8.5];
ss_int_exp_22 = [5 5.5; 6 6; 4 6; 5 6.5; 6 7];

ratID = inputdlg("Enter Rat ID:");
ratID = convertCharsToStrings(cell2mat(ratID));
lrrlID = inputdlg("Enter LR or RL:");
lrrlID = convertCharsToStrings(cell2mat(lrrlID));

if ratID == "18"  
    ratID = finalDS.eighteenAQ;
    ss_int_exp = ss_int_exp_18;
    if lrrlID == "LR" 
        int_exp = interval_experience_18_LR;
    else
        int_exp = interval_experience_18_RL;
    end
elseif ratID == "19"  
    ratID = finalDS.nineteenAQ;
    ss_int_exp = ss_int_exp_19;
    if lrrlID == "LR" 
        int_exp = interval_experience_19_LR;
    else
        int_exp = interval_experience_19_RL;
    end
elseif ratID == "20"  
    ratID = finalDS.twentyAQ;
    ss_int_exp = ss_int_exp_20;
    if lrrlID == "LR" 
        int_exp = interval_experience_20_LR;
    else
        int_exp = interval_experience_20_RL;
    end
elseif ratID == "22"  
    ratID = finalDS.twentytwoAQ;
    ss_int_exp = ss_int_exp_22;
    if lrrlID == "LR" 
       int_exp = interval_experience_22_LR;
    else
     int_exp = interval_experience_22_RL;
    end
end


%% Prepare Interval-Experience-Pixel Cube

for cx=1:length(ss_int_exp)
    setInterval = ss_int_exp(cx, 1);
    setExperience = ss_int_exp(cx,2);

    for j=1:repetitions
        b = zeros(size(ratID));
        c = find(~cellfun(@isempty,ratID));
        b(c) = 1;
        [row,col] = find(b); 

        for i=1:length(row)
            e = ratID(row(i), col(i));
            f = e{1};
            b(row(i), col(i)) = f(j);
        end
        b = num2cell(b);

        for i=1:length(int_exp)
            iepCube{row(i), col(i), j} = [int_exp(i,1) int_exp(i,2) b{row(i), col(i)}];
        end
    end

    %% Fit sigmoid surface

    % Set Interval and Experience for SS sessions


    idx = 3;  

    for k =1:size(iepCube,3)
   %     figure;
        counter = 1;

        temp1 = iepCube(:, :, k);
        temp1 = temp1(:);

        for i=1:length(temp1)
            if  ~cellfun(@isempty,iepCube(i))
                temp2 = cell2mat(temp1(i));
                desmat(counter, 1:3) = temp2; 
                counter = counter + 1;
     %           plot3(temp2(1), temp2(2), temp2(3), 'ko');
      %          hold on
            end   
        end
        
     %   xlabel('Interval');
    %    ylabel('Avg. Experience');
     %   zlabel('R')

      %  desmat = [ ones(length(int_exp),1) desmat]; % planar regression
      %  [beta,b_CI,resids,rint,stats] = regress(desmat(:,4),desmat(:, 1:3)); % planar regression
       %  z = beta(1) + beta(2)*x + beta(3)*y; % planar regression 
        %  z1 = beta(1) + beta(2)*setInterval + beta(3)*setExperience; 

        [fitresult, gof] = createFit(desmat(:,1), desmat(:, 2), desmat(:,3)); % sigmoidal regression
        coeff = coeffvalues(fitresult); 

        x = linspace(0, 12, 100);
        y = linspace(0, 12, 100);
        [x, y] = meshgrid(x, y);
        z = (1./(1 + exp(-1*coeff(1).*(x - coeff(3)))) + 1./(1 + exp(-1*coeff(2).*(y - coeff(4))))) * 0.5;
   %     mesh(x, y, z);
        z1 = (1./(1 + exp(-1*coeff(1)*(setInterval - coeff(3)))) + 1./(1 + exp(-1*coeff(2)*(setExperience - coeff(4))))) * 0.5;

        predictedCorrMatrix(k) = z1;

    end

    predictedCorrMatrix = reshape(predictedCorrMatrix, [17 17]);
    predictedCorrCell(cx) = {predictedCorrMatrix};

    %// Define integer grid of coordinates for the above data
    [X,Y] = meshgrid(1:size(predictedCorrMatrix,2), 1:size(predictedCorrMatrix,1));

    %// Define a finer grid of points
    [X2,Y2] = meshgrid(1:0.01:size(predictedCorrMatrix,2), 1:0.01:size(predictedCorrMatrix,1));

    %// Interpolate the data and show the output
    outData = interp2(X, Y, predictedCorrMatrix, X2, Y2, 'linear');

   % figure;
   % imagesc(outData); colormap hot; caxis([0.5 1]);  axis off; colorbar
end
%%
predictedAvg = predictedCorrCell{1};
for i=2:size(predictedCorrCell, 2)
    predictedAvg = predictedAvg + cell2mat(predictedCorrCell(i));
end
predictedAvg = predictedAvg ./ size(predictedCorrCell, 2);





[X,Y] = meshgrid(1:size(predictedAvg,2), 1:size(predictedAvg,1));

%// Define a finer grid of points
[X2,Y2] = meshgrid(1:0.01:size(predictedAvg,2), 1:0.01:size(predictedAvg,1));

%// Interpolate the data and show the output
outData = interp2(X, Y, predictedAvg, X2, Y2, 'linear');
figure;

imagesc(outData); colormap hot; caxis([0 1]); axis off; colorbar 

%% Trajectory Actual

%{

predictedAvg = twentyAQ{1};
for i=2:size(twentyAQ, 1)
    predictedAvg = predictedAvg + cell2mat(twentyAQ(i));
end
%}

%%
%{
predictedAvg3 = (predictedAvg + predictedAvg2) ./ 2;
predictedAvg3 = (predictedAvg3 * 2) - 1;
[X,Y] = meshgrid(1:size(predictedAvg3,2), 1:size(predictedAvg3,1));

%// Define a finer grid of points
[X2,Y2] = meshgrid(1:0.01:size(predictedAvg3,2), 1:0.01:size(predictedAvg3,1));

%// Interpolate the data and show the output
outData = interp2(X, Y, predictedAvg3, X2, Y2, 'linear');
figure;

imagesc(outData); colormap hot; caxis([0 1]); axis off; colorbar 
%}
