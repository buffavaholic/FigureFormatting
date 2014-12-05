% Figure formatting for standardized figures
% This code standardizes plot size, location, fonts, and lines.

%% single plot positioning
set(gcf,'Units','inches');
set(gcf,'Position',[8 4 2 2]); % Figure 2x2 inches, [left bottom width height]
set(gcf,'ActivePositionProperty','OuterPosition');
set(gca,'OuterPosition',[0 0 1 1]); % makes sure entire plot fits

%% 1x2 subplot positioning
set(gcf,'Units','inches');
set(gcf,'Position',[8 4 4.5 2]); % [left bottom width height]
set(gcf,'ActivePositionProperty','OuterPosition');
plots = get(gcf,'Children');
set(plots(2),'OuterPosition',[0 0 0.5 1]); % makes sure entire plot fits
set(plots(1),'OuterPosition',[0.5 0 0.5 1]); % makes sure entire plot fits
% note: sometimes the above OuterPosition setting doesn't seem to work, try +/-

%% 1x3 subplot positioning
set(gcf,'Units','inches');
set(gcf,'Position',[8 4 6 2]); % Figure 3x3 inches
set(gcf,'ActivePositionProperty','OuterPosition');
plots = get(gcf,'Children');
set(plots(3),'OuterPosition',[0 0 0.33 1]); % makes sure entire plot fits
set(plots(2),'OuterPosition',[.33 0 0.33 1]); % makes sure entire plot fits
set(plots(1),'OuterPosition',[0.67 0 0.33 1]); % makes sure entire plot fits
% note: sometimes the above OuterPosition setting doesn't seem to work, try +/-


%% font size and line size/color
set(findall(gcf,'-property','FontSize'),'FontSize',12)  % set all fonts to this
set(get(gcf,'Children'),'FontSize',10); % Font size of axes

lines = get(gca,'Children');
set(lines,'LineWidth',2)  % set line width for all lines
set(lines(1),'Color',[0 0 0]);          % set to black
set(lines(2),'Color',[0.5 0.5 0.5]);    % set to gray

