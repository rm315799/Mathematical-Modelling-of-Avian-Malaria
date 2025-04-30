t=linspace(0,365,1e3);
T=2*sin(2*t.*pi/365 - 2.5)+16.225;
mu_v= 1./(159.68-(T.*4.57));
plot(t,mu_v, linewidth=3.0, color='#80B3FF')
xlabel('t (days)')
ylabel('\mu_v')