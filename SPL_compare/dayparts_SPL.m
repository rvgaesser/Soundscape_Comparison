%% Plotting for Low frequency band

clear
close all 
load('daily_SPL.mat');
load('avg_suncycle.mat');

tbins = 0:.25:23.75;

% Identify dayparts
dawn_d1 = find(tbins==d1_dawn):find(tbins== d1_sRISE-.25);
dawn_d2 = find(tbins==d2_dawn):find(tbins==d2_sRISE-.25);
dawn_d3 = find(tbins==d3_dawn):find(tbins==d3_sRISE-.25);
dawn_d4 = find(tbins==d4_dawn):find(tbins==d4_sRISE-.25);
dawn_d5 = find(tbins==d5_dawn):find(tbins==d5_sRISE-.25);
day_d1 = find(tbins==d1_sRISE):find(tbins==d1_sSET-.25);
day_d2 = find(tbins==d2_sRISE):find(tbins==d2_sSET-.25);
day_d3 = find(tbins==d3_sRISE):find(tbins==d3_sSET-.25);
day_d4 = find(tbins==d4_sRISE):find(tbins==d4_sSET-.25);
day_d5 = find(tbins==d5_sRISE):find(tbins==d5_sSET-.25);
dusk_d1 = find(tbins==d1_sSET):find(tbins==d1_dusk-.25);
dusk_d2 = find(tbins==d2_sSET):find(tbins==d2_dusk-.25);
dusk_d3 = find(tbins==d3_sSET):find(tbins==d3_dusk-.25);
dusk_d4 = find(tbins==d4_sSET):find(tbins==d4_dusk-.25);
dusk_d5 = find(tbins==d5_sSET):find(tbins==d5_dusk-.25);
night_d1 = cat(2,find(tbins==d1_dusk):96,1:find(tbins==d1_dawn-.25));
night_d2 = cat(2,find(tbins==d2_dusk):96,1:find(tbins==d2_dawn-.25));
night_d3 = cat(2,find(tbins==d3_dusk):96,1:find(tbins==d3_dawn-.25));
night_d4 = cat(2,find(tbins==d4_dusk):96,1:find(tbins==d4_dawn-.25));
night_d5 = cat(2,find(tbins==d5_dusk):96,1:find(tbins==d5_dawn-.25));

%% subset to dayparts
% 210RK
T1_dawn = 10*log10(low_210d1(:,dawn_d1)); T1_dawn_avg=mean2(T1_dawn);T1_dawn_sd=std2(T1_dawn);
T2_dawn = 10*log10(low_210d2(:,dawn_d2)); T2_dawn_avg=mean2(T2_dawn);T2_dawn_sd=std2(T2_dawn);
T3_dawn = 10*log10(low_210d3(:,dawn_d3)); T3_dawn_avg=mean2(T3_dawn);T3_dawn_sd=std2(T3_dawn);
T4_dawn = 10*log10(low_210d4(:,dawn_d4)); T4_dawn_avg=mean2(T4_dawn);T4_dawn_sd=std2(T4_dawn);
T5_dawn = 10*log10(low_210d5(:,dawn_d5)); T5_dawn_avg=mean2(T5_dawn);T5_dawn_sd=std2(T5_dawn);

T1_day = 10*log10(low_210d1(:,day_d1)); T1_day_avg=mean2(T1_day);T1_day_sd=std2(T1_day);
T2_day = 10*log10(low_210d2(:,day_d2)); T2_day_avg=mean2(T2_day);T2_day_sd=std2(T2_day);
T3_day = 10*log10(low_210d3(:,day_d3)); T3_day_avg=mean2(T3_day);T3_day_sd=std2(T3_day);
T4_day = 10*log10(low_210d4(:,day_d4)); T4_day_avg=mean2(T4_day);T4_day_sd=std2(T4_day);
T5_day = 10*log10(low_210d5(:,day_d5)); T5_day_avg=mean2(T5_day);T5_day_sd=std2(T5_day);

