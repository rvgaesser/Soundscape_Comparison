% Script to get power spectra separated by dayparts to evaluate whether
% increased SPL at dusk and night is also an increase in the number of
% callers

clear
close all

load('avg_suncycle.mat');
day_d1 = d1_dawn:0.25:d1_sSET-0.25;
day_d2 = d2_dawn:0.25:d2_sSET-0.25;
day_d3 = d3_dawn:0.25:d3_sSET-0.25;
day_d4 = d4_dawn:0.25:d4_sSET-0.25;
day_d5 = d5_dawn:0.25:d5_sSET-0.25;

% load night spectra from ordination scripts
load('d1_mspec.mat');
load('d2_mspec.mat');
load('d3_mspec.mat');
load('d4_mspec.mat');
load('d5_mspec.mat');


%% Identify avg spectra for other Dayparts - organized by deployment

% D1
load('C:/Users/Becca/Desktop/MATLAB/result_matfiles/results_ST01_One_210RK.mat'); %(13:780) 
matdays = matdays(13:780);
poavg = poavg(:,13:780);
t=matdays-(4/24); 
[~,~,~,hr,mn,~]=datevec(t); 
hrmn=hr+mn/60; 
b = NaN(16385,8,49);
for i = 1:length(day_d1) 
    a = find(hrmn == day_d1(i));
    b(:,:,i) = poavg(:,a); 
end
d1_210 = squeeze(mean(b,2)); %avg po each file time over deployment
N = 4; szA = size(d1_210);
B = arrayfun(@(k) mean(d1_210(:,k:min(szA(2),k+N-1)),2), 1:N:szA(2), 'un', 0); % calc mean each hour or 4 files
mspec_210RK_day1 = [B{:}]; %avg spectra each hr

load('C:/Users/Becca/Desktop/MATLAB/result_matfiles/results_ST02_ONE_WESTR.mat'); %(13:780)
matdays = matdays(13:780); 
poavg = poavg(:,13:780);
t=matdays-(4/24); 
[~,~,~,hr,mn,~]=datevec(t); 
hrmn=hr+mn/60; 
b = NaN(16385,8,49);
for i = 1:length(day_d1) 
    a = find(hrmn == day_d1(i)); 
    b(:,:,i) = poavg(:,a);  
end
d1_west = squeeze(mean(b,2)); 
N = 4; szA = size(d1_west);
B = arrayfun(@(k) mean(d1_west(:,k:min(szA(2),k+N-1)),2), 1:N:szA(2), 'un', 0); 
mspec_WESTR_day1 = [B{:}];

load('C:/Users/Becca/Desktop/MATLAB/result_matfiles/results_ST03_ONE_CSPAR.mat'); %(1:768)
matdays = matdays(1:768); 
poavg = poavg(:,1:768);
t=matdays-(4/24); 
[~,~,~,hr,mn,~]=datevec(t); 
hrmn=hr+mn/60;
b = NaN(16385,8,49);
for i = 1:length(day_d1) 
    a = find(hrmn == day_d1(i)); 
    b(:,:,i) = poavg(:,a);  
end
d1_spar = squeeze(mean(b,2)); 
N = 4; szA = size(d1_spar);
B = arrayfun(@(k) mean(d1_spar(:,k:min(szA(2),k+N-1)),2), 1:N:szA(2), 'un', 0); 
mspec_CSPAR_day1 = [B{:}];

% D2
% subsetted 210 Rock so that only days without any skipped files are
% included - total 6 days included
load('C:/Users/Becca/Desktop/MATLAB/result_matfiles/results_ST01_TWO_210.mat'); %(13:863)
matdays1 = cat(1,matdays(29:124),matdays(304:783));
poavg1 = cat(2,poavg(:,29:124),poavg(:,304:783));
t=matdays1-(4/24); 
[~,~,~,hr,mn,~]=datevec(t); 
hrmn=hr+mn/60; 
b = NaN(16385,6,47);
for i = 1:length(day_d2) 
    a = find(hrmn == day_d2(i)); 
    b(:,:,i) = poavg1(:,a); 
end
d2_210 = squeeze(mean(b,2)); %avg po each file time over deployment
N = 4; szA = size(d2_210);
B = arrayfun(@(k) mean(d2_210(:,k:min(szA(2),k+N-1)),2), 1:N:szA(2), 'un', 0); % calc mean each hour or 4 files
mspec_210RK_day2 = [B{:}]; %avg spectra each hr

