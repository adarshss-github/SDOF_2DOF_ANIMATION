function xstate_dot = statederivative(  t , xstate)

m = 1 ;
zeta = 0.1 ;
k = 100 ;
wn = sqrt(k/m) ;
c = 2*m*wn*zeta ;

xstate_dot = [xstate(2) ;  ( ((10*sin(100*t))/m) - (c/m)*xstate(2) -(k/m)*xstate(1) ) ] ;
 
end
% ((10*sin(30*t))/m)