T1_dusk = 10*log10(low_210d1(:,dusk_d1)); T1_dusk_avg=mean2(T1_dusk);T1_dusk_sd=std2(T1_dusk);
T2_dusk = 10*log10(low_210d2(:,dusk_d2)); T2_dusk_avg=mean2(T2_dusk);T2_dusk_sd=std2(T2_dusk);
T3_dusk = 10*log10(low_210d3(:,dusk_d3)); T3_dusk_avg=mean2(T3_dusk);T3_dusk_sd=std2(T3_dusk);
T4_dusk = 10*log10(low_210d4(:,dusk_d4)); T4_dusk_avg=mean2(T4_dusk);T4_dusk_sd=std2(T4_dusk);
T5_dusk = 10*log10(low_210d5(:,dusk_d5)); T5_dusk_avg=mean2(T5_dusk);T5_dusk_sd=std2(T5_dusk);

T1_night = 10*log10(low_210d1(:,night_d1)); T1_night_avg=mean2(T1_night);T1_night_sd=std2(T1_night);
T2_night = 10*log10(low_210d2(:,night_d2)); T2_night_avg=mean2(T2_night);T2_night_sd=std2(T2_night);
T3_night = 10*log10(low_210d3(:,night_d3)); T3_night_avg=mean2(T3_night);T3_night_sd=std2(T3_night);
T4_night = 10*log10(low_210d4(:,night_d4)); T4_night_avg=mean2(T4_night);T4_night_sd=std2(T4_night);
T5_night = 10*log10(low_210d5(:,night_d5)); T5_night_avg=mean2(T5_night);T5_night_sd=std2(T5_night);

% West Rock
W1_dawn = 10*log10(low_westrd1(:,dawn_d1)); W1_dawn_avg=mean2(W1_dawn);W1_dawn_sd=std2(W1_dawn);
W2_dawn = 10*log10(low_westrd2(:,dawn_d2)); W2_dawn_avg=mean2(W2_dawn);W2_dawn_sd=std2(W2_dawn);
W3_dawn = 10*log10(low_westrd3(:,dawn_d3)); W3_dawn_avg=mean2(W3_dawn);W3_dawn_sd=std2(W3_dawn);
W4_dawn = 10*log10(low_westrd4(:,dawn_d4)); W4_dawn_avg=mean2(W4_dawn);W4_dawn_sd=std2(W4_dawn);
W5_dawn = 10*log10(low_westrd5(:,dawn_d5)); W5_dawn_avg=mean2(W5_dawn);W5_dawn_sd=std2(W5_dawn);

W1_day = 10*log10(low_westrd1(:,day_d1)); W1_day_avg=mean2(W1_day);W1_day_sd=std2(W1_day);
W2_day = 10*log10(low_westrd2(:,day_d2)); W2_day_avg=mean2(W2_day);W2_day_sd=std2(W2_day);
W3_day = 10*log10(low_westrd3(:,day_d3)); W3_day_avg=mean2(W3_day);W3_day_sd=std2(W3_day);
W4_day = 10*log10(low_westrd4(:,day_d4)); W4_day_avg=mean2(W4_day);W4_day_sd=std2(W4_day);
W5_day = 10*log10(low_westrd5(:,day_d5)); W5_day_avg=mean2(W5_day);W5_day_sd=std2(W5_day);

W1_dusk = 10*log10(low_westrd1(:,dusk_d1)); W1_dusk_avg=mean2(W1_dusk);W1_dusk_sd=std2(W1_dusk);
W2_dusk = 10*log10(low_westrd2(:,dusk_d2)); W2_dusk_avg=mean2(W2_dusk);W2_dusk_sd=std2(W2_dusk);
W3_dusk = 10*log10(low_westrd3(:,dusk_d3)); W3_dusk_avg=mean2(W3_dusk);W3_dusk_sd=std2(W3_dusk);
W4_dusk = 10*log10(low_westrd4(:,dusk_d4)); W4_dusk_avg=mean2(W4_dusk);W4_dusk_sd=std2(W4_dusk);
W5_dusk = 10*log10(low_westrd5(:,dusk_d5)); W5_dusk_avg=mean2(W5_dusk);W5_dusk_sd=std2(W5_dusk);

