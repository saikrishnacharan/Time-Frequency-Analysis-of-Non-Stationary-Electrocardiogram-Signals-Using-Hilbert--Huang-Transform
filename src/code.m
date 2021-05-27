[filename, pathname] = uigetfile('*.dat', 'Open file .dat');
if isequal(filename, 0) || isequal(pathname, 0)   
    disp('File input canceled.');  
   ECG_Data = [];  
else
fid=fopen(strcat(pathname,filename),'r');
end;
time=10;  % duration of ecg signal
fs = 360; %sample frequency
f=fread(fid,2*fs*time,'ubit12');
len = length(f(1:2:length(f))); %length of the signal
time_step = 1/fs; 
max_time = len/fs; % duration of your signal in seconds depending on sampling rate
t = time_step:time_step:max_time;  % this is our time vector.
Orig_Sig=f(1:2:length(f)); %compute the clean ecg signal
figure();
plot(t,Orig_Sig)
[imf,residual,info] = emd(Orig_Sig/1000);
emd(Orig_Sig)
figure();
hht(imf,360);hold on;plot(t,Orig_Sig/25,'k');hold off
grid on;
box on;
figure();hold on;
stft(Orig_Sig,360)
plot(t,Orig_Sig-1000,'r');
hold off
grid on;
box on;
x=Orig_Sig;
figure()
cwt(x,fs);hold on;
plot(t,50*x,'k');hold off;
grid on;
box on;
figure()
wvd(x,fs,'SmoothedPseudo','MinThreshold',0);ylim([0,50]);hold on;
plot(t,10*x,'k');hold off;
grid on;
box on;

%%
%decreasing IMFs 
[imf,residual,info] = emd(Orig_Sig/1000,'MaxNumIMF',8,'Display',1);
emd(Orig_Sig,'MaxNumIMF',8)
figure();
hht(imf,360);hold on;plot(t,Orig_Sig/25,'k');hold off
grid on;
box on;
[imf,residual,info] = emd(Orig_Sig/1000,'MaxNumIMF',7,'Display',1);
emd(Orig_Sig,'MaxNumIMF',7)
figure();
hht(imf,360);hold on;plot(t,Orig_Sig/25,'k');hold off
grid on;
box on;
[imf,residual,info] = emd(Orig_Sig/1000,'MaxNumIMF',6,'Display',1);
emd(Orig_Sig,'MaxNumIMF',6)
figure();
hht(imf,360);hold on;plot(t,Orig_Sig/25,'k');hold off
grid on;
box on;
[imf,residual,info] = emd(Orig_Sig/1000,'MaxNumIMF',5,'Display',1);
emd(Orig_Sig,'MaxNumIMF',5)
figure();
hht(imf,360);hold on;plot(t,Orig_Sig/25,'k');hold off
grid on;
box on;
[imf,residual,info] = emd(Orig_Sig/1000,'MaxNumIMF',4,'Display',1);
emd(Orig_Sig,'MaxNumIMF',4)
figure();
hht(imf,360);hold on;plot(t,Orig_Sig/25,'k');hold off
grid on;
box on;
[imf,residual,info] = emd(Orig_Sig/1000,'MaxNumIMF',3,'Display',1);
emd(Orig_Sig,'MaxNumIMF',3)
figure();
hht(imf,360);hold on;plot(t,Orig_Sig/25,'k');hold off
grid on;
box on;
%%
% Changing Interpolation to Pchip
[imf,residual,info] = emd(Orig_Sig/1000,'Interpolation','pchip');
emd(Orig_Sig,'Interpolation','pchip')
figure();
hht(imf,360);hold on;plot(t,Orig_Sig/25,'k');hold off
grid on;
box on;
%%
%SiftTolerance
[imf,residual,info] = emd(Orig_Sig/1000,'SiftRelativeTolerance',0.1,'Display',1);
emd(Orig_Sig,'Interpolation','pchip','SiftRelativeTolerance',0.1)
figure();
hht(imf,360);hold on;plot(t,Orig_Sig/25,'k');hold off
grid on;
box on;
[imf,residual,info] = emd(Orig_Sig/1000,'SiftRelativeTolerance',0.01,'Display',1);
emd(Orig_Sig,'SiftRelativeTolerance',0.01)
figure();
hht(imf,360);hold on;plot(t,Orig_Sig/25,'k');hold off
grid on;
box on;
[imf,residual,info] = emd(Orig_Sig/1000,'SiftRelativeTolerance',0.001,'Display',1,'MaxNumIMF',100);
emd(Orig_Sig,'SiftRelativeTolerance',0.001)
figure();
hht(imf,360);hold on;plot(t,Orig_Sig/25,'k');hold off
grid on;
box on;
%%

