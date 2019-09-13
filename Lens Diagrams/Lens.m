% Lens Simulator
clc; clear all; close all;



% Create Figure
figure(1)
axis([0 30 -10 10])
xticks(0:3:30)
yticks(-10:2:10)
pbaspect([1 1 1])
grid on

% Lens Type, Focal Length, Oject Distance, and Object Height
type = input('Convex (1) or Concave (2) Lens:\n');
f0 = input('Focal Length:\n');
% Account for concave lens
if type == 2
    f0 = -f0;
end
do = input('Object Distance:\n');
ho = input('Object Height:\n');
shg

% Principal Axis
x = [0 30];
y = [0 0];
hold on
plot(x,y,'m.--','LineWidth',1)

% Lens Axis
x = [15 15];
y = [6 -6];
plot(x,y,'m.--','LineWidth',1)

% Convex Lens & focal length
drawLens(type)
f1 = 15+f0;
f2 = 15-f0;

plot(f1,0,'k.-','MarkerSize',15)
plot(f2,0,'k.-','MarkerSize',15)

% Object

p1 = [15-do 0];
p2 = [15-do ho];
dp = p2-p1;
quiver(p1(1),p1(2),dp(1),dp(2),0,'r','MaxHeadSize',2,'LineWidth',2)

% Calculations
di = ((1/f0)-(1/do))^-1;
M = -di/do;
hi = M*ho;

switch type
    % Convex (Converging Lens)
    case 1
        
        % Real, inverted image
        if do > f0
            % 1st Ray
            dx = do/100;
            for k = 1:1:101
                x = (15-do)+(k-1)*dx;
                y = ho;
                plot(x,y,'b.-','Linewidth',2)
                pause(0.01)
            end
            
            dx = di/100;
            m = -ho/f0;
            for k = 1:1:101
                x = (15)+(k-1)*dx;
                y = m*(x-15)+ho;
                plot(x,y,'b.-','Linewidth',2)
                pause(0.01)
            end
            
            % 2nd Ray
            dx = (di+do)/200;
            m = -ho/do;
            for k = 1:1:201
                x = (15-do)+(k-1)*dx;
                y = m*(x-15);
                plot(x,y,'b.-','Linewidth',2)
                pause(0.01)
            end
            
            % 3rd Ray
            dx = do/100;
            m = ho/(f0-do);
            for k = 1:1:101
                x = (15-do)+(k-1)*dx;
                y = m*(x-(15-f0));
                plot(x,y,'b.-','Linewidth',2)
                pause(0.01)
            end
            
            dx = di/100;
            for k = 1:1:101
                x = (15)+(k-1)*dx;
                y = hi;
                plot(x,y,'b.-','Linewidth',2)
                pause(0.01)
            end
        
        % No image (Parallel Rays)    
        elseif do == f0
            
            % 1st Ray
            dx = do/100;
            for k = 1:1:101
                x = (15-do)+(k-1)*dx;
                y = ho;
                plot(x,y,'b.-','Linewidth',2)
                pause(0.01)
            end
            
            dx = 1/20;
            m = -ho/f0;
            for k = 1:1:201
                x = (15)+(k-1)*dx;
                y = m*(x-15)+ho;
                plot(x,y,'b.-','Linewidth',2)
                pause(0.01)
            end
            
            % 2nd Ray
            dx = 1/20;
            m = -ho/do;
            for k = 1:1:201
                x = (15-do)+(k-1)*dx;
                y = m*(x-15);
                plot(x,y,'b.-','Linewidth',2)
                pause(0.01)
            end
        % Virtual, Erect Image (Diverging Rays)    
        else
            
            % 1st Ray
            dx = do/100;
            for k = 1:1:101
                x = (15-do)+(k-1)*dx;
                y = ho;
                plot(x,y,'b.-','Linewidth',2)
                pause(0.01)
            end
            
            dx = 1/20;
            m = -ho/f0;
            for k = 1:1:201
                x = (15)+(k-1)*dx;
                y = m*(x-15)+ho;
                plot(x,y,'b.-','Linewidth',2)
                pause(0.01)
            end
            
            % 2nd Ray
            dx = 1/20;
            m = -ho/do;
            for k = 1:1:201
                x = (15-do)+(k-1)*dx;
                y = m*(x-15);
                plot(x,y,'b.-','Linewidth',2)
                pause(0.01)
            end
            
            % Add Converging Rays
            
            % 1st Ray
            dx = (di+do)/20;
            m = (hi-ho)/(do+di);
            for k = 1:1:21
                x = (15-do)+(k-1)*dx;
                y = m*(x-15+do)+ho;
                plot(x,y,'b.-','Linewidth',2)
                pause(0.01)
            end
            
            % 2nd Ray
            dx = di/20;
            m = (hi-ho)/di;
            for k = 1:1:21
                x = 15+(k-1)*dx;
                y = m*(x-15)+ho;
                plot(x,y,'b.-','Linewidth',2)
                pause(0.01)
            end
            
        end
        
        % Add Image
        p1 = [15+di 0];
        p2 = [15+di hi];
        dp = p2-p1;
        c = [1 0.4118 0.1608];
        quiver(p1(1),p1(2),dp(1),dp(2),0,'Color',c,'MaxHeadSize',2,'LineWidth',2)
        
    % Concave (Diverging Lens)    
    case 2
        
        % Zoom in for convenience
        x1 = 15-do-2;
        x2 = 15+do+2;
        axis([x1 x2 -4 4])
        pbaspect([1 1 1])
        grid on
        
        % 1st Ray
        dx = do/100;
        for k = 1:1:101
            x = (15-do)+(k-1)*dx;
            y = ho;
            plot(x,y,'b.-','Linewidth',2)
            pause(0.01)
        end
        
        dx = 0.05;
        m = ho/abs(f0);
        for k = 1:1:101
            x = (15)+(k-1)*dx;
            y = m*(x-15)+ho;
            plot(x,y,'b.-','Linewidth',2)
            pause(0.01)
        end
        
        % 2nd Ray
        dx = do/100;
        m = (hi-ho)/do;
        for k = 1:1:101
            x = (15-do)+(k-1)*dx;
            y = m*(x-15)+hi;
            plot(x,y,'b.-','Linewidth',2)
            pause(0.01)
        end
        
        dx = 0.05;
        for k = 1:1:151
            x = (15)+(k-1)*dx;
            y = hi;
            plot(x,y,'b.-','Linewidth',2)
            pause(0.001)
        end
        
        % 3rd Ray
        dx = 0.05;
        m = -ho/do;
        for k = 1:1:201
            x = (15-do)+(k-1)*dx;
            y = m*(x-15);
            plot(x,y,'b.-','Linewidth',2)
            pause(0.001)
        end
        
        % Add Converging Rays
        
        % 1st Ray
        dx = di/20;
        m = (hi-ho)/di;
        for k = 1:1:21
            x = (15)+(k-1)*dx;
            y = m*(x-15)+ho;
            plot(x,y,'b.-','Linewidth',2)
            pause(0.001)
        end
        
        % 2nd Ray
        dx = di/20;
        for k = 1:1:21
            x = (15)+(k-1)*dx;
            y = hi;
            plot(x,y,'b.-','Linewidth',2)
            pause(0.001)
        end
        
        % Image
        p1 = [15+di 0];
        p2 = [15+di hi];
        dp = p2-p1;
        c = [1 0.4118 0.1608];
        quiver(p1(1),p1(2),dp(1),dp(2),0,'Color',c,'MaxHeadSize',2,'LineWidth',2)
        
end




