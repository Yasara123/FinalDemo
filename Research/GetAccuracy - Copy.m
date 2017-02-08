function [ accuracy ] = GetAccuracy( Class1,Class2 )
Mxx=max(max(Class1),max(Class2));
Min=min(min(Class1),min(Class2));
bin=3.49*std([Class1;Class2])*power(length(Class1)+length(Class2),-1/3); %Scott suggested using the Gaussian density as a reference standard
pClass1 = fitdist(Class1, 'Normal');
pClass2 = fitdist(Class2, 'Normal');
x_values = Min:bin:Mxx; %---------Color range-
y1 = normpdf( x_values,pClass1.mu,pClass1.sigma);
y2 = normpdf(x_values,pClass2.mu,pClass2.sigma);
index=Min;
i=1;
FalsePositive=zeros(1,length(y1)-1);
FalseNegative=zeros(1,length(y1)-1);
Th=zeros(1,length(y1)-1);
Mx = max(min(sort(Class1)), min(sort(Class2)));
while index<=Mxx
x_values1 = index:bin:Mxx; %For lower pClass1
x_values2 = Min:bin:index; %For higher pClass1
if Mx == min(sort(Class2))
    yy1 = pdf(pClass2, x_values2);
    errorProb1 = sum(yy1);
    yy2 = pdf(pClass1, x_values1);
    errorProb2 = sum(yy2);
    FalsePositive(i) = errorProb2*100*bin;
    FalseNegative(i) = errorProb1*100*bin;
	Th(i)=index;
    i=i+1;
else
    yy1 = pdf(pClass1, x_values2);
    errorProb1 = sum(yy1);
    yy2 = pdf(pClass2, x_values1);
    errorProb2 = sum(yy2);
    FalsePositive(i) = errorProb1*100*bin;
    FalseNegative(i) = errorProb2*100*bin;
	Th(i)=index;
    i=i+1;
end;
index=index+bin;
end;
[~,Threshod]=min((FalsePositive+FalseNegative)/2);
accuracy=100-min((FalsePositive+FalseNegative)/2);

end

