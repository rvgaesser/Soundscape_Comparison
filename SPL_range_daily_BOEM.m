%% I am editing this script in GitHub online to test the file for use in matlab
% now I have cloned the repository locally with Git Desktop and am going to
% try to update it on the remote repository

% Find Daily Range in SPL for each Deployment and Frequency Band

% using max in low frequency drastically increases the daily range - use
% quantile range to or min - 95 quantile to represent range in biological
% activity
% don't use min-max

close all
clear
load('daily_SPL.mat');

%% High Frequency Range
% 210 Rock 
%a = max(high_210d1,[],2); b = min(high_210d1,[],2); 
c = quantile(high_210d1,0.05,2); d = quantile(high_210d1,0.95,2);
rangeT1 = 10*log10(d)-10*log10(c); %Hmean_rangeT1 = mean(rangeT1);HSD_rangeT1 = std(rangeT1);

%a = max(high_210d2,[],2); b = min(high_210d2,[],2); 
c = quantile(high_210d2,0.05,2); d = quantile(high_210d2,0.95,2);
rangeT2 = 10*log10(d)-10*log10(c);% Hmean_rangeT2 = mean(rangeT2); HSD_rangeT2 = std(rangeT2);

% a =max(high_210d3,[],2); b = min(high_210d3,[],2); 
c = quantile(high_210d3,0.05,2); d = quantile(high_210d3,0.95,2);
rangeT3 = 10*log10(d)-10*log10(c);% Hmean_rangeT3 = mean(rangeT3);HSD_rangeT3 = std(rangeT3);

% a =max(high_210d4,[],2); b = min(high_210d4,[],2); 
c = quantile(high_210d4,0.05,2); d = quantile(high_210d4,0.95,2);
rangeT4 = 10*log10(d)-10*log10(c);% Hmean_rangeT4 = mean(rangeT4);HSD_rangeT4 = std(rangeT4);

% a =max(high_210d5,[],2); b = min(high_210d5,[],2); 
c = quantile(high_210d5,0.05,2); d = quantile(high_210d5,0.95,2);
rangeT5 = 10*log10(d)-10*log10(c);% Hmean_rangeT5 = mean(rangeT5);HSD_rangeT5 = std(rangeT5);

% West Rock
% a =max(high_westrd1,[],2); b = min(high_westrd1,[],2); 
c = quantile(high_westrd1,0.05,2); d = quantile(high_westrd1,0.95,2);
rangeW1 = 10*log10(d)-10*log10(c);% Hmean_rangeW1 = mean(rangeW1);HSD_rangeW1 = std(rangeW1);

% a =max(high_westrd2,[],2); b = min(high_westrd2,[],2); 
c = quantile(high_westrd2,0.05,2); d = quantile(high_westrd2,0.95,2);
rangeW2 = 10*log10(d)-10*log10(c);% Hmean_rangeW2 = mean(rangeW2);HSD_rangeW2 = std(rangeW2);

% a =max(high_westrd3,[],2); b = min(high_westrd3,[],2); 
c = quantile(high_westrd3,0.05,2); d = quantile(high_westrd3,0.95,2);
rangeW3 = 10*log10(d)-10*log10(c);% Hmean_rangeW3 = mean(rangeW3);HSD_rangeW3 = std(rangeW3);

% a =max(high_westrd4,[],2); b = min(high_westrd4,[],2); 
c = quantile(high_westrd4,0.05,2); d = quantile(high_westrd4,0.95,2);
rangeW4 = 10*log10(d)-10*log10(c);% Hmean_rangeW4 = mean(rangeW4);HSD_rangeW4 = std(rangeW4);

% a =max(high_westrd5,[],2); b = min(high_westrd5,[],2); 
c = quantile(high_westrd5,0.05,2); d = quantile(high_westrd5,0.95,2);
rangeW5 = 10*log10(d)-10*log10(c);% Hmean_rangeW5 = mean(rangeW5);HSD_rangeW5 = std(rangeW5);

% CSPAR
% a =max(high_cspard1,[],2); b = min(high_cspard1,[],2); 
c = quantile(high_cspard1,0.05,2); d = quantile(high_cspard1,0.95,2);
rangeC1 = 10*log10(d)-10*log10(c);% Hmean_rangeC1 = mean(rangeC1);HSD_rangeC1 = std(rangeC1);

% a =max(high_cspard2,[],2); b = min(high_cspard2,[],2); 
c = quantile(high_cspard2,0.05,2); d = quantile(high_cspard2,0.95,2);
rangeC2 = 10*log10(d)-10*log10(c);% Hmean_rangeC2 = mean(rangeC2);HSD_rangeC2 = std(rangeC2);

