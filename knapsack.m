%costΪ״̬ת�ƾ���:1Ϊ��ʼ״̬ȫΪ0��2Ϊ��һ��״̬,i��ʾ��i-1״̬�Ƿ�ѡ����Ʒn-1���뱳������w-1�У�ѡ�������״̬�����ֵ����ѡ���򲻸���;

weight=[2,2,6,5,4];%��Ʒ����;
value=[6,3,5,4,6];%��Ʒ��ֵ;
weight_max=10;%��Ʒ����;
n=length(weight);%��Ʒ����
cost=zeros(n+1,weight_max+1);%״̬ת�ƾ���;
temp=cell(n+1,weight_max+1);
for i=2:n+1
    for w=2:weight_max+1
        if weight(i-1)<=w-1  %״̬ѡ�����Ʒ�����Ƿ���ڱ�������
            if value(i-1)+cost(i-1,w-weight(i-1))>cost(i-1,w);%�Ƚ�״̬i��i-1�ļ�ֵ��С;
                cost(i,w)=value(i-1)+cost(i-1,w-weight(i-1));%��ֵ״̬i������w�µ�����;
                temp{i,w}=[temp{i-1,w-weight(i-1)},i-1];%��¼ƥ����Ʒ����;
            else
                cost(i,w)=cost(i-1,w);%%��ֵ״̬i������w�µ�����;
                temp{i,w}=temp{i-1,w};
            end
        else
             cost(i,w)=cost(i-1,w);%%��ֵ״̬i������w�µ�����;
             temp{i,w}=temp{i-1,w};
        end
    end
end

cost=cost(end,2:end);
value_choose={temp{end,2:end}};
