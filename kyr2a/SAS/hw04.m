[x, Fs]=audioread('p16.wav');
N = length(x);
k=0:N-1;
f = k*(Fs/N);
figure(1);
subplot(341);
plot(f, x);


xrev = -x;
sound(x, Fs)

X = fft(x, N);


subplot(345);
plot(f, abs(X))

f1 = 200;
k1 = round(N*f1/Fs);
H1 = zeros(N, 1);
H1(1:k1+1) = 1;
H1(N-k1+1:N) = 1;
subplot(349);
plot(f, abs(H1))

Y1 = X .* H1;
subplot(346);
plot(f, abs(Y1))

y1 = ifft(Y1, N);
subplot(342);
plot(f, y1)

%sound(y1, Fs);

f2l = 300;
f2h = 2000;
k2l = round(N*f2l/Fs);
k2h = round(N*f2h/Fs);
H2 = zeros(N, 1);
H2(k2l+1:k2h+1) = 1;
H2(N-k2h+1:N-k2l+1) = 1;
subplot(3,4,10);
plot(f, abs(H2))

Y2 = X .* H2;
subplot(347);
plot(f, abs(Y2))

y2 = ifft(Y2, N);
subplot(343);
plot(f, y2)

%sound(y2, Fs);

f3 = 2000;
k3 = round(N*f3/Fs);
H3 = zeros(N, 1);
H3(k3+1:N-k3+1) = 1;
subplot(3,4,11);
plot(f, abs(H3));

Y3 = X .* H3;
subplot(348);
plot(f, abs(Y3))

y3 = ifft(Y3, N);
subplot(344);
plot(f, y3)

%sound(y3, Fs);

figure(2)
subplot(121)
plot(x)
subplot(122)
plot(xrev)
