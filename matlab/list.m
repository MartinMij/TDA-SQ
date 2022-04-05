function [list] = list(name)
% This function works with functions persistence.m 
% and statistics.m 
% A new list can be added following the pattern. The entry in each array
% must be the name of the midifile without the .mid extension.
% List of works used in the paper Musical Stylistic Analysis: A Study of Intervallic
% Transition Graphs via Persistent Homology are already included.


if strcmp(name,'haydn')
 list={'op17n2-02', 'op20n1-02', 'op33n2-02', 'op50n3-03', 'op64n1-02', 'op71n1-03', 'op77n1-03'}
elseif strcmp(name,'beethoven')
 list={'q01-3', 'q04-3', 'q06-3', 'q09-3', 'q12-3'};
elseif strcmp(name,'mozart')
 list={'sq5', 'sq8', 'sq13', 'sq14', 'sq19', 'sq23'};
elseif strcmp(name,'minuetom')
 list={'k080-03', 'k168-03', 'k169-03', 'k170-02', 'k171-02', 'k173-03', 'k387-02', 'k428-03', 'k464-02'};
elseif strcmp(name,'andantem')
 list={'k155-02', 'k157-02', 'k159-01', 'k168-02', 'k171-03', 'k421-02', 'k464-03', 'k575-02', 'k590-02'};
elseif strcmp(name,'allegrom')
 list={'k080-02', 'k155-01', 'k157-01', 'k158-01', 'k168-01', 'k168-04', 'k421-01', 'k499-04', 'k589-01', 'k590-04'};
elseif strcmp(name,'adagiom')
 list={'k080-01', 'k156-02', 'k172-02', 'k458-03', 'k465-01', 'k499-03', 'k160-02', 'k170-03'}; 
elseif strcmp(name,'adagioh')
 list={'op01n0-03', 'op01n1-03', 'op01n2-03', 'op01n3-01', 'op01n4-03', 'op09n2-03', 'op17n1-03', 'op17n2-03', 'op17n3-03', 'op17n5-03', 'op20n5-03', 'op20n6-02', 'op33n3-03', 'op50n2-02', 'op54n2-04', 'op64n5-02', 'op76n4-02', 'op77n1-02'};
elseif strcmp(name,'allegroh')
 list={'op01n1-01', 'op01n2-01', 'op17n3-04', 'op20n1-01', 'op20n3-04', 'op33n1-01', 'op33n3-01', 'op33n4-01', 'op50n1-01', 'op55n2-02', 'op64n4-01', 'op64n6-01', 'op71n1-01'};
elseif strcmp(name,'minuetoh')
 list={'op01n0-02', 'op01n1-02', 'op01n3-04', 'op01n4-02', 'op01n6-02', 'op09n2-02', 'op09n3-02', 'op17n1-02', 'op17n3-02', 'op17n6-02', 'op20n3-02', 'op20n5-02', 'op20n6-03', 'op42-02', 'op50n2-03', 'op50n5-03', 'op54n1-03', 'op55n2-03', 'op64n5-03', 'op71n1-03', 'op71n3-03'};
elseif strcmp(name,'prestoh')
 list={'op01n0-01', 'op01n0-05', 'op01n1-05', 'op01n2-05', 'op01n3-05', 'op01n4-01', 'op01n4-05', 'op01n6-05', 'op09n3-04', 'op17n1-01', 'op17n1-04', 'op17n5-04', 'op20n1-04', 'op33n1-04', 'op33n3-04', 'op33n4-04', 'op42-04', 'op54n3-04', 'op55n2-04', 'op55n3-04', 'op64n1-04', 'op64n2-04', 'op64n4-04', 'op64n6-04', 'op76n5-04', 'op77n1-04'};
elseif strcmp(name,'adagiob')
 list={'quartet01-2', 'quartet02-2', 'quartet06-4a', 'quartet07-3', 'quartet08-2', 'quartet10-2', 'quartet15-3'};
elseif strcmp(name,'allegrob')
 list={'quartet01-4', 'quartet02-1', 'quartet03-3', 'quartet04-4', 'quartet05-1', 'quartet07-1', 'quartet08-1', 'quartet11-1', 'quartet13-6', 'quartet14-7'};
elseif strcmp(name,'minuetob')
 list={'quartet04-3', 'quartet05-2', 'quartet09-3'};
elseif strcmp(name,'scherzob')
 list={'quartet01-3', 'quartet02-3', 'quartet06-3', 'quartet12-3'};
else 
 list="there is no list in list.m with that name";

end
end

