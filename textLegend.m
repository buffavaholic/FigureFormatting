%% textLegend.m
% Eric Greenwald 12/16/14
%
% This function is made to add labels near the lines on the plot, that is
% the same color as the line. 
% Inputs:
%    - LegText - cell array (m x 1) of strings of legend text
%    - xVals   - n x 1 vector of x values
%    - yVals   - n x m matrix of the y values

% The labels are placed based on the order of the final y point. The first
% half of the higher y values are placed above the line and the lower half
% are placed below the line. If there isnt room where the text is supposed
% to go it gets pushed to the next text region.


function textLegend(LegText,xVals,yVals)

%% Extract the plot properties
% Extract all the line graphics handles
lines = flipud(findall(gca,'Type','Line'));
% Get colors of those lines
colors = get(lines,'Color');
% Determine the Range of Y values currently set to determine how much space
% is required between lines
yLims = get(gca,'YLim');

%% Sort Y values and calculate spacing
% sort the final y values to determine spacing for max to min
[ordY,indY] = sort(yVals(end,:),'descend');
nLines = length(ordY);      % number of lines
distY = abs(diff(ordY));    % distances between y values
% calculate the distance between lines required as 10% of the set y range
spacing = diff(yLims)/10;   
% set up the vector to determine which gap between lines each label is
% where the value of 1 is above the top line and the value of nLines+1 is
% the space below the bottom line
loc = zeros(length(ordY),1);
loc(1) = 1;
loc(nLines) = nLines+1;

%% Placing Text
% if there is only 1 line just put above the line
if nLines >1
    % determine what is the half way point in terms of number of lines
    halfNum = ceil(nLines/2);
    %% Determining text gap locations    
    % For the lines in the top half assume that if there is space above the
    % line then it will be placed there. If there isnt room above but there
    % is space for 2 labels below then place below line. If neither work
    % then use the location spacer index above that to determine the place.
    % This means that if all the lines are nearly on top of eachother the
    % top half ones will be placed in the 1 spot because each one will
    % recursively be pushed higher.
    for k = 2: halfNum
        if distY(k-1)>=spacing
            % enough space above
            loc(k) = k;
        elseif distY(k)>= spacing*2
            % enough space below for 2 labels
            loc(k) = k+1;
        else
            % push to previous lines grouping
            loc(k) = loc(k-1);
        end
    end
    % for the bottom half use the same process except for starting at the
    % bottom and looking below the line.
    for k = nLines-1:-1:halfNum+1
        if distY(k)>=spacing
            % enough space below
            loc(k) = k+1;
        elseif distY(k-1)>= spacing*2
            % enough space below for 2 labels
            loc(k) = k;
        else
            % push to previous lines grouping
            loc(k) = loc(k+1);
        end
    end
    % Determine how many lines are in each spot
    for k = 1:nLines+1
        countSpots(k) = sum(loc == k);
    end
    %% Determine Text spacing
    % Space out the text spacing as determined by the gap and and stack
    % them from highest to lowest within a gap.
    for k = 1:halfNum
        if countSpots(loc(k))>1
            % more that one text is within a gap so stack them. 
            % Place location a distance away that is equal to the the
            % spacing times the number of labels left to place in that gap
            strLoc(k) = ordY(loc(k))+spacing*1*countSpots(loc(k));
            % decrease the number of text that has to be placed in that gap
            countSpots(loc(k)) = countSpots(loc(k)) - 1;
        else
            % only 1 text to place in the gap so just place 1 spacing
            % distance above line
            strLoc(k) = ordY(loc(k))+spacing*1;
        end
        
    end
    for k = nLines:-1:halfNum+1
        if countSpots(loc(k))>1
            % more that one text is within a gap so stack them. 
            % Place location a distance away that is equal to the the
            % spacing times the number of labels left to place in that gap
            strLoc(k) = ordY(loc(k)-1)-spacing*1*countSpots(loc(k));
            % decrease the number of text that has to be placed in that gap
            countSpots(loc(k)) = countSpots(loc(k)) - 1;
        else
            % only 1 text to place in the gap so just place 1 spacing
            % distance below line
            strLoc(k) = ordY(loc(k)-1)-spacing*1;
        end
        
    end
    %% Place text
    for k = 1:length(LegText)
        % Use the string y location, strLoc, to place each of the correct
        % (needed to make sure to use the sort indexes) text to its given
        % location.
        % NOTE: Made sure to add "'Tag','annotation'" inside text so it can
        % be found as an annotation later for formatting by
        % "figureFormatting" functions
        text(xVals(end),strLoc(k),LegText(indY(k)),'HorizontalAlignment','right','Tag','annotation','Color',colors{indY(k)})
    end
else
    % Just place the single text label above the line 1 spacing distance
    strLoc(1) = ordY(1)+spacing*1;
    % NOTE: Made sure to add "'Tag','annotation'" inside text so it can
    % be found as an annotation later for formatting by
    % "figureFormatting" functions
    text(xVals(end),strLoc,LegText(indY),'HorizontalAlignment','right','Tag','annotation','Color',colors)
end


