% This script is intended to obtain a PCA and dispersion plot from Mozart's works as described in the
% paper Musical Stylistic Analysis: A Study of Intervallic Transition Graphs via Persistent Homology
% Note that results are saved in a folder named 'results' which needs to be created.

AD=statistics('adagiom');
AL=statistics('allegrom');
AN=statistics('andantem');
MI=statistics('minuetom');
X=[AD; AL; AN; MI];
[coeff, score, latent, tsquared, explained, mu]=pca(X);
explained;
ADPCA=score(1:size(AD, 1),:);
ALPCA=score(size(AD, 1)+1:size(AD, 1)+size(AL, 1),:);
ANPCA=score(size(AD, 1)+size(AL, 1)+1:size(AD, 1)+size(AL, 1)+size(AN,1),:);
MIPCA=score(size(AD, 1)+size(AL, 1)+size(AN,1)+1:size(AD, 1)+size(AL, 1)+size(AN,1)+size(MI, 1),:);
figure
plot(ADPCA(:,1), ADPCA(:,2),'.r', ALPCA(:,1), ALPCA(:,2),'.b', ANPCA(:,1), ANPCA(:,2),'.k',MIPCA(:,1), MIPCA(:,2),'.c')
xlabel('1st principal component');
ylabel('2nd principal component');
legend({'Adagio','Allegro', 'Andante','Menuetto'})
saveas(gcf, 'results/mozart.eps');
%%%dispersion
dAD=squareform(pdist([ADPCA; mean(ADPCA)]));
dAL=squareform(pdist([ALPCA; mean(ALPCA)]));
dAN=squareform(pdist([ANPCA; mean(ANPCA)]));
dMI=squareform(pdist([MIPCA; mean(MIPCA)]));
DAD=dAD(1:size(AD, 1),size(AD, 1)+1).^2;
DAL=dAL(1:size(AL, 1),size(AL, 1)+1).^2;
DAN=dAN(1:size(AN, 1),size(AN, 1)+1).^2;
DMI=dMI(1:size(MI, 1),size(MI, 1)+1).^2;
figure
plot([sqrt(sum(DMI)/(size(DMI, 1)-1)), sqrt(sum(DAN)/(size(DAN, 1)-1)), sqrt(sum(DAL)/(size(DAL, 1)-1)),sqrt(sum(DAD)/(size(DAD, 1)-1))]);
xticks([1 2 3 4]);
xticklabels({'Minuet','Andante','Allegro', 'Adagio'});
saveas(gcf, 'results/mozart-dispersion.eps');