load('C:/Users/Becca/Desktop/MATLAB/result_matfiles/results_ST02_TWO_WESTR.mat'); %(13:876)
matdays = matdays(13:876); 
poavg = poavg(:,13:876);
t=matdays-(4/24); 
[~,~,~,hr,mn,~]=datevec(t); 
hrmn=hr+mn/60; 
b = NaN(16385,9,47);
for i = 1:length(day_d2) 
    a = find(hrmn == day_d2(i)); 
    b(:,:,i) = poavg(:,a);  
end
d2_west = squeeze(mean(b,2)); 
N = 4; szA = size(d2_west);
B = arrayfun(@(k) mean(d2_west(:,k:min(szA(2),k+N-1)),2), 1:N:szA(2), 'un', 0); 
mspec_WESTR_day2 = [B{:}];

load('C:/Users/Becca/Desktop/MATLAB/result_matfiles/results_ST03_TWO_CSPAR.mat'); %(13:876)
matdays = matdays(13:876); 
poavg = poavg(:,13:876);
t=matdays-(4/24); 
[~,~,~,hr,mn,~]=datevec(t); 
hrmn=hr+mn/60;
b = NaN(16385,9,47);
for i = 1:length(day_d2) 
    a = find(hrmn == day_d2(i)); 
    b(:,:,i) = poavg(:,a);  
end
d2_spar = squeeze(mean(b,2)); 
N = 4; szA = size(d2_spar);
B = arrayfun(@(k) mean(d2_spar(:,k:min(szA(2),k+N-1)),2), 1:N:szA(2), 'un', 0); 
mspec_CSPAR_day2 = [B{:}];

% D3
load('C:/Users/Becca/Desktop/MATLAB/result_matfiles/results_ST01_THREE_210.mat');
matdays = matdays(37:804);
poavg = poavg(:,37:804);
t=matdays-(4/24); 
[~,~,~,hr,mn,~]=datevec(t); 
hrmn=hr+mn/60; 
b = NaN(16385,8,59);
for i = 1:length(day_d3) 
    a = find(hrmn == day_d3(i)); 
    b(:,:,i) = poavg(:,a); 
end
d3_210 = squeeze(mean(b,2)); %avg po each file time over deployment
N = 4; szA = size(d3_210);
B = arrayfun(@(k) mean(d3_210(:,k:min(szA(2),k+N-1)),2), 1:N:szA(2), 'un', 0); % calc mean each hour or 4 files
mspec_210RK_day3 = [B{:}]; %avg spectra each hr
% 1st col is 1hr pre-sSET, last col is 1hr post-sRISE

load('C:/Users/Becca/Desktop/MATLAB/result_matfiles/results_ST02_THREE_WESTR.mat');
matdays = matdays(25:792); 
poavg = poavg(:,25:792);
t=matdays-(4/24); 
[~,~,~,hr,mn,~]=datevec(t); 
hrmn=hr+mn/60; 
b = NaN(16385,8,59);
for i = 1:length(day_d3) 
    a = find(hrmn == day_d3(i)); 
    b(:,:,i) = poavg(:,a);  
end
d3_west = squeeze(mean(b,2)); 
N = 4; szA = size(d3_west);
B = arrayfun(@(k) mean(d3_west(:,k:min(szA(2),k+N-1)),2), 1:N:szA(2), 'un', 0); 
mspec_WESTR_day3 = [B{:}];

load('C:/Users/Becca/Desktop/MATLAB/result_matfiles/results_ST03_THREE_CSPAR.mat');
matdays = matdays(25:792); 
poavg = poavg(:,25:792);
t=matdays-(4/24); 
[~,~,~,hr,mn,~]=datevec(t); 
hrmn=hr+mn/60;
b = NaN(16385,8,59);
for i = 1:length(day_d3) 
    a = find(hrmn == day_d3(i)); 
    b(:,:,i) = poavg(:,a);  
end
d3_spar = squeeze(mean(b,2)); 
N = 4; szA = size(d3_spar);
B = arrayfun(@(k) mean(d3_spar(:,k:min(szA(2),k+N-1)),2), 1:N:szA(2), 'un', 0); 
mspec_CSPAR_day3 = [B{:}];