% a =max(high_cspard3,[],2); b = min(high_cspard3,[],2); 
c = quantile(high_cspard3,0.05,2); d = quantile(high_cspard3,0.95,2);
rangeC3 = 10*log10(d)-10*log10(c);% Hmean_rangeC3 = mean(rangeC3);HSD_rangeC3 = std(rangeC3);

% a =max(high_cspard4,[],2); b = min(high_cspard4,[],2); 
c = quantile(high_cspard4,0.05,2); d = quantile(high_cspard4,0.95,2);
rangeC4 = 10*log10(d)-10*log10(c);% Hmean_rangeC4 = mean(rangeC4);HSD_rangeC4 = std(rangeC4);

% a =max(high_cspard5,[],2); b = min(high_cspard5,[],2); 
c = quantile(high_cspard5,0.05,2); d = quantile(high_cspard5,0.95,2);
rangeC5 = 10*log10(d)-10*log10(c);% Hmean_rangeC5 = mean(rangeC5);HSD_rangeC5 = std(rangeC5);

% Aeolus
% a =max(high_aeolud3,[],2); b = min(high_aeolud3,[],2); 
c = quantile(high_aeolud3,0.05,2); d = quantile(high_aeolud3,0.95,2);
rangeA3 = 10*log10(d)-10*log10(c);% Hmean_rangeA3 = mean(rangeA3);HSD_rangeA3 = std(rangeA3);

% a =max(high_aeolud4,[],2); b = min(high_aeolud4,[],2); 
c = quantile(high_aeolud4,0.05,2); d = quantile(high_aeolud4,0.95,2);
rangeA4 = 10*log10(d)-10*log10(c);% Hmean_rangeA4 = mean(rangeA4);HSD_rangeA4 = std(rangeA4);

% a =max(high_aeolud5,[],2); b = min(high_aeolud5,[],2); 
c = quantile(high_aeolud5,0.05,2); d = quantile(high_aeolud5,0.95,2);
rangeA5 = 10*log10(d)-10*log10(c);% Hmean_rangeA5 = mean(rangeA5);HSD_rangeA5 = std(rangeA5);

% Make matrices the same size and test for normality only 1/18 not normal
rangeT1H = cat(1,rangeT1,NaN); %adtest(rangeT1H(:)) 
rangeT2H = cat(1,rangeT2,NaN,NaN,NaN);%adtest(rangeT2H(:))
rangeT3H = cat(1,rangeT3,NaN);%adtest(rangeT3H(:))
rangeT4H = cat(1,rangeT4,NaN,NaN);%adtest(rangeT4H(:))
rangeT5H = cat(1,rangeT5,NaN,NaN);%adtest(rangeT5H(:))
rangeW1H = cat(1,rangeW1,NaN);%adtest(rangeW1H(:))
rangeW3H = cat(1,rangeW3,NaN);%adtest(rangeW3H(:))
rangeW4H = cat(1,rangeW4,NaN,NaN);%adtest(rangeW4H(:))
rangeW5H = cat(1,rangeW5,NaN,NaN);%adtest(rangeW5H(:))
rangeC1H = cat(1,rangeC1,NaN);%adtest(rangeC1H(:))
rangeC3H = cat(1,rangeC3,NaN);%adtest(rangeC3H(:))
rangeC4H = cat(1,rangeC4,NaN,NaN);%adtest(rangeC4H(:))
rangeC5H = cat(1,rangeC5,NaN,NaN);%adtest(rangeC5H(:)) %not normal
rangeA3H = cat(1,rangeA3,NaN);%adtest(rangeA3H(:))
rangeA4H = cat(1,rangeA4,NaN,NaN);%adtest(rangeA4H(:))
rangeA5H = cat(1,rangeA5,NaN,NaN);%adtest(rangeA5H(:))
%adtest(rangeW2(:))
%adtest(rangeC2(:))
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 210RK and CSPAR all - not normal
range_T_all = [rangeT1H rangeT2H rangeT3H rangeT4H rangeT5H]; %adtest(range_T_all(:))
range_W_all = [rangeW1H rangeW2 rangeW3H rangeW4H rangeW5H]; %adtest(range_W_all(:))
range_C_all = [rangeC1H rangeC2 rangeC3H rangeC4H rangeC5H]; %adtest(range_C_all(:))
range_A_all = [rangeA3H rangeA4H rangeA5H]; %adtest(range_A_all(:))

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% comparing all sites and seasons rather than averages across sites 
range_high_all = [range_T_all range_W_all range_C_all range_A_all];
deploys_all = {'T1','T2','T3','T4','T5','W1','W2','W3','W4','W5','C1','C2','C3','C4','C5','A3','A4','A5',};
[~,~,stats] = kruskalwallis(range_high_all,deploys_all);multcompare(stats,'ctype','bonferroni');title('High Frequency Ranges');
[~,~,stats] = anova(range_high_all,deploys_all);multcompare(stats,'ctype','bonferroni');title('High Frequency Ranges');

