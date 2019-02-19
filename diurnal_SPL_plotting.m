% Calculates average SPL for each 15min file in each frequency band for
% every full day of the deployment.

% Plots SPL on a color scale against 24hrs to show daily and seasonal variation in temporal SPL patterns. 

%% Fish Specific Patterns

clear

day6 = 1:6;
day7 = 1:7;
day8 = 1:8;
day9 = 1:9;

% 210RK D1
load('210RK_D1/results_ST01_One_210RK.mat');
matdays = matdays(13:780);
poavg = poavg(:,13:780);
tbins=0:0.25:23.75;
low = find(f>=100 & f<=2000);
toadfish = find(f>170 & f<=380);
tomtate =find(f>=600&f<=700); 
high = find(f>=7000 & f<= 20000);
low_210d1 = NaN(8,96);
tom_210d1 = NaN(8,96);
toad_210d1 = NaN(8,96);
high_210d1 = NaN(8,96);
t=matdays-(4/24);
[~,~,~,hr,mn,~]=datevec(t); 
hrmn=hr+mn/60;
for i = 1:length(tbins) 
    a = find(hrmn == tbins(i)); 
    low_210d1(:,i) = sum(poavg(low,a));
    tom_210d1(:,i) = sum(poavg(tomtate,a)); 
    toad_210d1(:,i) = sum(poavg(toadfish,a));
    high_210d1(:,i) = sum(poavg(high,a));
end

% 210RK D2 
% Trimmed to include only full days
load('210RK_D2/results_ST01_TWO_210.mat'); 
matdays = cat(1,matdays(29:124),matdays(304:783));
poavg = cat(2,poavg(:,29:124),poavg(:,304:783));
t=matdays-(4/24); 
[~,~,~,hr,mn,~]=datevec(t); 
hrmn=hr+mn/60; 
low_210d2 = NaN(6,96);
tom_210d2 = NaN(6,96);
toad_210d2 = NaN(6,96);
high_210d2 = NaN(6,96);
for i = 1:length(tbins) 
    a = find(hrmn == tbins(i)); 
    low_210d2(:,i) = sum(poavg(low,a));
    tom_210d2(:,i) = sum(poavg(tomtate,a)); 
    toad_210d2(:,i) = sum(poavg(toadfish,a));
    high_210d2(:,i) = sum(poavg(high,a));
end



% 210RK D3
load('210RK_D3/results_ST01_THREE_210.mat');
matdays = matdays(37:804);
poavg = poavg(:,37:804);
t=matdays-(4/24);  
[~,~,~,hr,mn,~]=datevec(t);
hrmn=hr+mn/60;
low_210d3 = NaN(8,96);
tom_210d3 = NaN(8,96);
toad_210d3 = NaN(8,96);
high_210d3 = NaN(8,96);
for i = 1:length(tbins)
    a = find(hrmn == tbins(i));
    low_210d3(:,i) = sum(poavg(low,a)); 
    tom_210d3(:,i) = sum(poavg(tomtate,a)); 
    toad_210d3(:,i) = sum(poavg(toadfish,a));
    high_210d3(:,i) = sum(poavg(high,a));
end

% 210RK D4
load('210RK_D4/results_ST01_FOUR_210.mat');
matdays = matdays(1:672); 
poavg = poavg(:,1:672);
t=matdays-(4/24); 
[~,~,~,hr,mn,~]=datevec(t); 
hrmn=hr+mn/60; 
low_210d4 = NaN(7,96);
tom_210d4 = NaN(7,96);
toad_210d4 = NaN(7,96);
high_210d4 = NaN(7,96);
for i = 1:length(tbins)
    a = find(hrmn == tbins(i));
    low_210d4(:,i) = sum(poavg(low,a));
    tom_210d4(:,i) = sum(poavg(tomtate,a)); 
    toad_210d4(:,i) = sum(poavg(toadfish,a));
    high_210d4(:,i) = sum(poavg(high,a));
end

