function  WriteFile( Th1,Th2,Th3 )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
fid=fopen('C:\Users\YASARA\Desktop\FYPTraningModule\MyFile.txt','w');
fprintf(fid, '%f %f %f\n', [Th1 Th2 Th3]');
fclose(fid);
end

