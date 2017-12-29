clear();
clc();
close all;

% define data options
opts = detectImportOptions('Qualitative_Bankruptcy.data.txt');
opts.DataLine = 1;
opts.MissingRule = 'omitrow';
opts.VariableNamesLine = 0;
opts.VariableNames = {'IR' 'MR' 'FF' 'CR' 'CO' 'OR' 'Class'};
opts.VariableTypes = repmat({'categorical'},1,7);
opts = setvaropts(opts, 'Categories', {'P' 'A' 'N'});
opts = setvaropts(opts, 'Class', 'Categories', {'B' 'NB'});

% import data
data = readtable('Qualitative_Bankruptcy.data.txt', opts);
data = rmmissing(data);

% convert categorical to a matrix
data = double(table2array(data));

% split data
train_in = data([1:119, 170:end], 1:6);
train_out = data([1:119, 170:end], 7);
test_in = data(120:169, 1:6);
test_out = data(120:169, 7);

% generate fis
fis = genfis3(train_in, train_out, 'mamdani', 2);
predict = evalfis(test_in, fis);
compare = [predict, test_out];
compare(:,1) = round(compare(:,1));
match = 0;
for i = 1:length(compare)
   if compare(i,1) == compare(i,2)
       match = match+1;
   end
end

accuracy = match / length(compare) * 100;
fprintf('Accuracy: %f\n', accuracy);

% plot graph
subplot(2,4,1);
plotmf(fis, 'input', 1)
subplot(2,4,2);
plotmf(fis, 'input', 2)
subplot(2,4,3);
plotmf(fis, 'input', 3)
subplot(2,4,4);
plotmf(fis, 'input', 4)
subplot(2,4,5);
plotmf(fis, 'input', 5)
subplot(2,4,6);
plotmf(fis, 'input', 6)
subplot(2,4,7);
plotmf(fis, 'output', 1)
subplot(2,4,8);
gensurf(fis)

% show rule
% showrule(fis)

% test data
% answer = evalfis([1;1;1;3;1;1], fis);