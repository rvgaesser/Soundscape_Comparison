% Find Daily Range in SPL for each Deployment and Frequency Band

close all
clear
load('daily_SPL.mat');

%% High Frequency Range
% 210 Rock  
c = quantile(high_210d1,0.05,2); d = quantile(high_210d1,0.95,2);rangeT1 = 10*log10(d)-10*log10(c); 
c = quantile(high_210d2,0.05,2); d = quantile(high_210d2,0.95,2);rangeT2 = 10*log10(d)-10*log10(c);
c = quantile(high_210d3,0.05,2); d = quantile(high_210d3,0.95,2);rangeT3 = 10*log10(d)-10*log10(c);
c = quantile(high_210d4,0.05,2); d = quantile(high_210d4,0.95,2);rangeT4 = 10*log10(d)-10*log10(c);
c = quantile(high_210d5,0.05,2); d = quantile(high_210d5,0.95,2);rangeT5 = 10*log10(d)-10*log10(c);
% West Rock
c = quantile(high_westrd1,0.05,2); d = quantile(high_westrd1,0.95,2);rangeW1 = 10*log10(d)-10*log10(c);
c = quantile(high_westrd2,0.05,2); d = quantile(high_westrd2,0.95,2);rangeW2 = 10*log10(d)-10*log10(c);
c = quantile(high_westrd3,0.05,2); d = quantile(high_westrd3,0.95,2);rangeW3 = 10*log10(d)-10*log10(c);
c = quantile(high_westrd4,0.05,2); d = quantile(high_westrd4,0.95,2);rangeW4 = 10*log10(d)-10*log10(c);
c = quantile(high_westrd5,0.05,2); d = quantile(high_westrd5,0.95,2);rangeW5 = 10*log10(d)-10*log10(c);
% CSPAR
c = quantile(high_cspard1,0.05,2); d = quantile(high_cspard1,0.95,2);rangeC1 = 10*log10(d)-10*log10(c);
c = quantile(high_cspard2,0.05,2); d = quantile(high_cspard2,0.95,2);rangeC2 = 10*log10(d)-10*log10(c);
c = quantile(high_cspard3,0.05,2); d = quantile(high_cspard3,0.95,2);rangeC3 = 10*log10(d)-10*log10(c);
c = quantile(high_cspard4,0.05,2); d = quantile(high_cspard4,0.95,2);rangeC4 = 10*log10(d)-10*log10(c);
c = quantile(high_cspard5,0.05,2); d = quantile(high_cspard5,0.95,2);rangeC5 = 10*log10(d)-10*log10(c);
% Aeolus 
c = quantile(high_aeolud3,0.05,2); d = quantile(high_aeolud3,0.95,2);rangeA3 = 10*log10(d)-10*log10(c);
c = quantile(high_aeolud4,0.05,2); d = quantile(high_aeolud4,0.95,2);rangeA4 = 10*log10(d)-10*log10(c);
c = quantile(high_aeolud5,0.05,2); d = quantile(high_aeolud5,0.95,2);rangeA5 = 10*log10(d)-10*log10(c);

% Make vectors all the same length
rangeT1H = cat(1,rangeT1,NaN); 
rangeT2H = cat(1,rangeT2,NaN,NaN,NaN);
rangeT3H = cat(1,rangeT3,NaN);
rangeT4H = cat(1,rangeT4,NaN,NaN);
rangeT5H = cat(1,rangeT5,NaN,NaN);
rangeW1H = cat(1,rangeW1,NaN);
rangeW3H = cat(1,rangeW3,NaN);
rangeW4H = cat(1,rangeW4,NaN,NaN);
rangeW5H = cat(1,rangeW5,NaN,NaN);
rangeC1H = cat(1,rangeC1,NaN);
rangeC3H = cat(1,rangeC3,NaN);
rangeC4H = cat(1,rangeC4,NaN,NaN);
rangeC5H = cat(1,rangeC5,NaN,NaN);
rangeA3H = cat(1,rangeA3,NaN);
rangeA4H = cat(1,rangeA4,NaN,NaN);
rangeA5H = cat(1,rangeA5,NaN,NaN);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 210RK and CSPAR all - not normal
range_T_all = [rangeT1H rangeT2H rangeT3H rangeT4H rangeT5H]; 
range_W_all = [rangeW1H rangeW2 rangeW3H rangeW4H rangeW5H]; 
range_C_all = [rangeC1H rangeC2 rangeC3H rangeC4H rangeC5H]; 
range_A_all = [rangeA3H rangeA4H rangeA5H];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% comparing all sites and seasons rather than averages across sites 
range_high_all = [range_T_all range_W_all range_C_all range_A_all];
deploys_all = {'T1','T2','T3','T4','T5','W1','W2','W3','W4','W5','C1','C2','C3','C4','C5','A3','A4','A5'};

