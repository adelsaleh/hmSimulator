clear MaxDiff4
h1HF = fspecial('average',30);
% N=128;
Phi0=zeros(N,N);
a = 6; c=0.1; Beta=a.*sqrt(1+1./c);


%gamma = 5.1024; %%a=4; c=1e-3;N=256
% gamma = 5.133; %%a = 6; c=1e-4; N=256
% LengthXY=10;
% h = 2*LengthXY/(N-1); 
% x = -LengthXY:h:LengthXY; y = -LengthXY:h:LengthXY; 
% [X,Y] = meshgrid(y,x); % Generate the mesh

t=time;

gh=1; 
for gamma = 5.1329
r = sqrt(X.^2 + (Y-c.*t).^2); 
CosTheta = X./r;

K1 = besselk(1,Beta);
J1 = besselj(1,gamma);

K11 = besselk(1,Beta.*r./a);
J11 = besselj(1,gamma.*r./a);


    Phi0(r<=a) = ( (1+Beta.^2./gamma.^2).*(r(r<=a)./a) - Beta.^2.*J11(r<=a)./(gamma.^2.*J1) ).*a.*c.*CosTheta(r<=a);    
    Phi0(r>a) = (K11(r>a)./K1).*a.*c.*CosTheta(r>a);
    
    Nextra=40; II=ones(N+Nextra,N+Nextra).*Phi0(1,1); II(Nextra/2+1:N+Nextra/2,Nextra/2+1:Nextra/2+N)=Phi0;
    FI=filter2(h1HF,II); II=FI(Nextra/2+1:N+Nextra/2,Nextra/2+1:N+Nextra/2); Phi0=II; 

%     MaxDiff4(gh)=max(max(diff(Phi0,4))); 
    gh=gh+1; 
end
  
  %  figure(3); contour(X,Y,Phi0,16);  drawnow; %shading interp; axis tight; pause(0.2);



