function [ gamma ] = bessel_root( a,c ,x0, epsilon)
    beta = a*(1-1/c);
    f = @(x) besselk(2,beta)/(beta*besselk(1,beta)).+besselj(2,x)./(x.*besselj(1,x));
	X = linspace(x0-epsilon,x0+epsilon,1000);      
	plot(X, f(X),'r', X , 0.*X, 'k', 0.*X, linspace(-3,5,1000),'k');
	axis ([x0-epsilon, x0+epsilon, -1, 3]);
	print ("gamma.pdf","dpdflatexstandalone");
    gamma = fzero(f,x0);
end
