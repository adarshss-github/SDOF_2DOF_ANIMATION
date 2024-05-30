function xstate_dot = statederivative1(  t , xstate)

% m = 1 ;
% zeta = 0 ;
k = 0.5 ;
% wn = sqrt(k/m) ;
% c = 2*m*wn*zeta ;

xstate_dot = [xstate(2) ;  -k*xstate(1)  ] ;
 
end