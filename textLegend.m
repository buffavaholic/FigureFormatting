

function textLegend(LegText,xVals,yVals)
% get colors
lines = flipud(findall(gca,'Type','Line'));
colors = get(lines,'Color');
yLims = get(gca,'YLim');

[ordY,indY] = sort(yVals(end,:),'descend');
nLines = length(ordY);
distY = abs(diff(ordY));
spacing = diff(yLims)/10;
loc = zeros(length(ordY),1);
loc(1) = 1;
loc(nLines) = nLines+1;
% for k = 1:length(ordY)-2
%     if distY(k)>=spacing
%         loc(k+1) = k+1;
%     elseif distY(k+1)>= spacing*1.5
%         loc(k+1) = k+2;
%     end
%         
% end
if nLines >1
halfNum = ceil(nLines/2);
% top ones
for k = 2: halfNum
    if distY(k-1)>=spacing
        loc(k) = k;
    elseif distY(k)>= spacing*2
        loc(k) = k+1;
    else
        loc(k) = loc(k-1);
    end
end
for k = nLines-1:-1:halfNum+1
    if distY(k)>=spacing
        loc(k) = k+1;
    elseif distY(k-1)>= spacing*2
        loc(k) = k;
    else
        loc(k) = loc(k+1);
    end
end
% if distY(3)
for k = 1:nLines+1
    countSpots(k) = sum(loc == k);
end
for k = 1:halfNum
    if countSpots(loc(k))>1
        strLoc(k) = ordY(loc(k))+spacing*1*countSpots(loc(k));
        countSpots(loc(k)) = countSpots(loc(k)) - 1;
    else
        strLoc(k) = ordY(loc(k))+spacing*1;
    end
    
end
for k = nLines:-1:halfNum+1
    if countSpots(loc(k))>1
        strLoc(k) = ordY(loc(k)-1)-spacing*1*countSpots(loc(k));
        countSpots(loc(k)) = countSpots(loc(k)) - 1;
    else
        strLoc(k) = ordY(loc(k)-1)-spacing*1;
    end
    
end
for k = 1:length(LegText)
    text(xVals(end),strLoc(k),LegText(indY(k)),'HorizontalAlignment','right','Tag','annotation','Color',colors{indY(k)})
    set(lines(indY(k)),'LineStyle','--')
%     text(xVals(end),strLoc(k),LegText(indY(k)),'HorizontalAlignment','right','Tag','annotation','Color',colors{indY(k)})
end
else
    strLoc(1) = ordY(1)+spacing*1;
    text(xVals(end),strLoc,LegText(indY),'HorizontalAlignment','right','Tag','annotation','Color',colors)
    set(lines(indY),'LineStyle','--')
end
% for k = 1:length(LegText)
%     text(xVals(end),strLoc(k),LegText(indY(k)),'HorizontalAlignment','right','Tag','annotation','Color',colors{indY(k)})
%     set(lines(indY(k)),'LineStyle','--')
% %     text(xVals(end),strLoc(k),LegText(indY(k)),'HorizontalAlignment','right','Tag','annotation','Color',colors{indY(k)})
% end

