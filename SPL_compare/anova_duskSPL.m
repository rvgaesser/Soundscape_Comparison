% ANOVA within site between season during from dusk to dawn
% added a new branch and am making edits locally

% Low Frequency band

clear
load 'avg_suncycle.mat' % mean sRISE, sSET, and twilight times for each deploy
load 'daily_SPL.mat' % [n days in deploy, 96] mean SPL in each file for low and high  

% Identify the index (1-96) that matches the nighttime for each deploy
tbins = 0:.25:23.75;
D1_na = find(tbins==d1_sSET):96;D1_nb = 1:find(tbins==d1_dawn-.25); 
D2_na = find(tbins==d2_sSET):96;D2_nb = 1:find(tbins==d2_dawn-.25);
D3_na = find(tbins==d3_sSET):96;D3_nb = 1:find(tbins==d3_dawn-.25);
D4_na = find(tbins==d4_sSET):96;D4_nb = 1:find(tbins==d4_dawn-.25);
D5_na = find(tbins==d5_sSET):96;D5_nb = 1:find(tbins==d5_dawn-.25);

% Night - use previous index to subset each site
T1_n=cat(2,10*log10(low_210d1(:,D1_na)),10*log10(low_210d1(:,D1_nb)),NaN(8,2))'; T1_avg=nanmean(T1_n(:)); T1_sd=nanstd(T1_n(:)); 
T2_n=cat(2,10*log10(low_210d2(:,D2_na)),10*log10(low_210d2(:,D2_nb)))'; T2_avg=nanmean(T2_n(:)); T2_sd=nanstd(T1_n(:));
T3_n=cat(2,10*log10(low_210d3(:,D3_na)),10*log10(low_210d3(:,D3_nb)),NaN(8,12))'; T3_avg=nanmean(T3_n(:)); T3_sd=nanstd(T3_n(:));
T4_n=cat(2,10*log10(low_210d4(:,D4_na)),10*log10(low_210d4(:,D4_nb)),NaN(7,17))'; T4_avg=nanmean(T4_n(:)); T4_sd=nanstd(T4_n(:));
T5_n=cat(2,10*log10(low_210d5(:,D5_na)),10*log10(low_210d5(:,D5_nb)),NaN(7,12))'; T5_avg=nanmean(T5_n(:)); T5_sd=nanstd(T5_n(:));
W1_n=cat(2,10*log10(low_westrd1(:,D1_na)),10*log10(low_westrd1(:,D1_nb)),NaN(8,2))'; W1_avg=nanmean(W1_n(:)); W1_sd=nanstd(W1_n(:));
W2_n=cat(2,10*log10(low_westrd2(:,D2_na)),10*log10(low_westrd2(:,D2_nb)))'; W2_avg=nanmean(W1_n(:)); W2_sd=nanstd(W1_n(:));
W3_n=cat(2,10*log10(low_westrd3(:,D3_na)),10*log10(low_westrd3(:,D3_nb)),NaN(8,12))'; W3_avg=nanmean(W3_n(:)); W3_sd=nanstd(W3_n(:));
W4_n=cat(2,10*log10(low_westrd4(:,D4_na)),10*log10(low_westrd4(:,D4_nb)),NaN(7,17))'; W4_avg=nanmean(W4_n(:)); W4_sd=nanstd(W4_n(:));
W5_n=cat(2,10*log10(low_westrd5(:,D5_na)),10*log10(low_westrd5(:,D5_nb)),NaN(7,12))'; W5_avg=nanmean(W5_n(:)); W5_sd=nanstd(W5_n(:));
C1_n=cat(2,10*log10(low_cspard1(:,D1_na)),10*log10(low_cspard1(:,D1_nb)),NaN(8,2))'; C1_avg=nanmean(C1_n(:)); C1_sd=nanstd(C1_n(:));
C2_n=cat(2,10*log10(low_cspard2(:,D2_na)),10*log10(low_cspard2(:,D2_nb)))'; C2_avg=nanmean(C2_n(:)); C2_sd=nanstd(C2_n(:));
C3_n=cat(2,10*log10(low_cspard3(:,D3_na)),10*log10(low_cspard3(:,D3_nb)),NaN(8,12))'; C3_avg=nanmean(C3_n(:)); C3_sd=nanstd(C3_n(:));
C4_n=cat(2,10*log10(low_cspard4(:,D4_na)),10*log10(low_cspard4(:,D4_nb)),NaN(7,17))'; C4_avg=nanmean(C4_n(:)); C4_sd=nanstd(C4_n(:));
C5_n=cat(2,10*log10(low_cspard5(:,D5_na)),10*log10(low_cspard5(:,D5_nb)),NaN(7,12))'; C5_avg=nanmean(C5_n(:)); C5_sd=nanstd(C5_n(:));
A3_n=cat(2,10*log10(low_aeolud3(:,D3_na)),10*log10(low_aeolud3(:,D3_nb)),NaN(8,12))'; A3_avg=nanmean(A3_n(:)); A3_sd=nanstd(A3_n(:));
A4_n=cat(2,10*log10(low_aeolud4(:,D4_na)),10*log10(low_aeolud4(:,D4_nb)),NaN(7,17))'; A4_avg=nanmean(A4_n(:)); A4_sd=nanstd(A4_n(:));
A5_n=cat(2,10*log10(low_aeolud5(:,D5_na)),10*log10(low_aeolud5(:,D5_nb)),NaN(7,12))'; A5_avg=nanmean(A5_n(:)); A5_sd=nanstd(A5_n(:));

