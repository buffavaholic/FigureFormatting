% figureFormatting.m
% Jeff Saucerman 11/24/2014

%% Figure Positioning
fig = gcf;
fig.Units = 'inches';
fig.Position(3:4) = [3.5 2]; % 1 column figure, width x height
% fig.Position(3:4) = [5 2]; % 1.5 column figure, width x height
% fig.Position(3:4) = [7.2 2]; % 2 column figure, width x height
fig.Units = 'pixels';

%% Axis Formatting
ax = gca;
ax.TickDir = 'out';
ax.YMinorTick = 'on'; 
ax.XMinorTick = 'on';
box off;


%% font size and line size/color
fig = gcf;
set(findall(gcf,'-property','FontSize'),'FontSize',8)  % set all fonts to this
% set(get(gcf,'Children'),'FontSize',10); % Font size of axes

lines = get(gca,'Children');
set(lines,'LineWidth',2)  % set line width for all lines

%% Color
% cmap = get(groot,'defaultAxesColorOrder');
% cmap = gray(5);
% set(groot,'defaultAxesColorOrder','remove')

% set(lines(1),'Color',[0 0 0]);          % set to black
% set(lines(1),'Color',[0.5 0.5 0.5]);    % set to gray