W1_night = 10*log10(low_westrd1(:,night_d1)); W1_night_avg=mean2(W1_night);W1_night_sd=std2(W1_night);
W2_night = 10*log10(low_westrd2(:,night_d2)); W2_night_avg=mean2(W2_night);W2_night_sd=std2(W2_night);
W3_night = 10*log10(low_westrd3(:,night_d3)); W3_night_avg=mean2(W3_night);W3_night_sd=std2(W3_night);
W4_night = 10*log10(low_westrd4(:,night_d4)); W4_night_avg=mean2(W4_night);W4_night_sd=std2(W4_night);
W5_night = 10*log10(low_westrd5(:,night_d5)); W5_night_avg=mean2(W5_night);W5_night_sd=std2(W5_night);

% Spar
C1_dawn = 10*log10(low_cspard1(:,dawn_d1)); C1_dawn_avg=mean2(C1_dawn);C1_dawn_sd=std2(C1_dawn);
C2_dawn = 10*log10(low_cspard2(:,dawn_d2)); C2_dawn_avg=mean2(C2_dawn);C2_dawn_sd=std2(C2_dawn);
C3_dawn = 10*log10(low_cspard3(:,dawn_d3)); C3_dawn_avg=mean2(C3_dawn);C3_dawn_sd=std2(C3_dawn);
C4_dawn = 10*log10(low_cspard4(:,dawn_d4)); C4_dawn_avg=mean2(C4_dawn);C4_dawn_sd=std2(C4_dawn);
C5_dawn = 10*log10(low_cspard5(:,dawn_d5)); C5_dawn_avg=mean2(C5_dawn);C5_dawn_sd=std2(C5_dawn);

C1_day = 10*log10(low_cspard1(:,day_d1)); C1_day_avg=mean2(C1_day);C1_day_sd=std2(C1_day);
C2_day = 10*log10(low_cspard2(:,day_d2)); C2_day_avg=mean2(C2_day);C2_day_sd=std2(C2_day);
C3_day = 10*log10(low_cspard3(:,day_d3)); C3_day_avg=mean2(C3_day);C3_day_sd=std2(C3_day);
C4_day = 10*log10(low_cspard4(:,day_d4)); C4_day_avg=mean2(C4_day);C4_day_sd=std2(C4_day);
C5_day = 10*log10(low_cspard5(:,day_d5)); C5_day_avg=mean2(C5_day);C5_day_sd=std2(C5_day);

C1_dusk = 10*log10(low_cspard1(:,dusk_d1)); C1_dusk_avg=mean2(C1_dusk);C1_dusk_sd=std2(C1_dusk);
C2_dusk = 10*log10(low_cspard2(:,dusk_d2)); C2_dusk_avg=mean2(C2_dusk);C2_dusk_sd=std2(C2_dusk);
C3_dusk = 10*log10(low_cspard3(:,dusk_d3)); C3_dusk_avg=mean2(C3_dusk);C3_dusk_sd=std2(C3_dusk);
C4_dusk = 10*log10(low_cspard4(:,dusk_d4)); C4_dusk_avg=mean2(C4_dusk);C4_dusk_sd=std2(C4_dusk);
C5_dusk = 10*log10(low_cspard5(:,dusk_d5)); C5_dusk_avg=mean2(C5_dusk);C5_dusk_sd=std2(C5_dusk);

C1_night = 10*log10(low_cspard1(:,night_d1)); C1_night_avg=mean2(C1_night);C1_night_sd=std2(C1_night);
C2_night = 10*log10(low_cspard2(:,night_d2)); C2_night_avg=mean2(C2_night);C2_night_sd=std2(C2_night);
C3_night = 10*log10(low_cspard3(:,night_d3)); C3_night_avg=mean2(C3_night);C3_night_sd=std2(C3_night);
C4_night = 10*log10(low_cspard4(:,night_d4)); C4_night_avg=mean2(C4_night);C4_night_sd=std2(C4_night);
C5_night = 10*log10(low_cspard5(:,night_d5)); C5_night_avg=mean2(C5_night);C5_night_sd=std2(C5_night);

% Aeolus
A3_dawn = 10*log10(low_aeolud3(:,dawn_d3)); A3_dawn_avg=mean2(A3_dawn);A3_dawn_sd=std2(A3_dawn);
A4_dawn = 10*log10(low_aeolud4(:,dawn_d4)); A4_dawn_avg=mean2(A4_dawn);A4_dawn_sd=std2(A4_dawn);
A5_dawn = 10*log10(low_aeolud5(:,dawn_d5)); A5_dawn_avg=mean2(A5_dawn);A5_dawn_sd=std2(A5_dawn);

