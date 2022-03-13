%Modele uk�ad�w cz�stkowych przedstawione za pomoc� 3 postaci
A1=-1.335; B1=1; C1=1; D1=0;
G1=ss(A1,B1,C1,D1)%Posta� macierzowa
[licz1,mian1]=ss2tf(A1,B1,C1,D1); %Zamiana postaci macierzowej na og�ln�
G1tf=tf(licz1,mian1)%Posta� og�lna
[Z1,P1,K1]=tf2zp(licz1,mian1) %Zamiana postaci og�lnej na zpk

G2=tf([1],[1 1.449])%Posta� og�lna
[licz2,mian2]=tfdata(G2,'v');
[A2,B2,C2,D2]=tf2ss([licz2],[mian2])%Zamiana postaci og�lnej na macierzow�
[Z2,P2,K2]=tf2zp(licz2,mian2)%Zamiana postaci og�lnej na zpk

A3=-2.823; B3=1; C3=1; D3=0;
G3=ss(A3,B3,C3,D3)%Posta� macierzowa
[licz3,mian3]=ss2tf(A3,B3,C3,D3); %Zamiana postaci macierzowej na og�ln�
G3tf=tf(licz3,mian3)%Posta� og�lna
[Z3,P3,K3]=tf2zp(licz3,mian3) %Zamiana postaci og�lnej na zpk

G4=tf([1], [1 2.03])%Posta� og�lna
[licz4,mian4]=tfdata(G4,'v');
[A4,B4,C4,D4]=tf2ss([licz4],[mian4])%Zamiana postaci og�lnej na macierzow�
[Z4,P4,K4]=tf2zp(licz4,mian4)%Zamiana postaci og�lnej na zpk

G5=zpk([], [-0.3199],1)%Czynnikowa posta� transmitacji
Z5=[]; P5=[-0.3199]; K5=1;
[licz5,mian5]=zp2tf(Z5,P5,K5);%Zamiana zpk na tf
G5tf=tf(licz5,mian5)
[A5,B5,C5,D5]=tf2ss([licz5],[mian5])%Zamiana tf na ss

G6=zpk([], [-0.548],1)%Czynnikowa posta� transmitacji
Z6=[]; P6=[-0.548]; K6=1;
[licz6,mian6]=zp2tf(Z6,P6,K6);%Zamiana zpk na tf
G6tf=tf(licz6,mian6)
[A6,B6,C6,D6]=tf2ss([licz6],[mian6])%Zamiana tf na ss


%Charakterystyki uk�ad�w cz�stkowych
%Charakterystyka skokowa
figure(1)
step(G1,G2,G3,G4,G5,G6) 
legend('G1','G2','G3','G4','G5','G6')
title('Odpowied� skokowa')
xlabel('Czas')
ylabel('Amplituda')
grid on


%Charakterysyka impulsowa
figure(2)
impulse(G1,G2,G3,G4,G5,G6)
legend('G1','G2','G3','G4','G5','G6')
title('Odpowied� impulsowa')
xlabel('Czas')
ylabel('Amplituda')
grid on

%Logarytmiczna charakterystyka amplitudowo fazowa
opt=bodeoptions;
opt.Ylabel.String={'Modu�' 'Faza'};
opt.Title.FontSize=12;
figure(3)
bode(G1,G2,G3,G4,G5,G6,opt)
legend('G1','G2','G3','G4','G5','G6')
title('Charakterystyka amplitudowo fazowa')
xlabel('Cz�stotliwo��')
grid on

%Zapas fazy i zapas modu�u
figure(4)
subplot(2,3,1)
margin(G1)
title('Zapas modu�u i fazy')
xlabel('Cz�stotliwo��')
subplot(2,3,2)
margin(G2)
title('Zapas modu�u i fazy')
xlabel('Cz�stotliwo��')
subplot(2,3,3)
margin(G3)
title('Zapas modu�u i fazy')
xlabel('Cz�stotliwo��')
subplot(2,3,4)
margin(G4)
title('Zapas modu�u i fazy')
xlabel('Cz�stotliwo��')
subplot(2,3,5)
margin(G5)
title('Zapas modu�u i fazy')
xlabel('Cz�stotliwo��')
subplot(2,3,6)
margin(G6)
title('Zapas modu�u i fazy')
xlabel('Cz�stotliwo��')



