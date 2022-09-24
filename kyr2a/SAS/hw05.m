[x, Fs]=audioread('p16.wav');
N = length(x);
X = fft(x, N);

load coef1
x = zeros(N, 1);
x(1) = 1;

h1 = filter(b, a, x);
H1 = fft(h1, N);

load coef2

h2 = filter(b, a, x);
H2 = fft(h2, N);

figure(1);
subplot(211)
plot(abs(H1))
subplot(212)
plot(abs(H2))

length(X)
length(H1)
length(H2)
Y1 = X.*H1;
Y2 = X.*H2;
y1 = ifft(Y1, N);
y2 = ifft(Y2, N);
sound(y2, Fs);