A3_day = 10*log10(low_aeolud3(:,day_d3)); A3_day_avg=mean2(A3_day);A3_day_sd=std2(A3_day);
A4_day = 10*log10(low_aeolud4(:,day_d4)); A4_day_avg=mean2(A4_day);A4_day_sd=std2(A4_day);
A5_day = 10*log10(low_aeolud5(:,day_d5)); A5_day_avg=mean2(A5_day);A5_day_sd=std2(A5_day);

A3_dusk = 10*log10(low_aeolud3(:,dusk_d3)); A3_dusk_avg=mean2(A3_dusk);A3_dusk_sd=std2(A3_dusk);
A4_dusk = 10*log10(low_aeolud4(:,dusk_d4)); A4_dusk_avg=mean2(A4_dusk);A4_dusk_sd=std2(A4_dusk);
A5_dusk = 10*log10(low_aeolud5(:,dusk_d5)); A5_dusk_avg=mean2(A5_dusk);A5_dusk_sd=std2(A5_dusk);

A3_night = 10*log10(low_aeolud3(:,night_d3)); A3_night_avg=mean2(A3_night);A3_night_sd=std2(A3_night);
A4_night = 10*log10(low_aeolud4(:,night_d4)); A4_night_avg=mean2(A4_night);A4_night_sd=std2(A4_night);
A5_night = 10*log10(low_aeolud5(:,night_d5)); A5_night_avg=mean2(A5_night);A5_night_sd=std2(A5_night);

%% Grouping and Plotting Dayparts, by site, different for each deployment

d1_210 = [T1_dawn_avg T1_day_avg T1_dusk_avg T1_night_avg];
d2_210 = [T2_dawn_avg T2_day_avg T2_dusk_avg T2_night_avg];
d3_210 = [T3_dawn_avg T3_day_avg T3_dusk_avg T3_night_avg];
d4_210 = [T4_dawn_avg T4_day_avg T4_dusk_avg T4_night_avg];
d5_210 = [T5_dawn_avg T5_day_avg T5_dusk_avg T5_night_avg];

d1_westr = [W1_dawn_avg W1_day_avg W1_dusk_avg W1_night_avg];
d2_westr = [W2_dawn_avg W2_day_avg W2_dusk_avg W2_night_avg];
d3_westr = [W3_dawn_avg W3_day_avg W3_dusk_avg W3_night_avg];
d4_westr = [W4_dawn_avg W4_day_avg W4_dusk_avg W4_night_avg];
d5_westr = [W5_dawn_avg W5_day_avg W5_dusk_avg W5_night_avg];

d1_cspar = [C1_dawn_avg C1_day_avg C1_dusk_avg C1_night_avg];
d2_cspar = [C2_dawn_avg C2_day_avg C2_dusk_avg C2_night_avg];
d3_cspar = [C3_dawn_avg C3_day_avg C3_dusk_avg C3_night_avg];
d4_cspar = [C4_dawn_avg C4_day_avg C4_dusk_avg C4_night_avg];
d5_cspar = [C5_dawn_avg C5_day_avg C5_dusk_avg C5_night_avg];

d3_aeolu = [A3_dawn_avg A3_day_avg A3_dusk_avg A3_night_avg];
d4_aeolu = [A4_dawn_avg A4_day_avg A4_dusk_avg A4_night_avg];
d5_aeolu = [A5_dawn_avg A5_day_avg A5_dusk_avg A5_night_avg];

D1 = [d1_210; d1_westr; d1_cspar];
D2 = [d2_210; d2_westr; d2_cspar];
D3 = [d3_210; d3_westr; d3_cspar;d3_aeolu];
D4 = [d4_210; d4_westr; d4_cspar;d4_aeolu];
D5 = [d5_210; d5_westr; d5_cspar;d5_aeolu];

d1_210sd = [T1_dawn_sd T1_day_sd T1_dusk_sd T1_night_sd];
d2_210sd = [T2_dawn_sd T2_day_sd T2_dusk_sd T2_night_sd];
d3_210sd = [T3_dawn_sd T3_day_sd T3_dusk_sd T3_night_sd];
d4_210sd = [T4_dawn_sd T4_day_sd T4_dusk_sd T4_night_sd];
d5_210sd = [T5_dawn_sd T5_day_sd T5_dusk_sd T5_night_sd];

