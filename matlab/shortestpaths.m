function [M] = shortestpaths( filename )

%  INPUT This function takes an edge list of an undirected graph. Each line is of the form
%  i j w_{i, j}
%  where w is the weight of the undirected edge (i, j). If (i, j) is in the list, (j, i) must not be. 
%  OUTPUT A file with a distance matrix. Each line is a row in the matrix
%  In this code, infinite distances are replaced by 100 times the maximum finite distance. 

A=load(filename);
%a=max([A(:,1)', A(:,2)']);
a=156;
B=sparse(A(:,1), A(:,2), A(:,3), a, a);
C=B+B';
G=graph(C);
D=distances(G)
id=D==inf;
D(id)=zeros;
M=max(max(D));
D(id)=100*M;

filename = regexprep(filename,'.txt',''); 
output_file_name=[filename,'_SP_distmat.txt'];
fileID=fopen(output_file_name,'w');

for i=1:a
 output_line=sprintf('%8.18f ', D(i,:));
 fprintf(fileID,'%s\n',output_line);
end
fclose(fileID);
end
