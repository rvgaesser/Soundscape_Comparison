% Deploy 1

% updated this to include the actual night based on photoperiod

clear
load('suncycle_data/avg_suncycle.mat');

tbins = 0:0.25:23.75;
night_d1 = cat(2,tbins(find(tbins==d1_sSET):96),tbins(1:find(tbins==d1_dawn-.25)));
night_d2 = cat(2,tbins(find(tbins==d2_sSET):96),tbins(1:find(tbins==d2_dawn-.25)));
night_d3 = cat(2,tbins(find(tbins==d3_sSET):96),tbins(1:find(tbins==d3_dawn-.25)));
night_d4 = cat(2,tbins(find(tbins==d4_sSET):96),tbins(1:find(tbins==d4_dawn-.25)));
night_d5 = cat(2,tbins(find(tbins==d5_sSET):96),tbins(1:find(tbins==d5_dawn-.25)));

load('210RK_D1/results_ST01_One_210RK.mat'); %(13:780) 
matdays = matdays(13:780);
poavg = poavg(:,13:780);
t=matdays-(4/24); 
[~,~,~,hr,mn,~]=datevec(t); 
hrmn=hr+mn/60; 
b = NaN(16385,8,47);
for i = 1:length(night_d1) 
    a = find(hrmn == night_d1(i)); 
    b(:,:,i) = poavg(:,a); 
end
d1_210 = squeeze(mean(b,2)); %avg po each file time over deployment
N = 4; szA = size(d1_210);
B = arrayfun(@(k) mean(d1_210(:,k:min(szA(2),k+N-1)),2), 1:N:szA(2), 'un', 0); % calc mean each hour or 4 files
mspec_210RK_night1 = [B{:}]; %avg spectra each hr

load('WESTR_D1/results_ST02_ONE_WESTR.mat'); %(13:780)
matdays = matdays(13:780); 
poavg = poavg(:,13:780);
t=matdays-(4/24); 
[~,~,~,hr,mn,~]=datevec(t); 
hrmn=hr+mn/60; 
b = NaN(16385,8,47);
for i = 1:length(night_d1) 
    a = find(hrmn == night_d1(i)); 
    b(:,:,i) = poavg(:,a);  
end
d1_west = squeeze(mean(b,2)); 
N = 4; szA = size(d1_west);
B = arrayfun(@(k) mean(d1_west(:,k:min(szA(2),k+N-1)),2), 1:N:szA(2), 'un', 0); 
mspec_WESTR_night1 = [B{:}];

load('CSPAR_D1/results_ST03_ONE_CSPAR.mat'); %(1:768)
matdays = matdays(1:768); 
poavg = poavg(:,1:768);
t=matdays-(4/24); 
[~,~,~,hr,mn,~]=datevec(t); 
hrmn=hr+mn/60;
b = NaN(16385,8,47);
for i = 1:length(night_d1) 
    a = find(hrmn == night_d1(i)); 
    b(:,:,i) = poavg(:,a);  
end
d1_spar = squeeze(mean(b,2)); 
N = 4; szA = size(d1_spar);
B = arrayfun(@(k) mean(d1_spar(:,k:min(szA(2),k+N-1)),2), 1:N:szA(2), 'un', 0); 
mspec_CSPAR_night1 = [B{:}];

%save d1_mspec.mat mspec_210RK_night1 mspec_CSPAR_night1 mspec_WESTR_night1 f

%% Combining the matrices

%mspec_d1_night = [mspec_210RK_night1 mspec_WESTR_night1 mspec_CSPAR_night1];


%% Calculating Df matrix 

c = 1;
f1 = 100;
f2 = 2000;
for i = 1:36
    S1 = mspec_d1_night(:,i);
    for j = i+1:36
        S2 = mspec_d1_night(:,j);
        Df(c) = sound_Df(S1,S2,f,f1,f2,0); 
    c=c+1;
    end
end

Df_square_d1 = squareform(Df); 
figure; imagesc(Df_square_d1);

%% Ordination

% NMDS
[Y1,stress2] = mdscale(Df_square_d1,2);
% figure; scatter(Y(:,1),Y(:,2));
%scree plot
% stress_list = [stress1,stress2,stress3,stress4,stress5,stress6];
% dimensions = [1,2,3,4,5,6];
% figure;plot(dimensions,stress_list);

% Grouping
g1_site = {'T','T','T','T','T','T','T','T','T','T','T','T','W','W','W','W','W','W','W','W','W','W','W','W','S','S','S','S','S','S','S','S','S','S','S','S'};
clr = [1 0 0;0 1 0;0 1 1;.5 0 1];
msize = [1];
figure; gscatter(Y1(:,1),Y1(:,2),{g1_site},clr,'.',25);
set(gca,'FontSize',18);
legend('210 Rock','West Rock','Spar','location','southwest'); 
title('November 2015','FontSize',18);
xlabel('NMS 1','FontSize',18); ylabel('NMS 2','FontSize',18);
print('-bestfit','d1_ord','-dpdf')


% Shepard Plot
distances = pdist(Y1);figure;
plot(Df,distances,'bo',[0 1],[0 1],'k-');
xlabel('Dissimilarities');ylabel('Distances');
title('D1 night - Shepard Plot');

