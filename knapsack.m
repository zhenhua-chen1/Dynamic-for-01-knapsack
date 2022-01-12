%cost为状态转移矩阵:1为初始状态全为0，2为第一步状态,i表示第i-1状态是否选择物品n-1放入背包重量w-1中，选择则更新状态矩阵价值，不选择则不更新;

weight=[2,2,6,5,4];%物品重量;
value=[6,3,5,4,6];%物品价值;
weight_max=10;%物品承重;
n=length(weight);%物品数量
cost=zeros(n+1,weight_max+1);%状态转移矩阵;
temp=cell(n+1,weight_max+1);
for i=2:n+1
    for w=2:weight_max+1
        if weight(i-1)<=w-1  %状态选择的物品重量是否大于背包重量
            if value(i-1)+cost(i-1,w-weight(i-1))>cost(i-1,w);%比较状态i与i-1的价值大小;
                cost(i,w)=value(i-1)+cost(i-1,w-weight(i-1));%赋值状态i和重量w下的重量;
                temp{i,w}=[temp{i-1,w-weight(i-1)},i-1];%记录匹配物品个数;
            else
                cost(i,w)=cost(i-1,w);%%赋值状态i和重量w下的重量;
                temp{i,w}=temp{i-1,w};
            end
        else
             cost(i,w)=cost(i-1,w);%%赋值状态i和重量w下的重量;
             temp{i,w}=temp{i-1,w};
        end
    end
end

cost=cost(end,2:end);
value_choose={temp{end,2:end}};