%Charakterystka amplitudowo fazowa
figure(5)
nyquist(G1,G2,G3,G4,G5,G6)
legend('G1','G2','G3','G4','G5','G6')
title('Charakterystka Nyquista')
xlabel('O� rzeczywista')
ylabel('O� urojona')
grid on

%Mapa zer i biegun�w 
figure(6)
subplot(2,3,1)
pzmap(G1)
title('Mapa zer i biegun�w')
xlabel('O� rzeczywista')
ylabel('O� urojona')
subplot(2,3,2)
pzmap(G2)
title('Mapa zer i biegun�w')
xlabel('O� rzeczywista')
ylabel('O� urojona')
subplot(2,3,3)
pzmap(G3)
title('Mapa zer i biegun�w')
xlabel('O� rzeczywista')
ylabel('O� urojona')
subplot(2,3,4)
title('Mapa zer i biegun�w')
xlabel('O� rzeczywista')
ylabel('O� urojona')
pzmap(G4)
title('Mapa zer i biegun�w')
xlabel('O� rzeczywista')
ylabel('O� urojona')
subplot(2,3,5)
title('Mapa zer i biegun�w')
xlabel('O� rzeczywista')
ylabel('O� urojona')
pzmap(G5)
title('Mapa zer i biegun�w')
xlabel('O� rzeczywista')
ylabel('O� urojona')
subplot(2,3,6)
pzmap(G6)
title('Mapa zer i biegun�w')
xlabel('O� rzeczywista')
ylabel('O� urojona')


%Linie pierwiastkowe
figure(7)
subplot(2,3,1)
rlocus(G1)
title('Linie pierwiastkowe')
xlabel('O� rzeczywista')
ylabel('O� urojona')
subplot(2,3,2)
rlocus(G2)
title('Linie pierwiastkowe')
xlabel('O� rzeczywista')
ylabel('O� urojona')
subplot(2,3,3)
rlocus(G3)
title('Linie pierwiastkowe')
xlabel('O� rzeczywista')
ylabel('O� urojona')
subplot(2,3,4)
rlocus(G4)
title('Linie pierwiastkowe')
xlabel('O� rzeczywista')
ylabel('O� urojona')
subplot(2,3,5)
rlocus(G5)
title('Linie pierwiastkowe')
xlabel('O� rzeczywista')
ylabel('O� urojona')
subplot(2,3,6)
rlocus(G6)
title('Linie pierwiastkowe')
xlabel('O� rzeczywista')
ylabel('O� urojona')

%Nazwanie poszczeg�lnych ga��zi uk�adu
G1.Inputname='b';
G1.Outputname='c';
G2.Inputname='c';
G2.Outputname='d';
G3.Inputname='d';
G3.Outputname='f';
G4.Inputname='d';
G4.Outputname='e';
G5.Inputname='d';
G5.Outputname='g';
G6.Inputname='h'
G6.Outputname='i';

%Opisanie w�z��w sumacyjnych
sum1=sumblk('a=u-i');
sum2=sumblk('b=a+f');
sum3=sumblk('y=e+g');

%Wyznaczenie transmitacji zast�pczej uk�adu
G=connect(G1,G2,G3,G4,G5,G6,sum1,sum2,sum3,'u','y');

%Przedstawienie modelu uk�adu zast�pczego w 3 formach
[licz,mian]=tfdata(G,'v');
[A,B,C,D]=tf2ss([licz],[mian])
Gtf=tf(licz,mian)
[Z,P,K]=tf2zp(licz,mian)

%Charakterystyki uk�adu zast�pczego
%Charakterystyka skokowa
figure(8)
step(G);
title('Odpowied� skokowa')
xlabel('Czas')
ylabel('Amplituda')
grid on

%Charakterysyka impulsowa
figure(9)
impulse(G);
title('Odpowied� impulsowa')
xlabel('Czas[s]')
ylabel('Amplituda')
grid on

%Logarytmiczna charakterystyka amplitudowo fazowa
opt=bodeoptions;
opt.Ylabel.String={'Modu�' 'Faza'};
opt.Title.FontSize=12;
figure(10)
bode(G,opt);
title('Charakterystyka amplitudowo fazowa')
xlabel('Cz�stotliwo��')
grid on

