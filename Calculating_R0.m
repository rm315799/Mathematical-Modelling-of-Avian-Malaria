mu_h=0.0002
N=4750
eta_h=1/4
theta_h=1/4
Gamma=1/29
v=0.93
T=22.8
beta_h=0.98
beta_v=0.95
f=100
delta_L=0.88
lambda_h = mu_h * N
alpha_h = v*Gamma
gamma_h = (1-v)*Gamma - mu_h
rho_L = (T-10)/179
mu_L = rho_L *(1-delta_L)/delta_L
b = 0.198*((T)^(1.11))/241
mu_v = 1/(159.68-(4.57*T))
eta_v = -0.1504+0.0116*T
K=347
sigma = 0.999

R_h = b * beta_h * eta_v/(mu_v*(eta_v + mu_v))
L_ = K*(1-(mu_v/(b*f))*((rho_L + mu_L)/rho_L))
N_v = rho_L * L_ /mu_v

R_v = b * beta_v * (N_v/N) * (eta_h/(eta_h + mu_h)) * ( (1/(theta_h + mu_h)) + (theta_h/(Gamma*(theta_h + mu_h)))*(1+ sigma*gamma_h/mu_h))
R_0 = (R_v * R_h)^(1/2)

R_v_1 = b * (N_v/N_h) * (eta_h/(eta_h + mu_h)) * ( (1/(theta_h + mu_h)) + (theta_h/(Gamma*(theta_h + mu_h)))*(1+ sigma*gamma_h/mu_h))

beta_v_1 = 1/(R_h * R_v_1)