% Testing assumptions - does not meet assumptions 
figure;histogram(range_high_all);
p = vartestn(range_high_all,'TestType','LeveneQuadratic')

%% Kruskal Wallis 
[~,~,stats] = kruskalwallis(range_high_all,deploys_all);multcompare(stats,'ctype','bonferroni');title('High Frequency Ranges');

deploys = {'1','2','3','4','5'};
A_deploys = {'3','4','5'};

% Kruskal Wallis Test with Bonferroni correction
[~,~,stats] = kruskalwallis(range_T_all,deploys);multcompare(stats,'ctype','bonferroni'); title('210RK High Frequency Daily Range');
[~,~,stats] = kruskalwallis(range_W_all,deploys);multcompare(stats,'ctype','bonferroni'); title('WESTR High Frequency Daily Range');
[~,~,stats] = kruskalwallis(range_C_all,deploys);multcompare(stats,'ctype','bonferroni'); title('CSPAR High Frequency Daily Range');
[~,~,stats] = kruskalwallis(range_A_all,A_deploys);multcompare(stats,'ctype','bonferroni'); title('AEOLU High Frequency Daily Range');
        % CSPAR is technically sig. dif. between D2 and D4

% reporting mean range +/- SD for each site
range_210RK_h = nanmean(range_T_all(:));sd_210RK_h = nanstd(range_T_all(:));
range_westr_h = nanmean(range_W_all(:));sd_westr_h = nanstd(range_W_all(:));
range_cspar_h = nanmean(range_C_all(:));sd_cspar_h = nanstd(range_C_all(:));
range_aeolu_h = nanmean(range_A_all(:));sd_aeolu_h = nanstd(range_A_all(:));

% Combined all deploys within site to evaluate site differences
high_range_all = [range_T_all(:) range_W_all(:) range_C_all(:) cat(1,range_A_all(:),nan(18,1))];
sites = {'T','W','C','A'};
[~,~,stats] = kruskalwallis(high_range_all,sites);multcompare(stats,'ctype','bonferroni');title('Mean SPL daily range - all deploys');     % 210RK has sig. lower daily range than other sites

% reporting values based on Kruskal Wallis Test
range_all = [range_W_all range_C_all range_A_all];
mean_range_high = nanmean(range_all(:));
sd_range_high = nanstd(range_all(:));

mean_range_T_high = nanmean(range_T_all(:));
sd_range_T_high = nanstd(range_T_all(:));

%% Low Frequency  
c = quantile(low_210d1,0.05,2); d = quantile(low_210d1,0.95,2);rangeT1L = 10*log10(d)-10*log10(c);
c = quantile(low_210d2,0.05,2); d = quantile(low_210d2,0.95,2);rangeT2L = 10*log10(d)-10*log10(c);
c = quantile(low_210d3,0.05,2); d = quantile(low_210d3,0.95,2);rangeT3L = 10*log10(d)-10*log10(c);
c = quantile(low_210d4,0.05,2); d = quantile(low_210d4,0.95,2);rangeT4L = 10*log10(d)-10*log10(c);
c = quantile(low_210d5,0.05,2); d = quantile(low_210d5,0.95,2);rangeT5L = 10*log10(d)-10*log10(c);
% West Rock
c = quantile(low_westrd1,0.05,2); d = quantile(low_westrd1,0.95,2);rangeW1L = 10*log10(d)-10*log10(c);
c = quantile(low_westrd2,0.05,2); d = quantile(low_westrd2,0.95,2);rangeW2L = 10*log10(d)-10*log10(c);
c = quantile(low_westrd3,0.05,2); d = quantile(low_westrd3,0.95,2);rangeW3L = 10*log10(d)-10*log10(c);
c = quantile(low_westrd4,0.05,2); d = quantile(low_westrd4,0.95,2);rangeW4L = 10*log10(d)-10*log10(c);
c = quantile(low_westrd5,0.05,2); d = quantile(low_westrd5,0.95,2);rangeW5L = 10*log10(d)-10*log10(c);
% CSPAR
c = quantile(low_cspard1,0.05,2); d = quantile(low_cspard1,0.95,2);rangeC1L = 10*log10(d)-10*log10(c);
c = quantile(low_cspard2,0.05,2); d = quantile(low_cspard2,0.95,2);rangeC2L = 10*log10(d)-10*log10(c);
c = quantile(low_cspard3,0.05,2); d = quantile(low_cspard3,0.95,2);rangeC3L = 10*log10(d)-10*log10(c);
c = quantile(low_cspard4,0.05,2); d = quantile(low_cspard4,0.95,2);rangeC4L = 10*log10(d)-10*log10(c);
c = quantile(low_cspard5,0.05,2); d = quantile(low_cspard5,0.95,2);rangeC5L = 10*log10(d)-10*log10(c);
% Aeolus
c = quantile(low_aeolud3,0.05,2); d = quantile(low_aeolud3,0.95,2);rangeA3L = 10*log10(d)-10*log10(c);
c = quantile(low_aeolud4,0.05,2); d = quantile(low_aeolud4,0.95,2);rangeA4L = 10*log10(d)-10*log10(c);
c = quantile(low_aeolud5,0.05,2); d = quantile(low_aeolud5,0.95,2);rangeA5L = 10*log10(d)-10*log10(c); 

