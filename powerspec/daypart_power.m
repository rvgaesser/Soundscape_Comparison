% Script to get power spectra separated by dayparts to evaluate whether
% increased SPL at dusk and night is also an increase in the number of
% callers

clear
close all
load('daypart_tbins.mat');

load('d1_mspec.mat');
load('d2_mspec.mat');
load('d3_mspec.mat');
load('d4_mspec.mat');
load('d5_mspec.mat');