%210RK D5
load('210RK_D5/results_ST04_FIVE_210.mat');
matdays = matdays(5:676); 
poavg = poavg(:,5:676);
t=matdays-(4/24); 
[~,~,~,hr,mn,~]=datevec(t); 
hrmn=hr+mn/60; 
low_210d5 = NaN(7,96);
tom_210d5 = NaN(7,96);
toad_210d5 = NaN(7,96);
high_210d5 = NaN(7,96);
for i = 1:length(tbins)
    a = find(hrmn == tbins(i));
    low_210d5(:,i) = sum(poavg(low,a));
    tom_210d5(:,i) = sum(poavg(tomtate,a)); 
    toad_210d5(:,i) = sum(poavg(toadfish,a));
    high_210d5(:,i) = sum(poavg(high,a));
end

% WESTR D1
load('WESTR_D1/results_ST02_ONE_WESTR.mat'); %(13:780)
matdays = matdays(13:780);
poavg = poavg(:,13:780);
tbins=0:0.25:23.75; 
low_westrd1 = NaN(8,96);
tom_westrd1 = NaN(8,96);
toad_westrd1 = NaN(8,96);
high_westrd1 = NaN(8,96);
t=matdays-(4/24);
[~,~,~,hr,mn,~]=datevec(t); 
hrmn=hr+mn/60;
for i = 1:length(tbins) 
    a = find(hrmn == tbins(i)); 
    low_westrd1(:,i) = sum(poavg(low,a));
    tom_westrd1(:,i) = sum(poavg(tomtate,a)); 
    toad_westrd1(:,i) = sum(poavg(toadfish,a));
    high_westrd1(:,i) = sum(poavg(high,a));
end

% WESTR D2 

load('WESTR_D2/results_ST02_TWO_WESTR.mat'); %(13:876)
matdays = matdays(13:876); 
poavg = poavg(:,13:876);
t=matdays-(4/24); 
[~,~,~,hr,mn,~]=datevec(t); 
hrmn=hr+mn/60; 
low_westrd2 = NaN(9,96);
tom_westrd2 = NaN(9,96);
toad_westrd2 = NaN(9,96);
high_westrd2 = NaN(9,96);
for i = 1:length(tbins) 
    a = find(hrmn == tbins(i)); 
    low_westrd2(:,i) = sum(poavg(low,a));
    tom_westrd2(:,i) = sum(poavg(tomtate,a)); 
    toad_westrd2(:,i) = sum(poavg(toadfish,a));
    high_westrd2(:,i) = sum(poavg(high,a));
end



% WESTR D3
load('WESTR_D3/results_ST02_THREE_WESTR.mat'); %(25:792)
matdays = matdays(25:792);
poavg = poavg(:,25:792);
t=matdays-(4/24);  
[~,~,~,hr,mn,~]=datevec(t);
hrmn=hr+mn/60;
low_westrd3 = NaN(8,96);
tom_westrd3 = NaN(8,96);
toad_westrd3 = NaN(8,96);
high_westrd3 = NaN(8,96);
for i = 1:length(tbins)
    a = find(hrmn == tbins(i));
    low_westrd3(:,i) = sum(poavg(low,a));
    tom_westrd3(:,i) = sum(poavg(tomtate,a)); 
    toad_westrd3(:,i) = sum(poavg(toadfish,a));
    high_westrd3(:,i) = sum(poavg(high,a));

end

% WESTR D4
load('WESTR_D4/results_ST02_FOUR_WESTR.mat'); %(1:672)
matdays = matdays(1:672); 
poavg = poavg(:,1:672);
t=matdays-(4/24); 
[~,~,~,hr,mn,~]=datevec(t); 
hrmn=hr+mn/60; 
low_westrd4 = NaN(7,96);
tom_westrd4 = NaN(7,96);
toad_westrd4 = NaN(7,96);
high_westrd4 = NaN(7,96);
for i = 1:length(tbins)
    a = find(hrmn == tbins(i));
    low_westrd4(:,i) = sum(poavg(low,a));
    tom_westrd4(:,i) = sum(poavg(tomtate,a)); 
    toad_westrd4(:,i) = sum(poavg(toadfish,a));
    high_westrd4(:,i) = sum(poavg(high,a));