% nall_T = [T1_n T2_n T3_n T4_n T5_n];% Combines each deployment
% nall_W = [W1_n W2_n W3_n W4_n W5_n];
% nall_C = [C1_n C2_n C3_n C4_n C5_n];
% nall_A = [A3_n A4_n A5_n];
% 
% % ANOVA groups
% deploys = {'D1','D1','D1','D1','D1','D1','D1','D1','D2','D2','D2','D2','D2','D2','D2','D2','D2','D3','D3','D3','D3','D3','D3','D3','D3','D4','D4','D4','D4','D4','D4','D4','D5','D5','D5','D5','D5','D5','D5'};
% deploysT = {'D1','D1','D1','D1','D1','D1','D1','D1','D2','D2','D2','D2','D2','D2','D3','D3','D3','D3','D3','D3','D3','D3','D4','D4','D4','D4','D4','D4','D4','D5','D5','D5','D5','D5','D5','D5'};
% deploysA = {'D3','D3','D3','D3','D3','D3','D3','D3','D4','D4','D4','D4','D4','D4','D4','D5','D5','D5','D5','D5','D5','D5'};
% 
% % ANOVA & Multiple Comparisons
% 
% % Night
% [~,~,stats] = anova1(nall_T,deploysT); multcompare(stats); title('210RK');
% [~,~,stats] = anova1(nall_W,deploys); multcompare(stats);title('West Rock');
% [~,~,stats] = anova1(nall_C,deploys); multcompare(stats);('Spar');
% [~,~,stats] = anova1(nall_A,deploysA);multcompare(stats);('Aeolus');

sites = {'T','W','C'};
sites_A = {'T','W','C','A'};

D1_l = [T1_n(:) W1_n(:) C1_n(:)];[~,~,stats] = anova1(D1_l,sites); multcompare(stats); title('D1');
D2_l = [cat(1,T2_n(:),nan([147,1])) W2_n(:) C2_n(:)];[~,~,stats] = anova1(D2_l,sites); multcompare(stats); title('D2');
D3_l = [T3_n(:) W3_n(:) C3_n(:) A3_n(:)];[~,~,stats] = anova1(D3_l,sites_A); multcompare(stats); title('D3');
D4_l = [T4_n(:) W4_n(:) C4_n(:) A4_n(:)];[~,~,stats] = anova1(D4_l,sites_A); multcompare(stats); title('D4');
D5_l = [T5_n(:) W5_n(:) C5_n(:) A5_n(:)];[~,~,stats] = anova1(D5_l,sites_A); multcompare(stats); title('D5');


%% High Frequency band - night

