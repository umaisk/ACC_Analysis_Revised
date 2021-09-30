%{
close all;
clearvars -except finalData finalDS

ratID = inputdlg("Enter Rat ID");
ratID = convertCharsToStrings(cell2mat(ratID));

sess1 = inputdlg("Enter Session 1 ID:");
sess1 = convertCharsToStrings(cell2mat(sess1));
sess2 = inputdlg("Enter Session 2 ID:");
sess2 = convertCharsToStrings(cell2mat(sess2));


if ratID == "18AQ"
    if sess1 == "Track2_2"
        data1 = finalData(1).imagingData(:,1);
        sess1_data = finalData(1).tcurveData(1);
    elseif sess1 == "Track6_2"
        data1 = finalData(1).imagingData(:,2);  
        sess1_data = finalData(1).tcurveData(2);
    elseif sess1 == "Track7_extinguished_2"
        data1 = finalData(1).imagingData(:,3);
        sess1_data = finalData(1).tcurveData(3);
    elseif sess1 == "Track8_1"
        data1 = finalData(1).imagingData(:,4);    
        sess1_data = finalData(1).tcurveData(4);
    elseif sess1 == "Track9_1"
        data1 = finalData(1).imagingData(:,5);
        sess1_data = finalData(1).tcurveData(5);
    end
    
    
    if sess2 == "Track2_2"
        data2 = finalData(1).imagingData(:,1);
        sess2_data = finalData(1).tcurveData(1);
    elseif sess2 == "Track6_2"
        data2 = finalData(1).imagingData(:,2); 
        sess2_data = finalData(1).tcurveData(2);
    elseif sess2 == "Track7_extinguished_2"
        data2 = finalData(1).imagingData(:,3);
        sess2_data = finalData(1).tcurveData(3);
    elseif sess2 == "Track8_1"
        data2 = finalData(1).imagingData(:,4);
        sess2_data = finalData(1).tcurveData(4);
    elseif sess2 == "Track9_1"
        data2 = finalData(1).imagingData(:,5);
        sess2_data = finalData(1).tcurveData(5);
    end
    
        
elseif ratID == "19AQ"
    if sess1 == "Track5"
        data1 = finalData(2).imagingData(:,1);
        sess1_data = finalData(2).tcurveData(1);
    elseif sess1 == "Track6"
        data1 = finalData(2).imagingData(:,2);
        sess1_data = finalData(2).tcurveData(2);
    elseif sess1 == "Track8"
        data1 = finalData(2).imagingData(:,3);
        sess1_data = finalData(2).tcurveData(3);
    elseif sess1 == "Track9"
        data1 = finalData(2).imagingData(:,4);
        sess1_data = finalData(2).tcurveData(4);
    end
    
    if sess2 == "Track5"
        data2 = finalData(2).imagingData(:,1);
        sess2_data = finalData(2).tcurveData(1);
    elseif sess2 == "Track6"
        data2 = finalData(2).imagingData(:,2);
          sess2_data = finalData(2).tcurveData(2);
    elseif sess2 == "Track8"
        data2 = finalData(2).imagingData(:,3);
         sess2_data = finalData(2).tcurveData(3);
    elseif sess2 == "Track9"
        data2 = finalData(2).imagingData(:,4);
         sess2_data = finalData(2).tcurveData(4);
    end


elseif ratID == "20AQ"
    if sess1 == "Track2_1"
         data1 = finalData(3).imagingData(:,1);
         sess1_data = finalData(3).tcurveData(1);
    elseif sess1 == "Track4_1"
         data1 = finalData(3).imagingData(:,2);
         sess1_data = finalData(3).tcurveData(2);
    elseif sess1 == "Track6"
         data1 = finalData(3).imagingData(:,3);
         sess1_data = finalData(3).tcurveData(3);
    elseif sess1 == "Track7"
         data1 = finalData(3).imagingData(:,4);
         sess1_data = finalData(3).tcurveData(4);
    elseif sess1 == "Track8"
         data1 = finalData(3).imagingData(:,5);
         sess1_data = finalData(3).tcurveData(5);
    elseif sess1 == "Track10"
         data1 = finalData(3).imagingData(:,6);
         sess1_data = finalData(3).tcurveData(6);
    elseif sess1 == "Track11"
         data1 = finalData(3).imagingData(:,7);
         sess1_data = finalData(3).tcurveData(7);
    end
    
   
    if sess2 == "Track2_1"
         data2 = finalData(3).imagingData(:,1);
         sess2_data = finalData(3).tcurveData(1);
    elseif sess2 == "Track4_1"
         data2 = finalData(3).imagingData(:,2);
         sess2_data = finalData(3).tcurveData(2);
    elseif sess2 == "Track6"
         data2 = finalData(3).imagingData(:,3);
         sess2_data = finalData(3).tcurveData(3);      
    elseif sess2 == "Track7"
         data2 = finalData(3).imagingData(:,4);
         sess2_data = finalData(3).tcurveData(4);
    elseif sess2 == "Track8"
         data2 = finalData(3).imagingData(:,5);
         sess2_data = finalData(3).tcurveData(5);
    elseif sess2 == "Track10"
         data2 = finalData(3).imagingData(:,6);
         sess2_data = finalData(3).tcurveData(6);
    elseif sess2 == "Track11"
         data2 = finalData(3).imagingData(:,7);
         sess2_data = finalData(3).tcurveData(7);
    end

elseif ratID == "21AQ"
    if sess1 == "Track2"
         data1 = finalData(4).imagingData(:,1);
         sess1_data = finalData(4).tcurveData(1);
    elseif sess1 == "Track3"
         data1 = finalData(4).imagingData(:,2);
         sess1_data = finalData(4).tcurveData(2);
    elseif sess1 == "Track5"
         data1 = finalData(4).imagingData(:,3);
         sess1_data = finalData(4).tcurveData(3);
    elseif sess1 == "Track14"
         data1 = finalData(4).imagingData(:,4);
         sess1_data = finalData(4).tcurveData(4);
    elseif sess1 == "Track15"
         data1 = finalData(4).imagingData(:,5);
         sess1_data = finalData(4).tcurveData(5);
    end

    if sess2 == "Track2"
         data2 = finalData(4).imagingData(:,1);
         sess2_data = finalData(4).tcurveData(1);
    elseif sess2 == "Track3"
         data2 = finalData(4).imagingData(:,2);
         sess2_data = finalData(4).tcurveData(2);
    elseif sess2 == "Track5"
         data2 = finalData(4).imagingData(:,3);
         sess2_data = finalData(4).tcurveData(3);
    elseif sess2 == "Track14"
         data2 = finalData(4).imagingData(:,4);
         sess2_data = finalData(4).tcurveData(4);
    elseif sess2 == "Track15"
         data2 = finalData(4).imagingData(:,5);
         sess2_data = finalData(4).tcurveData(5);
    end
    
elseif ratID == "22AQ"
    if sess1 == "Track3"
        data1 = finalData(5).imagingData(:,1);
        sess1_data = finalData(5).tcurveData(1);
    elseif sess1 == "Track4"
        data1 = finalData(5).imagingData(:,2);
        sess1_data = finalData(5).tcurveData(2);
    elseif sess1 == "Track8"
        data1 = finalData(5).imagingData(:,3);
        sess1_data = finalData(5).tcurveData(3);
    elseif sess1 == "Track9"
        data1 = finalData(5).imagingData(:,4);
        sess1_data = finalData(5).tcurveData(4);
    elseif sess1 == "Track10"
        data1 = finalData(5).imagingData(:,5);
        sess1_data = finalData(5).tcurveData(5);
    end

    if sess2 == "Track3"
        data2 = finalData(5).imagingData(:,1);
        sess2_data = finalData(5).tcurveData(1);
    elseif sess2 == "Track4"
        data2 = finalData(5).imagingData(:,2);
        sess2_data = finalData(5).tcurveData(2);
    elseif sess2 == "Track8"
        data2 = finalData(5).imagingData(:,3);
        sess2_data = finalData(5).tcurveData(3);
    elseif sess2 == "Track9"
        data2 = finalData(5).imagingData(:,4);
        sess2_data = finalData(5).tcurveData(4);
    elseif sess2 == "Track10"
        data2 = finalData(5).imagingData(:,5);
        sess2_data = finalData(5).tcurveData(5);
    end

end
%}
close all;
clearvars -except finalData finalDS ph1 ph2 data1 sess1_data data2 sess2_data
%% extract cells 2
sess1_data_nnz = data1 > 0;
sess2_data_nnz = data2 > 0;  

