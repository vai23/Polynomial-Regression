data=load('bluegills.txt');
x=data(:,1);
y=data(:,2);
figure(1);plot(x,y,'o');
axis([0 max(x)+1]);
xlabel('Age of the fish( in years )');
ylabel('Length of the fish( in mm )');\
title('Before normalizing');

#Normalizing y

mu=mean(y);
sigma=std(y);
y=y-mu;
y=y/sigma;

#Calculating theta by normal equation

X=[ones(size(y)) x];
theta=pinv(X'*X)*X'*y;
PV=X*theta;

#Testing polynomial regression

Xpol=[ones(size(y)) x x.^2];
thetapol=pinv(Xpol'*Xpol)*Xpol'*y
PVpol=Xpol*thetapol;
figure(2);plot(x,y,'b','o',x,PV,'r');
legend('Test data','Hypothesis function');
axis([0 max(x)+1]);
xlabel('Age of the fish( in years )');
ylabel('Length of the fish( in mm )');
title('After normalizing');