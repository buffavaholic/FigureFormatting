%% timecourse
subplot(2,2,1);
x= [0:0.1:10];
y1 = sin(x);
y2 = cos(x);
y3 = 0.1+y1;
y4 = 0.1+y2;

% set(groot,'defaultAxesColorOrder','remove')
p = plot(x,y1,x,y2,x,y3,x,y4)
set(p,'LineWidth',2)


%%
subplot(2,2,2);
p = plot(x,y1,x,y2,x,y3,x,y4)
set(p,'LineWidth',3)

cmap = gray(5); % if using grayscale lines
% use 25 50 and 100
for i=1:length(p)
    p(i).Color = cmap(i,:);
end

%% 
subplot(2,2,3);
plot(y1,y2,'o',y1,y4,'+',y2,y4,'x');

