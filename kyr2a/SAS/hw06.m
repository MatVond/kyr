t=0:0.001:4; % vektor časů
T=1; % Perioda
w0=2*pi/T; % Fundamentální frekvence
xs=0; ys=0;
for k=-5000:5000
 w=w0*k;
 C= 2 * T * exp(-j*w0*T/2) * sin(w0*k*T/4)/(w0*k) % Koeficienty Fourierovy řady
 if k==0, C=0.5; end % Koeficient Fourierovy řady pro k=0
 xs=xs+C*exp(j*w0*k*t); % suma
 %H= 1/(1+ j*w/10) % frekvenční charakteristika
 H= j*w/10/(1+ j*w/10)
 ys=ys+H*C*exp(j*w0*k*t);% suma
end
xs=real(xs); % zahodí zvyškovou imaginární část vytvořenou numerickými chybami
ys=real(ys); % zahodí zvyškovou imaginární část vytvořenou numerickými chybami
% Vykreslit výsledky
figure(1)
plot(t,xs,t,ys)
legend('x(t)','y(t)')