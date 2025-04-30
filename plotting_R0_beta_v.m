beta_v=linspace(0,1,1e3);

T=22.8;
eta_v=0.0116*T - 0.1504;
mu_v= 1/(159.68-(4.57*T));
beta_h= 0.98;
b=0.0264;
eta_h= 1/4;
lambda_h= 4750/4380;
mu_h= 1/4380;
theta_h= 1/4;
gamma_h= ((1-0.93)/29) - mu_h;
alpha_h= 0.93/29;
sigma= 0.999;
rho_L= (T-10)/179;
mu_L= rho_L*(1-0.88)/0.88;
K= 347;
f=100;
N = 4750;

plot(beta_v,ComputeR0(b, beta_h, eta_v, mu_v, beta_v, eta_h,mu_h,theta_h, gamma_h, alpha_h, sigma, rho_L, mu_L, K, f,N),'LineWidth',2.0)
xlabel('\beta_v','Fontsize',20)
ylabel('R_0','Fontsize',20)
h=yline(1,'-','LineWidth',2.0)
colororder(['#c8e494'; '#6c911c'])

%Function to compute the code
function R0 = ComputeR0(b,beta_h,eta_v,mu_v,beta_v,eta_h,mu_h,theta_h,gamma_h,alpha_h,sigma,rho_L,mu_L,K,f,N)

    R_h = b.*beta_h.*eta_v./(mu_v*(eta_v + mu_v));
    L_1 = (rho_L + mu_L)/rho_L;
    L_2 = K*(1- (mu_v./(b.*f)) *L_1);
    N_v = rho_L * L_2/mu_v;
    R_v1 = b.* beta_v .* (N_v/N) .* eta_h./(eta_h + mu_h);
    R_v2a = 1 + sigma* gamma_h/mu_h;
    Gamma = gamma_h + mu_h + alpha_h;
    Theta = theta_h / (theta_h + mu_h);
    R_v2 = 1/(theta_h + mu_h) + Theta * R_v2a / Gamma;
    R_v = R_v1 * R_v2;
    R0 = (R_h.* R_v).^(1/2);

end