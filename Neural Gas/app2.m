clc;
clear;
close all;

%% Load Data

data = load('jain');
X = data.X;

%% Create and Train Neural Gas Network

params.N = 35;

params.MaxIt = 50;

params.tmax = 10000;

params.epsilon_initial = 0.4;
params.epsilon_final = 0.02;

params.lambda_initial = 5;
params.lambda_final = 0.5;

params.T_initial = 5;
params.T_final = 10;

net = NeuralGasNetwork(X, params, true);
