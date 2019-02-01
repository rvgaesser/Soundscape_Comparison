% Deploy 3

% updated this to include the actual night based on photoperiod

clear
load('suncycle_data/avg_suncycle.mat');

tbins = 0:0.25:23.75;
night_d1 = cat(2,tbins(find(tbins==d1_sSET):96),tbins(1:find(tbins==d1_dawn-.25)));
night_d2 = cat(2,tbins(find(tbins==d2_sSET):96),tbins(1:find(tbins==d2_dawn-.25)));
night_d3 = cat(2,tbins(find(tbins==d3_sSET):96),tbins(1:find(tbins==d3_dawn-.25)));
night_d4 = cat(2,tbins(find(tbins==d4_sSET):96),tbins(1:find(tbins==d4_dawn-.25)));
night_d5 = cat(2,tbins(find(tbins==d5_sSET):96),tbins(1:find(tbins==d5_dawn-.25)));

load('210RK_D3/results_ST01_THREE_210.mat');
matdays = matdays(37:804);
poavg = poavg(:,37:804);
t=matdays-(4/24); 
[~,~,~,hr,mn,~]=datevec(t); 
hrmn=hr+mn/60; 
b = NaN(16385,8,37);
for i = 1:length(night_d3) 
    a = find(hrmn == night_d3(i)); 
    b(:,:,i) = poavg(:,a); 
end
d3_210 = squeeze(mean(b,2)); %avg po each file time over deployment
N = 4; szA = size(d3_210);
B = arrayfun(@(k) mean(d3_210(:,k:min(szA(2),k+N-1)),2), 1:N:szA(2), 'un', 0); % calc mean each hour or 4 files
mspec_210RK_night3 = [B{:}]; %avg spectra each hr
% 1st col is 1hr pre-sSET, last col is 1hr post-sRISE

load('WESTR_D3/results_ST02_THREE_WESTR.mat');
matdays = matdays(25:792); 
poavg = poavg(:,25:792);
t=matdays-(4/24); 
[~,~,~,hr,mn,~]=datevec(t); 
hrmn=hr+mn/60; 
b = NaN(16385,8,37);
for i = 1:length(night_d3) 
    a = find(hrmn == night_d3(i)); 
    b(:,:,i) = poavg(:,a);  
end
d3_west = squeeze(mean(b,2)); 
N = 4; szA = size(d3_west);
B = arrayfun(@(k) mean(d3_west(:,k:min(szA(2),k+N-1)),2), 1:N:szA(2), 'un', 0); 
mspec_WESTR_night3 = [B{:}];

load('CSPAR_D3/results_ST03_THREE_CSPAR.mat');
matdays = matdays(25:792); 
poavg = poavg(:,25:792);
t=matdays-(4/24); 
[~,~,~,hr,mn,~]=datevec(t); 
hrmn=hr+mn/60;
b = NaN(16385,8,37);
for i = 1:length(night_d3) 
    a = find(hrmn == night_d3(i)); 
    b(:,:,i) = poavg(:,a);  
end
d3_spar = squeeze(mean(b,2)); 
N = 4; szA = size(d3_spar);
B = arrayfun(@(k) mean(d3_spar(:,k:min(szA(2),k+N-1)),2), 1:N:szA(2), 'un', 0); 
mspec_CSPAR_night3 = [B{:}];

load('AEOLU_D3/results_ST04_THREE_AEOLU.mat');
matdays = matdays(25:792); 
poavg = poavg(:,25:792);
t=matdays-(4/24); 
[~,~,~,hr,mn,~]=datevec(t); 
hrmn=hr+mn/60; 
b = NaN(16385,8,37);
for i = 1:length(night_d3) 
    a = find(hrmn == night_d3(i)); 
    b(:,:,i) = poavg(:,a); 
end
d3_aeolus = squeeze(mean(b,2)); 
N = 4; szA = size(d3_aeolus);
B = arrayfun(@(k) mean(d3_aeolus(:,k:min(szA(2),k+N-1)),2), 1:N:szA(2), 'un', 0); 
mspec_AEOLU_night3 = [B{:}];

%save d3_mspec.mat mspec_210RK_night3 mspec_CSPAR_night3 mspec_WESTR_night3 mspec_AEOLU_night3


%% Combining the matrices

mspec_d3_night = [mspec_210RK_night3 mspec_WESTR_night3 mspec_CSPAR_night3 mspec_AEOLU_night3];

%% Calculating Df matrix 

c = 1;
f1 = 100;
f2 = 2000;
for i = 1:40
    S1 = mspec_d3_night(:,i);
    for j = i+1:40
        S2 = mspec_d3_night(:,j);
        Df(c) = sound_Df(S1,S2,f,f1,f2,0); 
    c=c+1;
    end
end

Df_square_d3 = squareform(Df); 
%figure; imagesc(Df_square_d3);

%% Ordination

% NMDS
[Y3,stress] = mdscale(Df_square_d3,2);
g3_site = {'T','T','T','T','T','T','T','T','T','T','W','W','W','W','W','W','W','W','W','W','S','S','S','S','S','S','S','S','S','S','A','A','A','A','A','A','A','A','A','A'};
clr = [1 0 0;0 1 0;0 1 1;.5 0 1];
figure; gscatter(Y3(:,1),Y3(:,2),{g3_site},clr,'.',25);set(gca,'FontSize',18);
legend('210 Rock','West Rock','Spar','Aeolus','location','southwest'); title('April 2016');
xlabel('NMS 1'); ylabel('NMS 2');
print('-bestfit','d3_ord','-dpdf')

% Shepard Plot
% distances = pdist(Y3);figure;
% plot(Df,distances,'bo',[0 1],[0 1],'k-');
% xlabel('Dissimilarities');ylabel('Distances');
% title('D3 night - Shepard Plot');