T1_nh=cat(2,10*log10(high_210d1(:,D1_na)),10*log10(high_210d1(:,D1_nb)),NaN(8,2))'; T1_avgH=nanmean(T1_nh(:)); T1_sdH=nanstd(T1_nh(:)); 
T2_nh=cat(2,10*log10(high_210d2(:,D2_na)),10*log10(high_210d2(:,D2_nb)))'; T2_avgH=nanmean(T2_nh(:)); T2_sdH=nanstd(T1_nh(:));
T3_nh=cat(2,10*log10(high_210d3(:,D3_na)),10*log10(high_210d3(:,D3_nb)),NaN(8,12))'; T3_avgH=nanmean(T3_nh(:)); T3_sdH=nanstd(T3_nh(:));
T4_nh=cat(2,10*log10(high_210d4(:,D4_na)),10*log10(high_210d4(:,D4_nb)),NaN(7,17))'; T4_avgH=nanmean(T4_nh(:)); T4_sdH=nanstd(T4_nh(:));
T5_nh=cat(2,10*log10(high_210d5(:,D5_na)),10*log10(high_210d5(:,D5_nb)),NaN(7,12))'; T5_avgH=nanmean(T5_nh(:)); T5_sdH=nanstd(T5_nh(:));
W1_nh=cat(2,10*log10(high_westrd1(:,D1_na)),10*log10(high_westrd1(:,D1_nb)),NaN(8,2))'; W1_avgH=nanmean(W1_nh(:)); W1_sdH=nanstd(W1_nh(:));
W2_nh=cat(2,10*log10(high_westrd2(:,D2_na)),10*log10(high_westrd2(:,D2_nb)))'; W2_avgH=nanmean(W1_nh(:)); W2_sdH=nanstd(W1_nh(:));
W3_nh=cat(2,10*log10(high_westrd3(:,D3_na)),10*log10(high_westrd3(:,D3_nb)),NaN(8,12))'; W3_avgH=nanmean(W3_nh(:)); W3_sdH=nanstd(W3_nh(:));
W4_nh=cat(2,10*log10(high_westrd4(:,D4_na)),10*log10(high_westrd4(:,D4_nb)),NaN(7,17))'; W4_avgH=nanmean(W4_nh(:)); W4_sdH=nanstd(W4_nh(:));
W5_nh=cat(2,10*log10(high_westrd5(:,D5_na)),10*log10(high_westrd5(:,D5_nb)),NaN(7,12))'; W5_avgH=nanmean(W5_nh(:)); W5_sdH=nanstd(W5_nh(:));
C1_nh=cat(2,10*log10(high_cspard1(:,D1_na)),10*log10(high_cspard1(:,D1_nb)),NaN(8,2))'; C1_avgH=nanmean(C1_nh(:)); C1_sdH=nanstd(C1_nh(:));
C2_nh=cat(2,10*log10(high_cspard2(:,D2_na)),10*log10(high_cspard2(:,D2_nb)))'; C2_avgH=nanmean(C2_nh(:)); C2_sdH=nanstd(C2_nh(:));
C3_nh=cat(2,10*log10(high_cspard3(:,D3_na)),10*log10(high_cspard3(:,D3_nb)),NaN(8,12))'; C3_avgH=nanmean(C3_nh(:)); C3_sdH=nanstd(C3_nh(:));
C4_nh=cat(2,10*log10(high_cspard4(:,D4_na)),10*log10(high_cspard4(:,D4_nb)),NaN(7,17))'; C4_avgH=nanmean(C4_nh(:)); C4_sdH=nanstd(C4_nh(:));
C5_nh=cat(2,10*log10(high_cspard5(:,D5_na)),10*log10(high_cspard5(:,D5_nb)),NaN(7,12))'; C5_avgH=nanmean(C5_nh(:)); C5_sdH=nanstd(C5_nh(:));
A3_nh=cat(2,10*log10(high_aeolud3(:,D3_na)),10*log10(high_aeolud3(:,D3_nb)),NaN(8,12))'; A3_avgH=nanmean(A3_nh(:)); A3_sdH=nanstd(A3_nh(:));
A4_nh=cat(2,10*log10(high_aeolud4(:,D4_na)),10*log10(high_aeolud4(:,D4_nb)),NaN(7,17))'; A4_avgH=nanmean(A4_nh(:)); A4_sdH=nanstd(A4_nh(:));
A5_nh=cat(2,10*log10(high_aeolud5(:,D5_na)),10*log10(high_aeolud5(:,D5_nb)),NaN(7,12))'; A5_avgH=nanmean(A5_nh(:)); A5_sdH=nanstd(A5_nh(:));


% nall_T_high = [T1_nh T2_nh T3_nh T4_nh T5_nh];% Combines each deployment
% nall_W_high = [W1_nH W2_nh W3_nh W4_nh W5_nh];
% nall_C_high = [C1_nh C2_nh C3_nh C4_nh C5_nh];
% nall_A_high = [A3_nh A4_nh A5_nh];
% 
% % ANOVA and multcompare
% 
% [~,~,stats] = anova1(nall_T_high,deploysT); multcompare(stats); title('210RK');
% [~,~,stats] = anova1(nall_W_high,deploys); multcompare(stats);title('West Rock');
% [~,~,stats] = anova1(nall_C_high,deploys); multcompare(stats);title('Spar');
% [~,~,stats] = anova1(nall_A_high,deploysA); multcompare(stats);title('Aeolus');

