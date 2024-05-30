clear all ;
close all ;
clc 

m = 1 ;
k = 1 ;

 M = [2 0 ; 0 1]*m ;
 K = [3 -1 ; -1 1]*k ;
 [V D] = eig(K,M) ;
 
% x0 = [1 ; -1] ;
 x0 = V(:,1)*2 ;
 v0 = [0 ; 0] ;
 
 
 q0 = inv(V)*x0 ;
 qdot0 =  inv(V)*v0 ;
 
q1state_init(1) = q0(1) ;
q1state_init(2) = qdot0(1) ;

q2state_init(1) = q0(2) ;
q2state_init(2) = qdot0(2) ;


 
 
 tspan = 0:0.01:20 ;
 t = tspan ;
 
 [t , q1state] = ode45('statederivative1',tspan, q1state_init) ;
 [t , q2state] = ode45('statederivative2',tspan, q2state_init) ;
 
 u2 = V(1,1)*q1state(:,1) + V(1,2)*q2state(:,1) ;
 u1 = V(2,1)*q1state(:,1) + V(2,2)*q2state(:,1) ;
 
 [m,~] = size(t) ;
 w = 1 ;
h = 1 ;
xc = 0 ;

xl = xc - w*0.5 ;


tic   
for i = 1:1:m
    
    disp(i)
    yc1 = u1(i,1) ;
    yb1 = yc1 - h*0.5 ;
    yc2 = u2(i,1) ;
    yb2 = yc2 - h*0.5 ;
    
    clf
    
%     subplot(3,1,1)
    rectangle('Position',[xl,yb1,w,h]) ;
    rectangle('Position',[xl,yb2+3,w,h]) ;
    
    axis equal
    xlim([-5,5]) ;
    ylim([-5 ,5]) ;
    
    
%     subplot(3,1,2)
%      plot(t,u1(:,1));
%      hold on
%      scatter(t(i),u1(i,1),'m','o','fill')
%      
%     subplot(3,1,3)
% %      plot(t,xstate(:,));
%        plot(t,u2(:,1)) ;
%      hold on
%      scatter(t(i),u2(i,1),'m','o','fill')
    
     
pause(0.001)
    
    
end

   toc 