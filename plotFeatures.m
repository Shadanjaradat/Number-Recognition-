% plot feature vectors for given number of images
function plotFeatures(R,W, C,maxNum,testOnly)

if nargin == 4
    % do not reserve any for testing if testOnly not specified
    testOnly = false(size(R));
end

hold on
% extract and plot points for class 0
r = R(C==0 & ~testOnly);
w = W(C==0 & ~testOnly);
%l = L(C==0 & ~testOnly);
plot(r,w,'bo');
% repeat for class 1
r = R(C==1 & ~testOnly);
w = W(C==1 & ~testOnly);
%l = L(C==1 & ~testOnly);
plot(r,w,'rx');
% repeat for other classes as necessary
if maxNum > 1
    r = R(C==2 & ~testOnly);
    w = W(C==2 & ~testOnly);
    %l = L(C==2 & ~testOnly);
    plot(r,w, 'g+');
end
if maxNum > 2
    r = R(C==3 & ~testOnly);
    w = W(C==3 & ~testOnly); 
    %l = L(C==3 & ~testOnly); 
    plot(r,w,'md');
end
if maxNum > 3
    r = R(C==4 & ~testOnly);
    w = W(C==4 & ~testOnly);
    %l = L(C==4 & ~testOnly);
    plot(r,w,'cs');
end
if maxNum > 4
    r = R(C==5 & ~testOnly);
    w = W(C==5 & ~testOnly);
    %l = L(C==5 & ~testOnly);
    plot(r,w,'.','color',[0.8 0.6 0.4]);
end
if maxNum > 5
    r = R(C==6 & ~testOnly);
    w = W(C==6 & ~testOnly);
    %l = L(C==6 & ~testOnly);
    plot(r,w, '*','color',[0.8 0.6 0.4]);
end
if maxNum > 6
    r = R(C==7 & ~testOnly);
    w = W(C==7 & ~testOnly);
    %l = L(C==7 & ~testOnly);
    plot(r,w,'h','color',[0.8 0.2 0.4]);
end
if maxNum > 7
    r = R(C==8 & ~testOnly);
    w = W(C==8 & ~testOnly);
    plot(r,w, 'g+','color',[0.8 0.2 0.4]);
end
if maxNum > 8
    r = R(C==9 & ~testOnly);
    w = W(C==9 & ~testOnly);
    %l = L(C==9 & ~testOnly);
    plot(r,w,'>','color',[0.2 0.2 0.4]);
end

xlabel('hu0');
ylabel('hu1');