%% Plotting

%%% SPL at night grouped by Deployment
D1_low = [T1_avg W1_avg C1_avg NaN]; D1_sd_low = [T1_sd W1_sd C1_sd NaN];
D2_low = [T2_avg W2_avg C2_avg NaN]; D2_sd_low = [T2_sd W2_sd C2_sd NaN];
D3_low = [T3_avg W3_avg C3_avg A3_avg]; D3_sd_low = [T3_sd W3_sd C3_sd A3_sd];
D4_low = [T4_avg W4_avg C4_avg A4_avg]; D4_sd_low = [T4_sd W4_sd C4_sd A4_sd];
D5_low = [T5_avg W5_avg C5_avg A5_avg]; D5_sd_low = [T5_sd W5_sd C5_sd A5_sd];

avg_night_low = [D1_low;D2_low;D3_low;D4_low;D5_low];
std_night_low = [D1_sd_low;D2_sd_low;D3_sd_low;D4_sd_low;D5_sd_low];

figure;
hBar = bar(avg_night_low);ylim([85 125]); xBar=cell2mat(get(hBar,'XData')).' + [hBar.XOffset];
hold on; errorbar(xBar,avg_night_low,std_night_low,'k.'); legend('210 Rock', 'West Rock', 'Spar','Aeolus');
xlabel('Deployment');ylabel('Mean SPL at night (dB re 1uPa)'); title('Low Frequency SPL at Night')

%%% SPL at night grouped by Site
T_low_avg = [T1_avg T2_avg T3_avg T4_avg T5_avg]; T_low_sd = [T1_sd T2_sd T3_sd T4_sd T5_sd];
W_low_avg = [W1_avg W2_avg W3_avg W4_avg W5_avg]; W_low_sd = [W1_sd W2_sd W3_sd W4_sd W5_sd];
C_low_avg = [C1_avg C2_avg C3_avg C4_avg C5_avg]; C_low_sd = [C1_sd C2_sd C3_sd C4_sd C5_sd];
A_low_avg = [NaN NaN A3_avg A4_avg A5_avg]; A_low_sd = [NaN NaN A3_sd A4_sd A5_sd];

n_low_sites = [T_low_avg;W_low_avg;C_low_avg;A_low_avg];
n_low_sites_sd = [T_low_sd;W_low_sd;C_low_sd;A_low_sd];

figure;
hBar = bar(n_low_sites);ylim([85 125]); xBar=cell2mat(get(hBar,'XData')).' + [hBar.XOffset];
hold on; errorbar(xBar,n_low_sites,n_low_sites_sd,'k.'); legend('D1', 'D2', 'D3','D4','D5');
xlabel('Site');ylabel('Mean SPL at night (dB re 1uPa)');xticklabels({'210 Rock','West Rock','Spar','Aeolus'});
title('Low Frequency SPL at Night');

%% Plotting high frequency
%%% SPL at night grouped by Deployment
D1_high = [T1_avgH W1_avgH C1_avgH NaN]; D1_sd_high = [T1_sdH W1_sd C1_sdH NaN];
D2_high = [T2_avgH W2_avgH C2_avgH NaN]; D2_sd_high = [T2_sdH W2_sd C2_sdH NaN];
D3_high = [T3_avgH W3_avgH C3_avgH A3_avgH]; D3_sd_high = [T3_sdH W3_sdH C3_sd A3_sdH];
D4_high = [T4_avgH W4_avgH C4_avgH A4_avgH]; D4_sd_high = [T4_sdH W4_sdH C4_sd A4_sdH];
D5_high = [T5_avgH W5_avgH C5_avgH A5_avgH]; D5_sd_high = [T5_sdH W5_sdH C5_sd A5_sdH];

avg_night_high = [D1_high;D2_high;D3_high;D4_high;D5_high];
std_night_high = [D1_sd_high;D2_sd_high;D3_sd_high;D4_sd_high;D5_sd_high];

