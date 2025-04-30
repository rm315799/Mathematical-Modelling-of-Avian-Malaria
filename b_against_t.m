t=linspace(0,365,1e3);
T=2*sin(2*t.*pi/365 - 2.5)+16.225;
b=T.^(1.11)/241;
plot(t,b, linewidth=3.0, color='#80B3FF')
xlabel('t (days)')
ylabel('b')