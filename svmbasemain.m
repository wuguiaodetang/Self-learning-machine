clear all;
clc;
l=100;

%jumpcase 
%delay=[0.2+0.1*rand(l-10,1);0.5+0.1*rand(10,1)];
%nu=0.45;
%gradually case
%delay=[0.2+0.05*rand(l-10,1);0.2+0.1*rand(10,1)];
delay=[0.2+0.05*rand(l-10,1);0.3+0.2*rand(10,1)];
nu=0.1;

[xapp,xsup,pos1,xtest1,xtest2,ypred]=ocsvmbb(delay,nu);

figure(1); 
%clf; 
%contourf(xtest1,xtest2,ypred,50);shading flat;
hold on
[cc,hh]=contour(xtest1,xtest2,ypred,[0 0],'k');
clabel(cc,hh); 
 h1=plot(xapp(:,1),xapp(:,2),'+g'); 
 set(h1,'LineWidth',2);
h3=plot(xsup(:,1),xsup(:,2),'ob'); 
set(h3,'LineWidth',2);
% h2=plot(xapp(pos1,1),xapp(pos1,2),'*m'); 
% set(h2,'LineWidth',2);
%axis([-2 2 -2 2])
set(gcf,'color','white');
% plot(xapp(1:l-10,1),xapp(1:l-10,2),'*g');
% plot(xapp(l-9:l,1),xapp(l-9:l,2),'*m');