figure;
hBar = bar(avg_night_high);ylim([85 125]); xBar=cell2mat(get(hBar,'XData')).' + [hBar.XOffset];
hold on; errorbar(xBar,avg_night_high,std_night_high,'k.'); legend('210 Rock', 'West Rock', 'Spar','Aeolus');
xlabel('Deployment');ylabel('Mean SPL at night (dB re 1uPa)'); title('High Frequency SPL at Night')

%%% SPL at night grouped by Site
T_high_avgH = [T1_avgH T2_avgH T3_avgH T4_avgH T5_avgH]; T_high_sd = [T1_sdH T2_sdH T3_sdH T4_sdH T5_sdH];
W_high_avgH = [W1_avgH W2_avgH W3_avgH W4_avgH W5_avgH]; W_high_sd = [W1_sdH W2_sdH W3_sdH W4_sdH W5_sdH];
C_high_avgH = [C1_avgH C2_avgH C3_avgH C4_avgH C5_avgH]; C_high_sd = [C1_sdH C2_sdH C3_sdH C4_sdH C5_sdH];
A_high_avgH = [NaN NaN A3_avgH A4_avgH A5_avgH]; A_high_sd = [NaN NaN A3_sdH A4_sdH A5_sdH];

n_high_sites = [T_high_avgH;W_high_avgH;C_high_avgH;A_high_avgH];
n_high_sites_sd = [T_high_sd;W_high_sd;C_high_sd;A_high_sd];

figure;
hBar = bar(n_high_sites);ylim([85 125]); xBar=cell2mat(get(hBar,'XData')).' + [hBar.XOffset];
hold on; errorbar(xBar,n_high_sites,n_high_sites_sd,'k.'); legend('D1', 'D2', 'D3','D4','D5');
xlabel('Site');ylabel('Mean SPL at night (dB re 1uPa)');xticklabels({'210 Rock','West Rock','Spar','Aeolus'});
title('High Frequency SPL at Night');


%% Dusk low frequency   - not as useful

% % Dusk
% D1_dusk = find(tbins==d1_sSET):find(tbins==d1_dusk); % index of dusk times on 1:96
% D2_dusk = find(tbins==d2_sSET):find(tbins==d2_dusk);
% D3_dusk = find(tbins==d3_sSET):find(tbins==d3_dusk);
% D4_dusk = find(tbins==d4_sSET):find(tbins==d4_dusk);
% D5_dusk = find(tbins==d5_sSET):find(tbins==d5_dusk);
% 
% T1_d=10*log10(low_210d1(:,D1_dusk))'; %SPL each time and day during dusk
% T2_d=10*log10(low_210d2(:,D1_dusk))';
% T3_d=10*log10(low_210d3(:,D1_dusk))';
% T4_d=10*log10(low_210d4(:,D1_dusk))';
% T5_d=10*log10(low_210d5(:,D1_dusk))';
% W1_d=10*log10(low_westrd1(:,D1_dusk))';
% W2_d=10*log10(low_westrd2(:,D1_dusk))';
% W3_d=10*log10(low_westrd3(:,D1_dusk))';
% W4_d=10*log10(low_westrd4(:,D1_dusk))';
% W5_d=10*log10(low_westrd5(:,D1_dusk))';
% C1_d=10*log10(low_cspard1(:,D1_dusk))';
% C2_d=10*log10(low_cspard2(:,D1_dusk))';
% C3_d=10*log10(low_cspard3(:,D1_dusk))';
% C4_d=10*log10(low_cspard4(:,D1_dusk))';
% C5_d=10*log10(low_cspard5(:,D1_dusk))';
% A3_d=10*log10(low_aeolud3(:,D1_dusk))';
% A4_d=10*log10(low_aeolud4(:,D1_dusk))';
% A5_d=10*log10(low_aeolud5(:,D1_dusk))';
% 
% dall_T = [T1_d T2_d T3_d T4_d T5_d]; % Combines each deployment
% dall_W = [W1_d W2_d W3_d W4_d W5_d];
% dall_C = [C1_d C2_d C3_d C4_d C5_d];
% dall_A = [A3_d A4_d A5_d];
% 
% [~,~,stats] = anova1(dall_T,deploysT);
% c = multcompare(stats);
% [~,~,stats] = anova1(dall_W,deploys);
% c = multcompare(stats);
% [~,~,stats] = anova1(dall_C,deploys);
% c = multcompare(stats);
% [~,~,stats] = anova1(dall_A,deploysA);
% c = multcompare(stats);
% 

