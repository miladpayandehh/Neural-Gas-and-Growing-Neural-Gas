clc;
clear;
close all;

%% Load Data

data = load('spiral');
X = data.X;

%% Create and Train Neural Gas Network

params.N = 100;

params.MaxIt = 80;

params.tmax = 8000;

params.epsilon_initial = 0.8;
params.epsilon_final = 0.3;

params.lambda_initial = 10;
params.lambda_final = 1;

params.T_initial = 5;
params.T_final = 10;

net = NeuralGasNetwork(X, params, true);