cells_of_interest = sess2_data_nnz & sess1_data_nnz;

sess1_data_2 = data1(cells_of_interest);
sess2_data_2 = data2(cells_of_interest);

%% LR Data

% Session 1
sess1_tcurveLR0 = sess1_data.tcurve_LR(sess1_data_2, :);

max_column_sess1_tcurveLR = size(sess1_tcurveLR0, 2);
validIdx_sess1_tcurveLR = find(all(~isnan(sess1_tcurveLR0),1));
min_validIdx = min(validIdx_sess1_tcurveLR);
max_validIdx = max(validIdx_sess1_tcurveLR);

for i=1:min_validIdx - 1
    sess1_tcurveLR0(:,i) = sess1_tcurveLR0(:, min_validIdx);
end

for i=max_validIdx+1:max_column_sess1_tcurveLR
    sess1_tcurveLR0(:,i) = sess1_tcurveLR0(:, max_validIdx);
end

% Session 2

sess2_tcurveLR0 = sess2_data.tcurve_LR(sess2_data_2, :);
max_column_sess2_tcurveLR = size(sess2_tcurveLR0, 2);
validIdx_sess2_tcurveLR = find(all(~isnan(sess2_tcurveLR0),1));
min_validIdx2 = min(validIdx_sess2_tcurveLR);
max_validIdx2 = max(validIdx_sess2_tcurveLR);

