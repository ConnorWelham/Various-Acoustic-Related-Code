%function [g] = square_wave(n)

%syms t k; %// Define t and k 
%f = sin((2*k-1)*t)/(2*k-1); %// Define function
%F = symsum(f, k, 1, n); %// Define Fourier Series
%tVector = linspace(0, 4*pi, 1001); %// Define time points
%g = double(subs(F, t, tVector)); %// Get numeric output

%end

%g = square_wave(20);
%t = linspace(0, 4*pi, 1001);
%plot(t, g);


%syms k t;

%f = 1000;

%ak = 4/(k*pi);
%omegak = k * (2*pi*f);

%phiI = 0;
%aO = 0;
%Func = symsum(ak * sin(omegak*t+phiI)*(2*k-1),k,1,25);

%S1 = aO + Func;




syms k t integer;

aO = 0;

f = 1000;

oversamplingrate = 100; 
Fs = oversamplingrate * f;


Ts = 1/Fs;


%t = 0:Ts:50;

ai = 4/(k*pi);
bi = 0;
%omega1 = 2*pi*f;
omegai = k*2*pi*f;


R = [-pi pi];

phiI = rand(25,1)*range(R)+min(R);


S1 = symsum(sin((2*k-1)*t)/(2*k-1),k,1,25);

tvec = linspace(0,4*pi,1001);

%S2 = symsum(ai*sin((omegai*t+phiI( randperm(25,1)))*((2*k)-1))  ,k,1,5);

%S1 = symsum( sin((2*k-1)*t)/(2*k-1)  ,k,1,25);
%FFT2 = S2;

%FFT =  S1;

y = double(subs(S1,t,tvec)); 
Y = fft(y);

%y2 = double(S2); 
%Y2 = fft(y2);


subplot(4,1,1);
plot( abs(Y)  );

subplot(4,1,2);
plot(tvec,y);

%subplot(4,1,3);
%plot( abs(Y2));

%subplot (4,1,4);
%plot( t, y2);

sound(y,Fs);
pause(5);
%sound(y2,Fs);