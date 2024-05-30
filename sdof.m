clear all ;
close all ;
clc 

m = 1 ;
zeta = 0.1 ;
k = 100 ;
wn = sqrt(k/m) ;
c = 2*m*wn*zeta ;

w = 0.001:0.001:10 ;

H = 1./(-m*w.^2 + w*c*1i + k ) ;

tspan = 0:0.01:10 ;


xstate_init(1) = 0 ;
xstate_init(2) = 0 ;
[t , xstate] = ode45('statederivative',tspan, xstate_init); 
f = (10*sin(100*tspan)) ;
[m,~] = size(xstate) ;

w = 0.1 ;
h = 0.25 ;
xc = 0 ;

xl = xc - w*0.5 ;



figure ;

  tic   
for i = 1:1:m
    
    disp(i)
   yc = xstate(i,1) ;
    yb = yc - h*0.5 ;
    clf
    subplot(3,1,1)
    rectangle('Position',[xl,yb,w,h]) ;
%     rectangle('Position',[xl,yb+0.3,w,h]) ;
     
    xlim([-0.25,0.25]) ;
    ylim([-0.5 ,0.5]) ;
    
     subplot(3,1,2)
     plot(t,xstate(:,1));
     hold on
     scatter(t(i),xstate(i,1),'m','o','fill')
     
    subplot(3,1,3)
%      plot(t,xstate(:,));
       plot(t,f(:)) ;
     hold on
     scatter(t(i),f(1,i),'m','o','fill')
    
%     currentframe = frame2im(getframe(gcf)); % convert fig into image data
%  
%  if i == 1
%  imwrite(currentframe, 'tiffstack.tiff', 'WriteMode', 'overwrite');
%  else
%  imwrite(currentframe, 'tiffstack.tiff', 'WriteMode', 'append');
%  end
pause(0.001)
    
    
end

   toc 
    
    
    
    
    
    
    
    
    
    
    
    
    
% subplot(2,1,1)
% plot(tspan, f,'g','LineWidth',2) ;
% xlabel('Time','FontSize',12)
% ylabel('Force','FontSize',12)
% grid on
% 
% subplot(2,1,2)
% plot(tspan, xstate(:,1),'m','LineWidth',2) ;
% 
% xlabel('Time','FontSize',12)
% ylabel('Displacement','FontSize',12)
% grid on
