function [M] = persistence(midiname)
% This function computes zero and one-dimensional barcodes of a given string quartet 
% in midi file format.
%
% INPUT midi file of the string quartet
%
% OUTPUT .txt files with the barcodes. One file per track and per dimension zero and one. Files have as first entry
% in each row the bird time of a class and as a second entry, the time when it dies.
% In the name file 'filename_i_edges_SP_distmat_intervals_j_right_format.txt', 
% i stands for the track number and j for the dimension of the barcode. 

import edu.stanford.math.plex4.*;
%  As we are working with string quartets, we extract the information 
%  from the four instruments and storage in different matrices. In the process we convert polyphonic tracks 
%  into monophonic in order to be able to apply the pcdist2 function from MIDI Toolbox. 
nmat=readmidi(midiname);
i=1;
while i<size(nmat,1) && nmat(i,1)<=nmat(i+1,1)
 i=i+1;
end
nm1=nmat(1:i,:);
nm1=extreme(nm1,'high');
i2=i+1
i=i+1;
while i<size(nmat,1) && nmat(i,1)<=nmat(i+1,1)
 i=i+1;
end
nm2=nmat(i2:i,:);
nm2=extreme(nm2,'high');
i3=i+1
i=i+1;
while i<size(nmat,1) && nmat(i,1)<=nmat(i+1,1)
 i=i+1;
end
nm3=nmat(i3:i,:);
nm3=extreme(nm3,'high');
i4=i+1
i=i+1;
while i<size(nmat,1) && nmat(i,1)<=nmat(i+1,1)
 i=i+1;
end
nm4=nmat(i4:i,:);
nm4=extreme(nm4,'high');

nmpitch1=pcdist2(nm1);
nmpitch2=pcdist2(nm2);
nmpitch3=pcdist2(nm3);
nmpitch4=pcdist2(nm4);
filename = regexprep(midiname,'.mid','');

%  We store in a file (named filename_"track_number"_edges_SP_distmat.txt ) the distance matrix
%  of the finite metric space induced by the intervallic transition graph whose adjacency matrix
%  is given by nmpitchj, j=1, 2, 3, 4. This is done as described in the paper Musical Stylistic
%  Analysis: A Study of Intervallic Transition Graphs via Persistent Homology.
%%  Track 1
 output_file_name=[filename,'_1_edges.txt'];
 fileID=fopen(output_file_name, 'w'); 
 %% First we print distance between vertices joined by an edge
 for i=1:12
  for j=1:12
   if nmpitch1(i,j)~=0
    if i==j
     fprintf(fileID, '%d %d %1.4f\n', 13*i-12, 13*i-12+j, 1/nmpitch1(i,j));
    else  
     fprintf(fileID, '%d %d %1.4f\n%d %d %1.4f\n', 13*i-12, 13*i-12+j, 2/nmpitch1(i,j),13*i-12+j,13*j-12, 2/nmpitch1(i,j)); 
    end
   end
  end
 end  
 fclose(fileID);
 %% Calculate the remaining distances. Infinite distances are given by 100 times the maximum distance in the space
 M=shortestpaths([filename,'_1_edges.txt']);
 M1=M;
 %% Erase added vertices whose connected component consists of itself
 C=load([filename,'_1_edges_SP_distmat.txt']);
 v=[];
 for i=1:156
  E=100*M*ones(1,156);
  E(i)=0;
  if mod(i, 13)~=1&C(i,:)==E
   v=[v i];
  end
 end
 C(v, :)=[];
 C(:, v)=[];
 writematrix(C, [filename,'_1_edges_SP_distmat.txt'], 'Delimiter', ' ')  ;
 
 %%Track 2
 output_file_name=[filename,'_2_edges.txt'];
 fileID=fopen(output_file_name, 'w'); 
 %% First we print distance between vertices joined by an edge
 for i=1:12
  for j=1:12
   if nmpitch2(i,j)~=0
    if i==j
     fprintf(fileID, '%d %d %1.4f\n', 13*i-12, 13*i-12+j, 1/nmpitch2(i,j));
    else  
     fprintf(fileID, '%d %d %1.4f\n%d %d %1.4f\n', 13*i-12, 13*i-12+j, 2/nmpitch2(i,j),13*i-12+j,13*j-12, 2/nmpitch2(i,j)); 
    end
   end
  end
 end  
 fclose(fileID);
 %% Calculate the remaining distances. Infinite distances are given by 100 times the maximum distance in the space
 M=shortestpaths([filename,'_2_edges.txt']);
 M2=M;
 %% Erase added vertices whose connected component consists of itself
 C=load([filename,'_2_edges_SP_distmat.txt']);
 v=[];
 for i=1:156
  E=100*M*ones(1,156);
  E(i)=0;
  if mod(i, 13)~=1&C(i,:)==E
   v=[v i];
  end
 end
 C(v, :)=[];
 C(:, v)=[];
 writematrix(C, [filename,'_2_edges_SP_distmat.txt'], 'Delimiter', ' ')  ;
 
 %% Track 3
 output_file_name=[filename,'_3_edges.txt'];
 fileID=fopen(output_file_name, 'w'); 
 %% First we print distance between vertices joined by an edge
 for i=1:12
  for j=1:12
   if nmpitch3(i,j)~=0
    if i==j
     fprintf(fileID, '%d %d %1.4f\n', 13*i-12, 13*i-12+j, 1/nmpitch3(i,j));
    else  
     fprintf(fileID, '%d %d %1.4f\n%d %d %1.4f\n', 13*i-12, 13*i-12+j, 2/nmpitch3(i,j),13*i-12+j,13*j-12, 2/nmpitch3(i,j)); 
    end
   end
  end
 end  
 fclose(fileID);
 %% Calculate the remaining distances. Infinite distances are given by 100 times the maximum distance in the space
 M=shortestpaths([filename,'_3_edges.txt']);
 M3=M;
 %% Erase added vertices whose connected component consists of itself
 C=load([filename,'_3_edges_SP_distmat.txt']);
 v=[];
 for i=1:156
  E=100*M*ones(1,156);
  E(i)=0;
  if mod(i, 13)~=1&C(i,:)==E
   v=[v i];
  end
 end
 C(v, :)=[];
 C(:, v)=[];
 writematrix(C, [filename,'_3_edges_SP_distmat.txt'], 'Delimiter', ' ')  ;

