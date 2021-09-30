
%% find indices of zero rows and delete them in both sessions
nnz_sess1tcurveLR = ~all(sess1_tcurveLR0==0,2); % not zero rows
nnz_sess2tcurveRL = ~all(sess2_tcurveRL0==0,2);
nnz_both_LR = nnz_sess1tcurveLR & nnz_sess2tcurveRL;

sess1_tcurveLR = sess1_tcurveLR0(nnz_both_LR, :);
sess2_tcurveRL = sess2_tcurveRL0(nnz_both_LR, :);


%% LR tuning curves sorted by sess1 on sess 1 - REDO

[~, peaks1] = max(sess1_tcurveLR');
sess1_tcurve_LR_sess1 = sortrows([peaks1' sess1_tcurveLR]);
sess1_tcurve_LR_sess1 = sess1_tcurve_LR_sess1(:, 2:end);

%% correlate pairs of columns from sess1_tcurve_LR_sess1

for i=1:size(sess1_tcurve_LR_sess1, 1) 
    tempr1 = sess1_tcurve_LR_sess1(i, 4:20);
    if any(tempr1)
        pvcorr1(i, :) = tempr1 ./ max(tempr1); 
   else
        pvcorr1(i, :) = tempr1;
   end
end
pvcorr1(all(isnan(pvcorr1),2), :) = 0;
corrMatrix = corr(pvcorr1, pvcorr1);

%% LR tuning curves sorted by sess 1 on RL tuning curves on sess2 

sess1_tcurve_LR_sess2 = sortrows([peaks1' sess2_tcurveRL]);
sess1_tcurve_LR_sess2 = sess1_tcurve_LR_sess2(:, 2:end);

%% correlate columns of sess1_tcurve_LR_sess1 with columns of sess1_tcurve_LR_sess2

for i=1:size(sess1_tcurve_LR_sess2, 1)
    tempr2 = sess1_tcurve_LR_sess2(i, 4:20)
   if any(tempr2)
        pvcorr2(i, :) = tempr2 ./ max(tempr2); 
   else
        pvcorr2(i, :) = tempr2;
   end
end
pvcorr2(all(isnan(pvcorr2),2), :) = 0;
corrMatrix2 = corr(pvcorr1, pvcorr2);















