function varargout = TABLA_1_04_2013(varargin)
% TABLA_1_04_2013 MATLAB code for TABLA_1_04_2013.fig
%      TABLA_1_04_2013, by itself, creates a new TABLA_1_04_2013 or raises the existing
%      singleton*.
%
%      H = TABLA_1_04_2013 returns the handle to a new TABLA_1_04_2013 or the handle to
%      the existing singleton*.
%
%      TABLA_1_04_2013('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TABLA_1_04_2013.M with the given input arguments.
%
%      TABLA_1_04_2013('Property','Value',...) creates a new TABLA_1_04_2013 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before TABLA_1_04_2013_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to TABLA_1_04_2013_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help TABLA_1_04_2013

% Last Modified by GUIDE v2.5 01-Apr-2013 14:56:01

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @TABLA_1_04_2013_OpeningFcn, ...
                   'gui_OutputFcn',  @TABLA_1_04_2013_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before TABLA_1_04_2013 is made visible.
function TABLA_1_04_2013_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to TABLA_1_04_2013 (see VARARGIN)

% Choose default command line output for TABLA_1_04_2013
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
% global s
% s = serial('COM3');
% set(s,'BytesAvailableFcnMode','byte');
% set(s,'InputBufferSize',1024);
% BytesToRead=getappdata(0,'BytesToRead');
% % if isappdata(0,'BytesToRead');
% set(s,'BytesAvailableFcnCount',BytesToRead);
% % else
% % set(s,'BytesAvailableFcnCount',20);
% % end
% fopen(s);
% s.BytesAvailableFcn =  {'MyCallBack',BytesToRead};%{'mycallback',time
setappdata(0  , 'TableHandle'    , handles.uitable1);
BytesToRead=640;
setappdata(0,'BytesToRead',BytesToRead);
% UIWAIT makes TABLA_1_04_2013 wait for user response (see UIRESUME)
% uiwait(handles.figure1);
global BaudRate
BaudRate=get(handles.BaudRate,'String');
BaudRate=str2num(BaudRate);
global M
M(1,1:32)=1:32;

% --- Outputs from this function are returned to the command line.
function varargout = TABLA_1_04_2013_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in StartButton.
function StartButton_Callback(hObject, eventdata, handles)
% hObject    handle to StartButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global s
% fscanf(s,'%c',1);
fwrite(s,double('S'))

fwrite(s,71)
% fscanf(s,'%c',1);
% fwrite(s,[01000111])
% fprintf(s,'G');

% --- Executes on button press in StopButton.
function StopButton_Callback(hObject, eventdata, handles)
% hObject    handle to StopButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global s
% fprintf(s,'S');
fwrite(s,double('S'))

% --- Executes on button press in CloseButton.
function CloseButton_Callback(hObject, eventdata, handles)
% hObject    handle to CloseButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global s
try
rmappdata(0,'BytesToRead');
% rmappdata(0,'TableHandle');
% rmappdata(0,'filename');
catch
end
try
% rmappdata(0,'BytesToRead');
rmappdata(0,'TableHandle');
% rmappdata(0,'filename');
catch
end

try
% rmappdata(0,'BytesToRead');
% rmappdata(0,'TableHandle');
 rmappdata(0,'filename');
catch
end
% rmappdata(0,'pathname');
fclose(s)
delete(s)

clear s BaudRate
close



function BytesToRead_Callback(hObject, eventdata, handles)
% hObject    handle to BytesToRead (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

BytesToRead=str2double(get(hObject,'String'));
setappdata(0,'BytesToRead',BytesToRead);
% Hints: get(hObject,'String') returns contents of BytesToRead as text
%         returns contents of BytesToRead as a double
% global s
% s = serial('COM3');
% set(s,'BytesAvailableFcnMode','byte');
% set(s,'InputBufferSize',1024);
% BytesToRead=getappdata(0,'BytesToRead');
% % if isappdata(0,'BytesToRead');
% set(s,'BytesAvailableFcnCount',BytesToRead);
% % else
% % set(s,'BytesAvailableFcnCount',20);
% % end
% fopen(s);
% s.BytesAvailableFcn =  {'MyCallBack',BytesToRead};%{'mycallback',time

% --- Executes during object creation, after setting all properties.
function BytesToRead_CreateFcn(hObject, eventdata, handles)
% hObject    handle to BytesToRead (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in OpenPortButton.
function OpenPortButton_Callback(hObject, eventdata, handles)
% hObject    handle to OpenPortButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global s 
global BaudRate
s = serial('COM11');
 set(s,'BaudRate',BaudRate);
set(s,'BytesAvailableFcnMode','byte');
set(s,'InputBufferSize',65536);
% set(s,'OutputBufferSize',1);
BytesToRead=getappdata(0,'BytesToRead');
% if isappdata(0,'BytesToRead');
set(s,'BytesAvailableFcnCount',BytesToRead);
%  s.ReadAsyncMode = 'manual';
% else
% set(s,'BytesAvailableFcnCount',20);
% end
fopen(s);
s.BytesAvailableFcn =  {'MyCallBack28_03_2013',BytesToRead};%{'mycallback',time

% --- Executes on button press in ClosePortButton.
function ClosePortButton_Callback(hObject, eventdata, handles)
% hObject    handle to ClosePortButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global s
fclose(s)



function BaudRate_Callback(hObject, eventdata, handles)
% hObject    handle to BaudRate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of BaudRate as text
%        str2double(get(hObject,'String')) returns contents of BaudRate as a double
global BaudRate
BaudRate=get(handles.BaudRate,'String');
BaudRate=str2num(BaudRate);

% --- Executes during object creation, after setting all properties.
function BaudRate_CreateFcn(hObject, eventdata, handles)
% hObject    handle to BaudRate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% 
% function BytesToSend_Callback(hObject, eventdata, handles)
% % hObject    handle to BytesToSend (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hints: get(hObject,'String') returns contents of BytesToSend as text
% %        str2double(get(hObject,'String')) returns contents of BytesToSend as a double
% global s
% CustomBytes=str2double(get(handles.BytesToSend,'String'));
% 
% % --- Executes during object creation, after setting all properties.
% function BytesToSend_CreateFcn(hObject, eventdata, handles)
% % hObject    handle to BytesToSend (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    empty - handles not created until after all CreateFcns called
% 
% % Hint: edit controls usually have a white background on Windows.
% %       See ISPC and COMPUTER.
% if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
%     set(hObject,'BackgroundColor','white');
% end


% % --- Executes on button press in ChooseFile.
% function ChooseFile_Callback(hObject, eventdata, handles)
% % hObject    handle to ChooseFile (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% [filename, pathname] = uiputfile(...
%  {'*.csv';'*.txt';'*.mat';'*.*'},...
%  'Save data as');
% setappdata(0,'filename',filename);
% % setappdata(0,'pathname',pathname);
% % filename=[pathname,filename]
% global M
% 
% dlmwrite(filename, M, '-append')