end

% WESTR D5
load('WESTR_D5/results_ST01_FIVE_WESTR.mat'); %(5:676)
matdays = matdays(5:676); 
poavg = poavg(:,5:676);
t=matdays-(4/24); 
[~,~,~,hr,mn,~]=datevec(t); 
hrmn=hr+mn/60; 
low_westrd5 = NaN(7,96);
tom_westrd5 = NaN(7,96);
toad_westrd5 = NaN(7,96);
high_westrd5 = NaN(7,96);
for i = 1:length(tbins)
    a = find(hrmn == tbins(i));
    low_westrd5(:,i) = sum(poavg(low,a));
    tom_westrd5(:,i) = sum(poavg(tomtate,a)); 
    toad_westrd5(:,i) = sum(poavg(toadfish,a));
    high_westrd5(:,i) = sum(poavg(high,a));
end

% CSPAR D1
load('CSPAR_D1/results_ST03_ONE_CSPAR.mat'); %(1:768)
matdays = matdays(1:768);
poavg = poavg(:,1:768);
low_cspard1 = NaN(8,96);
tom_cspard1 = NaN(8,96);
toad_cspard1 = NaN(8,96);
high_cspard1 = NaN(8,96);
t=matdays-(4/24);
[~,~,~,hr,mn,~]=datevec(t); 
hrmn=hr+mn/60;
for i = 1:length(tbins) 
    a = find(hrmn == tbins(i)); 
    low_cspard1(:,i) = sum(poavg(low,a));
    tom_cspard1(:,i) = sum(poavg(tomtate,a)); 
    toad_cspard1(:,i) = sum(poavg(toadfish,a));
    high_cspard1(:,i) = sum(poavg(high,a));
end

% CSPAR D2 
load('CSPAR_D2/results_ST03_TWO_CSPAR.mat'); %(13:876)
matdays = matdays(13:876); 
poavg = poavg(:,13:876);
t=matdays-(4/24); 
[~,~,~,hr,mn,~]=datevec(t); 
hrmn=hr+mn/60; 
low_cspard2 = NaN(9,96);
toad_cspard2 = NaN(9,96);
tom_cspard2 = NaN(9,96);
high_cspard2 = NaN(9,96);
for i = 1:length(tbins) 
    a = find(hrmn == tbins(i)); 
    low_cspard2(:,i) = sum(poavg(low,a));
    tom_cspard2(:,i) = sum(poavg(tomtate,a)); 
    toad_cspard2(:,i) = sum(poavg(toadfish,a));
    high_cspard2(:,i) = sum(poavg(high,a));
end



% CSPAR D3
load('CSPAR_D3/results_ST03_THREE_CSPAR.mat'); %(25:792)
matdays = matdays(25:792);
poavg = poavg(:,25:792);
t=matdays-(4/24);  
[~,~,~,hr,mn,~]=datevec(t);
hrmn=hr+mn/60;
low_cspard3 = NaN(8,96);
tom_cspard3 = NaN(8,96);
toad_cspard3 = NaN(8,96);
high_cspard3 = NaN(8,96);
for i = 1:length(tbins)
    a = find(hrmn == tbins(i));
    low_cspard3(:,i) = sum(poavg(low,a));
    tom_cspard3(:,i) = sum(poavg(tomtate,a)); 
    toad_cspard3(:,i) = sum(poavg(toadfish,a));
    high_cspard3(:,i) = sum(poavg(high,a));
end

