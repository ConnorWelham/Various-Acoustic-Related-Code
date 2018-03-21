%% Plot Data from 0000 to 2400

n = size(Leq1);

n = n(1);

n2= n/2;
n24 = n/24;

time = linspace(12,24,n2);
time2 = linspace(00,12,n2);
timeday = horzcat(time,time2);


y = Leq1.VarName1;



[timeday, x] = sort(timeday);
y2 = y(x);



subplot(2,1,1);
plot(timeday,y2,'r');
title('L_{eq} over a 24 hour period in Manchester');
%plot(timeday,y,'r');
%xticks([0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24])
%xticklabels({'12','13','14','15','16','17','18','19','20','21','22','23','24','1','2','3','4','5','6','7','8','9','10','11','12'});
ylabel('Level (dB)');
xlabel('Time(Hours)');
xlim([00,24]);
%% 

% b

hrdata = reshape(y2,[],24);

y3 = mean(hrdata);


subplot(2,1,2);
plot(y3,'k--');
title('Average L_{eq} per hour over a 24 hour period in Manchester');
ylabel('Level (dB)');
xlabel('Time(Hours)');
xlim([1,24]);


%% %


Lnight1data = hrdata(1:706,1:6);
Lnight2data = hrdata(1:706,23:24);
Lnightdata = horzcat(Lnight2data,Lnight1data);

Ldaydata = hrdata(1:706,7:18);
Levndata = hrdata(1:706,19:22);


Lnightmean = mean(Lnightdata);

Ldaymean = mean(Ldaydata);

Levnmean = mean(Levndata);



Lday = 10*log10(sum(10.^(Ldaymean/10))/size(Ldaymean,2));

Lday


Levn = 10*log10(sum(10.^(Levnmean/10))/size(Levnmean,2));

Levn


Lnight = 10*log10(sum(10.^(Lnightmean/10))/size(Lnightmean,2));


Lnight 

%%


Lden = ((12*10.^( Lday/10 )) + (4*10.^( (Levn+5)/10 )) + (8*10.^( (Lnight+10)/10 ))  );

Lden = 10*log10( Lden /24);

Lden