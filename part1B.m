img = imread('owl.jpg');
img = imresize(img,0.2);

grayscale = rgb2gray(img);

output_img = highButter(grayscale,2.5,30);
figure;imshow(output_img,[])

output_img = highButter(grayscale,12,30);
figure;imshow(output_img,[])

output_img = highButter(grayscale,2.5,20);
figure;imshow(output_img,[])

output_img = highButter(grayscale,12,20);
figure;imshow(output_img,[])

function output_img = highButter(img,n,D0)

    [row, col] = size(img);
    forier_spec = fft2(double(img));
    u = 0:(row-1);
    v = 0:(col-1);

    indexX = find(u > row/2);
    indexY = find(v > col/2);
    
    u(indexX) = u(indexX) - row;
    v(indexY) = v(indexY) - col;
    
    [V, U] = meshgrid(v, u);
    D = sqrt(U.^2 + V.^2);

    H = 1./(1 + (D./D0).^(2*n));
    figure;imshow(fftshift(1-H),[]);
    figure;imshow(log(abs(fftshift((fft2(1-H))))),[]);
    G = (1-H).*forier_spec;
    figure;imshow(log(abs(fftshift(G))),[]);
    output_img = real(ifft2(double(G)));

end