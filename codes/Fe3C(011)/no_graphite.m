clear
clc

%----------------------------INPUT-----------------------%
E = [-543.072
-506.633
-469.516
-436.389
-402.318
-367.605
-333.903
-298.340
-493.609
-475.8849132
-456.1024369
-403.9463148
-548.679
-516.233
-442.862
];

E_fe3c = -139.2978903/4;
E_C = -18.43514337/2;
E_fe = -17.09769979/2;

n_fe = [48
44
44
40
36
32
28
28
42
42
42
36
48
44
40
];

n_c = [16
16
12
12
12
12
12
8
16
14
12
12
16
16
12
];


 U = E;

%----------------------------Expression of u_H-----------------------%
R = 0.008314462; %kJ/mol-K
T = 873.15;

ratio = 96.485;%eV to kJ/mol

P_ref = 1; %reference Pressure, atm

G_H2 = -7.660208; %eV, from DFT

h2 = G_H2*ratio + R*T*log(0.01/P_ref); %kJ/mol, potential of H2, lnP, P = 0.01atm

u_H = h2/ratio/2; %eV

%----------------------------Expression of u_C-----------------------%
G_C3H8 = -57.010378;%eV, from DFT

%x = u_C;
syms P %P_c3h8

c3h8 = G_C3H8*ratio + R*T*log(P/P_ref); %kJ/mol, potential of C3H8, log_e_P
x = (c3h8/ratio - 8*u_H)/3; %potential of C, eV


%----------------------------Plot-----------------------%

omega1  = (U(1) - n_fe(1)*(E_fe3c - x)/3 - n_c(1)*x)/2/40.009*16.01942554;
fplot(P,omega1,[1e-20 1e10],'-k','linewidth',1.25)
hold on
omega2  = (U(2) - n_fe(2)*(E_fe3c - x)/3 - n_c(2)*x)/2/40.009*16.01942554;
fplot(P,omega2,[1e-20 1e10],'-.k','linewidth',1.25)
hold on
omega3  = (U(3) - n_fe(3)*(E_fe3c - x)/3 - n_c(3)*x)/2/40.009*16.01942554;
fplot(P,omega3,[1e-20 1e10],'--k','linewidth',1.25)
hold on
omega4  = (U(4) - n_fe(4)*(E_fe3c - x)/3 - n_c(4)*x)/2/40.009*16.01942554;
fplot(P,omega4,[1e-20 1e10],'--b','linewidth',1.25)
hold on
omega5  = (U(5) - n_fe(5)*(E_fe3c - x)/3 - n_c(5)*x)/2/40.009*16.01942554;
fplot(P,omega5,[1e-20 1e10],'-b','linewidth',1.25)
hold on
omega6  = (U(6) - n_fe(6)*(E_fe3c - x)/3 - n_c(6)*x)/2/40.009*16.01942554;
fplot(P,omega6,[1e-20 1e10],'-.b','linewidth',1.25)
hold on
omega7  = (U(7) - n_fe(7)*(E_fe3c - x)/3 - n_c(7)*x)/2/40.009*16.01942554;
fplot(P,omega7,[1e-20 1e10],'-.r','linewidth',1.25)
hold on
omega8  = (U(8) - n_fe(8)*(E_fe3c - x)/3 - n_c(8)*x)/2/40.009*16.01942554;
fplot(P,omega8,[1e-20 1e10],'--r','linewidth',1.25)
hold on

plot([0.05 0.05],[1.7 4.2],':k','linewidth',1.5)
hold off


legend({'(011)-ST-1','(011)-CR-1','(011)-IR-1','(011)-IR-2','(011)-ST-2','(011)-CR-2','(011)-CR-3','(011)-IR-3'},'Position', [0.765 0.25 0.2300 0.5976])
legend('boxoff');

ylim([1.7 4.2]);

ax1=gca;                
pos=get(ax1,'position');  
dpos=0.06;
legendpos = 0.145;
pos(2) = pos(2) + dpos;
pos(4) = pos(4) - dpos;  
pos(3) = pos(3) - legendpos;
set(ax1,'xcolor','k','ycolor','k','position',pos,'xscale','log','XTick',[1e-20 1e-15 1e-10 1e-5 1 1e5 1e10],'FontName','Times','fontsize',14,'YTick',[1.8 2.0 2.2 2.4,2.6,2.8,3.0,3.2,3.4 3.6 3.8 4.0 4.2],'linewidth',1.5)     

ylabel(ax1,'Surface Energy (J m^-^2)')
xlabel(ax1,'Partial Pressure of C_3H_8 (atm)')
ax1.YLabel.FontSize = 17;
ax1.XLabel.FontSize = 17;
ytickformat('%.1f');
