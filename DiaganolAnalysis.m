%% ACC Diaganol Analysis 

d = [-1 0 1];
diag1 = spdiags(predictedAvg, d);
diag1_lin = diag1(1:end-1, 1);
diag3_lin = diag1(2:end, 3);
diag_lin = [diag1(:, 2); diag1_lin; diag3_lin];
avg_diag_lin = mean(diag_lin);

block1 = 4;
block2 = 9;
block3 = 4;

test = diag1(1:4,:);
test = nonzeros(test);
test_mean = mean(test);

test2 = diag1(5:13,:);
test2 = nonzeros(test2);
test2_mean = mean(test2);

test3 = diag1(14:17,:);    
test3 = nonzeros(test3);
test3_mean = mean(test3);
diag_stats2 = [avg_diag_lin test2_mean (test_mean + test3_mean)/2];

%% Diaganol Analysis 2
diaganol = diag(fliplr(predictedAvg));
avg_diag_line = mean(diaganol);
diag1 = mean(diaganol(1:4));
diag2 = mean(diaganol(5:13));
diag3 = mean(diaganol(14:17));
diag_stats2 = [avg_diag_line diag2 (diag1+diag3)/2];


%% plot 

predicted = [0.0336947214984276,0.0241441990113601,0.0444390592963785]
actual = [0.272399808280483,0.247092931862577,0.300870044250627]
x = categorical({'Overall','Unsafe','Safe'});
x = reordercats(x,{'Overall','Unsafe','Safe'});

bar([predicted; actual]);
name = {'Predicted';'Actual'};
set(gca,'xticklabel',name);
legend('Overall', 'Unsafe', 'Safe');
ylim([0 1]);
ylabel('Diagonal Correlation Index');
%





