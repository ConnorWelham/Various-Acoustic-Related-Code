uiimport;

pause(2)

Delaytime = 0.5;  

delayseconds = Delaytime*fs;  %turning the delay time into seconds relative to the file sampling rate.
 
delaydata = zeros(delayseconds,1); %adding data to pad out the signal(s) to make them the same vector 
   
sig2 = vertcat(delaydata,data);  %add delay to start of signal 
sig1 = vertcat(data,delaydata);  %add the zeroes to end of signal to make vectors same length
delaysig = sig1 + sig2;

delaysound = audioplayer(delaysig,fs);

t = 0:1/fs:((length(sig1)-1)/fs);

play(delaysound);

plot(t,sig1,'b');
hold on
plot(t,sig2,'r');
xlabel('Time(s)');
ylabel('Amplitude');
pleg = legend('original signal','delayed signal');
set(pleg,'Fontsize',14);
hold off


audiowrite('AudioDelay.wav',delaysig,fs);
