
run('GeneralSettings.m')

PM1 = 27:99; % Indices for time periods 
PM2 = 171:243;
PM3 = 315:387;

AM1 = 1:26;
AM2 = 100:170;
AM3 = 244:314;
AM4 = 388:408;

NR1 = sum(delDOdtk(PM1))/6 %mmol/m2/hr 
NEP1 = sum(delDOdtk(AM2))/6 
NR2 = sum(delDOdtk(PM2))/6 %mmol/m2/hr 
NEP2 = sum(delDOdtk(AM3))/6 
NR3 = sum(delDOdtk(PM3))/6 %mmol/m2/hr 

NEM1k = NEP1 + NR2
NEM2k = NEP2 + NR3

meanR1 = nanmean(delDOdtk(PM1))
meanR2 = nanmean(delDOdtk(PM2))
meanR3 = nanmean(delDOdtk(PM3))

DRR1k = meanR1*24
DRR2k = meanR2*24
DRR3k = meanR3*24

GPP1k = NEP1 + length(AM2)/6*abs(meanR2)
GPP2k = NEP2 + length(AM3)/6*abs(meanR3)

% %with air constant

DAY = [1 3 5 7];
NIGHT = [2 4 6];

%%

%with air flux
PM1 = 27:99; % Indices for time periods 
PM2 = 171:243;
PM3 = 315:387;

AM1 = 1:26;
AM2 = 100:170;
AM3 = 244:314;
AM4 = 388:408;

NR1 = sum(delDOdt(PM1))/6 %mmol/m2/hr 
NEP1 = sum(delDOdt(AM2))/6 
NR2 = sum(delDOdt(PM2))/6 %mmol/m2/hr 
NEP2 = sum(delDOdt(AM3))/6 
NR3 = sum(delDOdt(PM3))/6 %mmol/m2/hr 

NEM1v = NEP1 + NR2
NEM2v = NEP2 + NR3

meanR1 = nanmean(delDOdt(PM1))
meanR2 = nanmean(delDOdt(PM2))
meanR3 = nanmean(delDOdt(PM3))

DRR1v = meanR1*24
DRR2v = meanR2*24
DRR3v = meanR3*24

GPP1v = NEP1 + length(AM2)/6*abs(meanR2)
GPP2v = NEP2 + length(AM3)/6*abs(meanR3)

%%

% For Fair = 0 

NR1 = sum(delDOdt0(PM1))/6 %mmol/m2/hr 
NEP1 = sum(delDOdt0(AM2))/6 
NR2 = sum(delDOdt0(PM2))/6 %mmol/m2/hr 
NEP2 = sum(delDOdt0(AM3))/6 
NR3 = sum(delDOdt0(PM3))/6 %mmol/m2/hr 

NEM10 = NEP1 + NR2
NEM20 = NEP2 + NR3

meanR1 = nanmean(delDOdt0(PM1))
meanR2 = nanmean(delDOdt0(PM2))
meanR3 = nanmean(delDOdt0(PM3))

DRR10 = meanR1*24
DRR20 = meanR2*24
DRR30 = meanR3*24

GPP10 = NEP1 + length(AM2)/6*abs(meanR2)
GPP20 = NEP2 + length(AM3)/6*abs(meanR3)
%%
% PM1 = 1:65; % Indices for time periods Not a full night 
PM2 = 185:307;
PM3 = 426:547;
PM4 = 666:787;
% PM5 = 906:958;

AM1 = 66:184; 
AM2 = 308:425;
AM3 = 548:665;
AM4 = 788:905;

%%
% Run South Platform
%%

NEP1 = sum(delDOdtk(AM1))/10 
NR2 = nansum(delDOdtk(PM2))/10 %mmol/m2/hr % changed to 10 because 10 readings in an hour 
NEP2 = sum(delDOdtk(AM2))/10 
NR3 = sum(delDOdtk(PM3))/10 %mmol/m2/hr 
NEP3 = sum(delDOdtk(AM3))/10 %mmol/m2/hr 
NR4 = sum(delDOdtk(PM4))/10 %mmol/m2/hr 
NEP4 = sum(delDOdtk(AM4))/10 %mmol/m2/hr 

NEM1 = NEP1 + NR2
NEM2 = NEP2 + NR3
NEM3 = NEP3 + NR4

meanR2 = nanmean(delDOdtk(PM2))
meanR3 = nanmean(delDOdtk(PM3))
meanR4 = nanmean(delDOdtk(PM4))

DRR2 = meanR2*24
DRR3 = meanR3*24
DRR4 = meanR4*24

GPP1 = NEP1 + length(AM1)/10*abs(meanR2)
GPP2 = NEP2 + length(AM2)/10*abs(meanR3)
GPP3 = NEP3 + length(AM3)/10*abs(meanR4)
GPP4 = NEP4 + length(AM4)/10*abs(meanR4) % *** uses R4

