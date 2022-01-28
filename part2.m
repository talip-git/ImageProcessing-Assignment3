f = imread('bone.png');
figure, imshow(f, []);
F = fftshift(fft2(double(f)));
S = log(abs(F));
imwrite( S/max(S(:)), 'mask_skull.png');
figure, imshow(S, []);
pause;
M = imread('mask_bone_mod.png');
M = M(:,:,1); 
M = double((M>0)); 
G = M .* F;
g = real( ifft2( ifftshift(G) ) );

figure, imshow(g, []);
