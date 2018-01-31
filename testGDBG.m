clear all;
global proId;
global dim;
global error;
global evals;
global runId;
global func_opts;
global change_instance;
global func_num;
global freq;
global origin;
proId = 3;
dim = 10;
error=[];
evals = 0;
runId = 1;
change_instance = 1;
func_num = 6;
freq=100*dim;
func_opts = 10;
lower_bound = -5;
upper_bound = 5;
proRand = RandStream('mt19937ar','Seed',0);
RandStream.setGlobalStream(proRand);
algRand = RandStream('mt19937ar','Seed',runId);

% X = rand(algRand,100,dim)*(upper_bound-lower_bound)+lower_bound;
for_pop = 1;
origin=1;
iters = 1;
np=10;
if(for_pop==1)
    if(origin == 1)
        tic
        for t=1:iters
            X = rand(algRand,np,dim)*(upper_bound-lower_bound)+lower_bound;
            oldval=[];
            for i = 1:size(X,1)
                oldval =[oldval, evaluate(X(i,:))];
            end
        end
        toc
        disp(toc);
        % save './oldval.mat' oldval;
    end
    origin = 0;
    proId = 4;
    evals = 0;
    tic
    algRand = RandStream('mt19937ar','Seed',runId);
    for t=1:iters
        X = rand(algRand,np,dim)*(upper_bound-lower_bound)+lower_bound;
        val = evaluate(X);
    end
    toc
    disp(toc);
else
    index = 1;
    if(origin == 1)
        tic
        oldval = evaluate(X(index,:));
        toc
        disp(toc);
        % save './oldval.mat' oldval;
        
    end
    origin = 0;
    evals = 0;
    proId = 4;
    tic
    val = evaluate(X(index,:));
    toc
    disp(toc);
end
delta = oldval - val';
fprintf('max=%g\n',max(delta));
fprintf('mean=%g\n',mean(delta));
% disp(max(delta));