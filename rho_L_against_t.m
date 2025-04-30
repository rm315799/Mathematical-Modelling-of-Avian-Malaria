t=linspace(0,365,1e3);
T=2*sin(2*t.*pi/365 - 2.5)+16.225;
rho_L= (T-10)/179;
plot(t,rho_L, linewidth=3.0, color='#80B3FF')
xlabel('t (days)')
ylabel('\rho_L')