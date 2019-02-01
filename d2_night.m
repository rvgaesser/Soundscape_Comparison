% Deploy 2

% updated this to include the actual night based on photoperiod

clear
load('suncycle_data/avg_suncycle.mat');

tbins = 0:0.25:23.75;
night_d2 = cat(2,tbins(find(tbins==d2_sSET):96),tbins(1:find(tbins==d2_dawn-.25)));


% subsetted 210 Rock so that only days without any skipped files are
% included - total 6 days included
load('210RK_D2/results_ST01_TWO_210.mat'); %(13:863)
matdays1 = cat(1,matdays(29:124),matdays(304:783));
poavg1 = cat(2,poavg(:,29:124),poavg(:,304:783));
t=matdays1-(4/24); 
[~,~,~,hr,mn,~]=datevec(t); 
hrmn=hr+mn/60; 
b = NaN(16385,6,49);
for i = 1:length(night_d2) 
    a = find(hrmn == night_d2(i)); 
    b(:,:,i) = poavg1(:,a); 
end
d2_210 = squeeze(mean(b,2)); %avg po each file time over deployment
N = 4; szA = size(d2_210);
B = arrayfun(@(k) mean(d2_210(:,k:min(szA(2),k+N-1)),2), 1:N:szA(2), 'un', 0); % calc mean each hour or 4 files
mspec_210RK_night2 = [B{:}]; %avg spectra each hr
%1st col is 1hr pre-sSET, last col is 1hr post-sRISE

load('WESTR_D2/results_ST02_TWO_WESTR.mat'); %(13:876)
matdays = matdays(13:876); 
poavg = poavg(:,13:876);
t=matdays-(4/24); 
[~,~,~,hr,mn,~]=datevec(t); 
hrmn=hr+mn/60; 
b = NaN(16385,9,49);
for i = 1:length(night_d2) 
    a = find(hrmn == night_d2(i)); 
    b(:,:,i) = poavg(:,a);  
end
d2_west = squeeze(mean(b,2)); 
N = 4; szA = size(d2_west);
B = arrayfun(@(k) mean(d2_west(:,k:min(szA(2),k+N-1)),2), 1:N:szA(2), 'un', 0); 
mspec_WESTR_night2 = [B{:}];

load('CSPAR_D2/results_ST03_TWO_CSPAR.mat'); %(13:876)
matdays = matdays(13:876); 
poavg = poavg(:,13:876);
t=matdays-(4/24); 
[~,~,~,hr,mn,~]=datevec(t); 
hrmn=hr+mn/60;
b = NaN(16385,9,49);
for i = 1:length(night_d2) 
    a = find(hrmn == night_d2(i)); 
    b(:,:,i) = poavg(:,a);  
end
d2_spar = squeeze(mean(b,2)); 
N = 4; szA = size(d2_spar);
B = arrayfun(@(k) mean(d2_spar(:,k:min(szA(2),k+N-1)),2), 1:N:szA(2), 'un', 0); 
mspec_CSPAR_night2 = [B{:}];

%save d2_mspec.mat mspec_210RK_night2 mspec_CSPAR_night2 mspec_WESTR_night2

%% Combining the matrices

mspec_d2_night = [mspec_210RK_night2 mspec_WESTR_night2 mspec_CSPAR_night2];

%% Calculating Df matrix 

c = 1;
f1 = 100;
f2 = 2000;
for i = 1:39
    S1 = mspec_d2_night(:,i);
    for j = i+1:39
        S2 = mspec_d2_night(:,j);
        Df(c) = sound_Df(S1,S2,f,f1,f2,0); 
    c=c+1;
    end
end

Df_square_d2 = squareform(Df); 
%figure; imagesc(Df_square_d2);

%% Ordination

% NMDS
[Y2,stress2] = mdscale(Df_square_d2,2);
g2_site = {'T','T','T','T','T','T','T','T','T','T','T','T','T','W','W','W','W','W','W','W','W','W','W','W','W','W','S','S','S','S','S','S','S','S','S','S','S','S','S'};
clr = [1 0 0;0 1 0;0 1 1;.5 0 1];
figure; gscatter(Y2(:,1),Y2(:,2),{g2_site},clr,'.',25); ylim([-0.20 0.25]);
set(gca,'FontSize',18);
legend('210 Rock','WESTR','CSPAR','location','southwest'); title('January 2016');
xlabel('NMS 1'); ylabel('NMS 2');
print('-bestfit','d2_ord','-dpdf')

% Shepard Plot
% distances = pdist(Y2);figure;
% plot(Df,distances,'bo',[0 1],[0 1],'k-');
% xlabel('Dissimilarities');ylabel('Distances');
% title('D2 night - Shepard Plot');