%%Track 4
 output_file_name=[filename,'_4_edges.txt'];
 fileID=fopen(output_file_name, 'w'); 
 %% First we print distance between vertices joined by an edge
 for i=1:12
  for j=1:12
   if nmpitch4(i,j)~=0
    if i==j
     fprintf(fileID, '%d %d %1.4f\n', 13*i-12, 13*i-12+j, 1/nmpitch4(i,j));
    else  
     fprintf(fileID, '%d %d %1.4f\n%d %d %1.4f\n', 13*i-12, 13*i-12+j, 2/nmpitch4(i,j),13*i-12+j,13*j-12, 2/nmpitch4(i,j)); 
    end
   end
  end
 end  
 fclose(fileID);
 %% Calculate the remaining distances. Infinite distances are given by 100 times the maximum distance in the space
 M=shortestpaths([filename,'_4_edges.txt']);
 M4=M;
 %% Erase added vertices whose connected component consists of itself
 C=load([filename,'_4_edges_SP_distmat.txt']);
 v=[];
 for i=1:156
  E=100*M*ones(1,156);
  E(i)=0;
  if mod(i, 13)~=1&C(i,:)==E
   v=[v i];
  end
 end
 C(v, :)=[];
 C(:, v)=[];
 writematrix(C, [filename,'_4_edges_SP_distmat.txt'], 'Delimiter', ' ')  ;

% Now we calculate barcodes of dimension 1 and 2. 
  vietoris_rips_javaplexDM([filename,'_1_edges_SP_distmat.txt'],2,M1,10*M1);
  vietoris_rips_javaplexDM([filename,'_2_edges_SP_distmat.txt'],2,M2,10*M2);
  vietoris_rips_javaplexDM([filename,'_3_edges_SP_distmat.txt'],2,M3,10*M3);
  vietoris_rips_javaplexDM([filename,'_4_edges_SP_distmat.txt'],2,M4,10*M4);

% We erase not needed files written in the process.
 delete *edges.txt
 delete *distmat.txt
 delete *0.txt
 delete *1.txt
 delete *2.txt
 delete *2_right_format.txt
end   