% CSPAR D4
load('CSPAR_D4/results_ST03_FOUR_CSPAR.mat');%(1:672)
matdays = matdays(1:672); 
poavg = poavg(:,1:672);
t=matdays-(4/24); 
[~,~,~,hr,mn,~]=datevec(t); 
hrmn=hr+mn/60; 
low_cspard4 = NaN(7,96);
tom_cspard4 = NaN(7,96);
toad_cspard4 = NaN(7,96);
high_cspard4 = NaN(7,96);
for i = 1:length(tbins)
    a = find(hrmn == tbins(i));
    low_cspard4(:,i) = sum(poavg(low,a));
    tom_cspard4(:,i) = sum(poavg(tomtate,a)); 
    toad_cspard4(:,i) = sum(poavg(toadfish,a));
    high_cspard4(:,i) = sum(poavg(high,a));
end

% CSPAR D5
load('CSPAR_D5/results_ST03_FIVE_CSPAR.mat'); %(5:676)
matdays = matdays(5:676); 
poavg = poavg(:,5:676);
t=matdays-(4/24); 
[~,~,~,hr,mn,~]=datevec(t); 
hrmn=hr+mn/60; 
low_cspard5 = NaN(7,96);
tom_cspard5 = NaN(7,96);
toad_cspard5 = NaN(7,96);
high_cspard5 = NaN(7,96);
for i = 1:length(tbins)
    a = find(hrmn == tbins(i));
    low_cspard5(:,i) = sum(poavg(low,a));
    tom_cspard5(:,i) = sum(poavg(tomtate,a)); 
    toad_cspard5(:,i) = sum(poavg(toadfish,a));
    high_cspard5(:,i) = sum(poavg(high,a));
end

% AEOLU D3
load('AEOLU_D3/results_ST04_THREE_AEOLU.mat'); %(25:792)
matdays = matdays(25:792);
poavg = poavg(:,25:792);
t=matdays-(4/24);  
[~,~,~,hr,mn,~]=datevec(t);
hrmn=hr+mn/60;
low_aeolud3 = NaN(8,96);
tom_aeolud3 = NaN(8,96);
toad_aeolud3 = NaN(8,96);
high_aeolud3 = NaN(8,96);
for i = 1:length(tbins)
    a = find(hrmn == tbins(i));
    low_aeolud3(:,i) = sum(poavg(low,a));
    tom_aeolud3(:,i) = sum(poavg(tomtate,a)); 
    toad_aeolud3(:,i) = sum(poavg(toadfish,a));
    high_aeolud3(:,i) = sum(poavg(high,a));
end

% AEOLU D4
load('AEOLU_D4/results_ST04_FOUR_AEOLU.mat'); %(5:676)
matdays = matdays(5:676); 
poavg = poavg(:,5:676);
t=matdays-(4/24); 
[~,~,~,hr,mn,~]=datevec(t); 
hrmn=hr+mn/60; 
low_aeolud4 = NaN(7,96);
tom_aeolud4 = NaN(7,96);
toad_aeolud4 = NaN(7,96);
high_aeolud4 = NaN(7,96);
for i = 1:length(tbins)
    a = find(hrmn == tbins(i));
    low_aeolud4(:,i) = sum(poavg(low,a));
    tom_aeolud4(:,i) = sum(poavg(tomtate,a)); 
    toad_aeolud4(:,i) = sum(poavg(toadfish,a));
    high_aeolud4(:,i) = sum(poavg(high,a));
end

% AEOLU D5
load('AEOLU_D5/results_ST02_FIVE_AEOLU.mat'); %(5:676)
matdays = matdays(5:676); 
poavg = poavg(:,5:676);
t=matdays-(4/24); 
[~,~,~,hr,mn,~]=datevec(t); 
hrmn=hr+mn/60; 
low_aeolud5 = NaN(7,96);
tom_aeolud5 = NaN(7,96);
toad_aeolud5 = NaN(7,96);
high_aeolud5 = NaN(7,96);
for i = 1:length(tbins)
    a = find(hrmn == tbins(i));
    low_aeolud5(:,i) = sum(poavg(low,a));
    tom_aeolud5(:,i) = sum(poavg(tomtate,a)); 
    toad_aeolud5(:,i) = sum(poavg(toadfish,a));
    high_aeolud5(:,i) = sum(poavg(high,a));
end


