RGB = imread('iImageTest1.jpg');
%imshow(RGB);

I = rgb2gray(RGB);
figure
%imshow(I)

K = imresize(I,[64 64]);
%imshow(K)

J = imnoise(K,'salt & pepper',0.02);
subplot(1,3,1), imshow(J);

tmp = medfilt2(J);
a = ssim(tmp, K)


 %a = psnr(tmp, tmp)
 %b = ssim(J,J)
%mse(tmp,tmp)
subplot(1,3,2), imshow(tmp);
imgHex = dec2hex(J);

fid = fopen('C:\intelFPGA_lite\16.1\ImageProcessing\oImageTest.txt', 'wt');
fprintf(fid, '%x\n', J);
fclose(fid);

int8 fileID;
fileID = fopen('C:\intelFPGA_lite\16.1\ImageProcessing\result.txt','r');

%fid = fopen('file.txt');
%comma  = char(',');
A = fscanf(fileID, '%x');
fclose(fileID);
result_img = zeros(64,64,'uint8');


%for n = 1:4096

    for col = 1:64
      start = (col-1)*64;
      stop  = start + 63 ;
      for row = 1:64
          start = start + 1;
        result_img(row, col) = A(start);
      end
    end
%end
subplot(1,3,3), imshow(result_img);
size(result_img);
b = ssim (result_img, K)