range_all = [range_W_all range_C_all range_A_all];
mean_range_high = nanmean(range_all(:));
sd_range_high = nanstd(range_all(:));

mean_range_T_high = nanmean(range_T_all(:));
sd_range_T_high = nanstd(range_T_all(:));

%%%%%%%%%%%%%%%%%%%%%%%
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

%%%%%%%%%%%%%%%%%%%%
high_range_all = [range_T_all(:) range_W_all(:) range_C_all(:) cat(1,range_A_all(:),nan(18,1))];
sites = {'T','W','C','A'};
[~,~,stats] = kruskalwallis(high_range_all,sites);multcompare(stats,'ctype','bonferroni');title('Mean SPL daily range - all deploys');     % 210RK has sig. lower daily range than other sites


%% Low Frequency  - overwrites variables from high frequency
% a =max(low_210d1,[],2); b = min(low_210d1,[],2); 
c = quantile(low_210d1,0.05,2); d = quantile(low_210d1,0.95,2);
rangeT1L = 10*log10(d)-10*log10(c);% Hmean_rangeT1 = mean(rangeT1L);HSD_rangeT1 = std(rangeT1L);

% a =max(low_210d2,[],2); b = min(low_210d2,[],2);
c = quantile(low_210d2,0.05,2); d = quantile(low_210d2,0.95,2);
rangeT2L = 10*log10(d)-10*log10(c);% Hmean_rangeT2 = mean(rangeT2L); HSD_rangeT2 = std(rangeT2L);

% a =max(low_210d3,[],2); b = min(low_210d3,[],2); 
c = quantile(low_210d3,0.05,2); d = quantile(low_210d3,0.95,2);
rangeT3L = 10*log10(d)-10*log10(c);% Hmean_rangeT3 = mean(rangeT3L);HSD_rangeT3 = std(rangeT3L);

% a =max(low_210d4,[],2); b = min(low_210d4,[],2); 
c = quantile(low_210d4,0.05,2); d = quantile(low_210d4,0.95,2);
rangeT4L = 10*log10(d)-10*log10(c);% Hmean_rangeT4 = mean(rangeT4L);HSD_rangeT4 = std(rangeT4L);

% a =max(low_210d5,[],2); b = min(low_210d5,[],2); 
c = quantile(low_210d5,0.05,2); d = quantile(low_210d5,0.95,2);
rangeT5L = 10*log10(d)-10*log10(c);% Hmean_rangeT5 = mean(rangeT5L);HSD_rangeT5 = std(rangeT5L);

% West Rock
% a =max(low_westrd1,[],2); b = min(low_westrd1,[],2); 
c = quantile(low_westrd1,0.05,2); d = quantile(low_westrd1,0.95,2);
rangeW1L = 10*log10(d)-10*log10(c);% Hmean_rangeW1 = mean(rangeW1L);HSD_rangeW1 = std(rangeW1L);

% a =max(low_westrd2,[],2); b = min(low_westrd2,[],2); 
c = quantile(low_westrd2,0.05,2); d = quantile(low_westrd2,0.95,2);
rangeW2L = 10*log10(d)-10*log10(c);% Hmean_rangeW2 = mean(rangeW2L);HSD_rangeW2 = std(rangeW2L);

% a =max(low_westrd3,[],2); b = min(low_westrd3,[],2);
c = quantile(low_westrd3,0.05,2); d = quantile(low_westrd3,0.95,2);
rangeW3L = 10*log10(d)-10*log10(c);% Hmean_rangeW3 = mean(rangeW3L);HSD_rangeW3 = std(rangeW3L);

% a =max(low_westrd4,[],2); b = min(low_westrd4,[],2); 
c = quantile(low_westrd4,0.05,2); d = quantile(low_westrd4,0.95,2);
rangeW4L = 10*log10(d)-10*log10(c);% Hmean_rangeW4 = mean(rangeW4L);HSD_rangeW4 = std(rangeW4L);