% save daily_SPL.mat low_210d1 low_210d2 low_210d3 low_210d4 low_210d5 low_aeolud3 low_aeolud4 low_aeolud5 low_cspard1 low_cspard2 low_cspard3 low_cspard4 low_cspard5 low_westrd1 low_westrd2 low_westrd3 low_westrd4 low_westrd5 high_210d1 high_210d2 high_210d3 high_210d4 high_210d5 high_aeolud3 high_aeolud4 high_aeolud5 high_cspard1 high_cspard2 high_cspard3 high_cspard4 high_cspard5 high_westrd1 high_westrd2 high_westrd3 high_westrd4 high_westrd5
% save daily_SPL_high.mat high_210d1 high_210d2 high_210d3 high_210d4 high_210d5 high_aeolud3 high_aeolud4 high_aeolud5 high_cspard1 high_cspard2 high_cspard3 high_cspard4 high_cspard5 high_westrd1 high_westrd2 high_westrd3 high_westrd4 high_westrd5 high_210d1 high_210d2 high_210d3 high_210d4 high_210d5 high_aeolud3 high_aeolud4 high_aeolud5 high_cspard1 high_cspard2 high_cspard3 high_cspard4 high_cspard5 high_westrd1 high_westrd2 high_westrd3 high_westrd4 high_westrd5


%% Combining matrices and plotting

nan_sep = NaN(1,96);

% Low Frequency
low_210RK_all = [low_210d1;nan_sep;low_210d2;nan_sep;low_210d3;nan_sep;low_210d4;nan_sep;low_210d5];
low_WESTR_all = [low_westrd1;nan_sep;low_westrd2;nan_sep;low_westrd3;nan_sep;low_westrd4;nan_sep;low_westrd5];
low_CSPAR_all = [low_cspard1;nan_sep;low_cspard2;nan_sep;low_cspard3;nan_sep;low_cspard4;nan_sep;low_cspard5];
low_AEOLU_all = [low_aeolud3;nan_sep;low_aeolud4;nan_sep;low_aeolud5];

figure; 
subplot(2,2,1);pcolor(tbins,1:40,10*log10(low_210RK_all));caxis([80,125]);title('210 Rock');ylabel('Deployment');shading flat;set(gca,'ydir','reverse');
subplot(2,2,2);pcolor(tbins,1:43,10*log10(low_WESTR_all));caxis([80,125]);title('West Rock');shading flat;set(gca,'ydir','reverse');
subplot(2,2,3);pcolor(tbins,1:43,10*log10(low_CSPAR_all));caxis([80,125]);title('Spar');xlabel('Hour of the Day');ylabel('Deployment');shading flat;set(gca,'ydir','reverse');
subplot(2,2,4);pcolor(tbins,1:24,10*log10(low_AEOLU_all));caxis([80,125]);title('Aeolus');xlabel('Hour of the Day');shading flat; set(gca,'ydir','reverse');

% High Frequency 
high_210RK_all = [high_210d1;nan_sep;high_210d2;nan_sep;high_210d3;nan_sep;high_210d4;nan_sep;high_210d5];
high_WESTR_all = [high_westrd1;nan_sep;high_westrd2;nan_sep;high_westrd3;nan_sep;high_westrd4;nan_sep;high_westrd5];
high_CSPAR_all = [high_cspard1;nan_sep;high_cspard2;nan_sep;high_cspard3;nan_sep;high_cspard4;nan_sep;high_cspard5];
high_AEOLU_all = [high_aeolud3;nan_sep;high_aeolud4;nan_sep;high_aeolud5];

