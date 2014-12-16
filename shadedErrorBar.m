%% shadedErrorBar.m
% Eric Greenwald 12/16/14
%
% Creating x-y line plots with error plotted as shading instead of error
% bars. 
% Inputs:
%    - x      - n x 1 vector of x values 
%    - Ymean  - n x m matrix of the mean Y value for each x point for m
%                  lines
%    - Yerr   - n x m matrix of the error values for each Y point for each
%                  line

function shadedErrorBar(x,Ymean,Yerr)

%% Plot lines
% Plot the lines with a standard x-y plot
p = plot(x,Ymean,'LineWidth',2);
hold on;
% pull the color values of the lines
colors = get(p,'Color');

%% Plot shaded region
for k = 1:length(p)
    % define x points of the polygon verticies, x must be collumn vector
    xRegion = [x; flipud(x)];
    % calculate y vertices for error above and below and put in correct
    % order
    yRegion = [Ymean(:,k)+Yerr(:,k);flipud(Ymean(:,k)-Yerr(:,k))];
    % change the color associated with the line some to have a lighter
    % intensity
    if iscell(colors)
        colorRegion = colors{k} + .6;
    else 
        colorRegion = colors + .6;
    end
    % Make sure the color values are maxed out at 1
    colorRegion(colorRegion>1) = 1;
    % set the fill region excluding the repeated inital point
    % The alpha was set to .5 so that the order didnt have to change but
    % could still see the lines. Has issues with copy figure.
    fi = fill(xRegion(1:end-1),yRegion(1:end-1),colorRegion,'EdgeColor','none','FaceAlpha',.5);
%     uistack(fi,'bottom')
end



