% figureFormattingFunc.m
% Jeff Saucerman 11/24/2014
% updated by Eric Greenwald 12/10/2014 to be run as a function

function figureFormattingFunc(width,height)
% The inputs are the width and height of a function in inches
% The standard widths for column types:
%   1 column - 3.5 inches
%   1.5 column - 5 inches
%   2 column - 7.2 inches

%% Determine MATLAB version
% matlab 2014 has some new methods for figure handling that are not
% compatable with older versions
isOldVersion = verLessThan('matlab','8.3');
%% Figure Positioning
fig = gcf;
if isOldVersion
set(fig,'Units','inches');
PosVals = get(fig,'Position');
PosVals(3:4) = [width,height];
set(fig,'Position',PosVals);
set(fig,'Units','pixels');
else
fig.Units = 'inches';
fig.Position(3:4) = [3.5 2]; % 1 column figure, width x height
% fig.Position(3:4) = [5 2]; % 1.5 column figure, width x height
% fig.Position(3:4) = [7.2 2]; % 2 column figure, width x height
fig.Units = 'pixels';
end

% aspRatio = width/height;
% set(fig,'ResizeFcn',{@keepAspectRatio,aspRatio,})

%% Axis Formatting
% ax = gca;
% 
% % ax.TickDir = 'out';
% % ax.YMinorTick = 'on'; 
% % ax.XMinorTick = 'on';
% set(ax,'TickDir','out','YMinorTick','on','XMinorTick','on');
% box off;

axes = get(fig,'Children');
set(axes,'TickDir','out','YMinorTick','on','XMinorTick','on','box','off');


%% font size 
fig = gcf;
% Define font sizes
axesFontSize = 16;
titleFontSize = 20;
labelFontSize = 16;
% use 'changeFontSizes' subfunction to find all of each respective type and
% change them to the desired size
changeFontSizes(fig,axesFontSize,titleFontSize,labelFontSize)
% set(findall(gcf,'-property','FontSize'),'FontSize',8)  % set all fonts to this
% set(get(gcf,'Children'),'FontSize',10); % Font size of axes
%% set line size/color
lines = get(gca,'Children');
set(lines,'LineWidth',2)  % set line width for all lines

%% Color
% cmap = get(groot,'defaultAxesColorOrder');
% cmap = gray(5);
% set(groot,'defaultAxesColorOrder','remove')

% set(lines(1),'Color',[0 0 0]);          % set to black
% set(lines(1),'Color',[0.5 0.5 0.5]);    % set to gray
% origProps = get(gcf);
% aspRatio = width/height;
% inputVect = {@keepAspectRatio,origProps,aspRatio};
% set(fig,'ResizeFcn',inputVect)
%% Set figure to be scaleable
setScaleFig(gcf)
end

function changeFontSizes(hFig,axesSize,titleSize,labelSize)
allAxes = findall(hFig,'type','axes');
set(allAxes,'FontSize',axesSize)
% Title font size
allTitles= get(allAxes,'Title');
if iscell(allTitles)
    set(cell2mat(allTitles),'FontSize',titleSize)
else
    set(allTitles,'FontSize',titleSize)
end
% Labels font size
allLabels = get(allAxes,{'XLabel','YLabel'});
if iscell(allLabels)
    set(cell2mat(allLabels),'FontSize',labelSize)
else
    set(allLabels,'FontSize',labelSize)
end
end