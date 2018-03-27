clear xe J 

zl = 0.15 + 1i*0.1; % Line impedence
yl = 1/zl; % Line admittance

G11 = real(yl); 
G12 = -real(yl); 
G21 = -real(yl); 
G22 = real(yl); 

B11 = imag(yl); 
B12 = -imag(yl); 
B21 = -imag(yl); 
B22 = imag(yl); 

x0 = [0 1]';
xe = x0;
iter = 1;

while (iter <10)
    
theta2 = xe(1); 
v2 = xe(2);


fp = G21*v2*cos(theta2) + B21*v2*sin(theta2) + G22*v2*v2 - Pnet2 ;
fq = G21*v2*sin(theta2) - B21*v2*cos(theta2) - B22*v2*v2 - Qnet2 ; 


fx = [fp fq]';
% if iter>1
%     fxe = fx - fxn;
% end
J11 = -G21*v2*sin(theta2)+ B21*v2*cos(theta2) ;
J12 = G21*cos(theta2) + B21*sin(theta2) + 2*G22*v2; 
J21 = G21*v2*cos(theta2) + B21*v2*sin(theta2); 
J22 = G21*sin(theta2) - B21*cos(theta2) - 2*B22*v2; 

J = [J11 J12
    J21 J22 ] ;


xe = xe - J\fx ; 


% if iter>1
% xr = xe - xn;  
% if max(abs(xr))< .000001
%     iter
%     break
% end
% end

if iter>1
fxr = fx - fxn;  
if max(abs(fxr))< .000001
   % iter
    break
end
end 


xn = xe;
fxn = fx;

iter = iter+1;

end

%xe