% a =max(low_westrd5,[],2); b = min(low_westrd5,[],2); 
c = quantile(low_westrd5,0.05,2); d = quantile(low_westrd5,0.95,2);
rangeW5L = 10*log10(d)-10*log10(c);% Hmean_rangeW5 = mean(rangeW5L);HSD_rangeW5 = std(rangeW5L);

% CSPAR
% a =max(low_cspard1,[],2); b = min(low_cspard1,[],2); 
c = quantile(low_cspard1,0.05,2); d = quantile(low_cspard1,0.95,2);
rangeC1L = 10*log10(d)-10*log10(c);% Hmean_rangeC1 = mean(rangeC1L);HSD_rangeC1 = std(rangeC1L);

% a =max(low_cspard2,[],2); b = min(low_cspard2,[],2);
c = quantile(low_cspard2,0.05,2); d = quantile(low_cspard2,0.95,2);
rangeC2L = 10*log10(d)-10*log10(c);% Hmean_rangeC2 = mean(rangeC2L);HSD_rangeC2 = std(rangeC2L);

% a =max(low_cspard3,[],2); b = min(low_cspard3,[],2); 
c = quantile(low_cspard3,0.05,2); d = quantile(low_cspard3,0.95,2);
rangeC3L = 10*log10(d)-10*log10(c);% Hmean_rangeC3 = mean(rangeC3L);HSD_rangeC3 = std(rangeC3L);

% a =max(low_cspard4,[],2); b = min(low_cspard4,[],2);
c = quantile(low_cspard4,0.05,2); d = quantile(low_cspard4,0.95,2);
rangeC4L = 10*log10(d)-10*log10(c);% Hmean_rangeC4 = mean(rangeC4L);HSD_rangeC4 = std(rangeC4L);

% a =max(low_cspard5,[],2); b = min(low_cspard5,[],2); 
c = quantile(low_cspard5,0.05,2); d = quantile(low_cspard5,0.95,2);
rangeC5L = 10*log10(d)-10*log10(c);% Hmean_rangeC5 = mean(rangeC5L);HSD_rangeC5 = std(rangeC5L);

% Aeolus
% a =max(low_aeolud3,[],2); b = min(low_aeolud3,[],2); 
c = quantile(low_aeolud3,0.05,2); d = quantile(low_aeolud3,0.95,2);
rangeA3L = 10*log10(d)-10*log10(c);% Hmean_rangeA3 = mean(rangeA3L);HSD_rangeA3 = std(rangeA3L);

% a =max(low_aeolud4,[],2); b = min(low_aeolud4,[],2);
c = quantile(low_aeolud4,0.05,2); d = quantile(low_aeolud4,0.95,2);
rangeA4L = 10*log10(d)-10*log10(c);% Hmean_rangeA4 = mean(rangeA4L);HSD_rangeA4 = std(rangeA4L);

% a =max(low_aeolud5,[],2); b = min(low_aeolud5,[],2); 
c = quantile(low_aeolud5,0.05,2); d = quantile(low_aeolud5,0.95,2);
rangeA5L = 10*log10(d)-10*log10(c); % Hmean_rangeA5 = mean(rangeA5L);HSD_rangeA5 = std(rangeA5L);

% Make matrices the same size and test for normality (only 1/18 not normal)
rangeT1_l = cat(1,rangeT1L,NaN); %adtest(rangeT1_l(:)) % not normal
rangeT2_l = cat(1,rangeT2L,NaN,NaN,NaN);%adtest(rangeT2_l(:))
rangeT3_l = cat(1,rangeT3L,NaN);%adtest(rangeT3_l(:))
rangeT4_l = cat(1,rangeT4L,NaN,NaN);%adtest(rangeT4_l(:))
rangeT5_l = cat(1,rangeT5L,NaN,NaN);%adtest(rangeT5_l(:))
rangeW1_l = cat(1,rangeW1L,NaN);%adtest(rangeW1_l(:))
rangeW3_l = cat(1,rangeW3L,NaN);%adtest(rangeW3_l(:))
rangeW4_l = cat(1,rangeW4L,NaN,NaN);%adtest(rangeW4_l(:))
rangeW5_l = cat(1,rangeW5L,NaN,NaN);%adtest(rangeW5_l(:))
rangeC1_l = cat(1,rangeC1L,NaN);%adtest(rangeC1_l(:))
rangeC3_l = cat(1,rangeC3L,NaN);%adtest(rangeC3_l(:))
rangeC4_l = cat(1,rangeC4L,NaN,NaN);%adtest(rangeC4_l(:))
rangeC5_l = cat(1,rangeC5L,NaN,NaN);%adtest(rangeC5_l(:)) 
rangeA3_l = cat(1,rangeA3L,NaN);%adtest(rangeA3_l(:))
rangeA4_l = cat(1,rangeA4L,NaN,NaN);%adtest(rangeA4_l(:))
rangeA5_l = cat(1,rangeA5L,NaN,NaN);%adtest(rangeA5_l(:))
%adtest(rangeW2L(:))
%adtest(rangeC2L(:))

