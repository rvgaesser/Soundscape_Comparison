
clear

load d1_mspec.mat
load d2_mspec.mat
load d3_mspec.mat
load d4_mspec.mat
load d5_mspec.mat

band = find(f>=100 & f<=2000);

T1 = mean(mspec_210RK_night1(band,:),2);
T2 = mean(mspec_210RK_night2(band,:),2);
T3 = mean(mspec_210RK_night3(band,:),2);
T4 = mean(mspec_210RK_night4(band,:),2);
T5 = mean(mspec_210RK_night5(band,:),2);
W1 = mean(mspec_WESTR_night1(band,:),2);
W2 = mean(mspec_WESTR_night2(band,:),2);
W3 = mean(mspec_WESTR_night3(band,:),2);
W4 = mean(mspec_WESTR_night4(band,:),2);
W5 = mean(mspec_WESTR_night5(band,:),2);
C1 = mean(mspec_CSPAR_night1(band,:),2);
C2 = mean(mspec_CSPAR_night2(band,:),2);
C3 = mean(mspec_CSPAR_night3(band,:),2);
C4 = mean(mspec_CSPAR_night4(band,:),2);
C5 = mean(mspec_CSPAR_night5(band,:),2);
A3 = mean(mspec_AEOLU_night3(band,:),2);
A4 = mean(mspec_AEOLU_night4(band,:),2);
A5 = mean(mspec_AEOLU_night5(band,:),2);


% Plotting 

% D1
figure; %subplot(2,3,1);
plot(f(band),10*log10(T1));hold on;
plot(f(band),10*log10(W1));hold on; 
plot(f(band),10*log10(C1));
legend('210RK', 'WESTR', 'CSPAR', 'location','northeast'); title('Deployment 1 - 11/15');
ylabel('SPL db re 1uPa'); xlabel('Frequency Hz');hold off;

% D2
figure;
%subplot(2,3,2);
plot(f(band),10*log10(T2));hold on;
plot(f(band),10*log10(W2));hold on;
plot(f(band),10*log10(C2));
legend('210RK', 'WESTR', 'CSPAR', 'location','northeast'); title('Deployment 2 - 01/16');
ylabel('SPL db re 1uPa'); xlabel('Frequency Hz');hold off;

%D3
figure;
%subplot(2,3,3);
plot(f(band),10*log10(T3));hold on;
plot(f(band),10*log10(W3));hold on;
plot(f(band),10*log10(C3));hold on;
plot(f(band),10*log10(A3));
legend('210RK', 'WESTR', 'CSPAR', 'AEOLU', 'location','northeast'); title('Deployment 3 - 04/16');
ylabel('SPL db re 1uPa'); xlabel('Frequency Hz');hold off;

%D4
figure;
%subplot(2,3,4);
plot(f(band),10*log10(T4));hold on;
plot(f(band),10*log10(W4));hold on;
plot(f(band),10*log10(C4));hold on;
plot(f(band),10*log10(A4));
legend('210RK', 'WESTR', 'CSPAR', 'AEOLU', 'location','northeast'); title('Deployment 4 - 06/16');
ylabel('SPL db re 1uPa'); xlabel('Frequency Hz');hold off;

%D5
figure;
%subplot(2,3,5);
plot(f(band),10*log10(T5));hold on;
plot(f(band),10*log10(W5));hold on;
plot(f(band),10*log10(C5));hold on;
plot(f(band),10*log10(A5));
legend('210RK', 'WESTR', 'CSPAR', 'AEOLU', 'location','northeast'); title('Deployment 5 - 08/16');
ylabel('SPL db re 1uPa'); xlabel('Frequency Hz');hold off;


