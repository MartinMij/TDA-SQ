% This script is intended to obtain a PCA and dispersion plot from minuets corresponding
% to Haydn, Mozart and Beethoven as described in the
% paper Musical Stylistic Analysis: A Study of Intervallic Transition Graphs via Persistent Homology
% Note that results are saved in a folder named 'results' which needs to be created.

H=statistics('haydn');
M=statistics('mozart');
B=statistics('beethoven');
X=[H; M; B];
[coeff, score, latent, tsquared, explained, mu]=pca(X);
HPCA=score(1:7,:);
MPCA=score(8:13,:);
BPCA=score(14:18,:);
labels={'1', '2', '3', '4', '5', '6', '7'};
labels6={'2', '3', '4', '5', '6', '7'};
labels5={'1', '2', '3', '4', '5'};
figure
plot(HPCA(:,1), HPCA(:,2),'.r', MPCA(:,1), MPCA(:,2),'.b', BPCA(:,1), BPCA(:,2),'.k')
xlabel('1st principal component');
ylabel('2nd principal component');
text(BPCA(:,1), BPCA(:,2), labels5, 'HorizontalAlignment', 'left', 'Color', 'black');
text(HPCA(:,1), HPCA(:,2), labels, 'HorizontalAlignment', 'left', 'Color', 	'#A2142F');
text(MPCA(:,1), MPCA(:,2), labels6, 'Color', 	'#0072BD');
legend({'Haydn','Mozart', 'Beethoven'})
saveas(gcf, 'results/grafica.eps');
%%dispersiones
dH=squareform(pdist([HPCA; mean(HPCA)]));
dM=squareform(pdist([MPCA; mean(MPCA)]));
dB=squareform(pdist([BPCA; mean(BPCA)]));
DH=dH(1:7,8).^2;
DM=dM(1:6, 7).^2;
DB=dB(1:5, 6).^2;
figure
plot([sqrt(sum(DH)/6), sqrt(sum(DM)/5), sqrt(sum(DB)/4)])
xticks([1 2 3]);
xticklabels({'Haydn','Mozart','Beethoven'});
saveas(gcf, 'results/dispersion.eps');