figure;
subplot(2,2,1);pcolor(tbins,1:40,10*log10(high_210RK_all));caxis([95,115]);title('210 Rock');ylabel('Deloyment');shading flat;set(gca,'ydir','reverse');
subplot(2,2,2);pcolor(tbins,1:43,10*log10(high_WESTR_all));caxis([95,115]);title('West Rock');shading flat;set(gca,'ydir','reverse');
subplot(2,2,3);pcolor(tbins,1:43,10*log10(high_CSPAR_all));caxis([95,115]);title('Spar');xlabel('Hour of the Day');ylabel('Deployment');shading flat;set(gca,'ydir','reverse');
subplot(2,2,4);pcolor(tbins,1:24,10*log10(high_AEOLU_all));caxis([95,115]);title('Aeolus');xlabel('Hour of the Day');shading flat;set(gca,'ydir','reverse');
figure_high_func(gca);
print('-bestfit','BestFitFigure','-dpdf')


%% Plotting

% % 210RK
% figure;
% subplot(5,1,1);imagesc(tbins,day8,10*log10(low_210d1));caxis([70,115]);
% subplot(5,1,2);imagesc(tbins,day6,10*log10(low_210d2));caxis([70 115]);
% subplot(5,1,3);imagesc(tbins,day8,10*log10(low_210d3));caxis([70,115]);
% subplot(5,1,4);imagesc(tbins,day7,10*log10(low_210d4));caxis([70,115]);
% subplot(5,1,5);imagesc(tbins,day7,10*log10(low_210d5));caxis([70,115]);
% mtit('Low Freq 210RK')
% 
% % figure;
% % subplot(5,1,1);imagesc(tbins,day8,10*log10(tom_210d1));caxis([70,115]);
% % subplot(5,1,2);imagesc(tbins,day6,10*log10(tom_210d2));caxis([70 115]);
% % subplot(5,1,3);imagesc(tbins,day8,10*log10(tom_210d3));caxis([70,115]);
% % subplot(5,1,4);imagesc(tbins,day7,10*log10(tom_210d4));caxis([70,115]);
% % subplot(5,1,5);imagesc(tbins,day7,10*log10(tom_210d5));caxis([70,115]);
% % mtit('Tomtate 210RK')
% % 
% % figure;
% % subplot(5,1,1);imagesc(tbins,day8,10*log10(toad_210d1));caxis([70,115]);
% % subplot(5,1,2);imagesc(tbins,day6,10*log10(toad_210d2));caxis([70 115]);
% % subplot(5,1,3);imagesc(tbins,day8,10*log10(toad_210d3));caxis([70,115]);
% % subplot(5,1,4);imagesc(tbins,day7,10*log10(toad_210d4));caxis([70,115]);
% % subplot(5,1,5);imagesc(tbins,day7,10*log10(toad_210d5));caxis([70,115]);
% % mtit('Toadfish 210RK');
% 
% figure;
% subplot(5,1,1);imagesc(tbins,day8,10*log10(high_210d1));caxis([100,115]);
% subplot(5,1,2);imagesc(tbins,day6,10*log10(high_210d2));caxis([100,115]);
% subplot(5,1,3);imagesc(tbins,day8,10*log10(high_210d3));caxis([100,115]);
% subplot(5,1,4);imagesc(tbins,day7,10*log10(high_210d4));caxis([100,115]);
% subplot(5,1,5);imagesc(tbins,day7,10*log10(high_210d5));caxis([100,115]);
% mtit('Inverts 210RK');
% 
% % West Rock
% figure; 
% subplot(5,1,1);imagesc(tbins,day8,10*log10(low_westrd1));caxis([70,115]);
% subplot(5,1,2);imagesc(tbins,day9,10*log10(low_westrd2));caxis([70,115]);
% subplot(5,1,3);imagesc(tbins,day8,10*log10(low_westrd3));caxis([70,115]);
% subplot(5,1,4);imagesc(tbins,day7,10*log10(low_westrd4));caxis([70,115]);
% subplot(5,1,5);imagesc(tbins,day7,10*log10(low_westrd5));caxis([70,115]);
% mtit('Low Freq West Rock');
% 
% % figure; 
% % subplot(5,1,1);imagesc(tbins,day8,10*log10(tom_westrd1));caxis([70,115]);
% % subplot(5,1,2);imagesc(tbins,day9,10*log10(tom_westrd2));caxis([70,115]);
% % subplot(5,1,3);imagesc(tbins,day8,10*log10(tom_westrd3));caxis([70,115]);
% % subplot(5,1,4);imagesc(tbins,day7,10*log10(tom_westrd4));caxis([70,115]);
% % subplot(5,1,5);imagesc(tbins,day7,10*log10(tom_westrd5));caxis([70,115]);
% % mtit('Tomtate West Rock');
% % 
% % figure;
% % subplot(5,1,1);imagesc(tbins,day8,10*log10(toad_westrd1));caxis([70,115]);
% % subplot(5,1,2);imagesc(tbins,day9,10*log10(toad_westrd2));caxis([70,115]);
% % subplot(5,1,3);imagesc(tbins,day8,10*log10(toad_westrd3));caxis([70,115]);
% % subplot(5,1,4);imagesc(tbins,day7,10*log10(toad_westrd4));caxis([70,115]);
% % subplot(5,1,5);imagesc(tbins,day7,10*log10(toad_westrd5));caxis([70,115]);
% % mtit('Toadfish West Rock');
% 
% figure;
% subplot(5,1,1);imagesc(tbins,day8,10*log10(high_westrd1));caxis([100,115]);
% subplot(5,1,2);imagesc(tbins,day9,10*log10(high_westrd2));caxis([100,115]);
% subplot(5,1,3);imagesc(tbins,day8,10*log10(high_westrd3));caxis([100,115]);
% subplot(5,1,4);imagesc(tbins,day7,10*log10(high_westrd4));caxis([100,115]);
% subplot(5,1,5);imagesc(tbins,day7,10*log10(high_westrd5));caxis([100,115]);
% mtit('Inverts West Rock');
% 
% % CSPAR
% figure;
% subplot(5,1,1);imagesc(tbins,day8,10*log10(low_cspard1));caxis([70,115]);
% subplot(5,1,2);imagesc(tbins,day9,10*log10(low_cspard2));caxis([70,115]);
% subplot(5,1,3);imagesc(tbins,day8,10*log10(low_cspard3));caxis([70,115]);
% subplot(5,1,4);imagesc(tbins,day7,10*log10(low_cspard4));caxis([70,115]);
% subplot(5,1,5);imagesc(tbins,day7,10*log10(low_cspard5));caxis([70,115]);
% mtit('Low Freq Spar')
% 
% % figure;
% % subplot(5,1,1);imagesc(tbins,day8,10*log10(tom_cspard1));caxis([70,115]);
% % subplot(5,1,2);imagesc(tbins,day9,10*log10(tom_cspard2));caxis([70,115]);
% % subplot(5,1,3);imagesc(tbins,day8,10*log10(tom_cspard3));caxis([70,115]);
% % subplot(5,1,4);imagesc(tbins,day7,10*log10(tom_cspard4));caxis([70,115]);
% % subplot(5,1,5);imagesc(tbins,day7,10*log10(tom_cspard5));caxis([70,115]);
% % mtit('Tomtate Spar')
% % 
% % figure;
% % subplot(5,1,1);imagesc(tbins,day8,10*log10(toad_cspard1));caxis([70,115]);
% % subplot(5,1,2);imagesc(tbins,day9,10*log10(toad_cspard2));caxis([70,115]);
% % subplot(5,1,3);imagesc(tbins,day8,10*log10(toad_cspard3));caxis([70,115]);
% % subplot(5,1,4);imagesc(tbins,day7,10*log10(toad_cspard4));caxis([70,115]);
% % subplot(5,1,5);imagesc(tbins,day7,10*log10(toad_cspard5));caxis([70,115]);
% % mtit('Toadfish Spar')
% 
% figure;
% subplot(5,1,1);imagesc(tbins,day8,10*log10(high_cspard1));caxis([100,115]);
% subplot(5,1,2);imagesc(tbins,day9,10*log10(high_cspard2));caxis([100,115]);
% subplot(5,1,3);imagesc(tbins,day8,10*log10(high_cspard3));caxis([100,115]);
% subplot(5,1,4);imagesc(tbins,day7,10*log10(high_cspard4));caxis([100,115]);
% subplot(5,1,5);imagesc(tbins,day7,10*log10(high_cspard5));caxis([100,115]);
% mtit('Inverts Spar')
% 
% % AEOLUS
% figure;
% subplot(3,1,1);imagesc(tbins,day8,10*log10(low_aeolud3));caxis([70,115]);
% subplot(3,1,2);imagesc(tbins,day7,10*log10(low_aeolud4));caxis([70,115]);
% subplot(3,1,3);imagesc(tbins,day7,10*log10(low_aeolud5));caxis([70,115]);
% mtit('Low Freq Aeolus');
% 
% % figure;
% % subplot(3,1,1);imagesc(tbins,day8,10*log10(tom_aeolud3));caxis([70,115]);
% % subplot(3,1,2);imagesc(tbins,day7,10*log10(tom_aeolud4));caxis([70,115]);
% % subplot(3,1,3);imagesc(tbins,day7,10*log10(tom_aeolud5));caxis([70,115]);
% % mtit('Tomtate Aeolus');
% % 
% % figure;
% % subplot(3,1,1);imagesc(tbins,day8,10*log10(toad_aeolud3));caxis([70,115]);
% % subplot(3,1,2);imagesc(tbins,day7,10*log10(toad_aeolud4));caxis([70,115]);
% % subplot(3,1,3);imagesc(tbins,day7,10*log10(toad_aeolud5));caxis([70,115]);
% % mtit('Toadfish Aeolus');
% 
% figure;
% subplot(3,1,1);imagesc(tbins,day8,10*log10(high_aeolud3));caxis([100,115]);
% subplot(3,1,2);imagesc(tbins,day7,10*log10(high_aeolud4));caxis([100,115]);
% subplot(3,1,3);imagesc(tbins,day7,10*log10(high_aeolud5));caxis([100,115]);
% mtit('Inverts Aeolus');