delDOdtkmean = delDOdtk;
delDOdtkmean(isnan(delDOdtkmean)) = nanmean([meanR2, meanR3,meanR4]);
NR2 = sum(delDOdtkmean(PM2))/10 %mmol/m2/hr % changed to 10 because 10 readings in an hour 
NEM1 = NEP1 + NR2
meanR2 = nanmean(delDOdtkmean(PM2))
DRR2 = meanR2*24
GPP1 = NEP1 + length(AM1)/10*abs(meanR2)
%%

figure
ax3 = subplot(2,2,1);
% ax3.XAxisLocation = 'origin';
bar(2,DRR10,'FaceColor',teal)
hold on
bar(3,NEM10,'FaceColor',navy)
bar(3,GPP10,'FaceColor',red)
bar(4,DRR20,'FaceColor',teal)
bar(5,GPP20,'FaceColor',red)
bar(5,NEM20,'FaceColor',navy)
bar(6,DRR30,'FaceColor',teal)
bar(1,0)
ylabel('NEM, GPP, and ER (mmol m^-^2 d^-^1)','FontName','Georgia','FontSize',12)
title('Salt Pond Metabolism: F_A_I_R = F_0','FontName','Georgia','FontSize',16)
xticks([1 2 3 4 5 6])
xticklabels({'Day 1','Night 1','Day 2', 'Night 2', 'Day 3', 'Night 3'})
legend('ER','NEM','GPP','Location','SW')
set(ax3,'FontName','Georgia','FontSize',12)
grid on
ylim([-300 300])
%set(xticklabels,'FontName','Georgia')
%set(ax,'FontName','Georgia','XTick','XTickLabel',{'10/24','','10/25'});

ax2=subplot(2,2,3);
ax2.XAxisLocation = 'origin';
bar(2,DRR1v,'FaceColor',teal)
hold on
bar(3,NEM1v,'FaceColor',navy)
bar(3,GPP1v,'FaceColor',red)
bar(4,DRR2v,'FaceColor',teal)
bar(5,GPP2v,'FaceColor',red)
bar(5,NEM2v,'FaceColor',navy)
bar(6,DRR3v,'FaceColor',teal)
grid on
bar(1,0)
ylabel('NEM, GPP, and ER (mmol m^-^2 d^-^1)','FontName','Georgia','FontSize',12)
title('Salt Pond Metabolism: F_A_I_R = F_W_I_N_D','FontName','Georgia','FontSize',16)
xticks([1 2 3 4 5 6])
xticklabels({'Day 1','Night 1','Day 2', 'Night 2', 'Day 3', 'Night 3'})
legend('ER','NEM','GPP','Location','SW')
set(ax2,'FontName','Georgia','FontSize',12)
ylim([-300 300])

ax1 = subplot(2,2,2);
% ax1.XAxisLocation = 'origin';
bar(2,DRR1k,'FaceColor',teal)
hold on
bar(3,NEM1k,'FaceColor',navy)
bar(3,GPP1k,'FaceColor',red)
bar(4,DRR2k,'FaceColor',teal)
bar(5,GPP2k,'FaceColor',red)
bar(5,NEM2k,'FaceColor',navy)
bar(6,DRR3k,'FaceColor',teal)
grid on
bar(1,0)
ylabel('NEM, GPP, and ER (mmol m^-^2 d^-^1)','FontName','Georgia','FontSize',12)
title('Salt Pond Metabolism: F_A_I_R = F_K','FontName','Georgia','FontSize',16)
xticks([1 2 3 4 5 6])
xticklabels({'Day 1','Night 1','Day 2', 'Night 2', 'Day 3', 'Night 3'})
legend('ER','NEM','GPP','Location','SW')
set(ax1,'FontName','Georgia','FontSize',12)
ylim([-300 300])

ax4=subplot(2,2,4);
ax4.XAxisLocation = 'origin';
bar(2,DRR2,'FaceColor',cyan)
hold on
bar(1,NEM1,'FaceColor',yellow)
bar(1,GPP1,'FaceColor',forestgreen)
bar(1,NEM1,'FaceColor',yellow)
bar(2,DRR2,'FaceColor',cyan)
bar(3,GPP2,'FaceColor',forestgreen)
bar(3,NEM2,'FaceColor',yellow)
bar(4,DRR3,'FaceColor',cyan)
bar(5,GPP3,'FaceColor',forestgreen)
bar(5,NEM3,'FaceColor',yellow)
bar(6,DRR4,'FaceColor',cyan)
grid on
hold on
ylabel('NEM, GPP, and ER (mmol m^-^2 d^-^1)','FontName','Georgia','FontSize',12)
title('South Platform Metabolism: F_A_I_R = F_K','FontName','Georgia','FontSize',16)
xticks([1 2 3 4 5 6])
xticklabels({'Day 1','Night 1','Day 2', 'Night 2', 'Day 3', 'Night 3'})
legend('ER','NEM','GPP','Location','SW')
set(ax4,'FontName','Georgia','FontSize',12)
ylim([-300 300])
%set(xticklabels,'FontName','Georgia')
%set(ax,'FontName','Georgia','XTick','XTickLabel',{'10/24','','10/25'});