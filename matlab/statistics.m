function P = statistics(name)
% This function computes statistics based on the barcodes. Note that files with the barcodes 
% information need to be already computed using persistence.m function.
%
% INPUT: A (char) name of a midifile or the name of a list added to the list.m function.
%
% OUTPUT: A poin in R^24 for each work as described in the paper Musical Stylistic Analysis: A Study of Intervallic
% Transition Graphs via Persistent Homology


 if size(strfind(name, '.mid'))~=0
  P=stat(name);
 else 
  if strcmp(class(list(name)),'cell')
   names=list(name);
   l=size(names, 2);
   P=[];
   for i=1:l
   Q=stat([char(names(i)), '.mid']);
   P=[P; Q];
   end
  else
    fprintf("There is no list of works named %s or you have not run yet 'persistence.m'", name);
  end 
 end

 function P=stat(midiname)
  filename = regexprep(midiname,'.mid','');
  A=cell(2,4);
  B=cell(2,4);
  ent=[];
  mn=[];
  stdev=[];
  for i=1:2
   for j=1:4
    p=0;
    L=0;
    B{i,j}=load([filename,'_',num2str(j),'_edges_SP_distmat_intervals_',num2str(i-1),'_right_format.txt']);
    for k=1:size(B{i,j},1)
     if B{i,j}(k,2)<inf
      A{i,j}(k)=B{i,j}(k,2)-B{i,j}(k,1);
      L=L+A{i,j}(k);
     end
    end
    m=max(A{i,j});
    for k=(size(A{i,j},2)+1):size(B{i,j},1)
     L=L+m+1;
    end
    for k=1:size(A{i,j},2)
      p=p+(A{i,j}(k)/L)*log((A{i,j}(k)/L));
    end
    for k=(size(A{i,j},2)+1):size(B{i,j},1)
     p=p+((m+1)/L)*log((m+1)/L);
    end
    ent(i,j)=-p;
    mn(i,j)=mean(A{i,j});
    stdev(i,j)=std(A{i,j}); 
   end 
  end
  P=[];
  for j=1:4
   for i=1:2
    P=[P [mn(i,j), stdev(i,j), ent(i,j)]];
   end  
  end
 end
 
end
