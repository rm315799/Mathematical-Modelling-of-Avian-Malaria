t=linspace(0,365,1e3);
T=2*sin(2*t.*pi/365 - 2.5)+16.225;
eta_v=T.*0.0116- 0.1504;
plot(t,eta_v, linewidth=3.0, color='#80B3FF')
xlabel('t (days)')
ylabel('\eta_v')