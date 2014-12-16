% figureFormatting_disp.m
% Jeff Saucerman 11/24/2014
% updated by Eric Greenwald 12/10/2014 to be run as a function

% This function is designed to set all the formatting for figures to be
% standard 

function figureFormatting_disp(fig,width,height)
%% Get current figure
if nargin == 0
    fig = gcf;
end

%% if there are inputs set height and width
if nargin == 3
    set(fig,'Units','inches');
    PosVals = get(fig,'Position');
    PosVals(3:4) = [width,height];
    set(fig,'Position',PosVals);
    set(fig,'Units','pixels');
end


%% Axis Formatting
% ax = gca;
% 
% % ax.TickDir = 'out';
% % ax.YMinorTick = 'on'; 
% % ax.XMinorTick = 'on';
% set(ax,'TickDir','out','YMinorTick','on','XMinorTick','on');
% box off;

axes = get(fig,'Children');
Leg = findobj(gcf,'Type','axes','Tag','legend');
axNoLeg = setdiff(axes,Leg);
set(axNoLeg,'TickDir','out','YMinorTick','on','XMinorTick','on','box','off');
set(Leg,'EdgeColor','w');

% uistack(Leg,'top')

%% font size 

% Define font sizes
axesFontSize = 14;
titleFontSize = 18;
labelFontSize = 14;
annotationFontSize = 14;
% use 'changeFontSizes' subfunction to find all of each respective type and
% change them to the desired size
changeFontSizes(fig,axesFontSize,titleFontSize,labelFontSize,annotationFontSize)
% set(findall(gcf,'-property','FontSize'),'FontSize',8)  % set all fonts to this
% set(get(gcf,'Children'),'FontSize',10); % Font size of axes
%% set line size/color
lines = get(gca,'Children');
set(lines,'LineWidth',2)  % set line width for all lines

%% Color
% allAxes = findall(fig,'type','axes');
% allAxesOnly= allAxes(~ismember(get(allAxes,'Tag'),{'legend','Colobar'}))
% % cmap = get(groot,'defaultAxesColorOrder');
% % cmap = gray(5);
% % set(groot,'defaultAxesColorOrder','remove')
% 
% % set(lines(1),'Color',[0 0 0]);          % set to black
% % set(lines(1),'Color',[0.5 0.5 0.5]);    % set to gray
% 
% % if 2 color, use black and red
% RBcmap = [0,0,0;1,0,0];
% ColorBlindMap = [0,0,0;
%                 230,159,0;
%                 86,180,233;
%                 0,158,115;
%                 240,228,66;
%                 0,114,178;
%                 213,94,0;
%                 204,121,167];
% for k = 1:length(allAxesOnly)
%     childs = get(allAxesOnly(k),'Children'); % get all children
%     if length(childs) == 2
% %         colormap(allAxesOnly(k),RBcmap)
%         set(allAxesOnly(k),'ColorOrder',RBcmap)
%     elseif length(childs) <= 8
% %         colormap(allAxesOnly(k),RBcmap)
%         set(allAxesOnly(k),allAxesOnly,ColorBlindMap)
%     end    
% end

end

function changeFontSizes(hFig,axesSize,titleSize,labelSize,annotationSize)
allAxes = findall(hFig,'type','axes');
set(allAxes,'FontSize',axesSize)
% Title font size
allTitles= get(allAxes,'Title');
if iscell(allTitles)
    for k = 1:length(allTitles)
        set(allTitles{k},'FontSize',titleSize)
    end
%     set(cell2mat(allTitles),'FontSize',titleSize)
else
    set(allTitles,'FontSize',titleSize)
end
% allAnnotation = findobj(allAxes,'-property','HeadStyle');
allAnnotation = findobj(allAxes,'Tag','annotation');
if iscell(allAnnotation)
    for k = 1:length(allAnnotation)
    set(allAnnotation{k},'FontSize',annotationSize)
    end
else
    set(allAnnotation,'FontSize',annotationSize)
end
% Labels font size
allLabels = get(allAxes,{'XLabel','YLabel'});
if iscell(allLabels)
    for k = 1:length(allLabels)
        set(allLabels{k},'FontSize',labelSize)
    end
%     set(cell2mat(allLabels),'FontSize',labelSize)
else
    set(allLabels,'FontSize',labelSize)
end

end