lm = imread('Coins2.jpg');
%imshow(lm);
%imtool('Coins2.jpg');

I_Red = im (:,:,1); 
I_Green = im (:,:,2); 
I_Blue = im (:,:,3);

%imshow(I_Red);
%imshow(I_Blue);
%imshow(I_Green);

ThrBlue = imbinarize(I_Blue,.65);
ThrGreen = imbinarize(I_Green,.69);
ThrRed = imbinarize(I_Red,.69);
%imshow(ThrBlue);
%imshow(ThrGreen);
%imshow(ThrRed);

ThrSum = (~ThrRed&~ThrGreen&~ThrBlue);

[centers, radii] = imfindcircles(ThrSum,[19 29]);

SizeQuarter = 27.04;
Quarter = 0 ;
SizeDime = 19.05;
Dime = 0 ;
SizeNickle = 24.825;
Nickle = 0 ;
SizePenny = 21.495;
Penny = 0 ;

AllCoins = length(radii);
for index = 1:AllCoins
coin = radii(index);
if coin > SizeQuarter
Quarter = Quarter + 1;
end
end
Change = Quarter *25; 

AllCoins = length(radii);
for index = 1:AllCoins
coin = radii(index);
if coin > SizeDime && coin < SizePenny
Dime = Dime + 1;
end
end
Change = Change + (Dime*10); 

AllCoins = length(radii);
for index = 1:AllCoins
coin = radii(index);
if coin > SizePenny && coin < SizeNickle
Penny = Penny + 1;
end
end
Change = Change + (Penny*1); 

AllCoins = length(radii);
for index = 1:AllCoins
coin = radii(index);
if coin > SizeNickle && coin < SizeQuarter
Nickle = Nickle + 1;
end
end
Change = Change + (Nickle*5); 

c = viscircles(centers,radii);

subplot(2,2,1), imshow(lm);
title ('Original')
subplot(2,2,2), imshow(ThrGreen);
title ('Threshold Green')
subplot(2,2,3), imshow(ThrSum);
title ('Combined Threshold')
subplot(2,2,4), imshow();
title ('124 cents in the image') 


