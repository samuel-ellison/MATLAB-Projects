function S = diceroll(D, held)

hold on
set(gca,'visible','off')
axis([2.5 10.5 0 7.5])
axis equal

size = numel(D);
sizeheld = numel(held);

x = [3, 4.5, 6, 7.5, 9];
y = [6, 6, 6, 6, 6];

for k = 1:1:sizeheld
    x(held(k)) = 0;
    y(held(k)) = 0;
end

for k = 1:1:5
    x(x == 0) = [];
    y(y == 0) = [];
end

% if size == 1
%     x = [6];
%     y = [6];
% elseif size == 2
%     x = [5.25, 6];
%     y = [4.5, 6];
% elseif size == 3
%     x = [4.5, 5.25, 6];
%     y = [6, 4.5, 6];
% elseif size == 4
%     x = [3.75, 4.5, 5.25, 6];
%     y = [4.5, 6, 4.5, 6];
% elseif size == 5
%     x = [3, 3.75, 4.5, 5.25, 6];
%     y = [6, 4.5, 6, 4.5, 6];
% end

for k = 1:1:size
    rectangle('Position', [x(k) y(k) 1 1], 'FaceColor', 'w', 'LineWidth', 5)
end

for k = 1:1:size
    if D(k) == 1
        X1 = x(k) + 0.5;
        Y1 = y(k) + 0.5;
        plot(X1,Y1,'k.-','markersize',50)
    elseif D(k) == 2
        X1 = x(k) + 0.25;
        Y1 = y(k) + 0.75;
        X2 = x(k) + 0.75;
        Y2 = y(k) + 0.25;
        hold on
        plot(X1,Y1,'k.-','markersize',50)
        plot(X2,Y2,'k.-','markersize',50)
    elseif D(k) == 3
        X1 = x(k) + 0.25;
        Y1 = y(k) + 0.75;
        X2 = x(k) + 0.75;
        Y2 = y(k) + 0.25;
        X3 = x(k) + 0.5;
        Y3 = y(k) + 0.5;
        hold on
        plot(X1,Y1,'k.-','markersize',50)
        plot(X2,Y2,'k.-','markersize',50)
        plot(X3,Y3,'k.-','markersize',50)
    elseif D(k) == 4
        X1 = x(k) + 0.25;
        Y1 = y(k) + 0.75;
        X2 = x(k) + 0.75;
        Y2 = y(k) + 0.25;
        X3 = x(k) + 0.25;
        Y3 = y(k) + 0.25;
        X4 = x(k) + 0.75;
        Y4 = y(k) + 0.75;
        plot(X1,Y1,'k.-','markersize',50)
        plot(X2,Y2,'k.-','markersize',50)
        plot(X3,Y3,'k.-','markersize',50)
        plot(X4,Y4,'k.-','markersize',50)
    elseif D(k) == 5
        X1 = x(k) + 0.25;
        Y1 = y(k) + 0.75;
        X2 = x(k) + 0.75;
        Y2 = y(k) + 0.25;
        X3 = x(k) + 0.25;
        Y3 = y(k) + 0.25;
        X4 = x(k) + 0.75;
        Y4 = y(k) + 0.75;
        X5 = x(k) + 0.5;
        Y5 = y(k) + 0.5;
        plot(X1,Y1,'k.-','markersize',50)
        plot(X2,Y2,'k.-','markersize',50)
        plot(X3,Y3,'k.-','markersize',50)
        plot(X4,Y4,'k.-','markersize',50)
        plot(X5,Y5,'k.-','markersize',50)
    elseif D(k) == 6
        X1 = x(k) + 0.25;
        Y1 = y(k) + 0.75;
        X2 = x(k) + 0.75;
        Y2 = y(k) + 0.25;
        X3 = x(k) + 0.25;
        Y3 = y(k) + 0.25;
        X4 = x(k) + 0.75;
        Y4 = y(k) + 0.75;
        X5 = x(k) + 0.25;
        Y5 = y(k) + 0.5;
        X6 = x(k) + 0.75;
        Y6 = y(k) + 0.5;
        plot(X1,Y1,'k.-','markersize',50)
        plot(X2,Y2,'k.-','markersize',50)
        plot(X3,Y3,'k.-','markersize',50)
        plot(X4,Y4,'k.-','markersize',50)
        plot(X5,Y5,'k.-','markersize',50)
        plot(X6,Y6,'k.-','markersize',50)
    end
end
end
        
        
        
        
        
        
        