% % Toadfish D3
% figure;
% subplot(4,1,1);imagesc(tbins,day8,10*log10(toad_210d3));caxis([70,115]);
% subplot(4,1,2);imagesc(tbins,day8,10*log10(toad_westrd3));caxis([70,115]);
% subplot(4,1,3);imagesc(tbins,day8,10*log10(toad_cspard3));caxis([70,115]);
% subplot(4,1,4);imagesc(tbins,day8,10*log10(toad_aeolud3));caxis([70,115]);
% 
% % D4
% figure;
% subplot(4,1,1);imagesc(tbins,day7,10*log10(toad_210d4));caxis([70,115]);
% subplot(4,1,2);imagesc(tbins,day7,10*log10(toad_westrd4));caxis([70,115]);
% subplot(4,1,3);imagesc(tbins,day7,10*log10(toad_cspard4));caxis([70,115]);
% subplot(4,1,4);imagesc(tbins,day7,10*log10(tom_aeolud4));caxis([70,115]);

%save tomtate_daily.mat tom_210d1 tom_210d3  tom_210d4  tom_210d5 tom_westrd1 tom_westrd2 tom_westrd3 tom_westrd4 tom_westrd5 tom_cspard1 tom_cspard2 tom_cspard3 tom_cspard4 tom_cspard5 tom_aeolud3 tom_aeolud4 tom_aeolud5
%save toadfish_daily.mat toad_210d1 toad_210d3  toad_210d4  toad_210d5 toad_westrd1 toad_westrd2 toad_westrd3 toad_westrd4 toad_westrd5 toad_cspard1 toad_cspard2 toad_cspard3 toad_cspard4 toad_cspard5 toad_aeolud3 toad_aeolud4 toad_aeolud5
%save high_daily.mat high_210d1 high_210d3  high_210d4  high_210d5 high_westrd1 high_westrd2 high_westrd3 high_westrd4 high_westrd5 high_cspard1 high_cspard2 high_cspard3 high_cspard4 high_cspard5 high_aeolud3 high_aeolud4 high_aeolud5

