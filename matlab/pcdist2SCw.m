function pcd = pcdist2SC2(nmat)
% This is a modification of the function pcdist2.m in the MIDI Toolbox
% to wight the transitions as described in the paper Musical Stylistic
% Analysis: A Study of Intervallic Transition Graphs via Persistent Homology.
%
% 2nd order pitch-class distribution
% pcd = pcdist2(nmat);
% Calculates the 2nd order pitch-class distribution of NMAT
% weighted by note durations. The note durations are based on 
% duration in seconds that are modified according to Parncutt's
% durational accent model (1994).
%
% Input argument:
%	NMAT = notematrix
%
% Output:
%	PCD = 2nd order pitch-class distribution of NMAT
%	12 * 12 matrix
%	e.g. PCD(1,2) = probability of transitions from C to C#
%
% Change History :
% Date		Time	Prog	Note
% 17.6.2002	20:03	TE	Created under MATLAB 5.3 (PC)
%© Part of the MIDI Toolbox, Copyright © 2004, University of Jyvaskyla, Finland
% See License.txt

if isempty(nmat), return; end
if ~ismonophonic(nmat), disp([mfilename, ' works only with monophonic input!']); pcd=[]; return; end

pc = mod(pitch(nmat),12)+1; % C = 1 etc.
du = duraccent(dur(nmat,'sec')); % durations are weighted by Parncutt's durational accent
pcd = zeros(12,12);
%silence
onss=nmat(:,6);
durs=nmat(:,7);
%
for k=2:length(pc)

	pcd(pc(k-1),pc(k)) = pcd(pc(k-1),pc(k))+du(k-1)*du(k)*(1/(duraccent(onss(k)-onss(k-1)-durs(k-1))/(du(k-1)*du(k))+1));
     %  pcd(pc(k-1),pc(k)) = pcd(pc(k-1),pc(k))+du(k-1)*du(k);
        %silence
     %  if onss(k-1)+durs(k-1)<onss(k)
     %     pcd(pc(k-1),pc(k)) = pcd(pc(k-1),pc(k))-du(k-1)*du(k);
     %  end
    

end
pcd = pcd/sum(sum(pcd + 1e-12)); % normalize 

