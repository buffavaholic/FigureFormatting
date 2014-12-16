

function setScaleFig(FigHand)

figure(FigHand);
axesSize = get(gca,'FontSize');
oneTitle = get(gca,'Title');
titleSize = get(oneTitle,'FontSize');
oneLabel = get(gca,'XLabel');
labelSize = get(oneLabel,'FontSize');

 set(FigHand,'Units','inches');
 set(FigHand,'PaperPositionMode','auto');
posVals = get(FigHand,'Position');
% Get font size for axes, titles, and legends using the last axes
% axesSize = get(gca,'FontSize');
% oneTitle = get(gca,'Title');
% titleSize = get(oneTitle,'FontSize');
% oneLabel = get(gca,'XLabel');
% labelSize = get(oneLabel,'FontSize');
aspRatio = posVals(3)/posVals(4);
UDmatrix = posVals;
UDmatrix(2,:) = [aspRatio,axesSize,titleSize,labelSize];
set(FigHand,'UserData',UDmatrix);
origProps = get(FigHand);
% posVals = origProps.Position;


inputVect = {@keepAspectRatio,origProps,aspRatio};
set(FigHand,'ResizeFcn',inputVect)
set(FigHand,'Units','pixels');
end

function newPos = keepAspectRatio(hFig,inProps,origProps,aspRatio) 

    set(hFig,'Units','inches');
    origPos = origProps.Position;
%     origPos = origProps.UserData;
    UDvals = get(hFig,'UserData');
    prevPos = UDvals(1,1:4);
    currPos = get(hFig,'Position');
    sizeChg = abs(currPos(3:4)-prevPos(3:4)); % determine difference from original size
%     NewAspRatio = oldPos(3)/oldPos(4);
    newPos = currPos;
    if sizeChg(1) >= sizeChg(2)
        % Width is larger so change height
        newPos(3:4) = [newPos(3), newPos(3)/aspRatio];
    else
        newPos(3:4) = [newPos(4)*aspRatio, newPos(4)];
    end
    scaleFactor = newPos(3)/origPos(3);
    allAxes = findall(hFig,'type','axes');
    set(allAxes,'FontSize',UDvals(2,2)*scaleFactor)
    allTitles= get(allAxes,'Title');
    if iscell(allTitles)
        set(cell2mat(allTitles),'FontSize',UDvals(2,3)*scaleFactor)
    else
        set(allTitles,'FontSize',UDvals(2,3)*scaleFactor)
    end
    allLabels = get(allAxes,{'XLabel','YLabel'});
    if iscell(allLabels)
        set(cell2mat(allLabels),'FontSize',UDvals(2,4)*scaleFactor)
    else
        set(allLabels,'FontSize',UDvals(2,4)*scaleFactor)
    end

%     set(findall(hFig,'-property','FontSize'),'FontSize',12)  % scale all fonts to this
    UDnew = UDvals;
    UDnew(1,:) = newPos;
    set(hFig,'UserData',UDnew)
    set(hFig,'Position',newPos);
    
    set(hFig,'Units','pixels');
end