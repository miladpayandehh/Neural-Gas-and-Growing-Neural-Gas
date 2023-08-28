function net = NeuralGasNetwork(X, params, PlotFlag)

    if ~exist('PlotFlag','var')
        PlotFlag = false;
    end

    %% Load Data
    
    nData = size(X,1);
    nDim = size(X,2);

    X = X(randperm(nData),:);

    Xmin = min(X);
    Xmax = max(X);

    %% Parameters
    N = params.N;
    MaxIt = params.MaxIt;
    tmax = params.tmax;
    epsilon_initial = params.epsilon_initial;
    epsilon_final = params.epsilon_final;
    lambda_initial = params.lambda_initial;
    lambda_final = params.lambda_final;
    T_initial = params.T_initial;
    T_final = params.T_final;

    %% Initialization

    w = zeros(N, nDim);
    for i = 1:N
        w(i,:) = unifrnd(Xmin, Xmax);
    end

    C = zeros(N, N);
    t = zeros(N, N);

    tt = 0;

    %% Main Loop

    for it = 1:MaxIt
        for l = 1:nData
            % Slect Input Vector
            x = X(l,:);

            % Competion and Ranking
            d = pdist2(x,w);
            [~, SortOrder] = sort(d);

            % Calculate Parameters
            epsilon = epsilon_initial*(epsilon_final/epsilon_initial)^(tt/tmax);
            lambda = lambda_initial*(lambda_final/lambda_initial)^(tt/tmax);
            T = T_initial*(T_final/T_initial)^(tt/tmax);

            % Adaptation
            for ki = 0:N-1
                i=SortOrder(ki+1);
                w(i,:) = w(i,:) + epsilon*exp(-ki/lambda)*(x-w(i,:));
            end
            tt = tt + 1;

            % Creating Links
            i = SortOrder(1);
            j = SortOrder(2);
            C(i,j) = 1;
            C(j,i) = 1;
            t(i,j) = 0;
            t(j,i) = 0;

            % Aging
            t(i,:) = t(i,:) + 1;
            t(:,i) = t(:,i) + 1;

            % Remove Old Links
            OldLinks = t(i,:)>T;
            C(i, OldLinks) = 0;
            C(OldLinks, i) = 0;
        end

        % Plot
        if PlotFlag
            figure(1);
            PlotResults(X, w, C);
            pause(0.01);
        end

    end

    %% Export Results
    
    net.w = w;
    net.C = C;
    net.t = t;
    
end