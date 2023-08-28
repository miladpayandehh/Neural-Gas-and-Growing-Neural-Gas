clc;
clear;
close all;

%% Load Data

data = load('mydata');
X = data.X;

%% Create and Train Neural Gas Network

params.N = 15;

params.MaxIt = 50;

params.tmax = 10000;

params.epsilon_initial = 0.3;
params.epsilon_final = 0.02;

params.lambda_initial = 2;
params.lambda_final = 0.1;

params.T_initial = 5;
params.T_final = 10;

net = NeuralGasNetwork(X, params, true);
