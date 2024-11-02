% ��ȡ����ϵͳ������
numSystems = length(labelIndex);
% ��ʼ��һ���������洢ÿ������ϵͳ��ƽ��ֵ
averageValues = zeros(numSystems, 1);
% ����ÿ������ϵͳ
for systemIdx = 1:numSystems
    % ��ȡ��ǰ����ϵͳ���������
    regions = labelIndex{systemIdx};  % ��ǰ����ϵͳ���������

    % �ҵ����ڵ�ǰ����ϵͳ�Ľڵ�
    nodeIndices = ismember(label, regions);  % �߼��������ҵ����������Ľڵ�

    % ��ȡ��Щ�ڵ��ֵ
    values = first_component(nodeIndices);  % ��ǰ����ϵͳ�нڵ��ֵ

    % ����ƽ��ֵ
    if ~isempty(values)  % ȷ��values��Ϊ��
        averageValues(systemIdx) = mean(values);  % ����ƽ��ֵ
    else
        averageValues(systemIdx) = NaN;  % ���û�нڵ㣬����ΪNaN
    end
end

% ������״ͼ
figure;
barHandle = bar(averageValues);
% ����ÿ�����ӵ���ɫ
colors = lines(numSystems);  % ʹ��lines�������ɲ�ͬ����ɫ
barHandle.FaceColor = 'flat';  % ����FaceColorΪ'flat'��ʹ��CData
% ������ɫ��CData
barHandle.CData = colors;  % ����ɫ�����ÿ������
xticks(1:numSystems);  % ����x��̶�
xticklabels({'DMN', 'CON', 'FPN', 'DAN', 'VAN', 'AUD', 'SOM', 'VIS', 'Other'});  % x���ǩ
ylim([-60, 130]);

% ���ư��
ax = gca;  % ��ȡ��ǰ������
ax.Box = 'off';  % �رտ�
% ��Ӵ�����
yMax = max(averageValues) + 0.1 * max(averageValues); % Y�����ֵƫ��
hold on
line([1 1], [yMax-10 yMax-5], 'LineWidth', 2, 'Color', 'k'); % ������
line([5 5], [yMax-10 yMax-5], 'LineWidth', 2, 'Color', 'k'); % ������
line([1 5], [yMax-5 yMax-5], 'LineWidth', 2, 'Color', 'k'); % ������
text(3, yMax + 1, 'Association', 'HorizontalAlignment', 'center', 'FontSize', 12);

line([6 6], [yMax-10 yMax-5], 'LineWidth', 2, 'Color', 'k'); % ������
line([8 8], [yMax-10 yMax-5], 'LineWidth', 2, 'Color', 'k'); % ������
line([6 8], [yMax-5 yMax-5], 'LineWidth', 2, 'Color', 'k'); % ������
text(7, yMax + 1, 'Sensory', 'HorizontalAlignment', 'center', 'FontSize', 12);