% 210RK all not normal
range_T_all_l = [rangeT1_l rangeT2_l rangeT3_l rangeT4_l rangeT5_l]; %adtest(range_T_all_l(:)) % not normal
range_W_all_l = [rangeW1_l rangeW2L rangeW3_l rangeW4_l rangeW5_l]; %adtest(range_W_all_l(:))
range_C_all_l = [rangeC1_l rangeC2L rangeC3_l rangeC4_l rangeC5_l]; %adtest(range_C_all_l(:))
range_A_all_l = [rangeA3_l rangeA4_l rangeA5_l]; %adtest(range_A_all_l(:))

% Combined site and season comparisons
range_TWA_all = [range_T_all_l range_W_all_l range_C_all_l range_A_all_l];
deploys_all = {'T1','T2','T3','T4','T5','W1','W2','W3','W4','W5','C1','C2','C3','C4','C5','A3','A4','A5',};
[~,~,stats] = kruskalwallis(range_TWA_all,deploys_all);multcompare(stats,'ctype','bonferroni');title('Low Frequency Ranges');
[~,~,stats] = anova(range_TWA_all,deploys_all);multcompare(stats,'ctype','bonferroni');title('Low Frequency Ranges');


range_all_low = [range_T_all_l range_W_all_l range_C_all_l range_A_all_l];
mean_range_low = nanmean(range_all_low(:));
sd_range_low = nanstd(range_all_low(:));

deploys = {'1','2','3','4','5'};
A_deploys = {'3','4','5'};

% Kruskal Wallis Test with Bonferroni correction 
[~,~,stats] = kruskalwallis(range_T_all_l,deploys);multcompare(stats,'ctype','bonferroni'); title('210RK low Frequency Daily Range');
[~,~,stats] = kruskalwallis(range_W_all_l,deploys);multcompare(stats,'ctype','bonferroni'); title('WESTR low Frequency Daily Range');
[~,~,stats] = kruskalwallis(range_C_all_l,deploys);multcompare(stats,'ctype','bonferroni'); title('CSPAR low Frequency Daily Range');
[~,~,stats] = kruskalwallis(range_A_all_l,A_deploys);multcompare(stats,'ctype','bonferroni'); title('AEOLU low Frequency Daily Range');
% CSPAR D4 and 5 are different

% ANOVA also not significantly different
[~,~,stats] = anova1(range_T_all_l,deploys);multcompare(stats); title('210RK low Frequency Daily Range');
[~,~,stats] = anova1(range_W_all_l,deploys);multcompare(stats); title('WESTR low Frequency Daily Range');
[~,~,stats] = anova1(range_C_all_l,deploys);multcompare(stats); title('CSPAR low Frequency Daily Range');
[~,~,stats] = anova1(range_A_all_l,A_deploys);multcompare(stats); title('AEOLU low Frequency Daily Range');

% reporting mean range +/- SD for each site
range_210RK_l = nanmean(range_T_all_l(:));sd_210RK_l = nanstd(range_T_all_l(:));
range_westr_l = nanmean(range_W_all_l(:));sd_westr_l = nanstd(range_W_all_l(:));
range_cspar_l = nanmean(range_C_all_l(:));sd_cspar_l = nanstd(range_C_all_l(:));
range_aeolu_l = nanmean(range_A_all_l(:));sd_aeolu_l = nanstd(range_A_all_l(:));

low_range_all = [range_T_all_l(:) range_W_all_l(:) range_C_all_l(:) cat(1,range_A_all_l(:),nan(18,1))];
sites = {'T','W','C','A'};
[~,~,stats] = anova1(low_range_all,sites);multcompare(stats,'ctype','bonferroni');title('Mean SPL daily range - all deploys'); 

low_range_TWA = [range_T_all_l(:) range_W_all_l(:) cat(1,range_A_all_l(:),nan(18,1))];
nanmean(low_range_TWA(:)); nanstd(low_range_TWA(:));
