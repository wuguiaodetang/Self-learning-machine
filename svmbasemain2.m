clear all;
clc;
l=100;

%jumpcase 
%delay=[0.2+0.1*rand(l-10,1);0.8+0.1*rand(10,1)];
%nu=0.45;
%gradually case
delay_total=[0.2+0.05*rand(l,1);0.2+0.1*rand(20,1)];
for i=15:15
    delay=delay_total(i:i+100);

%delay=[0.2+0.05*rand(l-10,1);0.2+0.1*rand(10,1)];
nu=0.1;

[xapp,xsup,pos1,xtest1,xtest2,ypred]=ocsvmbb(delay,nu);

figure(1); 
%clf; 
%contourf(xtest1,xtest2,ypred,50);shading flat;
hold on
[cc,hh]=contour(xtest1,xtest2,ypred,[0 0],'k');
clabel(cc,hh); 
%  h1=plot(xapp(:,1),xapp(:,2),'+g'); 
%  set(h1,'LineWidth',2);
h3=plot(xsup(:,1),xsup(:,2),'ob'); 
set(h3,'LineWidth',2);
% h2=plot(xapp(pos1,1),xapp(pos1,2),'*m'); 
% set(h2,'LineWidth',2);
%axis([-2 2 -2 2])
set(gcf,'color','white');
plot(xapp(1:l-i,1),xapp(1:l-i,2),'*r');
plot(xapp(l-i+1:l,1),xapp(l-i+1:l,2),'*m');
xlabel('d_k_+_1 (sec)','fontsize',16);
ylabel('d_k (sec)','fontsize',16);
set(gca,'FontSize',16);
legend('Estimated "erroneous" delay','Actural "healthy" delay','Actual "erroneous" delay');
grid on;

end