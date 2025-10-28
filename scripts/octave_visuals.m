clc;
clear;
close all;

filename = '../outputs/pca10_clusters.csv';
if ~exist(filename, 'file')
    error('Error: File not found at %s', filename);
end

data = csvread(filename, 1, 0);
disp('✅ Dataset loaded successfully.');

PC1 = data(:, 1);
PC2 = data(:, 2);
Cluster = data(:, 3);

Cluster = round(Cluster);
Cluster = Cluster - min(Cluster) + 1;

mean_PC1 = mean(PC1);
median_PC1 = median(PC1);
var_PC1 = var(PC1);
std_PC1 = std(PC1);

fprintf('\n--- Statistics for PC1 ---\n');
fprintf('Mean: %.4f\n', mean_PC1);
fprintf('Median: %.4f\n', median_PC1);
fprintf('Variance: %.4f\n', var_PC1);
fprintf('Standard Deviation: %.4f\n', std_PC1);

figure;
hist(PC1, 15);
title('Histogram of PC1');
xlabel('PC1 Values');
ylabel('Frequency');
grid on;
saveas(gcf, '../outputs/octave_hist.png');
close;

pkg load statistics;

uniqueClusters = unique(Cluster);
numClusters = length(uniqueClusters);
dataGroups = cell(numClusters, 1);
for i = 1:numClusters
    dataGroups{i} = PC1(Cluster == uniqueClusters(i));
end
clusterLabels = cellstr(num2str(uniqueClusters));

figure;
boxplot(dataGroups, 'Labels', clusterLabels);
title('Boxplot of PC1 by Cluster');
xlabel('Cluster');
ylabel('PC1 Values');
grid on;
saveas(gcf, '../outputs/octave_boxplot.png');
close;

figure;
scatter(PC1, PC2, 40, Cluster, 'filled');
colormap(jet);
title('Scatter Plot: PC1 vs PC2 (colored by Cluster)');
xlabel('PC1');
ylabel('PC2');
colorbar;
grid on;
saveas(gcf, '../outputs/octave_scatter.png');
close;

disp('✅ All visualizations created successfully.');