load('C:/Users/Becca/Desktop/MATLAB/result_matfiles/results_ST04_THREE_AEOLU.mat');
matdays = matdays(25:792); 
poavg = poavg(:,25:792);
t=matdays-(4/24); 
[~,~,~,hr,mn,~]=datevec(t); 
hrmn=hr+mn/60; 
b = NaN(16385,8,59);
for i = 1:length(day_d3) 
    a = find(hrmn == day_d3(i)); 
    b(:,:,i) = poavg(:,a); 
end
d3_aeolus = squeeze(mean(b,2)); 
N = 4; szA = size(d3_aeolus);
B = arrayfun(@(k) mean(d3_aeolus(:,k:min(szA(2),k+N-1)),2), 1:N:szA(2), 'un', 0); 
mspec_AEOLU_day3 = [B{:}];

% D4
load('C:/Users/Becca/Desktop/MATLAB/result_matfiles/results_ST01_FOUR_210.mat'); % (1:672)
matdays = matdays(1:672);
poavg = poavg(:,1:672);
t=matdays-(4/24); 
[~,~,~,hr,mn,~]=datevec(t); 
hrmn=hr+mn/60; 
b = NaN(16385,7,64);
for i = 1:length(day_d4) 
    a = find(hrmn == day_d4(i)); 
    b(:,:,i) = poavg(:,a); 
end
d4_210 = squeeze(mean(b,2)); %avg po each file time over deployment
N = 4; szA = size(d4_210);
B = arrayfun(@(k) mean(d4_210(:,k:min(szA(2),k+N-1)),2), 1:N:szA(2), 'un', 0); % calc mean each hour or 4 files
mspec_210RK_day4 = [B{:}]; %avg spectra each hr
% 1st col is 1hr pre-sSET, last col is 1hr post-sRISE

load('C:/Users/Becca/Desktop/MATLAB/result_matfiles/results_ST02_FOUR_WESTR.mat'); %(1:672)
matdays = matdays(1:672); 
poavg = poavg(:,1:672);
t=matdays-(4/24); 
[~,~,~,hr,mn,~]=datevec(t); 
hrmn=hr+mn/60; 
b = NaN(16385,7,64);
for i = 1:length(day_d4) 
    a = find(hrmn == day_d4(i)); 
    b(:,:,i) = poavg(:,a);  
end
d4_west = squeeze(mean(b,2)); 
N = 4; szA = size(d4_west);
B = arrayfun(@(k) mean(d4_west(:,k:min(szA(2),k+N-1)),2), 1:N:szA(2), 'un', 0); 
mspec_WESTR_day4 = [B{:}];

load('C:/Users/Becca/Desktop/MATLAB/result_matfiles/results_ST03_FOUR_CSPAR.mat');%(1:672)
matdays = matdays(1:672); 
poavg = poavg(:,1:672);
t=matdays-(4/24); 
[~,~,~,hr,mn,~]=datevec(t); 
hrmn=hr+mn/60;
b = NaN(16385,7,64);
for i = 1:length(day_d4) 
    a = find(hrmn == day_d4(i)); 
    b(:,:,i) = poavg(:,a);  
end
d4_spar = squeeze(mean(b,2)); 
N = 4; szA = size(d4_spar);
B = arrayfun(@(k) mean(d4_spar(:,k:min(szA(2),k+N-1)),2), 1:N:szA(2), 'un', 0); 
mspec_CSPAR_day4 = [B{:}];

load('C:/Users/Becca/Desktop/MATLAB/result_matfiles/results_ST04_FOUR_AEOLU.mat'); %(5:676)
matdays = matdays(5:676); 
poavg = poavg(:,5:676);
t=matdays-(4/24); 
[~,~,~,hr,mn,~]=datevec(t); 
hrmn=hr+mn/60; 
b = NaN(16385,7,64);
for i = 1:length(day_d4) 
    a = find(hrmn == day_d4(i)); 
    b(:,:,i) = poavg(:,a); 
end
d4_aeolus = squeeze(mean(b,2)); 
N = 4; szA = size(d4_aeolus);
B = arrayfun(@(k) mean(d4_aeolus(:,k:min(szA(2),k+N-1)),2), 1:N:szA(2), 'un', 0); 
mspec_AEOLU_day4 = [B{:}];