d1_westrsd = [W1_dawn_sd W1_day_sd W1_dusk_sd W1_night_sd];
d2_westrsd = [W2_dawn_sd W2_day_sd W2_dusk_sd W2_night_sd];
d3_westrsd = [W3_dawn_sd W3_day_sd W3_dusk_sd W3_night_sd];
d4_westrsd = [W4_dawn_sd W4_day_sd W4_dusk_sd W4_night_sd];
d5_westrsd = [W5_dawn_sd W5_day_sd W5_dusk_sd W5_night_sd];

d1_csparsd = [C1_dawn_sd C1_day_sd C1_dusk_sd C1_night_sd];
d2_csparsd = [C2_dawn_sd C2_day_sd C2_dusk_sd C2_night_sd];
d3_csparsd = [C3_dawn_sd C3_day_sd C3_dusk_sd C3_night_sd];
d4_csparsd = [C4_dawn_sd C4_day_sd C4_dusk_sd C4_night_sd];
d5_csparsd = [C5_dawn_sd C5_day_sd C5_dusk_sd C5_night_sd];

d3_aeolusd = [A3_dawn_sd A3_day_sd A3_dusk_sd A3_night_sd];
d4_aeolusd = [A4_dawn_sd A4_day_sd A4_dusk_sd A4_night_sd];
d5_aeolusd = [A5_dawn_sd A5_day_sd A5_dusk_sd A5_night_sd];

D1sd = [d1_210sd; d1_westrsd; d1_csparsd];
D2sd = [d2_210sd; d2_westrsd; d2_csparsd];
D3sd = [d3_210sd; d3_westrsd; d3_csparsd; d3_aeolusd];
D4sd = [d4_210sd; d4_westrsd; d4_csparsd; d4_aeolusd];
D5sd = [d5_210sd; d5_westrsd; d5_csparsd; d5_aeolusd];

% Plotting

% Dayparts grouped by site, separate plot for each deployment
% still needs lots of labelling work

figure; subplot(3,2,1);
hBar = bar(D1); ylim([85 125]); xBar=cell2mat(get(hBar,'XData')).' + [hBar.XOffset];
hold on; errorbar(xBar,D1,D2sd,'k.'); %legend('Dawn','Day','Dusk','Night');
ylabel('SPL dB re 1uPa'); xlabel('Site');xticklabels({'210 Rock','West Rock','Spar'});
title('Deployment 1');

subplot(3,2,2);
hBar = bar(D2); ylim([85 125]); xBar=cell2mat(get(hBar,'XData')).' + [hBar.XOffset];
hold on; errorbar(xBar,D2,D2sd,'k.');%legend('Dawn','Day','Dusk','Night');
ylabel('SPL dB re 1uPa'); xlabel('Site');xticklabels({'210 Rock','West Rock','Spar'});
title('Deployment 2');

subplot(3,2,3);
hBar = bar(D3); ylim([85 125]); xBar=cell2mat(get(hBar,'XData')).' + [hBar.XOffset];
hold on; errorbar(xBar,D3,D3sd,'k.');%legend('Dawn','Day','Dusk','Night');
ylabel('SPL dB re 1uPa'); xlabel('Site');xticklabels({'210 Rock','West Rock','Spar','Aeolus'});
title('Deployment 3');

subplot(3,2,4);
hBar = bar(D4); ylim([85 125]); xBar=cell2mat(get(hBar,'XData')).' + [hBar.XOffset];
hold on; errorbar(xBar,D4,D4sd,'k.');%legend('Dawn','Day','Dusk','Night');
ylabel('SPL dB re 1uPa'); xlabel('Site');xticklabels({'210 Rock','West Rock','Spar','Aeolus'});
title('Deployment 4');

subplot(3,2,5);
hBar = bar(D5); ylim([85 125]); xBar=cell2mat(get(hBar,'XData')).' + [hBar.XOffset];
hold on; errorbar(xBar,D5,D5sd,'k.');legend('Dawn','Day','Dusk','Night');
ylabel('SPL dB re 1uPa'); xlabel('Site');xticklabels({'210 Rock','West Rock','Spar','Aeolus'});
title('Deployment 5');


%% Grouping and Plotting 