% Make vectors the same size
rangeT1_l = cat(1,rangeT1L,NaN); 
rangeT2_l = cat(1,rangeT2L,NaN,NaN,NaN);
rangeT3_l = cat(1,rangeT3L,NaN);
rangeT4_l = cat(1,rangeT4L,NaN,NaN);
rangeT5_l = cat(1,rangeT5L,NaN,NaN);
rangeW1_l = cat(1,rangeW1L,NaN);
rangeW3_l = cat(1,rangeW3L,NaN);
rangeW4_l = cat(1,rangeW4L,NaN,NaN);
rangeW5_l = cat(1,rangeW5L,NaN,NaN);
rangeC1_l = cat(1,rangeC1L,NaN);
rangeC3_l = cat(1,rangeC3L,NaN);
rangeC4_l = cat(1,rangeC4L,NaN,NaN);
rangeC5_l = cat(1,rangeC5L,NaN,NaN);
rangeA3_l = cat(1,rangeA3L,NaN);
rangeA4_l = cat(1,rangeA4L,NaN,NaN);
rangeA5_l = cat(1,rangeA5L,NaN,NaN);

% combine seasons within site
range_T_all_l = [rangeT1_l rangeT2_l rangeT3_l rangeT4_l rangeT5_l]; 
range_W_all_l = [rangeW1_l rangeW2L rangeW3_l rangeW4_l rangeW5_l]; 
range_C_all_l = [rangeC1_l rangeC2L rangeC3_l rangeC4_l rangeC5_l]; 
range_A_all_l = [rangeA3_l rangeA4_l rangeA5_l]; 

% Combined site and season comparisons
range_low_all = [range_T_all_l range_W_all_l range_C_all_l range_A_all_l];
deploys_all = {'T1','T2','T3','T4','T5','W1','W2','W3','W4','W5','C1','C2','C3','C4','C5','A3','A4','A5',};

% Testing assumptions
figure; histogram(range_low_all);
p = vartestn(range_low_all,'TestType','LeveneQuadratic')

[~,~,stats] = kruskalwallis(range_low_all,deploys_all);multcompare(stats,'ctype','bonferroni');title('Low Frequency Ranges');

deploys = {'1','2','3','4','5'};
A_deploys = {'3','4','5'};

% Kruskal Wallis Test with Bonferroni correction 
[~,~,stats] = kruskalwallis(range_T_all_l,deploys);multcompare(stats,'ctype','bonferroni'); title('210RK low Frequency Daily Range');
[~,~,stats] = kruskalwallis(range_W_all_l,deploys);multcompare(stats,'ctype','bonferroni'); title('WESTR low Frequency Daily Range');
[~,~,stats] = kruskalwallis(range_C_all_l,deploys);multcompare(stats,'ctype','bonferroni'); title('CSPAR low Frequency Daily Range');
[~,~,stats] = kruskalwallis(range_A_all_l,A_deploys);multcompare(stats,'ctype','bonferroni'); title('AEOLU low Frequency Daily Range');
% CSPAR D4 and 5 are different

% reporting mean range +/- SD for each site
range_210RK_l = nanmean(range_T_all_l(:));sd_210RK_l = nanstd(range_T_all_l(:));
range_westr_l = nanmean(range_W_all_l(:));sd_westr_l = nanstd(range_W_all_l(:));
range_cspar_l = nanmean(range_C_all_l(:));sd_cspar_l = nanstd(range_C_all_l(:));
range_aeolu_l = nanmean(range_A_all_l(:));sd_aeolu_l = nanstd(range_A_all_l(:));

% Spar has significantly higher daily range than other sites
low_range_all = [range_T_all_l(:) range_W_all_l(:) range_C_all_l(:) cat(1,range_A_all_l(:),nan(18,1))];
sites = {'T','W','C','A'};
[~,~,stats] = kruskalwallis(low_range_all,sites);multcompare(stats,'ctype','bonferroni');title('Mean SPL daily range - all deploys'); 
 
low_range_TWA = [range_T_all_l(:) range_W_all_l(:) cat(1,range_A_all_l(:),nan(18,1))];
mean_TWA = nanmean(low_range_TWA(:)); sd_TWA = nanstd(low_range_TWA(:));

% reporting overall mean across all sites and deployments
mean_range_low = nanmean(range_low_all(:));
sd_range_low = nanstd(range_low_all(:));
