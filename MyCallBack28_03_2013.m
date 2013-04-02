function MyCallBack28_03_2013(obj,event,BytesToRead)
EventType = event.Type;
name = get(obj, 'Name');
out=str2num(dec2bin(fread(obj,BytesToRead,'uchar'))); %#ok<ST2NM>
OUT=nan(20,32);
% OUT1=nan(20,32);

% p=nan(4,32);
count=0;
for n=1:20:20*32
    count=count+1;
   OUT(1:20,count) = out(n:n+19,:);
%    OUT1(1:20,count) = out1(n:n+19,:);
   
%    p(1:4,count)=char(OUT1(2:5,count));
%    pp
end
GuiHandles=getappdata(0,'GuiHandles');

set(getappdata(GuiHandles,'TableHandle'),'Data',OUT)
set(getappdata(GuiHandles,'TableHandle'),'ColumnWidth',{60})
% p=OUT(2:5,:);
% 
% % pp=p
% 
% filename=getappdata(0,'filename');
% 
% dlmwrite(filename, p, '-append')
% pathname=getappdata(0,'pathname');
% if ~exist('data.txt','file')
%     save('data.txt', 'p','-ASCII');
% else
%     save('data.txt', 'p','-ASCII','-append');
% 
% end
% disp(p)
% set( getappdata(0,'TableHandle'),'Data',AAAA)

% ToSet=getappdata(hMainGiu,'FPGADataTable');
% set(ToSet,'')
% 
% t = uitable('Data',out,'Position',[50 50 900 850]);
%  set(t,'ColumnWidth',{50})
%  drawnow
%  