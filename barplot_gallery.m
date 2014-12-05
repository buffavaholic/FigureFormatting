%% simple bar plot
subplot(2,2,1);
x = [1:5];
data = [1 2 5 4 3];
b = bar(data);

% formatting
b.FaceColor = [0.5 0.5 0.5];
b.EdgeColor = 'none';
ax = gca;
ax.XTick = [1:5];
ax.XTickLabel = {'CTL','cond2','cond3','cond4','cond5'};
ax.XTickLabelRotation = 40;
ax.Box = 'off';
ylabel('Relative activity');

%% multi-colored bar plot
subplot(2,2,2);
data = [1 2 5 4 3];
n = nan(size(data));
cmap = lines(7);
% cmap = gray(5);
hold on;
for i=1:length(data),
    d = n;
    d(i) = data(i);
    b = bar(d,'FaceColor',cmap(i,:),'EdgeColor','none');
end
hold off;

ax = gca;
ax.XTick = [1:5];
ax.XTickLabel = {'CTL','cond2','cond3','cond4','cond5'};
ax.XTickLabelRotation = 40;
ylabel('Relative activity');
ax.Box = 'off';


%% grouped bar graph
subplot(2,2,3);
data = magic(3);
b = bar(data);

cmap = get(groot,'defaultAxesColorOrder');
% cmap = gray(4);
for i=1:numel(b)
    b(i).FaceColor = cmap(i,:);
    b(i).EdgeColor = 'none';
end

ax = gca;
ax.XTickLabel = {'group1','group2','group3'};
ax.XTickLabelRotation = 40;
ax.YGrid = 'on';
ax.Box = 'off';

leg = legend('CTL','cond2','cond3');
% leg.Box = 'off';
leg.Orientation = 'horizontal';

%% simple horizontal bar plot
subplot(2,2,4);
data = [1 2 5 4 3];
b = bar(data);

% formatting
b.FaceColor = [0.5 0.5 0.5];
b.EdgeColor = 'none';
ax = gca;
ax.XTick = [1:5];
ax.XTickLabel = {'CTL','cond2','cond3','cond4','cond5'};

ax.Box = 'off';
ylabel('Relative activity');
view(90,90)
ax.YAxisLocation = 'right';
