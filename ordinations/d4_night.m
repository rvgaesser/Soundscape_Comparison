% Deploy 3

% updated this to include the actual night based on photoperiod

clear
load('suncycle_data/avg_suncycle.mat');

tbins = 0:0.25:23.75;
night_d4 = cat(2,tbins(find(tbins==d4_sSET):96),tbins(1:find(tbins==d4_dawn-.25)));

load('210RK_D4/results_ST01_FOUR_210.mat'); % (1:672)
matdays = matdays(1:672);
poavg = poavg(:,1:672);
t=matdays-(4/24); 
[~,~,~,hr,mn,~]=datevec(t); 
hrmn=hr+mn/60; 
b = NaN(16385,7,32);
for i = 1:length(night_d4) 
    a = find(hrmn == night_d4(i)); 
    b(:,:,i) = poavg(:,a); 
end
d4_210 = squeeze(mean(b,2)); %avg po each file time over deployment
N = 4; szA = size(d4_210);
B = arrayfun(@(k) mean(d4_210(:,k:min(szA(2),k+N-1)),2), 1:N:szA(2), 'un', 0); % calc mean each hour or 4 files
mspec_210RK_night4 = [B{:}]; %avg spectra each hr
% 1st col is 1hr pre-sSET, last col is 1hr post-sRISE

load('WESTR_D4/results_ST02_FOUR_WESTR.mat'); %(1:672)
matdays = matdays(1:672); 
poavg = poavg(:,1:672);
t=matdays-(4/24); 
[~,~,~,hr,mn,~]=datevec(t); 
hrmn=hr+mn/60; 
b = NaN(16385,7,32);
for i = 1:length(night_d4) 
    a = find(hrmn == night_d4(i)); 
    b(:,:,i) = poavg(:,a);  
end
d4_west = squeeze(mean(b,2)); 
N = 4; szA = size(d4_west);
B = arrayfun(@(k) mean(d4_west(:,k:min(szA(2),k+N-1)),2), 1:N:szA(2), 'un', 0); 
mspec_WESTR_night4 = [B{:}];

load('CSPAR_D4/results_ST03_FOUR_CSPAR.mat');%(1:672)
matdays = matdays(1:672); 
poavg = poavg(:,1:672);
t=matdays-(4/24); 
[~,~,~,hr,mn,~]=datevec(t); 
hrmn=hr+mn/60;
b = NaN(16385,7,32);
for i = 1:length(night_d4) 
    a = find(hrmn == night_d4(i)); 
    b(:,:,i) = poavg(:,a);  
end
d4_spar = squeeze(mean(b,2)); 
N = 4; szA = size(d4_spar);
B = arrayfun(@(k) mean(d4_spar(:,k:min(szA(2),k+N-1)),2), 1:N:szA(2), 'un', 0); 
mspec_CSPAR_night4 = [B{:}];

load('AEOLU_D4/results_ST04_FOUR_AEOLU.mat'); %(5:676)
matdays = matdays(5:676); 
poavg = poavg(:,5:676);
t=matdays-(4/24); 
[~,~,~,hr,mn,~]=datevec(t); 
hrmn=hr+mn/60; 
b = NaN(16385,7,32);
for i = 1:length(night_d4) 
    a = find(hrmn == night_d4(i)); 
    b(:,:,i) = poavg(:,a); 
end
d4_aeolus = squeeze(mean(b,2)); 
N = 4; szA = size(d4_aeolus);
B = arrayfun(@(k) mean(d4_aeolus(:,k:min(szA(2),k+N-1)),2), 1:N:szA(2), 'un', 0); 
mspec_AEOLU_night4 = [B{:}];

%save d4_mspec.mat mspec_210RK_night4 mspec_CSPAR_night4 mspec_WESTR_night4 mspec_AEOLU_night4


%% Combining the matrices

mspec_d4_night = [mspec_210RK_night4 mspec_WESTR_night4 mspec_CSPAR_night4 mspec_AEOLU_night4];

%% Calculating Df matrix 

c = 1;
f1 = 100;
f2 = 2000;
for i = 1:32
    S1 = mspec_d4_night(:,i);
    for j = i+1:32
        S2 = mspec_d4_night(:,j);
        Df(c) = sound_Df(S1,S2,f,f1,f2,0); 
    c=c+1;
    end
end

Df_square_d4 = squareform(Df); 
figure; imagesc(Df_square_d4);

%% Ordination

% NMDS
[Y4,stress4] = mdscale(Df_square_d4,2);
g4_site = {'T','T','T','T','T','T','T','T','W','W','W','W','W','W','W','W','S','S','S','S','S','S','S','S','A','A','A','A','A','A','A','A'};
clr = [1 0 0;0 1 0;0 1 1;.5 0 1];
figure; gscatter(Y4(:,1),Y4(:,2),{g4_site},clr,'.',25);
set(gca,'FontSize',18);
legend('210 Rock','West Rock','Spar','Aeolus','location','southeast'); title('June 2016');
xlabel('NMS 1'); ylabel('NMS 2');
print('-bestfit','d4_ord','-dpdf')

% Shepard Plot
% distances = pdist(Y4);figure;
% plot(Df,distances,'bo',[0 1],[0 1],'k-');
% xlabel('Dissimilarities');ylabel('Distances');
% title('D4 night - Shepard Plot'); 

