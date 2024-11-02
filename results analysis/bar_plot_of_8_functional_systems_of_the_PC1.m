% 获取功能系统的数量
numSystems = length(labelIndex);
% 初始化一个数组来存储每个功能系统的平均值
averageValues = zeros(numSystems, 1);
% 遍历每个功能系统
for systemIdx = 1:numSystems
    % 获取当前功能系统的脑区编号
    regions = labelIndex{systemIdx};  % 当前功能系统的脑区编号

    % 找到属于当前功能系统的节点
    nodeIndices = ismember(label, regions);  % 逻辑索引，找到符合条件的节点

    % 获取这些节点的值
    values = first_component(nodeIndices);  % 当前功能系统中节点的值

    % 计算平均值
    if ~isempty(values)  % 确保values不为空
        averageValues(systemIdx) = mean(values);  % 计算平均值
    else
        averageValues(systemIdx) = NaN;  % 如果没有节点，设置为NaN
    end
end

% 创建柱状图
figure;
barHandle = bar(averageValues);
% 设置每个柱子的颜色
colors = lines(numSystems);  % 使用lines函数生成不同的颜色
barHandle.FaceColor = 'flat';  % 设置FaceColor为'flat'以使用CData
% 分配颜色到CData
barHandle.CData = colors;  % 将颜色分配给每个柱子
xticks(1:numSystems);  % 设置x轴刻度
xticklabels({'DMN', 'CON', 'FPN', 'DAN', 'VAN', 'AUD', 'SOM', 'VIS', 'Other'});  % x轴标签
ylim([-60, 130]);

% 绘制半框
ax = gca;  % 获取当前坐标轴
ax.Box = 'off';  % 关闭框
% 添加大括号
yMax = max(averageValues) + 0.1 * max(averageValues); % Y轴最大值偏移
hold on
line([1 1], [yMax-10 yMax-5], 'LineWidth', 2, 'Color', 'k'); % 大括号
line([5 5], [yMax-10 yMax-5], 'LineWidth', 2, 'Color', 'k'); % 大括号
line([1 5], [yMax-5 yMax-5], 'LineWidth', 2, 'Color', 'k'); % 大括号
text(3, yMax + 1, 'Association', 'HorizontalAlignment', 'center', 'FontSize', 12);

line([6 6], [yMax-10 yMax-5], 'LineWidth', 2, 'Color', 'k'); % 大括号
line([8 8], [yMax-10 yMax-5], 'LineWidth', 2, 'Color', 'k'); % 大括号
line([6 8], [yMax-5 yMax-5], 'LineWidth', 2, 'Color', 'k'); % 大括号
text(7, yMax + 1, 'Sensory', 'HorizontalAlignment', 'center', 'FontSize', 12);