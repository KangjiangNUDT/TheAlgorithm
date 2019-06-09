%�������ű���a(��չϵ��)��b(��������)
syms a b;
c = [a b]';

%ԭʼ���� A
A = input('A='); %��ʽ[a1,a2L,a3]
n = length(A);

%��ԭʼ���� A ���ۼ��õ����� B
for i = 2:n
    H(i) = A(i) - A(i - 1);
end
H(1) = [];


%��ԭʼ���� A �����ھ�ֵ����
for i = 2:n
    C(i) = (A(i) + A(i-1))/2;
end
C(1) = [];

%�������ݾ��� 
D = [-C; C.^2];
Y = H; Y = Y';

%ʹ����С���˷�������� a(��չϵ��)��b(��������)
c = inv(D*D')*D*Y;
c = c';
a = c(1); b = c(2);

%�õ�Ԥ���������
F = []; F(1) = A(1);
for i = 2:(n+n)
    F(i) = (a*A(1))/(b*A(1)+(a - b*A(1))*exp(a*(i-1)));
end

disp('Ԥ������Ϊ��');
F

%��������ͼ
t1 = 0:n-1;  %ԭʼ���ݺ����귶Χ----------------------------------------------------------
t2 = 0:2*n-1;  %Ԥ�����ݺ����귶Χ-------------------------------------------------------------
plot(t1, A, 'ro'); hold on;
plot(t2, F);
%ͼ�β���
xlabel('x'); ylabel('y');  %----------------------------------------------------------
legend('ԭʼ����','Ԥ��ֵ');%----------------------------------------------------------
title('����');%----------------------------------------------------------
grid on;