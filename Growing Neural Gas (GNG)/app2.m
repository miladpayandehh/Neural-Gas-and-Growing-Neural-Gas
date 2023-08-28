clc;
clear;
close all;

%% Load Data

data = load('jain');
X = data.X;

%% Parameters

params.N = 40;

params.MaxIt = 20;

params.L = 50;

params.epsilon_b = 0.2;
params.epsilon_n = 0.005;

params.alpha = 0.5;
params.delta = 0.995;

params.T = 20;

net = GrowingNeuralGasNetwork(X, params, true);
