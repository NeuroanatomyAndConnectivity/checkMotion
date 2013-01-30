 
sub = ({'sbt01/day1' 'sbt01/day7' 'sbt01/day94' 'sbt02/day1' 'sbt02/day7' 'sbt02/day88'...
    'sbt03/day1' 'sbt03/day7' 'sbt03/day91' 'sbt05/day1' 'sbt05/day6' 'sbt05/day82'...
   'sbt06/day1' 'sbt06/day8' 'sbt06/day95' 'sbt08/day1' 'sbt08/day7' 'sbt08/day87'...
   'sbt10/day1' 'sbt10/day7' 'sbt10/day87' 'sbt18/day1' 'sbt18/day7' 'sbt18/day86'...
   'sbt18/day1' 'sbt18/day7' 'sbt18/day86' 'sbt24/day1' 'sbt24/day7' 'sbt24/day88'...
   'sbt26/day1' 'sbt26/day28' 'sbt26/day95' 'sbt28/day1' 'sbt28/day4' 'sbt28/day89'...
   'sbt31/day1' 'sbt31/day4' 'sbt31/day100'});
 
 
for s = 1: length(sub)
    
 
filename = ['/Volumes/sovadia/fmri/subjects/' sub{s} '/fun/fun_mc.txt'];
fun_mc = load(filename);
 
 
% computing total motion for each volume
 
j = length(fun_mc);
 
 
for i = 1:j
% compute RMS for each volume (translation parameters)  
 
    T = fun_mc(i,4:6);
    fun_mc(i,7) = rms(T);
 
% compute EULER for each volume (rotation parameters)
 
    R = fun_mc(i,1:3);
    fun_mc (i,8) = euler(R);
 
end
% computing mean and max
%% TRANSLATION
% mean absolute displacement in translation
fun_mc(1,9) =  mean(fun_mc(1:end,7));
% maximum absolute displacment in translation
fun_mc(2,9) = max(fun_mc(1:end,7));
 
%% ROTATION
% mean absolute displacement in rotation
fun_mc(1,10) = mean(fun_mc(1:end,8));
% maximum absolute displacment in rotation
fun_mc(2,10) = max(fun_mc(1:end,8));
 
 
% save fun_mc
filenameOutput = ['/Volumes/sovadia/fmri/subjects/' sub{s} '/fun/fun_mc_total_disp.txt'];
fid=fopen(filenameOutput,'w');
for row = 1:j
    for col = 7:10
    fprintf(fid,'%8.5f   ',fun_mc(row,col));
    end
    fprintf(fid,'\n');
end
fclose(fid);
end 
