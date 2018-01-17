function [f, b]= evaluate(x)
%EVALUATE 此处显示有关此函数的摘要
%   f is the fitness, b means if the environment will change
global proId;
global dim;
global error;
global evals;
global runId;
global func_opts;
global change_instance;
global func_num;
global freq;
switch(proId)
    case 1
        b=false;
        for i=1:size(x,1)
            [f(i), b_tmp]=MPB(x(i,:));
            if(b_tmp == true)
               b=true; 
            end
        end
    case 2
        [f, b]=DynSchwefel(x);
    case 3
        [f,e,~,evals,dim] = DBG(x,func_num,change_instance,evals,runId,dim,func_opts);
        if (rem(evals,freq)==1)
            error = [error,e];
        else
            error(end) = min(error(end),e);
        end
        b = false;
        if (rem(evals,freq)==0)
            b = true;
        end
        if (func_num ~= 1)
            f = -f;
        end
    case 4
        remain_FEs = freq - rem(evals,freq);
        if(remain_FEs>=size(x,1))
            if (rem(evals,freq)==0)
                error = [error,inf];
            end
            [f,e,~,evals,dim] = newDBGtmp(x,func_num,change_instance,evals,runId,dim,func_opts);
            error(end) = min(error(end),min(e));
            if (rem(evals,freq)==0)
                b=true;
            end
        else
            [f1,e1,~,evals,dim] = newDBGtmp(x(1:remain_FEs,:),func_num,change_instance,evals,runId,dim,func_opts);
            b=true;
            error(end) = min(error(end),min(e1));
            [f2,e2,~,evals,dim] = newDBGtmp(x(remain_FEs+1:size(x,1),:),func_num,change_instance,evals,runId,dim,func_opts);
            error = [error,min(e2)];
            f=[f1;f2];
        end
        if (func_num ~= 1)
            f = -f;
        end
    otherwise
        'proId is wrong'
end

end