%D5
load('C:/Users/Becca/Desktop/MATLAB/result_matfiles/results_ST04_FIVE_210.mat');
matdays = matdays(5:676);
poavg = poavg(:,5:676);
t=matdays-(4/24); 
[~,~,~,hr,mn,~]=datevec(t); 
hrmn=hr+mn/60; 
b = NaN(16385,7,59);
for i = 1:length(day_d5) 
    a = find(hrmn == day_d5(i)); 
    b(:,:,i) = poavg(:,a); 
end
d5_210 = squeeze(mean(b,2)); %avg po each file time over deployment
N = 4; szA = size(d5_210);
B = arrayfun(@(k) mean(d5_210(:,k:min(szA(2),k+N-1)),2), 1:N:szA(2), 'un', 0); % calc mean each hour or 4 files
mspec_210RK_day5 = [B{:}]; %avg spectra each hr
% 1st col is 1hr pre-sSET, last col is 1hr post-sRISE

load('C:/Users/Becca/Desktop/MATLAB/result_matfiles/results_ST01_FIVE_WESTR.mat'); %(5:676)
matdays = matdays(5:676); 
poavg = poavg(:,5:676);
t=matdays-(4/24); 
[~,~,~,hr,mn,~]=datevec(t); 
hrmn=hr+mn/60; 
b = NaN(16385,7,59);
for i = 1:length(day_d5) 
    a = find(hrmn == day_d5(i)); 
    b(:,:,i) = poavg(:,a);  
end
d5_west = squeeze(mean(b,2)); 
N = 4; szA = size(d5_west);
B = arrayfun(@(k) mean(d5_west(:,k:min(szA(2),k+N-1)),2), 1:N:szA(2), 'un', 0); 
mspec_WESTR_day5 = [B{:}];

load('C:/Users/Becca/Desktop/MATLAB/result_matfiles/results_ST03_FIVE_CSPAR.mat'); %(5:676)
matdays = matdays(5:676); 
poavg = poavg(:,5:676);
t=matdays-(4/24); 
[~,~,~,hr,mn,~]=datevec(t); 
hrmn=hr+mn/60;
b = NaN(16385,7,59);
for i = 1:length(day_d5) 
    a = find(hrmn == day_d5(i)); 
    b(:,:,i) = poavg(:,a);  
end
d5_spar = squeeze(mean(b,2)); 
N = 4; szA = size(d5_spar);
B = arrayfun(@(k) mean(d5_spar(:,k:min(szA(2),k+N-1)),2), 1:N:szA(2), 'un', 0); 
mspec_CSPAR_day5 = [B{:}];

load('C:/Users/Becca/Desktop/MATLAB/result_matfiles/results_ST02_FIVE_AEOLU.mat'); %(5:676)
matdays = matdays(5:676); 
poavg = poavg(:,5:676);
t=matdays-(4/24); 
[~,~,~,hr,mn,~]=datevec(t); 
hrmn=hr+mn/60; 
b = NaN(16385,7,59);
for i = 1:length(day_d5) 
    a = find(hrmn == day_d5(i)); 
    b(:,:,i) = poavg(:,a); 
end
d5_aeolus = squeeze(mean(b,2)); 
N = 4; szA = size(d5_aeolus);
B = arrayfun(@(k) mean(d5_aeolus(:,k:min(szA(2),k+N-1)),2), 1:N:szA(2), 'un', 0); 
mspec_AEOLU_day5 = [B{:}];

%% Plotting

band = find(f>=100 & f<=2000);
% D1
figure;subplot(2,2,1); 
plot(f(band),10*log10(mean(mspec_210RK_day1(band,:),2)));hold on;
plot(f(band),10*log10(mean(mspec_210RK_night1(band,:),2))); 
title('210 Rock D1');legend('Day','Night');
subplot(2,2,2); 
plot(f(band),10*log10(mean(mspec_WESTR_day1(band,:),2)));hold on;
plot(f(band),10*log10(mean(mspec_WESTR_night1(band,:),2))); 
title('West Rock D1');legend('Day','Night');
subplot(2,2,3); 
plot(f(band),10*log10(mean(mspec_CSPAR_day1(band,:),2)));hold on;
plot(f(band),10*log10(mean(mspec_CSPAR_night1(band,:),2))); 
title('Spar D1');legend('Day','Night');


