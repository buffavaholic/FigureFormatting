%% box plots and related plots

%% bar plot with data overlaid
subplot(2,2,1);
x = [1:3];
data = magic(3);
groups = {'Control','group2','group3'};

b = bar(x,mean(data,1));
hold on;
for i=1:size(data,2)
    y = data(i,:);
    p(i) = plot(x(i)*ones(size(y)),y,'ko');
end
hold off;
ax = gca;
ax.XTickLabel = groups;
b.FaceColor = [0.5 0.5 0.5];
b.EdgeColor = 'none';

% add jitter to the data
jitter = 0.1;
for i=1:length(p)
    p(i).XData = p(i).XData + jitter*(rand(size(p(i).YData))-0.5);
end

%% bar plot with data overlaid
subplot(2,2,2);
x = [1:3];
data = magic(3);
groups = {'Control','group2','group3'};
barWidth = 0.8;

for i=1:size(data,2)
    y = data(i,:);
    p(i) = plot(x(i)*ones(size(y)),y,'o');
    p(i).MarkerFaceColor = p(i).Color;
    hold on;
    pmean(i) = plot(x(i)+barWidth*[-0.5 0.5],mean(y)*[1 1],'-',...
        'Color',p(i).Color,'LineWidth',2);
end
hold off;
ax = gca;
ax.XTick = x;
ax.XTickLabel = groups;

% add jitter to the data
jitter = 0.1;
for i=1:length(p)
    p(i).XData = p(i).XData + jitter*(rand(size(p(i).YData))-0.5);
end


%%
subplot(2,2,3);
data = magic(3);
groups = {'Control','group2','group3'};
bp = boxplot(data);
% bp = boxplot(magic(3),'plotstyle','compact');
% set(findobj(gcf,'Tag','Median'),'Color',[0 0 0],'LineWidth',2);
ax = gca;
ax.XTickLabel = groups;