for i=1:(min_validIdx2 - 1)
    sess2_tcurveLR0(:,i) = sess2_tcurveLR0(:, min_validIdx2);
end

for i=max_validIdx2 + 1:max_column_sess2_tcurveLR
    sess2_tcurveLR0(:,i) = sess2_tcurveLR0(:, max_validIdx2);
end


%% RL Data

% Session 1
sess1_tcurveRL0 = sess1_data.tcurve_RL(sess1_data_2, :);

max_column_sess1_tcurveRL = size(sess1_tcurveRL0, 2);
validIdx_sess1_tcurveRL = find(all(~isnan(sess1_tcurveRL0),1));
min_validIdx3 = min(validIdx_sess1_tcurveRL);
max_validIdx3 = max(validIdx_sess1_tcurveRL);

for i=1:min_validIdx3 - 1
    sess1_tcurveRL0(:,i) = sess1_tcurveRL0(:, min_validIdx3);
end

for i=max_validIdx3 +1:max_column_sess1_tcurveRL
    sess1_tcurveRL0(:,i) = sess1_tcurveRL0(:, max_validIdx3);
end

% Session 2

sess2_tcurveRL0 = sess2_data.tcurve_RL(sess2_data_2, :);
max_column_sess2_tcurveRL = size(sess2_tcurveRL0, 2);
validIdx_sess2_tcurveRL = find(all(~isnan(sess2_tcurveRL0),1));
min_validIdx4 = min(validIdx_sess2_tcurveRL);
max_validIdx4 = max(validIdx_sess2_tcurveRL);

for i=1:(min_validIdx4 - 1)
    sess2_tcurveRL0(:,i) = sess2_tcurveRL0(:, min_validIdx4);
end


for i=max_validIdx4 + 1:max_column_sess2_tcurveRL
    sess2_tcurveRL0(:,i) = sess2_tcurveRL0(:, max_validIdx4);
end