%D2
figure;subplot(2,2,1); 
plot(f(band),10*log10(mean(mspec_210RK_day2(band,:),2)));hold on;
plot(f(band),10*log10(mean(mspec_210RK_night2(band,:),2))); 
title('210 Rock D2');legend('Day','Night');
subplot(2,2,2); 
plot(f(band),10*log10(mean(mspec_WESTR_day2(band,:),2)));hold on;
plot(f(band),10*log10(mean(mspec_WESTR_night2(band,:),2))); 
title('West Rock D2');legend('Day','Night');
subplot(2,2,3); 
plot(f(band),10*log10(mean(mspec_CSPAR_day2(band,:),2)));hold on;
plot(f(band),10*log10(mean(mspec_CSPAR_night2(band,:),2))); 
title('Spar D2');legend('Day','Night');


%D3
figure;subplot(2,2,1); 
plot(f(band),10*log10(mean(mspec_210RK_day3(band,:),2)));hold on;
plot(f(band),10*log10(mean(mspec_210RK_night3(band,:),2))); 
title('210 Rock D3');legend('Day','Night');
subplot(2,2,2); 
plot(f(band),10*log10(mean(mspec_WESTR_day3(band,:),2)));hold on;
plot(f(band),10*log10(mean(mspec_WESTR_night3(band,:),2))); 
title('West Rock D3');legend('Day','Night');
subplot(2,2,3); 
plot(f(band),10*log10(mean(mspec_CSPAR_day3(band,:),2)));hold on;
plot(f(band),10*log10(mean(mspec_CSPAR_night3(band,:),2))); 
title('Spar D3');legend('Day','Night');
subplot(2,2,4); 
plot(f(band),10*log10(mean(mspec_AEOLU_day3(band,:),2)));hold on;
plot(f(band),10*log10(mean(mspec_AEOLU_night3(band,:),2))); 
title('Aeolus D3');legend('Day','Night');


%D4
figure;subplot(2,2,1); 
plot(f(band),10*log10(mean(mspec_210RK_day4(band,:),2)));hold on;
plot(f(band),10*log10(mean(mspec_210RK_night4(band,:),2))); 
title('210 Rock D4');legend('Day','Night');
subplot(2,2,2); 
plot(f(band),10*log10(mean(mspec_WESTR_day4(band,:),2)));hold on;
plot(f(band),10*log10(mean(mspec_WESTR_night4(band,:),2))); 
title('West Rock D4');legend('Day','Night');
subplot(2,2,3); 
plot(f(band),10*log10(mean(mspec_CSPAR_day4(band,:),2)));hold on;
plot(f(band),10*log10(mean(mspec_CSPAR_night4(band,:),2))); 
title('Spar D4');legend('Day','Night');
subplot(2,2,4); 
plot(f(band),10*log10(mean(mspec_AEOLU_day4(band,:),2)));hold on;
plot(f(band),10*log10(mean(mspec_AEOLU_night4(band,:),2))); 
title('Aeolus D4');legend('Day','Night');


%D5
figure;subplot(2,2,1); 
plot(f(band),10*log10(mean(mspec_210RK_day5(band,:),2)));hold on;
plot(f(band),10*log10(mean(mspec_210RK_night5(band,:),2))); 
title('210 Rock D5');legend('Day','Night');
subplot(2,2,2); 
plot(f(band),10*log10(mean(mspec_WESTR_day5(band,:),2)));hold on;
plot(f(band),10*log10(mean(mspec_WESTR_night5(band,:),2))); 
title('West Rock D5');legend('Day','Night');
subplot(2,2,3); 
plot(f(band),10*log10(mean(mspec_CSPAR_day5(band,:),2)));hold on;
plot(f(band),10*log10(mean(mspec_CSPAR_night5(band,:),2))); 
title('Spar D5');legend('Day','Night');
subplot(2,2,4); 
plot(f(band),10*log10(mean(mspec_AEOLU_day5(band,:),2)));hold on;
plot(f(band),10*log10(mean(mspec_AEOLU_night5(band,:),2))); 
title('Aeolus D5');legend('Day','Night');