%Zapas fazy modu�u
figure(11)
margin(G);
title('Zapas modu�u i fazy')
xlabel('Cz�stotliwo��')

%Charakterystka amplitudowo fazowa
figure(12)
nyquist(G1)
title('Charakterystka Nyquista')
xlabel('O� rzeczywista')
ylabel('O� urojona')
grid on

%Mapa zer i biegun�w 
figure(13)
pzmap(G);
title('Mapa zer i biegun�w')
xlabel('O� rzeczywista')
ylabel('O� urojona')
grid on

%Linie pierwiastkowe
figure(14)
rlocus(G);
title('Linie pierwiastkowe')
xlabel('O� rzeczywista')
ylabel('O� urojona')

%Odpowied� uz na wymuszenie sinusoidalne (1Hz)
figure(15)
t1=0:0.001:5;
u1=sin(2*pi*1*t1);
lsim(G,u1,t1)
title('Odpowied� uz na wymuszenie sinusoidalne (1Hz)')
xlabel('Czas')
ylabel('Amplituda')

%Odpowied� uz na wymuszenie sinusoidalne (10Hz)
figure(16)
t2=0:0.001:1;
u2=sin(2*pi*10*t2);
lsim(G,u2,t2)
title('Odpowied� uz na wymuszenie sinusoidalne (10Hz)')
xlabel('Czas')
ylabel('Amplituda')

%Odpowied� uz na wymuszenie sinusoidalne (100Hz)
figure(17)
t3=0:0.001:0.25;
u3=sin(2*pi*100*t3);
lsim(G,u3,t3)
title('Odpowied� uz na wymuszenie sinusoidalne (100Hz)')
xlabel('Czas')
ylabel('Amplituda')

%Odpowied� uz na wymuszenie prostok�tne (1Hz)
figure(18)
t4=0:0.001:5;
n1=square(2*pi*1*t4);
lsim(G,n1,t4)
title('Odpowied� uz na wymuszenie prostok�tne (1Hz)')
xlabel('Czas')
ylabel('Amplituda')

%Odpowied� uz na wymuszenie prostok�tne (10Hz)
figure(19)
t5=0:0.001:1;
n2=square(2*pi*10*t5);
lsim(G,n2,t5)
title('Odpowied� uz na wymuszenie prostok�tne (10Hz)')
xlabel('Czas')
ylabel('Amplituda')

%Odpowied� uz na wymuszenie prostok�tne (100Hz)
figure(20)
t6=0:0.001:0.25;
n3=square(2*pi*100*t6);
lsim(G,n3,t6)
title('Odpowied� uz na wymuszenie prostok�tne (100Hz)')
xlabel('Czas')
ylabel('Amplituda')

%Odpowied� uz na wymuszenie tr�jk�tne i prostok�tne
figure(21)
t7=0:0.001:14;
x1=8*tripuls(t7-3,4);
x2=3*rectpuls(t7-10.5,3);
x3=x1+x2;
lsim(G,x3,t7)
title('Odpowied� uz na wymuszenie tr�jk�tne i prostok�tne')
xlabel('Czas')
ylabel('Amplituda')

%Zapas fazy i modulu poszczegolnych ukladow
[zfG1,zmG1]=margin(G1)
[zfG2,zmG2]=margin(G2)
[zfG3,zmG3]=margin(G3)
[zfG4,zmG4]=margin(G4)
[zfG5,zmG5]=margin(G5)
[zfG6,zmG6]=margin(G6)
[zfG,zmG]=margin(G)

%Wyznaczenie parametr�w transmitacji
y=stepinfo(G)
y1=stepinfo(G1)
y2=stepinfo(G2)
y3=stepinfo(G3)
y4=stepinfo(G4)
y5=stepinfo(G5)
y6=stepinfo(G6)

%Wyznaczenie cz�stotliwo�ci drga� w�asnych oraz wsp�czynnik�w t�umienia
[wn,z]=damp(G)
[wn1,z1]=damp(G1)
[wn2,z2]=damp(G2)
[wn3,z3]=damp(G3)
[wn4,z4]=damp(G4)
[wn5,z5]=damp(G5)
[wn6,z6]=damp(G6)
