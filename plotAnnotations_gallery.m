% plotAnnotations_gallery

%% bar plot with error bars and significance bridge
subplot(2,2,1);
x = [1:5];
data = [1 2 5 4 3];
b = bar(data);

% formatting
b.FaceColor = [0.5 0.5 0.5];
b.EdgeColor = 'none';
ax = gca;
ax.XTick = [1:5];
ax.XTickLabel = {'Control','AngII','Iso','Phe','IL6'};
ax.XTickLabelRotation = 40;
ax.Box = 'off';
ylabel('Relative activity');

% error bars
hold on;
err = 0.5*ones(size(data));
er = errorbar(1:5,data,err);
er.Color = [0 0 0];                            % make the errorbars black
er.LineStyle = 'none'; 
hold off
uistack(b,'top'); % if you want the bars in front of error bars


% stars
starHeight = data+1.5*err;
text(x(2),starHeight(2),'*','HorizontalAlignment','center');
text(x(3),starHeight(3),'**','HorizontalAlignment','center');

% significance bridge
comp = [4 5];   % which points to compare
bridgeHeight = 5;     % desired y location for bridge
ax = gca;
dh = 0.02*(max(ax.YLim)-min(ax.YLim));
yBridge = bridgeHeight-[dh 0 0 dh];
xBridge = [x(comp(1)),x(comp(1)),x(comp(2)),x(comp(2))];
line(xBridge,yBridge,'Color','k');
text(mean(x(comp)),bridgeHeight,'*','HorizontalAlignment','center');

%% timecourses with confidence intervals
subplot(2,2,2);
x = [0:0.1:10];
y = sin(x);

p = plot(x,y,'o-','MarkerSize',3);
xlabel('Time (s)');
ylabel('Signal');
p.MarkerFaceColor = p.Color;

xconf = [x,fliplr(x)];
err = 0.5*ones(size(y)); % replace with actual error values
yconf = [y+err, fliplr(y-err)];

hold on;
fillColor = p.Color+0.6;
fillColor(fillColor>1) = 1;
fi = fill(xconf,yconf,fillColor,'EdgeColor','none');
hold off;
uistack(fi,'bottom')

%% add arrow
ar = annotation('textarrow','String','+Iso');
ar.Parent = gca;
ar.Position = [pi/2 1.3 0 -0.2];
ar.HorizontalAlignment = 'center';

%% add textbox
tb = annotation('textbox','String','+IBMX');
tb.Parent = gca;
tb.Position = [5 1.3 5 0.18];
tb.Color = 'w';
tb.BackgroundColor = 'k';
tb.HorizontalAlignment = 'center';
tb.VerticalAlignment = 'middle';

%% gray section
hold on;
ax = gca;
xLim = [5 ax.XLim(2)];
yLim = [ax.YLim(1) ax.YLim(2)];
fillColor = [0.95 0.95 0.95];
fi2 = fill([xLim(1) xLim(2) xLim(2) xLim(1)],[yLim(1) yLim(1) yLim(2) yLim(2)],fillColor);
fi2.EdgeColor = 'none';
hold off;
uistack(fi2,'bottom');