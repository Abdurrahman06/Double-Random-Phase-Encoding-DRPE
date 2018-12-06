%producing the original image
I=imread('cameraman.tif');
A=im2double(I);
figure,imshow(A);title('The original image');
%producing mask1and mask2, encryption
A1=rand(256,256);
A11=exp(i*2*pi*A1);%mask1
A111=A.*A11;
B=fft2(A111);
B1=rand(256,256);
B11=exp(i*2*pi*B1);%mask2
B111=B.*B11;
C=ifft2(B111);
C1=abs(C);
figure;imshow(C1);title('The Encrypted image');
%%
%decryption
%     [s1 s2]     = size(C);
%     sigma       = 10;
%     Enoise      = zeros(s1,s2);
%     Enoise(:,:) = normrnd(0,sigma,s1,s2)+ i * normrnd(0,sigma,s1,s2);   
%     C          = C + Enoise;
%%
D=fft2(C);
D1=D.*exp(-i*2*pi*B1);
D11=ifft2(D1);
D111=D11.*exp(-i*2*pi*A1);
F=abs(D11);
figure,imshow(F);title('The decrypted image');
