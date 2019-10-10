res=512;                   %�ֱ���
L=10e-3;                    %����ߴ� ��λm
distance=0.2;                 %�������� ��λm ȡ0��0.01��1��10
lambda=1.03e-6;             %���� ��λm
w0=3e-3;                    %��߰뾶 ��λm


x2=linspace(-L,L,res);      %����ߴ� 
dx=2*L/(res-1);             %��������
[X,Y]=meshgrid(x2,x2);
r=sqrt(X.^2+Y.^2);
E=exp(-r.^2/w0^2);          %�糡��˹����
I=exp(-2*r.^2/w0^2);        %��ǿ��˹����





fx=linspace(-1/dx,1/dx,res);   %Ƶ��ֽ�  1/dxΪ�ռ�Ƶ��
fy=linspace(-1/dx,1/dx,res);   %Ƶ��ֽ�


[fX,fY] = meshgrid(fx,fy);
fz=real(sqrt(1/lambda.^2-fX.^2-fY.^2));   %fz=sqer(1/lambda.^2-fX.^2-fY.^2))


H1 = exp(1i*2*pi*distance.*fz);          
afterdistance=abs(fun_fpropagation(E,H1)).^2;                    %���㴫����Ĺ�ǿ
afterdistance=abs(afterdistance)/max(max(abs(afterdistance)));   %��һ��



figure(1)
imshow(I);                      %��ʾ��ʼ��ǿ
figure(2)
imshow(afterdistance)           %��ʾ����distance֮��Ĺ�ǿ



