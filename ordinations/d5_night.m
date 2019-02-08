% Deploy 3

% updated this to include the actual night based on photoperiod

clear
load('suncycle_data/avg_suncycle.mat');

tbins = 0:0.25:23.75;
night_d5 = cat(2,tbins(find(tbins==d5_sSET):96),tbins(1:find(tbins==d5_dawn-.25)));

load('210RK_D5/results_ST04_FIVE_210.mat');
matdays = matdays(5:676);
poavg = poavg(:,5:676);
t=matdays-(4/24); 
[~,~,~,hr,mn,~]=datevec(t); 
hrmn=hr+mn/60; 
b = NaN(16385,7,37);
for i = 1:length(night_d5) 
    a = find(hrmn == night_d5(i)); 
    b(:,:,i) = poavg(:,a); 
end
d5_210 = squeeze(mean(b,2)); %avg po each file time over deployment
N = 4; szA = size(d5_210);
B = arrayfun(@(k) mean(d5_210(:,k:min(szA(2),k+N-1)),2), 1:N:szA(2), 'un', 0); % calc mean each hour or 4 files
mspec_210RK_night5 = [B{:}]; %avg spectra each hr
% 1st col is 1hr pre-sSET, last col is 1hr post-sRISE

load('WESTR_D5/results_ST01_FIVE_WESTR.mat'); %(5:676)
matdays = matdays(5:676); 
poavg = poavg(:,5:676);
t=matdays-(4/24); 
[~,~,~,hr,mn,~]=datevec(t); 
hrmn=hr+mn/60; 
b = NaN(16385,7,37);
for i = 1:length(night_d5) 
    a = find(hrmn == night_d5(i)); 
    b(:,:,i) = poavg(:,a);  
end
d5_west = squeeze(mean(b,2)); 
N = 4; szA = size(d5_west);
B = arrayfun(@(k) mean(d5_west(:,k:min(szA(2),k+N-1)),2), 1:N:szA(2), 'un', 0); 
mspec_WESTR_night5 = [B{:}];

load('CSPAR_D5/results_ST03_FIVE_CSPAR.mat'); %(5:676)
matdays = matdays(5:676); 
poavg = poavg(:,5:676);
t=matdays-(4/24); 
[~,~,~,hr,mn,~]=datevec(t); 
hrmn=hr+mn/60;
b = NaN(16385,7,37);
for i = 1:length(night_d5) 
    a = find(hrmn == night_d5(i)); 
    b(:,:,i) = poavg(:,a);  
end
d5_spar = squeeze(mean(b,2)); 
N = 4; szA = size(d5_spar);
B = arrayfun(@(k) mean(d5_spar(:,k:min(szA(2),k+N-1)),2), 1:N:szA(2), 'un', 0); 
mspec_CSPAR_night5 = [B{:}];

load('AEOLU_D5/results_ST02_FIVE_AEOLU.mat'); %(5:676)
matdays = matdays(5:676); 
poavg = poavg(:,5:676);
t=matdays-(4/24); 
[~,~,~,hr,mn,~]=datevec(t); 
hrmn=hr+mn/60; 
b = NaN(16385,7,37);
for i = 1:length(night_d5) 
    a = find(hrmn == night_d5(i)); 
    b(:,:,i) = poavg(:,a); 
end
d5_aeolus = squeeze(mean(b,2)); 
N = 4; szA = size(d5_aeolus);
B = arrayfun(@(k) mean(d5_aeolus(:,k:min(szA(2),k+N-1)),2), 1:N:szA(2), 'un', 0); 
mspec_AEOLU_night5 = [B{:}];

%save d5_mspec.mat mspec_210RK_night5 mspec_CSPAR_night5 mspec_WESTR_night5 mspec_AEOLU_night5


%% Combining the matrices

mspec_d5_night = [mspec_210RK_night5 mspec_WESTR_night5 mspec_CSPAR_night5 mspec_AEOLU_night5];

%% Calculating Df matrix 

c = 1;
f1 = 100;
f2 = 2000;
for i = 1:40
    S1 = mspec_d5_night(:,i);
    for j = i+1:40
        S2 = mspec_d5_night(:,j);
        Df(c) = sound_Df(S1,S2,f,f1,f2,0); 
    c=c+1;
    end
end

Df_square_d5 = squareform(Df); 
% figure; imagesc(Df_square_d5);

%% Ordination

% NMDS
[Y5,stress5] = mdscale(Df_square_d5,2);
g5_site = {'T','T','T','T','T','T','T','T','T','T','W','W','W','W','W','W','W','W','W','W','S','S','S','S','S','S','S','S','S','S','A','A','A','A','A','A','A','A','A','A'};
clr = [1 0 0;0 1 0;0 1 1;.5 0 1];
figure; gscatter(Y5(:,1),Y5(:,2),{g5_site},clr,'.',25);
set(gca,'FontSize',18);
legend('210 Rock','West Rock','Spar','Aeolus','location','northeast'); title('August 2016');
xlabel('NMS 1'); ylabel('NMS 2');
print('-bestfit','d5_ord','-dpdf')

% Shepard Plot
% distances = pdist(Y5);figure;
% plot(Df,distances,'bo',[0 1],[0 1],'k-');
% xlabel('Dissimilarities');ylabel('Distances');
% title('D5 night - Shepard Plot'); 

