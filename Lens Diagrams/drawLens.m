function s = drawLens(type)

% type 1 = convex
% type 2 = concave

r = 10/cos(pi/9);
xx = r - 10;


switch type
    case 1
        for k = -pi/9:0.001:pi/9
            x = r*cos(k)+5;
            y = r*sin(k);
            hold on
            plot(x,y,'k.-')
        end
        for k = 8*pi/9:0.001:10*pi/9
            x = r*cos(k)+2*r-2*xx+5;
            y = r*sin(k);
            hold on
            plot(x,y,'k.-')
        end
    case 2
        for k = -pi/9:0.001:pi/9
            x = r*cos(k)-1.5*xx+5;
            y = r*sin(k);
            hold on
            plot(x,y,'k.-')
        end
        for k = 8*pi/9:0.001:10*pi/9
            x = r*cos(k)+2*r-.5*xx+5;
            y = r*sin(k);
            hold on
            plot(x,y,'k.-')
        end
        
        xt = [r-2.5*xx+5 r+0.5*xx+5];
        yt = [r*sin(pi/9) r*sin(pi/9)];
        xb = [r-2.5*xx+5 r+0.5*xx+5];
        yb = [-r*sin(pi/9) -r*sin(pi/9)];
        
        plot(xt,yt,'k.-','LineWidth',2)
        plot(xb,yb,'k.-','LineWidth',2)
        
        
        
end

end