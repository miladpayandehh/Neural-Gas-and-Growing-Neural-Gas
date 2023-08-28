clc;
clear;
close all;

%% Load Data

data = load('mydata');
X = data.X;

%% Parameters

params.N = 50;

params.MaxIt = 20;

params.L = 50;

params.epsilon_b = 0.2;
params.epsilon_n = 0.005;

params.alpha = 0.5;
params.delta = 0.995;

params.T = 50;

net = GrowingNeuralGasNetwork(X, params, true);
