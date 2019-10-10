res=114;                   %�ֱ���
L=6e-3;                    %����ߴ� ��λm
%distance=0.2;                 %�������� ��λm ȡ0��0.01��1��10
lambda=0.532e-6;             %���� ��λm
w0=6e-3;                    %��߰뾶 ��λm

% target=imresize(target,res/512)



x2=linspace(-L,L,res);      %����ߴ� 
dx=2*L/(res-1);             %��������
[X,Y]=meshgrid(x2,x2);
r=sqrt(X.^2+Y.^2);
E=exp(-r.^2/w0^2);          %�糡��˹����
I=exp(-2*r.^2/w0^2);        %��ǿ��˹����

ang=im2double(rgb2gray(imread('111.png')))*2*pi;
afterslm_end=exp(1i*ang).*E;
result=fun_FT_Objective(afterslm_end,1,lambda,0);
nom_result=abs(result)/max(max(abs(result)));
figure(1)
imshow(nom_result);
figure(2)
imshow(abs(ang)/max(max(abs(ang))));

