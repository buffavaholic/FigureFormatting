%% Error bar plots but with shading instead

function shadedErrorBar(x,Ymean,Yerr)

p = plot(x,Ymean,'LineWidth',2);
hold on;
colors = get(p,'Color');

for k = 1:length(p)
    xRegion = [x; flipud(x)];
    yRegion = [Ymean(:,k)+Yerr(:,k);flipud(Ymean(:,k)-Yerr(:,k))];
    if iscell(colors)
        colorRegion = colors{k} + .6;
    else 
        colorRegion = colors + .6;
    end
    colorRegion(colorRegion>1) = 1;
    fi = fill(xRegion(1:end-1),yRegion(1:end-1),colorRegion,'EdgeColor','none','FaceAlpha',.5);
%     uistack(fi,'bottom')
end



