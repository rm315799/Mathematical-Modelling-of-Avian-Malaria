%'amakihi
t=linspace(0,750,1e4);

T=2*sin(2*t.*pi/365 - 2.5)+16.225;
b=0.856*(T.^(1.11))/241;
eta_v=T.*0.0116- 0.1504;
mu_v= 1./(159.68-(T.*4.57));
beta_v= 0.95;
beta_h= 0.98;
eta_h= 1/4;
lambda_h= 3935/2555;
mu_h= 1/2555;
theta_h= 1/8;
gamma_h= ((1-0.60)/16) - mu_h;
alpha_h= 0.60/16;
sigma= 0.025;
rho_L= (T-10)/179;
mu_L= rho_L*(1-0.88)./0.88;
K= 59.5;
f=100;
N = 3935;

plot(t,ComputeR0(b, beta_h, eta_v, mu_v, beta_v, eta_h,mu_h,theta_h, gamma_h, alpha_h, sigma, rho_L, mu_L, K, f,N),'LineWidth',3.0, color='#80B3FF')
xlabel('t (days)')
ylabel('R_0')
h=yline(1,'-','LineWidth',3.0)
%Function to compute the code
function R0 = ComputeR0(b,beta_h,eta_v,mu_v,beta_v,eta_h,mu_h,theta_h,gamma_h,alpha_h,sigma,rho_L,mu_L,K,f,N)

    R_h = b.*beta_h.*eta_v./(mu_v.*(eta_v + mu_v));
    L_1 = (rho_L + mu_L)./rho_L;
    L_2 = K*(1-(mu_v./(b.*f)).*L_1);
    N_v = rho_L.*L_2./mu_v;
    R_v1 = b.* beta_v .* (N_v./N) .* eta_h./(eta_h + mu_h);
    R_v2a = 1 + sigma* gamma_h./mu_h;
    Gamma = gamma_h + mu_h + alpha_h;
    Theta = theta_h ./ (theta_h + mu_h);
    R_v2 = 1./(theta_h + mu_h) + Theta .* R_v2a ./ Gamma;
    R_v = R_v1 .* R_v2;
    R0 = (R_h.* R_v).^(1/2);

end