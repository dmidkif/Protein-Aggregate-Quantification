function varargout = AutoImaging_Confocal_DFM_v01_2018(varargin)
% AutoImaging_Confocal_DFM_v01_2018 MATLAB code for AutoImaging_Confocal_DFM_v01_2018.fig
%      AutoImaging_Confocal_DFM_v01_2018, by itself, creates a new AutoImaging_Confocal_DFM_v01_2018 or raises the existing
%      singleton*.
%      H = AutoImaging_Confocal_DFM_v01_2018 returns the handle to a new AutoImaging_Confocal_DFM_v01_2018 or the handle to
%      the existing singleton*.
%
%      AutoImaging_Confocal_DFM_v01_2018('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in AutoImaging_Confocal_DFM_v01_2018.M with the given input arguments.
%
%      AutoImaging_Confocal_DFM_v01_2018('Property','Value',...) creates a new AutoImaging_Confocal_DFM_v01_2018 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before AutoImaging_Confocal_DFM_v01_2018_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to AutoImaging_Confocal_DFM_v01_2018_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help AutoImaging_Confocal_DFM_v01_2018

% Last Modified by GUIDE v2.5 07-Mar-2018 09:05:10

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @AutoImaging_Confocal_DFM_v01_2018_OpeningFcn, ...
                   'gui_OutputFcn',  @AutoImaging_Confocal_DFM_v01_2018_OutputFcn, ...
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

% --- Executes just before AutoImaging_Confocal_DFM_v01_2018 is made visible.
function AutoImaging_Confocal_DFM_v01_2018_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to AutoImaging_Confocal_DFM_v01_2018 (see VARARGIN)

% Choose default command line output for AutoImaging_Confocal_DFM_v01_2018
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes AutoImaging_Confocal_DFM_v01_2018 wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% --- Outputs from this function are returned to the command line.
function varargout = AutoImaging_Confocal_DFM_v01_2018_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in Valve0.
function Valve0_Callback(hObject, eventdata, handles)
% hObject    handle to Valve0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Valve0
% Valve=getappdata(handles.figure1,'Valve');
DevId=str2double(get(handles.DevId,'String'));
ValveOpen=str2double(get(handles.ValveOpen,'String'));
ValveClosed=str2double(get(handles.ValveClosed,'String'));
% NV=Valve.Entry;
if (get(hObject,'Value') == get(hObject,'Max'))
    % Radio button is selected, take appropriate action
    calllib('PacDrive_x64','PacSetLEDState',DevId,0,ValveOpen)
else
    % Radio button is not selected, take appropriate action
    calllib('PacDrive_x64','PacSetLEDState',DevId,0,ValveClosed)
end

% --- Executes on button press in Valve1.
function Valve1_Callback(hObject, eventdata, handles)
% hObject    handle to Valve1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Valve1
DevId=str2double(get(handles.DevId,'String'));
ValveOpen=str2double(get(handles.ValveOpen,'String'));
ValveClosed=str2double(get(handles.ValveClosed,'String'));
if (get(hObject,'Value') == get(hObject,'Max'))
    % Radio button is selected, take appropriate action
    calllib('PacDrive_x64','PacSetLEDState',DevId,1,ValveOpen)
%     calllib('PacDrive','PacSetLEDState',DevId,1,ValveOpen)
else
    % Radio button is not selected, take appropriate action
   calllib('PacDrive_x64','PacSetLEDState',DevId,1,ValveClosed)
%     calllib('PacDrive','PacSetLEDState',DevId,1,ValveClosed)
end

% --- Executes on button press in Valve2.
function Valve2_Callback(hObject, eventdata, handles)
% hObject    handle to Valve2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Valve2
DevId=str2double(get(handles.DevId,'String'));
ValveOpen=str2double(get(handles.ValveOpen,'String'));
ValveClosed=str2double(get(handles.ValveClosed,'String'));
if (get(hObject,'Value') == get(hObject,'Max'))
    % Radio button is selected, take appropriate action
    calllib('PacDrive_x64','PacSetLEDState',DevId,2,ValveOpen)
else
    % Radio button is not selected, take appropriate action
    calllib('PacDrive_x64','PacSetLEDState',DevId,2,ValveClosed)
end

% --- Executes on button press in Valve3.
function Valve3_Callback(hObject, eventdata, handles)
% hObject    handle to Valve3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Valve3
DevId=str2double(get(handles.DevId,'String'));
ValveOpen=str2double(get(handles.ValveOpen,'String'));
ValveClosed=str2double(get(handles.ValveClosed,'String'));
if (get(hObject,'Value') == get(hObject,'Max'))
    % Radio button is selected, take appropriate action
    calllib('PacDrive_x64','PacSetLEDState',DevId,3,ValveOpen)
else
    % Radio button is not selected, take appropriate action
    calllib('PacDrive_x64','PacSetLEDState',DevId,3,ValveClosed)
end

% --- Executes on button press in Valve4.
function Valve4_Callback(hObject, eventdata, handles)
% hObject    handle to Valve4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Valve4fPac
DevId=str2double(get(handles.DevId,'String'));
ValveOpen=str2double(get(handles.ValveOpen,'String'));
ValveClosed=str2double(get(handles.ValveClosed,'String'));
if (get(hObject,'Value') == get(hObject,'Max'))
    % Radio button is selected, take appropriate action
    calllib('PacDrive_x64','PacSetLEDState',DevId,4,ValveOpen)
else
    % Radio button is not selected, take appropriate action
    calllib('PacDrive_x64','PacSetLEDState',DevId,4,ValveClosed)
end

% --- Executes on button press in Valve5.
function Valve5_Callback(hObject, eventdata, handles)
% hObject    handle to Valve5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Valve5
DevId=str2double(get(handles.DevId,'String'));
ValveOpen=str2double(get(handles.ValveOpen,'String'));
ValveClosed=str2double(get(handles.ValveClosed,'String'));
if (get(hObject,'Value') == get(hObject,'Max'))
    % Radio button is selected, take appropriate action
    calllib('PacDrive_x64','PacSetLEDState',DevId,5,ValveOpen)
else
    % Radio button is not selected, take appropriate action
    calllib('PacDrive_x64','PacSetLEDState',DevId,5,ValveClosed)
end

% --- Executes on button press in Valve6.
function Valve6_Callback(hObject, eventdata, handles)
% hObject    handle to Valve6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Valve6
DevId=str2double(get(handles.DevId,'String'));
ValveOpen=str2double(get(handles.ValveOpen,'String'));
ValveClosed=str2double(get(handles.ValveClosed,'String'));
if (get(hObject,'Value') == get(hObject,'Max'))
    % Radio button is selected, take appropriate action
    calllib('PacDrive_x64','PacSetLEDState',DevId,6,ValveOpen)
else
    % Radio button is not selected, take appropriate action
    calllib('PacDrive_x64','PacSetLEDState',DevId,6,ValveClosed)
end

% --- Executes on button press in Valve7.
function Valve7_Callback(hObject, eventdata, handles)
% hObject    handle to Valve7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Valve7
DevId=str2double(get(handles.DevId,'String'));
ValveOpen=str2double(get(handles.ValveOpen,'String'));
ValveClosed=str2double(get(handles.ValveClosed,'String'));
if (get(hObject,'Value') == get(hObject,'Max'))
    % Radio button is selected, take appropriate action
    calllib('PacDrive_x64','PacSetLEDState',DevId,7,ValveOpen)
else
    % Radio button is not selected, take appropriate action
    calllib('PacDrive_x64','PacSetLEDState',DevId,7,ValveClosed)
end

% --- Executes on button press in Valve8.
function Valve8_Callback(hObject, eventdata, handles)
% hObject    handle to Valve8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Valve8
DevId=str2double(get(handles.DevId,'String'));
ValveOpen=str2double(get(handles.ValveOpen,'String'));
ValveClosed=str2double(get(handles.ValveClosed,'String'));
if (get(hObject,'Value') == get(hObject,'Max'))
    % Radio button is selected, take appropriate action
    calllib('PacDrive_x64','PacSetLEDState',DevId,8,ValveOpen)
else
    % Radio button is not selected, take appropriate action
    calllib('PacDrive_x64','PacSetLEDState',DevId,8,ValveClosed)
end

% --- Executes on button press in Valve10.
function Valve10_Callback(hObject, eventdata, handles)
% hObject    handle to Valve10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Valve10
Valve=getappdata(handles.figure1,'Valve');
DevId=str2double(get(handles.DevId,'String'));
ValveOpen=str2double(get(handles.ValveOpen,'String'));
ValveClosed=str2double(get(handles.ValveClosed,'String'));
NV=Valve.InjectionPinch;

if (get(hObject,'Value') == get(hObject,'Max'))
    % Radio button is selected, take appropriate action
    calllib('PacDrive_x64','PacSetLEDState',DevId,NV,ValveOpen)
else
    % Radio button is not selected, take appropriate action
    calllib('PacDrive_x64','PacSetLEDState',DevId,NV,ValveClosed)
end

% --- Executes on button press in Valve11.
function Valve11_Callback(hObject, eventdata, handles)
% hObject    handle to Valve11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Valve11
% (handles.figure1,'CDevices')
Valve=getappdata(handles.figure1,'Valve');
DevId=str2double(get(handles.DevId,'String'));
ValveOpen=str2double(get(handles.ValveOpen,'String'));
ValveClosed=str2double(get(handles.ValveClosed,'String'));
NV=Valve.Flushing;
if (get(hObject,'Value') == get(hObject,'Max'))
    % Radio button is selected, take appropriate action
    calllib('PacDrive_x64','PacSetLEDState',DevId,NV,ValveOpen)
else
    % Radio button is not selected, take appropriate action
    calllib('PacDrive_x64','PacSetLEDState',DevId,NV,ValveClosed)
end

% --- Executes on button press in InitValves.
function InitValves_Callback(hObject, eventdata, handles)
% hObject    handle to InitValves (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
addpath('Valves')
addpath('Vision_Support')
if ~libisloaded('PacDrive')
   [notfound,warnings]=loadlibrary('C:\Users\cbe.nematode.share\Desktop\Imaging_Gui_v02\PacDrive_x64.dll','C:\Users\cbe.nematode.share\Desktop\Imaging_Gui_v02\PacDrive_x64.h')
%     [notfound,warnings]=loadlibrary('S:\Research\Lu Group\Group_Member_Folders\Adriana\IM_code\PacDrive.dll','S:\Research\Lu Group\Group_Member_Folders\Adriana\IM_code\PacDrive.h')
end
DevId=str2double(get(handles.DevId,'String'));
calllib('PacDrive_x64','PacInitialize')
% calllib('PacDrive','PacInitialize')
for i=0:15
    calllib('PacDrive_x64','PacSetLEDState',DevId,i,0);
%     calllib('PacDrive','PacSetLEDState',DevId,i,0);
end
addpath('Valves')
%addpath('Vision&Support')

Valve.Entry=str2double(get(handles.EntryValve,'String'));
Valve.Position=str2double(get(handles.PositionValve,'String'));
Valve.Mutant=str2double(get(handles.MutantValve,'String'));
Valve.WildType=str2double(get(handles.WildTypeValve,'String'));
Valve.Injection=str2double(get(handles.InjectionValve,'String'));
Valve.Flushing=str2double(get(handles.FlushingValve,'String'));
Valve.DevId=str2double(get(handles.DevId,'String'));
Valve.Open=str2double(get(handles.ValveOpen,'String'));
Valve.Closed=str2double(get(handles.ValveClosed,'String'));
Valve.ReleaseTime=str2double(get(handles.ReleaseTimeBox,'String'));
Valve.InjectionPinch=str2double(get(handles.InjPinchValve,'String'));
setappdata(handles.figure1,'Valve',Valve);
status='Initialized';
set(handles.status,'String',status);




function ValveClosed_Callback(hObject, eventdata, handles)
% hObject    handle to ValveClosed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ValveClosed as text
%        str2double(get(hObject,'String')) returns contents of ValveClosed as a double

% --- Executes during object creation, after setting all properties.
function ValveClosed_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ValveClosed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function DevId_Callback(hObject, eventdata, handles)
% hObject    handle to DevId (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of DevId as text
%        str2double(get(hObject,'String')) returns contents of DevId as a double

% --- Executes during object creation, after setting all properties.
function DevId_CreateFcn(hObject, eventdata, handles)
% hObject    handle to DevId (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function ValveOpen_Callback(hObject, eventdata, handles)
% hObject    handle to ValveOpen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ValveOpen as text
%        str2double(get(hObject,'String')) returns contents of ValveOpen as a double

% --- Executes during object creation, after setting all properties.
function ValveOpen_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ValveOpen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function GainBox_Callback(hObject, eventdata, handles)
% hObject    handle to GainBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of GainBox as text
%        str2double(get(hObject,'String')) returns contents of GainBox as a double
CDevices=getappdata(handles.figure1,'CDevices');
CCam=getappdata(handles.figure1,'CCam');
CCam.iGain = str2double(get(handles.GainBox,'String'));
    if((CCam.iGain<0)||(CCam.iGain>255))
        error('Gain / sensitivity should be a value between 0 and 255');
    else
        set(getselectedsource(CCam.pCam1),'Gain',CCam.iGain);
        %set(getselectedsource(CCam.pCam2),'Gain',CCam.iGain);
    end
setappdata(handles.figure1,'CCam',CCam);
setappdata(handles.figure1,'CDevices',CDevices);

% --- Executes during object creation, after setting all properties.
function GainBox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to GainBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function ExposureTimeBox_Callback(hObject, eventdata, handles)
% hObject    handle to ExposureTimeBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ExposureTimeBox as text
%        str2double(get(hObject,'String')) returns contents of ExposureTimeBox as a double
    CCam=getappdata(handles.figure1,'CCam');
    CCam.dExposureTime = str2double(get(handles.ExposureTimeBox,'String'));     
    CCam.dFPS1 = round(1000/CCam.dExposureTime);
    dExp = CCam.dExposureTime/1000;
    set(getselectedsource(CCam.pCam1),'ExposureTime',dExp);
    setappdata(handles.figure1,'CCam',CCam);

% --- Executes during object creation, after setting all properties.
function ExposureTimeBox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ExposureTimeBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function EntryWaitBeforeFlush_Callback(hObject, eventdata, handles)
% hObject    handle to EntryWaitBeforeFlush (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EntryWaitBeforeFlush as text
%        str2double(get(hObject,'String')) returns contents of EntryWaitBeforeFlush as a double

% --- Executes during object creation, after setting all properties.
function EntryWaitBeforeFlush_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EntryWaitBeforeFlush (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function EntryWaitBeforeSpeed_Callback(hObject, eventdata, handles)
% hObject    handle to EntryWaitBeforeSpeed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EntryWaitBeforeSpeed as text
%        str2double(get(hObject,'String')) returns contents of EntryWaitBeforeSpeed as a double

% --- Executes during object creation, after setting all properties.
function EntryWaitBeforeSpeed_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EntryWaitBeforeSpeed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function FlushingValve_Callback(hObject, eventdata, handles)
% hObject    handle to FlushingValve (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of FlushingValve as text
%        str2double(get(hObject,'String')) returns contents of FlushingValve as a double

% --- Executes during object creation, after setting all properties.
function FlushingValve_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FlushingValve (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function InjectionValve_Callback(hObject, eventdata, handles)
% hObject    handle to InjectionValve (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of InjectionValve as text
%        str2double(get(hObject,'String')) returns contents of InjectionValve as a double

% --- Executes during object creation, after setting all properties.
function InjectionValve_CreateFcn(hObject, eventdata, handles)
% hObject    handle to InjectionValve (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function WildTypeValve_Callback(hObject, eventdata, handles)
% hObject    handle to WildTypeValve (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of WildTypeValve as text
%        str2double(get(hObject,'String')) returns contents of WildTypeValve as a double

% --- Executes during object creation, after setting all properties.
function WildTypeValve_CreateFcn(hObject, eventdata, handles)
% hObject    handle to WildTypeValve (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function MutantValve_Callback(hObject, eventdata, handles)
% hObject    handle to MutantValve (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of MutantValve as text
%        str2double(get(hObject,'String')) returns contents of MutantValve as a double

% --- Executes during object creation, after setting all properties.
function MutantValve_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MutantValve (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function PositionValve_Callback(hObject, eventdata, handles)
% hObject    handle to PositionValve (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PositionValve as text
%        str2double(get(hObject,'String')) returns contents of PositionValve as a double

% --- Executes during object creation, after setting all properties.
function PositionValve_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PositionValve (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function EntryValve_Callback(hObject, eventdata, handles)
% hObject    handle to EntryValve (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EntryValve as text
%        str2double(get(hObject,'String')) returns contents of EntryValve as a double

% --- Executes during object creation, after setting all properties.
function EntryValve_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EntryValve (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in InitStage.
function InitStage_Callback(hObject, eventdata, handles)
% hObject    handle to InitStage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
CDevices=getappdata(handles.figure1,'CDevices');
try
    fclose(CDevices.pSerial);
end
CDevices.pSerial = serial('COM3','BaudRate',19200,'DataBits',8);
set(CDevices.pSerial,'Terminator','CR')
% CDevices.pSerial=serial('COM4');
% set(CDevices.pSerial,'Terminator','CR');
fopen(CDevices.pSerial);
fprintf(CDevices.pSerial,'71030 2000'); %10,000set z ramp (MAX=3612)
fscanf(CDevices.pSerial)
fprintf(CDevices.pSerial,'71032 2000000'); %%s99,000set z speed (MAX=8820000)
fscanf(CDevices.pSerial)
fprintf(CDevices.pSerial,'71042');
b=fscanf(CDevices.pSerial)
CDevices.zconv=str2double(b(6:end));
fprintf(CDevices.pSerial,'72034');
b=fscanf(CDevices.pSerial)
CDevices.xconv=str2double(b(6:end));
fprintf(CDevices.pSerial,'73034');
b=fscanf(CDevices.pSerial);
CDevices.yconv=str2double(b(6:end));
setappdata(handles.figure1,'CDevices',CDevices); 

% --- Executes on button press in Flush.
function Flush_Callback(hObject, eventdata, handles)
% hObject    handle to Flush (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

Valve=getappdata(handles.figure1,'Valve');
status=st_wt_flushing(Valve);set(handles.status,'String',status);
setappdata(handles.figure1,'Valve',Valve);

% --- Executes on button press in QuitAutomation.
function QuitAutomation_Callback(hObject, eventdata, handles)
% hObject    handle to QuitAutomation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of QuitAutomation

% --- Executes on selection change in StackSaveChoices.
function StackSaveChoices_Callback(hObject, eventdata, handles)
% hObject    handle to StackSaveChoices (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns StackSaveChoices contents as cell array
%        contents{get(hObject,'Value')} returns selected item from StackSaveChoices

% --- Executes during object creation, after setting all properties.
function StackSaveChoices_CreateFcn(hObject, eventdata, handles)
% hObject    handle to StackSaveChoices (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in LoadingMethod.
function LoadingMethod_Callback(hObject, eventdata, handles)
% hObject    handle to LoadingMethod (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns LoadingMethod contents as cell array
%        contents{get(hObject,'Value')} returns selected item from LoadingMethod

% --- Executes during object creation, after setting all properties.
function LoadingMethod_CreateFcn(hObject, eventdata, handles)
% hObject    handle to LoadingMethod (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in StackDisplayChoices.
function StackDisplayChoices_Callback(hObject, eventdata, handles)
% hObject    handle to StackDisplayChoices (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns StackDisplayChoices contents as cell array
%        contents{get(hObject,'Value')} returns selected item from StackDisplayChoices

% --- Executes during object creation, after setting all properties.
function StackDisplayChoices_CreateFcn(hObject, eventdata, handles)
% hObject    handle to StackDisplayChoices (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in UseGBClassifier.
function UseGBClassifier_Callback(hObject, eventdata, handles)
% hObject    handle to UseGBClassifier (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns UseGBClassifier contents as cell array
%        contents{get(hObject,'Value')} returns selected item from UseGBClassifier

% --- Executes during object creation, after setting all properties.
function UseGBClassifier_CreateFcn(hObject, eventdata, handles)
% hObject    handle to UseGBClassifier (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function LoadMean_Callback(hObject, eventdata, handles)
% hObject    handle to LoadMean (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of LoadMean as text
%        str2double(get(hObject,'String')) returns contents of LoadMean as a double

% --- Executes during object creation, after setting all properties.
function LoadMean_CreateFcn(hObject, eventdata, handles)
% hObject    handle to LoadMean (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function LoadStd_Callback(hObject, eventdata, handles)
% hObject    handle to LoadStd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of LoadStd as text
%        str2double(get(hObject,'String')) returns contents of LoadStd as a double

% --- Executes during object creation, after setting all properties.
function LoadStd_CreateFcn(hObject, eventdata, handles)
% hObject    handle to LoadStd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function ImStd_Callback(hObject, eventdata, handles)
% hObject    handle to ImStd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ImStd as text
%        str2double(get(hObject,'String')) returns contents of ImStd as a double

% --- Executes during object creation, after setting all properties.
function ImStd_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ImStd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function ImMean_Callback(hObject, eventdata, handles)
% hObject    handle to ImMean (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ImMean as text
%        str2double(get(hObject,'String')) returns contents of ImMean as a double

% --- Executes during object creation, after setting all properties.
function ImMean_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ImMean (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function ZStackSize_Callback(hObject, eventdata, handles)
% hObject    handle to ZStackSize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ZStackSize as text
%        str2double(get(hObject,'String')) returns contents of ZStackSize as a double

% --- Executes during object creation, after setting all properties.
function ZStackSize_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ZStackSize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function ZStackStepSize_Callback(hObject, eventdata, handles)
% hObject    handle to ZStackStepSize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ZStackStepSize as text
%        str2double(get(hObject,'String')) returns contents of ZStackStepSize as a double

% --- Executes during object creation, after setting all properties.
function ZStackStepSize_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ZStackStepSize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function ImageDelay_Callback(hObject, eventdata, handles)
% hObject    handle to ImageDelay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ImageDelay as text
%        str2double(get(hObject,'String')) returns contents of ImageDelay as a double

% --- Executes during object creation, after setting all properties.
function ImageDelay_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ImageDelay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function DetectionDelayBox_Callback(hObject, eventdata, handles)
% hObject    handle to DetectionDelayBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of DetectionDelayBox as text
%        str2double(get(hObject,'String')) returns contents of DetectionDelayBox as a double

% --- Executes during object creation, after setting all properties.
function DetectionDelayBox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to DetectionDelayBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function ReleaseTimeBox_Callback(hObject, eventdata, handles)
% hObject    handle to ReleaseTimeBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ReleaseTimeBox as text
%        str2double(get(hObject,'String')) returns contents of ReleaseTimeBox as a double

% --- Executes during object creation, after setting all properties.
function ReleaseTimeBox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ReleaseTimeBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in HeadTailModel.
function HeadTailModel_Callback(hObject, eventdata, handles)
% hObject    handle to HeadTailModel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = uigetfile('*.mat', 'Pick the mat file containing the head/tail classifier');
% name=[pathname filename];
% addpath('Vision&Support');
CDevices=getappdata(handles.figure1,'CDevices');
load(fullfile(pathname,filename))
CDevices.cHTParameters=cHTParameters;
setappdata(handles.figure1,'CDevices',CDevices);

% % --- Executes on button press in AutoImageCapture.
% function AutoImageCapture_Callback(hObject, eventdata, handles)
% % hObject    handle to AutomatedScreening (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% CDevices=getappdata(handles.figure1,'CDevices');
% CCam=getappdata(handles.figure1,'CCam');
% Valve=getappdata(handles.figure1,'Valve');
% myaddress=getappdata(handles.figure1,'email');
% % dev_angle=getappdata(handles.figure1,'Dev_angle');
% dev_angle=str2double(get(handles.DevAngle_disp,'String'));
% status=st_worm_loading(Valve);set(handles.status,'String',status);
% tic;
% flush=0;
% 
% while ~get(handles.QuitAutomation,'Value')
%     CWaitParameters.WaitBeforeFlush = str2double(get(handles.EntryWaitBeforeFlush,'String'));
%     CWaitParameters.EntryWaitBeforeSpeed = str2double(get(handles.EntryWaitBeforeSpeed,'String'));
%     CWaitParameters.DetectionDelayTime=str2double(get(handles.DetectionDelayBox,'String'));
%     CWaitParameters.ImageDelay=str2double(get(handles.ImageDelay,'String'));
%     CWaitParameters.DetectionMean=str2double(get(handles.LoadMean,'String'));
%     CWaitParameters.DetectionStd=str2double(get(handles.LoadStd,'String'));
% %     pause(0.1);
%     im=getsnapshot(CCam.pCam1);
%     im_mean=mean2(im);
%     set(handles.ImMean,'String',num2str(im_mean,4));
%     im_std=std2(double(im));
%     set(handles.ImStd,'String',num2str(im_std,4));
%     switch get(handles.LoadingMethod,'Value')
%         case 1
%             animal_loaded=(im_mean>CWaitParameters.DetectionMean);
%         case 2
%             animal_loaded=(im_std>CWaitParameters.DetectionStd);
%     end
%     if animal_loaded
%         pause(CWaitParameters.DetectionDelayTime);
% %         pause(0.2);
%         
%         im=getsnapshot(CCam.pCam1);
%         im_mean=mean2(im);
%         im_std=std2(double(im));
%         imr=getsnapshot(CCam.pCam2);
%         image=im;
%         image(481:960,:)=imr;
% 
%         switch get(handles.LoadingMethod,'Value')
%             case 1
%                 animal_loaded=(im_mean>CWaitParameters.DetectionMean);
%             case 2
%                 animal_loaded=(im_std>CWaitParameters.DetectionStd);
%         end
% 
%        
%         if animal_loaded %&& ~isempty(findworm)
%             totalworms=get(handles.WormsProcessed,'String');
%             increment=str2double(totalworms)+1;
%             set(handles.WormsProcessed,'String',num2str(increment));
%             switch get(handles.UseGBClassifier,'Value')
%                 case 1 %%ALL ANIMALS
%                         getstack=true;
%                         getstack_nowait=false;
%                 case 2 %%TAIL ONLY
%                     if (head_tail_analyze(image,CDevices.cHTParameters)==2)
%                         ntails=get(handles.NumTails,'String');
%                         increment_t=str2double(ntails)+1;
%                         set(handles.NumTails,'String',num2str(increment_t));
%                         set(handles.ht_disp,'String','T');
%                         getstack=true;
%                         getstack_nowait=false;
%                     else
%                         getstack=false;
%                         nheads=get(handles.NumHeads,'String');
%                         increment_h=str2double(nheads)+1;
%                         set(handles.NumHeads,'String',num2str(increment_h));
%                         set(handles.ht_disp,'String','H');
%                     end
%                 case 3 %%GOOD ORIENTED ONLY
%                     if (head_tail_analyze(image,CDevices.cHTParameters)==2)
%                         ntails=get(handles.NumTails,'String');
%                         increment_t=str2double(ntails)+1;
%                         set(handles.NumTails,'String',num2str(increment_t));
%                         set(handles.ht_disp,'String','T');
%                         [analyze_worm,or1,ecc1]=analyze_wormorientation(im,1,dev_angle);
% 
%                         if(analyze_worm==1)
%                             gtails=get(handles.goodtails,'String');
%                             increment_gt=str2double(gtails)+1;
%                             set(handles.goodtails,'String',num2str(increment_gt));
%                             set(handles.Or1,'String',num2str(or1));
%                             set(handles.Ecc,'String',num2str(ecc1));
%                             set(handles.Or2,'String','NaN');
%                             getstack=true;
%                             getstack_nowait=false;
%                             
%                         elseif(analyze_worm==2)
% %                             pause(CWaitParameters.ImageDelay);
% %                             pause(0.5);
%                             im=getsnapshot(CCam.pCam1);
%                             [analyze_worm,or2,ecc2]=analyze_wormorientation(im,2,dev_angle);
%                             if(analyze_worm==1)
%                                 getstack=true;
%                                 getstack_nowait=true;
%                                 gtails=get(handles.goodtails,'String');
%                                 increment_gt=str2double(gtails)+1;
%                                 set(handles.goodtails,'String',num2str(increment_gt));
%                                 set(handles.Or1,'String',num2str(or1));
%                                 set(handles.Ecc,'String',num2str(ecc2));
%                                 set(handles.Or2,'String',num2str(or2));
%                             else
%                                 getstack=false;
%                                 set(handles.Or1,'String',num2str(or1));
%                                 set(handles.Or2,'String',num2str(or2));
%                                 set(handles.Ecc,'String',num2str(ecc2));
%                             end
%                             
%                         else
%                             getstack=false;
%                             set(handles.Or1,'String',num2str(or1));
%                             set(handles.Or2,'String','NaN');
%                             set(handles.Ecc,'String',num2str(ecc1));
% %                             wildtypetrue=1;
%                         end
%                     else 
%                         getstack=false;
%                         nheads=get(handles.NumHeads,'String');
%                         increment_h=str2double(nheads)+1;
%                         set(handles.NumHeads,'String',num2str(increment_h));
%                         set(handles.ht_disp,'String','H');
%                         set(handles.Or1,'String','NaN');
%                         set(handles.Or2,'String','NaN');
%                         set(handles.Ecc,'String','NaN');
%                     end
%             end
% 
% 
%             if getstack %TAKE STACK AND ANALYZE WORM
%                 im_mean=mean2(im);
%                 im_std=std2(double(im));
%                 switch get(handles.LoadingMethod,'Value')
%                     case 1
%                         animal_loaded=(im_mean>CWaitParameters.DetectionMean);
%                     case 2
%                         animal_loaded=(im_std>CWaitParameters.DetectionStd);
%                 end
%                 if animal_loaded
%                     pause(CWaitParameters.DetectionDelayTime);
% %                     pause(0.5);
% %                     status=st_worm_imaging(Valve);set(handles.status,'String',status);
%                     if ~getstack_nowait
%                         pause(CWaitParameters.ImageDelay);
%                         im=getsnapshot(CCam.pCam1);
%                         im_mean=mean2(im);
%                         im_std=std2(double(im));
%                     else
%                         pause(CWaitParameters.ImageDelay);
%                         im=getsnapshot(CCam.pCam1);
%                         im_mean=mean2(im);
%                         im_std=std2(double(im));
%                     end
%                     switch get(handles.LoadingMethod,'Value')
%                         case 1
%                             animal_loaded=(im_mean>CWaitParameters.DetectionMean);
%                         case 2
%                             animal_loaded=(im_std>CWaitParameters.DetectionStd);
%                     end
%                     if animal_loaded
%                         status='Getting Z-stack';set(handles.status,'String',status);
%                         CStageSettings.uiZHeight=str2double(get(handles.ZStackSize,'String'));
%                         CStageSettings.uiStepSize=str2double(get(handles.ZStackStepSize,'String'));
%                         gain=get(handles.GainBox,'String');
%                         exposure_time=get(handles.ExposureTimeBox,'String');
%                         CStack.fileinfo=['ExposureTime-',exposure_time,' Gain-',gain,' StepSize-',num2str(CStageSettings.uiStepSize)];
%                         CStack.num=get(handles.NumStacks,'String');
%                         CStack.folder=get(handles.SaveDirectory,'String');
%                         CStack.strain=get(handles.StrainName,'String');
%                         CStack.DisplayChoices=get(handles.StackDisplayChoices,'Value');
%                         CStack.StackSaveChoices=get(handles.StackSaveChoices,'Value');
%                         increment=str2num(CStack.num)+1;
%                         set(handles.NumStacks,'String',num2str(increment));
%                         
% 
%                         [trld zstack]=GetZStackStepper(CDevices,CCam,CStageSettings);
%                         
%                         
%                         im=getsnapshot(CCam.pCam1);
%                         im_mean=mean2(im);
%                         im_std=std2(double(im));
% 
%                         switch get(handles.LoadingMethod,'Value')
%                             case 1
%                                 animal_loaded=(im_mean>CWaitParameters.DetectionMean);
%                             case 2
%                                 animal_loaded=(im_std>CWaitParameters.DetectionStd);
%                         end
%                         
%                         if animal_loaded
%                             status='Saving Z-stack';set(handles.status,'String',status);
%                             switch CStack.StackSaveChoices
%                                 case {1,2,3,4}
%                                     AcquireStack(zstack,CStack);
%                                 otherwise
%                                     folder=CStack.folder;
%                                     strain=CStack.strain;
%                                     fileinfo=CStack.fileinfo;
%                                     num=CStack.num;
%                                     file=strcat(folder,strain,'_Stack_',num,'.tif');
%                                     imwrite(zstack(:,:,1),file,'Description',fileinfo);
%                                     for i=2:size(zstack,3)
%                                         imwrite(stack(:,:,i),file,'WriteMode','append');
%                                     end
%                                     file=strcat(folder,strain,'_Projection_',num,'.tif');
%                                     imwrite(max(stack,[],3),file,'Description',fileinfo);
%                                     figure(2);imshow(max(stack,[],3),[],'InitialMagnification','fit','Border','tight');impixelinfo();
%                                     file=strcat(folder,strain,'_InitialSnapshot',num,'.tif');
%                                     imwrite(image,file,'Description',fileinfo);
%                             end
%                         end
% 
% 
%                     end
%                 end
%                 
%             end
% 
%             status=st_wt_flushing(Valve);set(handles.status,'String',status);
%             
%             ftic=tic;
%             flushing_cycles=1;
%             im=getsnapshot(CCam.pCam1);
%             im_mean=mean2(im);
%             set(handles.ImMean,'String',num2str(im_mean,4));
%             im_std=std2(double(im));
%             set(handles.ImStd,'String',num2str(im_std,4));
%             switch get(handles.LoadingMethod,'Value')
%                 case 1
%                     animal_loaded=(im_mean>CWaitParameters.DetectionMean);
%                 case 2
%                     animal_loaded=(im_std>CWaitParameters.DetectionStd);
%             end
%             while animal_loaded                                                              
%                 pause(0.1);
%                 im=getsnapshot(CCam.pCam1);
%                 im_mean=mean2(im);
%                 set(handles.ImMean,'String',num2str(im_mean,4));
%                 im_std=std2(double(im));
%                 set(handles.ImStd,'String',num2str(im_std,4));
%                 switch get(handles.LoadingMethod,'Value')
%                     case 1
%                         animal_loaded=(im_mean>CWaitParameters.DetectionMean);
%                     case 2
%                         animal_loaded=(im_std>CWaitParameters.DetectionStd);
%                 end    
%                 if toc(ftic)>2.5
%                     status=st_worm_imaging(Valve);
%                     pause(0.1)
%                     status=st_wt_flushing(Valve);
%                     ftic=tic;
%                     flushing_cycles=flushing_cycles+1;
%                 end
%                 if flushing_cycles>3
%                     sendmail(myaddress, 'CLOG', 'Worm stuck in imaging channel, please check operation');
%                     break
%                 end     
%             end
%             status=st_worm_loading(Valve);set(handles.status,'String',status);
%             flush=0;
%             tic;
%         else
%             status=st_wt_flushing(Valve);set(handles.status,'String',status);
%             pause(Valve.ReleaseTime);
%             status=st_worm_loading(Valve);set(handles.status,'String',status);
%             tic;
%         end
%     elseif toc>CWaitParameters.EntryWaitBeforeSpeed && flush<4
%         status=st_speed_loading(Valve);set(handles.status,'String',status);
%         pause(0.3);status=st_worm_loading(Valve);set(handles.status,'String',status);
%         flush=flush+1;
%         tic
%     elseif toc>CWaitParameters.WaitBeforeFlush && flush<8
%         status=st_wt_flushing(Valve);set(handles.status,'String',status);
%         pause(Valve.ReleaseTime);
%         status=st_worm_loading(Valve);set(handles.status,'String',status);
%         flush=flush+1;
%         tic
%     elseif flush>7
%         sendmail(myaddress, 'STOPPED OPERATION', 'Worm loading has failed, please check operation');
%         status=st_stop(Valve);set(handles.status,'String',status);
% 
%         break
%     end
%     
% end

% --- Executes on button press in AutoImageCapture.
function AutoImageCapture_Callback(hObject, eventdata, handles)
% hObject    handle to AutomatedScreening (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

CDevices=getappdata(handles.figure1,'CDevices');
CCam=getappdata(handles.figure1,'CCam');
Valve=getappdata(handles.figure1,'Valve');
myaddress=getappdata(handles.figure1,'email');
dev_angle=str2double(get(handles.DevAngle_disp,'String'));
status=st_worm_loading(Valve);set(handles.status,'String',status);

% loadingflush=0;
loadingtic=(tic);
flush=0;
while ~get(handles.QuitAutomation,'Value')
    breakall=false;
    CWaitParameters.WaitBeforeFlush = str2double(get(handles.EntryWaitBeforeFlush,'String'));
    CWaitParameters.EntryWaitBeforeSpeed = str2double(get(handles.EntryWaitBeforeSpeed,'String'));
    CWaitParameters.DetectionDelayTime=str2double(get(handles.DetectionDelayBox,'String'));
    CWaitParameters.ImageDelay=str2double(get(handles.ImageDelay,'String'));
    CWaitParameters.DetectionMean=str2double(get(handles.LoadMean,'String'));
    CWaitParameters.DetectionStd=str2double(get(handles.LoadStd,'String'));
    
    %check if an animal has loaded
    im=getsnapshot(CCam.pCam1);
   
    im_mean=mean2(im);
    set(handles.ImMean,'String',num2str(im_mean,4));
    im_std=std2(double(im));
    set(handles.ImStd,'String',num2str(im_std,4));
    
    switch get(handles.LoadingMethod,'Value')
        case 1
            animal_loaded=(im_mean>CWaitParameters.DetectionMean);
        case 2
            animal_loaded=(im_std>CWaitParameters.DetectionStd);
    end
    
    if animal_loaded
%         pause(0.1)
        pause(CWaitParameters.DetectionDelayTime); %wait load delay time
        status=st_worm_imaging(Valve); %close inlet valves
       
        
        set(handles.status,'String',status); %display Worm Imaging
        im=getsnapshot(CCam.pCam1);
      
        im_mean=mean2(im);
        im_std=std2(double(im));
%         imr=getsnapshot(CCam.pCam2);
%         image=im;
%         image(481:960,:)=imr;
        %check if worm is still loaded
        switch get(handles.LoadingMethod,'Value')
            case 1
                animal_loaded=(im_mean>CWaitParameters.DetectionMean);
            case 2
                animal_loaded=(im_std>CWaitParameters.DetectionStd);
        end
        
        
        if animal_loaded
            
            totalworms=get(handles.WormsProcessed,'String');
            increment=str2double(totalworms)+1;
            set(handles.WormsProcessed,'String',num2str(increment));
            
            switch get(handles.UseGBClassifier,'Value') %image all, tails, or tails on good orientation
                case 1 %%ALL ANIMALS
                    getstack=true;
                    getstack_nowait=false;
%                 case 2 %%TAIL ONLY
%                     str=get(handles.MarkerStrain);
%                     straintype=str.Value;
%                     if isfield(CDevices, 'cHTParameters')
%                         headsvmmodel=CDevices.cHTParameters;
%                     else
%                         headsvmmodel=[];
%                     end
%                     if (head_tail_analyze(image,straintype,headsvmmodel)==2)%2 if it is a tail
%                         ntails=get(handles.NumTails,'String');
%                         increment_t=str2double(ntails)+1;
%                         set(handles.NumTails,'String',num2str(increment_t));
%                         set(handles.ht_disp,'String','T');
%                         getstack=true;
%                         getstack_nowait=false;
%                     else
%                         getstack=false;
%                         nheads=get(handles.NumHeads,'String');
%                         increment_h=str2double(nheads)+1;
%                         set(handles.NumHeads,'String',num2str(increment_h));
%                         set(handles.ht_disp,'String','H');
%                     end
%                 case 3 %%GOOD ORIENTED ONLY
%                     str=get(handles.MarkerStrain);
%                     straintype=str.Value;
%                     if isfield(CDevices, 'cHTParameters')
%                         headsvmmodel=CDevices.cHTParameters;
%                     else
%                         headsvmmodel=[];
%                     end
%                     if (head_tail_analyze(image,straintype,headsvmmodel)==2)% if it is a tail
%                         ntails=get(handles.NumTails,'String');
%                         increment_t=str2double(ntails)+1;
%                         set(handles.NumTails,'String',num2str(increment_t));
%                         set(handles.ht_disp,'String','T');
%                         
%                         [analyze_worm,or1,ecc1]=analyze_wormorientation(im,1,dev_angle);
%                         
%                         if(analyze_worm==1)
%                             gtails=get(handles.goodtails,'String');
%                             increment_gt=str2double(gtails)+1;
%                             set(handles.goodtails,'String',num2str(increment_gt));
%                             set(handles.Or1,'String',num2str(or1));
%                             set(handles.Ecc,'String',num2str(ecc1));
%                             set(handles.Or2,'String','NaN');
%                             getstack=true;
%                             getstack_nowait=false;
%                             
%                         elseif(analyze_worm==2)
%                             pause(1);
%                             im=getsnapshot(CCam.pCam1);
%                             [analyze_worm,or2,ecc2]=analyze_wormorientation(im,2,dev_angle);
%                             
%                             if(analyze_worm==1)
%                                 getstack=true;
%                                 getstack_nowait=true;
%                                 gtails=get(handles.goodtails,'String');
%                                 increment_gt=str2double(gtails)+1;
%                                 set(handles.goodtails,'String',num2str(increment_gt));
%                                 set(handles.Or1,'String',num2str(or1));
%                                 set(handles.Ecc,'String',num2str(ecc2));
%                                 set(handles.Or2,'String',num2str(or2));
%                             else
%                                 getstack=false;
%                                 set(handles.Or1,'String',num2str(or1));
%                                 set(handles.Or2,'String',num2str(or2));
%                                 set(handles.Ecc,'String',num2str(ecc2));
%                             end
%                             
%                         else
%                             getstack=false;
%                             set(handles.Or1,'String',num2str(or1));
%                             set(handles.Or2,'String','NaN');
%                             set(handles.Ecc,'String',num2str(ecc1));
%                         end
%                     else
%                         getstack=false;
%                         nheads=get(handles.NumHeads,'String');
%                         increment_h=str2double(nheads)+1;
%                         set(handles.NumHeads,'String',num2str(increment_h));
%                         set(handles.ht_disp,'String','H');
%                         set(handles.Or1,'String','NaN');
%                         set(handles.Or2,'String','NaN');
%                         set(handles.Ecc,'String','NaN');
%                     end
            end
            
            
            if getstack %TAKE STACK AND ANALYZE WORM
                im=getsnapshot(CCam.pCam1);
                figure, imshow(im); %ADDED IMSHOW
                im_mean=mean2(im);
                im_std=std2(double(im));
                switch get(handles.LoadingMethod,'Value')
                    case 1
                        animal_loaded=(im_mean>CWaitParameters.DetectionMean);
                    case 2
                        animal_loaded=(im_std>CWaitParameters.DetectionStd);
                end
                if animal_loaded
                    
                    if ~getstack_nowait
                        pause(CWaitParameters.ImageDelay);
                        im=getsnapshot(CCam.pCam1);
                        im_mean=mean2(im);
                        im_std=std2(double(im));
                    else
                        pause(CWaitParameters.ImageDelay-1);
                        im=getsnapshot(CCam.pCam1);
                        im_mean=mean2(im);
                        im_std=std2(double(im));
                    end
                    
                    switch get(handles.LoadingMethod,'Value')
                        case 1
                            animal_loaded=(im_mean>CWaitParameters.DetectionMean);
                        case 2
                            animal_loaded=(im_std>CWaitParameters.DetectionStd);
                    end
                    if animal_loaded
                        status='Getting Z-stack';set(handles.status,'String',status);
                        CStageSettings.uiZHeight=str2double(get(handles.ZStackSize,'String'));
                        CStageSettings.uiStepSize=str2double(get(handles.ZStackStepSize,'String'));
%                         gain=get(handles.GainBox_CreateFcn,'String');
                        exposure_time=get(handles.ExposureTimeBox,'String');
%                         gain2=get(handles.GainBox_CreateFcn2,'String');
                        stepsize=get(handles.ZStackStepSize,'String');
%                         exposure_time2=get(handles.ExposureTimeBox2,'String');
%                         CStack.fileinfo=['ExposureTime1-',exposure_time,' Gain1-',gain,' ExposureTime2-',exposure_time2,' Gain2-',gain2,' StepSize-',stepsize];
                        CStack.num=get(handles.NumStacks,'String');
                        CStack.folder=get(handles.SaveDirectory,'String');
                        CStack.strain=get(handles.StrainName,'String');
                        CStack.DisplayChoices=get(handles.StackDisplayChoices,'Value');
                        CStack.StackSaveChoices=get(handles.StackSaveChoices,'Value');
                        increment=str2num(CStack.num)+1;
                        set(handles.NumStacks,'String',num2str(increment));
                        
                        [zstack]=GetZStackStepperG(CDevices,CCam,CStageSettings);


                        %                         [trld zstack]=GetZStackStepper(CDevices,CCam,CStageSettings);
%                         [~,zstack]=GetZStackPiezo(CDevices,CCam,CStageSettings);
                        %                         image=max(zstack,[],3);
                        
                        im=getsnapshot(CCam.pCam1);
                        im_mean=mean2(im);
                        im_std=std2(double(im));
                        
                        switch get(handles.LoadingMethod,'Value')
                            case 1
                                animal_loaded=(im_mean>CWaitParameters.DetectionMean);
                            case 2
                                animal_loaded=(im_std>CWaitParameters.DetectionStd);
                        end
                        
                        if animal_loaded
                            status='Saving Z-stack';set(handles.status,'String',status);
                            switch CStack.StackSaveChoices
                                
                                case {1,2,3,4}
                                    AcquireStack(zstack,CStack);
%                                 otherwise
%                                     folder=CStack.folder;
%                                     strain=CStack.strain;
%                                     fileinfo=CStack.fileinfo;
%                                     num=CStack.num;
%                                     file=strcat(folder,strain,'_Stack_',num,'.tif');
%                                     imwrite(zstack(:,:,1),file,'Description',fileinfo);
%                                     for i=2:size(zstack,3)
%                                         imwrite(stack(:,:,i),file,'WriteMode','append');
%                                     end
%                                     file=strcat(folder,strain,'_Projection_',num,'.tif');
%                                     imwrite(max(stack,[],3),file,'Description',fileinfo);
%                                     figure(2);imshow(max(stack,[],3),[],'InitialMagnification','fit','Border','tight');impixelinfo();
%                                     file=strcat(folder,strain,'_InitialSnapshot',num,'.tif');
%                                     imwrite(image,file,'Description',fileinfo);
                            end
                        end
                    end
                end
                
            end
            
            status=st_wt_flushing(Valve);set(handles.status,'String',status);
            
            ftic=tic; %start timer
            flushing_cycles=1;
            im=getsnapshot(CCam.pCam1);
            im_mean=mean2(im);
            set(handles.ImMean,'String',num2str(im_mean,4));
            im_std=std2(double(im));
            set(handles.ImStd,'String',num2str(im_std,4));
            switch get(handles.LoadingMethod,'Value')
                case 1
                    animal_loaded=(im_mean>CWaitParameters.DetectionMean);
                case 2
                    animal_loaded=(im_std>CWaitParameters.DetectionStd);
            end
            while animal_loaded % if worm is stuck, goes through 5 flushing cycles then stops
                pause(0.1);
                im=getsnapshot(CCam.pCam1);
                im_mean=mean2(im);
                set(handles.ImMean,'String',num2str(im_mean,4));
                im_std=std2(double(im));
                set(handles.ImStd,'String',num2str(im_std,4));
                switch get(handles.LoadingMethod,'Value')
                    case 1
                        animal_loaded=(im_mean>CWaitParameters.DetectionMean);
                    case 2
                        animal_loaded=(im_std>CWaitParameters.DetectionStd);
                end
                if toc(ftic)>2.5
                    status=st_worm_imaging(Valve);
                    pause(0.1)
                    status=st_wt_flushing(Valve);
                    ftic=tic;
                    flushing_cycles=flushing_cycles+1;
                end
                if flushing_cycles>10
                    sendmail(myaddress, 'CLOG', 'Worm stuck in imaging channel, please check operation');
                    breakall=true;
                    break
                end
            end
            if breakall
                status=st_stop(Valve);set(handles.status,'String',status);
                break
            end
            status=st_worm_loading(Valve);set(handles.status,'String',status);
%             loadingflush=0;
            loadingtic=tic;
        else %if worm escaped
            status=st_wt_flushing(Valve);set(handles.status,'String',status);
            pause(Valve.ReleaseTime);
            status=st_worm_loading(Valve);set(handles.status,'String',status);
            loadingtic=tic;
        end
    elseif toc(loadingtic)>CWaitParameters.EntryWaitBeforeSpeed && flush<4 %tries to unclog outlet
        status=st_wt_flushing(Valve);set(handles.status,'String',status);
        pause(Valve.ReleaseTime);
        status=st_uncloginlet(Valve);set(handles.status,'String',status);
        pause(1);status=st_worm_loading(Valve);set(handles.status,'String',status);
        flush=flush+1;
        loadingtic=tic;
    elseif toc(loadingtic)>CWaitParameters.WaitBeforeFlush && flush<8%tries to unclog outlet & inlet
        status=st_wt_flushing(Valve);set(handles.status,'String',status);
        pause(Valve.ReleaseTime);
        status=st_uncloginlet(Valve);set(handles.status,'String',status);
        pause(1);status=st_worm_loading(Valve);set(handles.status,'String',status);
        flush=flush+1;
        loadingtic=tic;
    elseif flush>7
        sendmail(myaddress, 'STOPPED OPERATION', 'Worm loading has failed, please check operation');
        status=st_stop(Valve);set(handles.status,'String',status);
        break
    end
    
end


% --- Executes on button press in AutomatedScreening.
function AutomatedScreening_Callback(hObject, eventdata, handles) %%FIX
% hObject    handle to AutomatedScreening (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

CDevices=getappdata(handles.figure1,'CDevices');
CCam=getappdata(handles.figure1,'CCam');
Valve=getappdata(handles.figure1,'Valve');
myaddress=getappdata(handles.figure1,'email');
dev_angle=str2double(get(handles.DevAngle_disp,'String'));
status=st_worm_loading(Valve);set(handles.status,'String',status);


loadingflush=0;
loadingtic=(tic);   
flush=0;

while ~get(handles.QuitAutomation,'Value')
    breakall=false;
    CWaitParameters.WaitBeforeFlush = str2double(get(handles.EntryWaitBeforeFlush,'String'));
    CWaitParameters.EntryWaitBeforeSpeed = str2double(get(handles.EntryWaitBeforeSpeed,'String'));
    CWaitParameters.DetectionDelayTime=str2double(get(handles.DetectionDelayBox,'String'));
    CWaitParameters.ImageDelay=str2double(get(handles.ImageDelay,'String'));
    CWaitParameters.DetectionMean=str2double(get(handles.LoadMean,'String'));
    CWaitParameters.DetectionStd=str2double(get(handles.LoadStd,'String'));

    %check if an animal has loaded
    im=getsnapshot(CCam.pCam1);
    im_mean=mean2(im);
    set(handles.ImMean,'String',num2str(im_mean,4));
    im_std=max(double(im));
    set(handles.ImStd,'String',num2str(im_std,4));
    
    switch get(handles.LoadingMethod,'Value')
        case 1
            animal_loaded=(im_mean>CWaitParameters.DetectionMean);
        case 2
            animal_loaded=(im_std>CWaitParameters.DetectionStd);
    end
    
    if animal_loaded
                pause(0.1)
        status=st_worm_imaging(Valve);set(handles.status,'String',status);%close inlet valves
        pause(CWaitParameters.DetectionDelayTime);%wait load delay time  
        
        set(handles.status,'String',status); %display Worm Imaging
        im=getsnapshot(CCam.pCam1);
        im_mean=mean2(im);
        im_std=std2(double(im));
%         imr=getsnapshot(CCam.pCam2);
        image=im;
%         image(481:960,:)=imr;
        %check if worm is still loaded
        switch get(handles.LoadingMethod,'Value')
            case 1
                animal_loaded=(im_mean>CWaitParameters.DetectionMean);
            case 2
                animal_loaded=(im_std>CWaitParameters.DetectionStd);
        end

        
        if animal_loaded 
            totalworms=get(handles.WormsProcessed,'String');
            increment=str2double(totalworms)+1;
            set(handles.WormsProcessed,'String',num2str(increment));
%            headsvmmodel=CDevices.cHTParameters;
            str=get(handles.MarkerStrain);
                    straintype=str.Value;
                if head_tail_analyze(image,straintype)==2%2 if it is a tail
                    
                        ntails=get(handles.NumTails,'String');
                        increment_t=str2double(ntails)+1;
                        set(handles.NumTails,'String',num2str(increment_t));
                        set(handles.ht_disp,'String','T');
                        getstack=false;
                        
%                         [analyze_worm,or1,ecc1]=analyze_wormorientation(im,1,dev_angle);

%                         if(analyze_worm==1)
%                             gtails=get(handles.goodtails,'String');
%                             increment_gt=str2double(gtails)+1;
%                             set(handles.goodtails,'String',num2str(increment_gt));
%                             set(handles.Or1,'String',num2str(or1));
%                             set(handles.Ecc,'String',num2str(ecc1));
%                             set(handles.Or2,'String','NaN');
%                             getstack=true;
%                             getstack_nowait=false;
%                             
%                         elseif(analyze_worm==2)
% %                              
%                             pause(0.5);
%                             im=getsnapshot(CCam.pCam1);
%                             [analyze_worm,or2,ecc2]=analyze_wormorientation(im,2,dev_angle);
%                             if(analyze_worm==1)
%                                 getstack=true;
%                                 getstack_nowait=true;
%                                 gtails=get(handles.goodtails,'String');
%                                 increment_gt=str2double(gtails)+1;
%                                 set(handles.goodtails,'String',num2str(increment_gt));
%                                 set(handles.Or1,'String',num2str(or1));
%                                 set(handles.Ecc,'String',num2str(ecc2));
%                                 set(handles.Or2,'String',num2str(or2));
%                             else
%                                 getstack=false;
%                                 set(handles.Or1,'String',num2str(or1));
%                                 set(handles.Or2,'String',num2str(or2));
%                                 set(handles.Ecc,'String',num2str(ecc2));
%                             end
                            
%                         else % IF IT IS IN BAD ORIENTAITON
%                             getstack=false;
%                             set(handles.Or1,'String',num2str(or1));
%                             set(handles.Or2,'String','NaN');
%                             set(handles.Ecc,'String',num2str(ecc1));
% %                             wildtypetrue=1;
%                         end
                else % IF IT IS A HEAD
                    getstack=true;
                    getstack_nowait=false;
                    nheads=get(handles.NumHeads,'String');
                    increment_h=str2double(nheads)+1;
                    set(handles.NumHeads,'String',num2str(increment_h));
                    set(handles.ht_disp,'String','H');
                    set(handles.Or1,'String','NaN');
                    set(handles.Or2,'String','NaN');
                    set(handles.Ecc,'String','NaN');
                end

            if getstack %TAKE STACK AND ANALYZE WORM
                % check if worm is there
                im_mean=mean2(im);
                im_std=std2(double(im));
                switch get(handles.LoadingMethod,'Value')
                    case 1
                        animal_loaded=(im_mean>CWaitParameters.DetectionMean);
                    case 2
                        animal_loaded=(im_std>CWaitParameters.DetectionStd);
                end
                if animal_loaded
                    
                    if ~getstack_nowait

                        pause(CWaitParameters.ImageDelay);
                        im=getsnapshot(CCam.pCam1);
                        im_mean=mean2(im);
                        im_std=std2(double(im));
                    else
                         pause(CWaitParameters.ImageDelay-0.5);
                        im=getsnapshot(CCam.pCam1);
                        im_mean=mean2(im);
                        im_std=std2(double(im));
                    end
                    
                    % check again if worm is there
                    switch get(handles.LoadingMethod,'Value')
                        case 1
                            animal_loaded=(im_mean>CWaitParameters.DetectionMean);
                        case 2
                            animal_loaded=(im_std>CWaitParameters.DetectionStd);
                    end
                    
                    if animal_loaded
                        status='Getting Z-stack';set(handles.status,'String',status);
                        CStageSettings.uiZHeight=str2double(get(handles.ZStackSize,'String'));
                        CStageSettings.uiStepSize=str2double(get(handles.ZStackStepSize,'String'));
%                         gain=get(handles.GainBox_CreateFcn,'String');
                        exposure_time=get(handles.ExposureTimeBox,'String');
%                         gain2=get(handles.GainBox_CreateFcn2,'String');
                        stepsize=get(handles.ZStackStepSize,'String');
%                         exposure_time2=get(handles.ExposureTimeBox2,'String');
                        CStack.fileinfo=['ExposureTime1-',exposure_time,'StepSize-',stepsize];
                        CStack.num=get(handles.NumStacks,'String');
                        CStack.folder=get(handles.SaveDirectory,'String');
                        CStack.strain=get(handles.StrainName,'String');
                        CStack.DisplayChoices=get(handles.StackDisplayChoices,'Value');
                        CStack.StackSaveChoices=get(handles.StackSaveChoices,'Value');
                        increment=str2num(CStack.num)+1;
                        set(handles.NumStacks,'String',num2str(increment));
                        

                        [zstack]=GetZStackStepperG(CDevices,CCam,CStageSettings);
                        image=max(zstack,[],3);
                        im=getsnapshot(CCam.pCam1);z
                        im_mean=mean2(im);
                        im_std=std2(double(im));

                        switch get(handles.LoadingMethod,'Value')
                            case 1
                                animal_loaded=(im_mean>CWaitParameters.DetectionMean);
                            case 2
                                animal_loaded=(im_std>CWaitParameters.DetectionStd);
                        end
                    
                    
                        if animal_loaded
                        
                            %[predict_image]=pixel_analyzelin(image,1,CDevices.cPixelTraining);
                            status='Phenotyping';set(handles.status,'String',status);
                            
                            [wildtypetrue phenotyped reason]=AnalyzeWorm_pab1(image);

                            if phenotyped
                                if ~wildtypetrue
                                    pause(3)
                                    [zstack]=GetZStackStepperG(CDevices,CCam,CStageSettings);
                                    image=max(zstack,[],3);
                                    %[predict_image]=pixel_analyzelin(image,1,CDevices.cPixelTraining);
                                    status='Phenotyping 2';set(handles.status,'String',status);
                                    [wildtypetrue phenotyped reason]=AnalyzeWorm_pab1(image);

                                    if ~wildtypetrue
                                        max_g=max(zstack,[],3);
                                        %figure(2);imshow(max_g(1:480,:),[],'InitialMagnification','fit','Border','tight');impixelinfo();
                                        %sendmail(myaddress, strcat('Mutant Found',reason));
                                        
                                        evalResponse=1;
%                                         
                                        if evalResponse
                                            CStack.strain=strcat('M_',get(handles.StrainName,'String'));
%                                             CStack.strain='Mutant';
                                            CStack.StackSaveChoices=3; 
                                            CStack.DisplayChoices=4;
                                            status='Saving Mutant Image';set(handles.status,'String',status);
                                            AcquireStack(zstack,CStack);
                                            nummutants=get(handles.NumMutants,'String');
                                            increment=str2num(nummutants)+1;
                                            set(handles.NumMutants,'String',num2str(increment));
                                            text='Mutant; ';
                                        else
                                            wildtypetrue=1;
                                            text='Wild Type';
                                        end
                                    else
                                        wildtypetrue=1;
                                        text='Wild Type';
                                        CStack.StackSaveChoices=3;   
                                        status='Saving WT Image';set(handles.status,'String',status);
                                        CStack.DisplayChoices=4;
                                        AcquireStack(zstack,CStack);
                                    end
                                else
                                    wildtypetrue=1;
                                    text='Wild Type';
                                    CStack.StackSaveChoices=3;
                                    CStack.DisplayChoices=4;
                                    status='Saving WT Image';set(handles.status,'String',status);
                                    AcquireStack(zstack,CStack);
                                end

                                wtnum=get(handles.NumPhenotyped,'String');
                                increment=str2num(wtnum)+1;
                                %syn_mean;
                                str2num(get(handles.AvgSize,'String'));
                                %avg_syn_size=(str2num(wtnum)*str2num(get(handles.AvgSize,'String'))+syn_mean)/increment;
                                set(handles.NumPhenotyped,'String',num2str(increment));
                                %set(handles.AvgSize,'String',num2str(avg_syn_size));
                            else
                                wildtypetrue=1;
                                %figure(2);imshow(image(1:480,:),[],'InitialMagnification','fit','Border','tight');
                                text='Not Phenotyped; ';
                            end

                            %figure(3);imshow(bw_l,[],'InitialMagnification','fit','Border','tight');title(['Identified synapses - Animal is - ',text,reason]);
                        else
                            wildtypetrue=1;
                        end

                    else
                        wildtypetrue=1;
                    end
                    
                else
                    wildtypetrue=1;
                end
            else
                wildtypetrue=1;
            end
            

            
            if wildtypetrue
                status=st_wt_flushing(Valve);set(handles.status,'String',status);
            else
                status=st_mutant_flushing(Valve);set(handles.status,'String',status);
            end
            
            
            im=getsnapshot(CCam.pCam1);
            im_mean=mean2(im);
            set(handles.ImMean,'String',num2str(im_mean,4));
            im_std=std2(double(im));
            set(handles.ImStd,'String',num2str(im_std,4));
            
            switch get(handles.LoadingMethod,'Value')
                case 1
                    animal_loaded=(im_mean>CWaitParameters.DetectionMean);
                case 2
                    animal_loaded=(im_std>CWaitParameters.DetectionStd);
            end
            
            ftic=tic; %start timer
            flushing_cycles=1;
            while animal_loaded                                                                
                pause(0.25);%%
                im=getsnapshot(CCam.pCam1);
                im_mean=mean2(im);
                set(handles.ImMean,'String',num2str(im_mean,4));
                im_std=std2(double(im));
                set(handles.ImStd,'String',num2str(im_std,4));
                switch get(handles.LoadingMethod,'Value')
                    case 1
                        animal_loaded=(im_mean>CWaitParameters.DetectionMean);
                    case 2
                        animal_loaded=(im_std>CWaitParameters.DetectionStd);
                end
                if toc(ftic)>5%%
                    status=st_worm_imaging(Valve);
                    pause(0.125)
                    if wildtypetrue
                        status=st_wt_flushing(Valve);set(handles.status,'String',status);
                    else
                        status=st_mutant_flushing(Valve);set(handles.status,'String',status);
                    end
                    ftic=tic;
                    flushing_cycles=flushing_cycles+1;
                end
                if flushing_cycles>5
                    %sendmail(myaddress, 'CLOG', 'Worm stuck in imaging channel, please check operation');
                    breakall=true;
                    break
                end        
                
            end
            if breakall
                status=st_stop(Valve);set(handles.status,'String',status);
                break 
            end
            pause(0.1)
            if ~wildtypetrue
                pause(2); %make sure mutant is out
            end
                
            status=st_worm_loading(Valve);set(handles.status,'String',status);

%             loadingflush=0;
            loadingtic=tic;
            flush=0;

            
        else
            status=st_wt_flushing(Valve);set(handles.status,'String',status);
            pause(Valve.ReleaseTime);
            status=st_worm_loading(Valve);set(handles.status,'String',status);
            loadingtic=tic;
            flush=0;
        end
        
    elseif toc(loadingtic)>CWaitParameters.EntryWaitBeforeSpeed && flush<12 %tries to unclog outlet
        status=st_speed_loading(Valve);set(handles.status,'String',status);
%         pause(0.1);      
%         status=st_uncloginlet(Valve);set(handles.status,'String',status);
%         pause(0.25);
%         status=st_uncloginlet(Valve);set(handles.status,'String',status);
        pause(0.25);
        status=st_worm_imaging(Valve);set(handles.status,'String',status);
        pause(0.25);
        status=st_worm_loading(Valve);set(handles.status,'String',status);
        flush=flush+1;
        loadingtic=tic;
%     elseif toc(loadingtic)>CWaitParameters.WaitBeforeFlush && flush>3%tries to unclog outlet & inlet
%         status=st_wt_flushing(Valve);set(handles.status,'String',status);
%         pause(Valve.ReleaseTime);  
%         flush
%          status=st_uncloginlet(Valve);set(handles.status,'String',status);
%         pause(1);status=st_worm_loading(Valve);set(handles.status,'String',status);
%         flush=flush+1;
%         loadingtic=tic;
    elseif flush>12
        %sendmail(myaddress, 'STOPPED OPERATION', 'Worm loading has failed, please check operation');
        status=st_stop(Valve);set(handles.status,'String',status);
        break
    end
    
end


% --- Executes on button press in AutomatedScreening.
% function AutomatedScreening_Callback(hObject, eventdata, handles) %%FIX
% hObject    handle to AutomatedScreening (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% 
% CDevices=getappdata(handles.figure1,'CDevices');
% CCam=getappdata(handles.figure1,'CCam');
% Valve=getappdata(handles.figure1,'Valve');
% myaddress=getappdata(handles.figure1,'email');
% dev_angle=getappdata(handles.figure1,'Dev_angle');
% dev_angle=str2double(get(handles.DevAngle_disp,'String'));
% status=st_worm_loading(Valve);set(handles.status,'String',status);
% tic;
% flush=0;
% 
% while ~get(handles.QuitAutomation,'Value')
%     CWaitParameters.WaitBeforeFlush = str2double(get(handles.EntryWaitBeforeFlush,'String'));
%     CWaitParameters.EntryWaitBeforeSpeed = str2double(get(handles.EntryWaitBeforeSpeed,'String'));
%     CWaitParameters.DetectionDelayTime=str2double(get(handles.DetectionDelayBox,'String'));
%     CWaitParameters.ImageDelay=str2double(get(handles.ImageDelay,'String'));
%     CWaitParameters.DetectionMean=str2double(get(handles.LoadMean,'String'));
%     CWaitParameters.DetectionStd=str2double(get(handles.LoadStd,'String'));
%     pause(0.1);
%     im=getsnapshot(CCam.pCam1);
%     
%     im_mean=mean2(im);
%     set(handles.ImMean,'String',num2str(im_mean,4));
%     im_std=std2(double(im));
%     set(handles.ImStd,'String',num2str(im_std,4));
%     
%     switch get(handles.LoadingMethod,'Value')
%         case 1
%             animal_loaded=(im_mean>CWaitParameters.DetectionMean);
%         case 2
%             animal_loaded=(im_std>CWaitParameters.DetectionStd);
%     end
%     
%     if animal_loaded
%         status=st_worm_imaging(Valve);set(handles.status,'String',status);
%         pause(CWaitParameters.DetectionDelayTime);
%         
%         im=getsnapshot(CCam.pCam1);
%         im_mean=mean2(im);
%         im_std=std2(double(im));
%         imr=getsnapshot(CCam.pCam2);
%         image=im;
%         image(481:960,:)=imr;
% 
%         switch get(handles.LoadingMethod,'Value')
%             case 1
%                 animal_loaded=(im_mean>CWaitParameters.DetectionMean);
%             case 2
%                 animal_loaded=(im_std>CWaitParameters.DetectionStd);
%         end
% 
%         
%         if animal_loaded %&& ~isempty(findworm)
%             totalworms=get(handles.WormsProcessed,'String');
%             increment=str2double(totalworms)+1;
%             set(handles.WormsProcessed,'String',num2str(increment));
%             
%                 if (head_tail_analyze(image,CDevices.cHTParameters)==2)
%                     
%                         ntails=get(handles.NumTails,'String');
%                         increment_t=str2double(ntails)+1;
%                         set(handles.NumTails,'String',num2str(increment_t));
%                         set(handles.ht_disp,'String','T');
%                         
%                         [analyze_worm,or1,ecc1]=analyze_wormorientation(im,1,dev_angle);
% 
%                         if(analyze_worm==1)
%                             gtails=get(handles.goodtails,'String');
%                             increment_gt=str2double(gtails)+1;
%                             set(handles.goodtails,'String',num2str(increment_gt));
%                             set(handles.Or1,'String',num2str(or1));
%                             set(handles.Ecc,'String',num2str(ecc1));
%                             set(handles.Or2,'String','NaN');
%                             getstack=true;
%                             getstack_nowait=false;
%                             
%                         elseif(analyze_worm==2)
%                              pause(CWaitParameters.ImageDelay);
%                             pause(0.5);
%                             im=getsnapshot(CCam.pCam1);
%                             [analyze_worm,or2,ecc2]=analyze_wormorientation(im,2,dev_angle);
%                             if(analyze_worm==1)
%                                 getstack=true;
%                                 getstack_nowait=true;
%                                 gtails=get(handles.goodtails,'String');
%                                 increment_gt=str2double(gtails)+1;
%                                 set(handles.goodtails,'String',num2str(increment_gt));
%                                 set(handles.Or1,'String',num2str(or1));
%                                 set(handles.Ecc,'String',num2str(ecc2));
%                                 set(handles.Or2,'String',num2str(or2));
%                             else
%                                 getstack=false;
%                                 set(handles.Or1,'String',num2str(or1));
%                                 set(handles.Or2,'String',num2str(or2));
%                                 set(handles.Ecc,'String',num2str(ecc2));
%                             end
%                             
%                         else
%                             getstack=false;
%                             set(handles.Or1,'String',num2str(or1));
%                             set(handles.Or2,'String','NaN');
%                             set(handles.Ecc,'String',num2str(ecc1));
%                             wildtypetrue=1;
%                         end
%                 else 
%                     getstack=false;
%                     nheads=get(handles.NumHeads,'String');
%                     increment_h=str2double(nheads)+1;
%                     set(handles.NumHeads,'String',num2str(increment_h));
%                     set(handles.ht_disp,'String','H');
%                     set(handles.Or1,'String','NaN');
%                     set(handles.Or2,'String','NaN');
%                     set(handles.Ecc,'String','NaN');
%                 end
% 
%             if getstack %TAKE STACK AND ANALYZE WORM
%                 im_mean=mean2(im);
%                 im_std=std2(double(im));
%                 switch get(handles.LoadingMethod,'Value')
%                     case 1
%                         animal_loaded=(im_mean>CWaitParameters.DetectionMean);
%                     case 2
%                         animal_loaded=(im_std>CWaitParameters.DetectionStd);
%                 end
%                 if animal_loaded
%                     
%                     if ~getstack_nowait
% 
%                         pause(CWaitParameters.ImageDelay);
%                         im=getsnapshot(CCam.pCam1);
%                         im_mean=mean2(im);
%                         im_std=std2(double(im));
%                     else
%                          pause(CWaitParameters.ImageDelay-0.5);
%                         im=getsnapshot(CCam.pCam1);
%                         im_mean=mean2(im);
%                         im_std=std2(double(im));
%                     end
%                     
%                     switch get(handles.LoadingMethod,'Value')
%                         case 1
%                             animal_loaded=(im_mean>CWaitParameters.DetectionMean);
%                         case 2
%                             animal_loaded=(im_std>CWaitParameters.DetectionStd);
%                     end
%                     
%                     if animal_loaded
%                         status='Getting Z-stack';set(handles.status,'String',status);
%                         CStageSettings.uiZHeight=str2double(get(handles.ZStackSize,'String'));
%                         CStageSettings.uiStepSize=str2double(get(handles.ZStackStepSize,'String'));
%                         gain=get(handles.GainBox,'String');
%                         exposure_time=get(handles.ExposureTimeBox,'String');
%                         CStack.fileinfo=['ExposureTime-',exposure_time,' Gain-',gain,' StepSize-',num2str(CStageSettings.uiStepSize)];
%                         CStack.num=get(handles.NumStacks,'String');
%                         CStack.folder=get(handles.SaveDirectory,'String');
%                         CStack.strain=get(handles.StrainName,'String');
%                         CStack.DisplayChoices=get(handles.StackDisplayChoices,'Value');
%                         CStack.StackSaveChoices=get(handles.StackSaveChoices,'Value');
%                         increment=str2num(CStack.num)+1;
%                         set(handles.NumStacks,'String',num2str(increment));
%                         
% 
%                         [trld zstack]=GetZStackStepper(CDevices,CCam,CStageSettings);
%                         image=max(zstack,[],3);
%                         im=getsnapshot(CCam.pCam1);
%                         im_mean=mean2(im);
%                         im_std=std2(double(im));
% 
%                         switch get(handles.LoadingMethod,'Value')
%                             case 1
%                                 animal_loaded=(im_mean>CWaitParameters.DetectionMean);
%                             case 2
%                                 animal_loaded=(im_std>CWaitParameters.DetectionStd);
%                         end
%                     
%                     
%                         if animal_loaded
%                         
%                             [predict_image]=pixel_analyzelin(image,CDevices.cPixelTraining);
%                             status='Phenotyping';set(handles.status,'String',status);
%                             
%                             [wildtypetrue phenotyped reason bw_l syn_mean]=AnalyzeWorm(image,predict_image);
% 
%                             if phenotyped
%                                 if ~wildtypetrue
%                                     [trld zstack]=GetZStackStepper(CDevices,CCam,CStageSettings);
%                                     image=max(zstack,[],3);
%                                     [predict_image]=pixel_analyzelin(image,CDevices.cPixelTraining);
%                                     status='Phenotyping 2';set(handles.status,'String',status);
%                                     [wildtypetrue phenotyped reason bw_l syn_mean]=AnalyzeWorm(image,predict_image);
% 
%                                     if ~wildtypetrue
%                                         max_g=max(zstack,[],3);
%                                         figure(2);imshow(max_g(1:480,:),[],'InitialMagnification','fit','Border','tight');impixelinfo();
%                                         sendmail(myaddress, 'Mutant Found');
%                                         
%                                         evalResponse=1;
%                                         
%                                         if evalResponse
%                                             CStack.strain=strcat('M_',get(handles.StrainName,'String'));
%                                             CStack.strain='Mutant';
%                                             CStack.StackSaveChoices=4;   
%                                             status='Saving Mutant Image';set(handles.status,'String',status);
%                                             AcquireStack(zstack,CStack);
%                                             nummutants=get(handles.NumMutants,'String');
%                                             increment=str2num(nummutants)+1;
%                                             set(handles.NumMutants,'String',num2str(increment));
%                                             text='Mutant; ';
%                                         else
%                                             wildtypetrue=1;
%                                             text='Wild Type';
%                                         end
%                                     else
%                                         wildtypetrue=1;
%                                         text='Wild Type';
%                                         CStack.StackSaveChoices=3;   
%                                         status='Saving WT Image';set(handles.status,'String',status);
%                                         AcquireStack(zstack,CStack);
%                                     end
%                                 else
%                                     wildtypetrue=1;
%                                     text='Wild Type';
%                                     CStack.StackSaveChoices=3;   
%                                     status='Saving WT Image';set(handles.status,'String',status);
%                                     AcquireStack(zstack,CStack);
%                                 end
% 
%                                 wtnum=get(handles.NumPhenotyped,'String');
%                                 increment=str2num(wtnum)+1;
%                                 syn_mean;
%                                 str2num(get(handles.AvgSize,'String'));
%                                 avg_syn_size=(str2num(wtnum)*str2num(get(handles.AvgSize,'String'))+syn_mean)/increment;
%                                 set(handles.NumPhenotyped,'String',num2str(increment));
%                                 set(handles.AvgSize,'String',num2str(avg_syn_size));
%                             else
%                                 wildtypetrue=1;
%                                 figure(2);imshow(image(1:480,:),[],'InitialMagnification','fit','Border','tight');
%                                 text='Not Phenotyped; ';
%                             end
% 
%                             figure(3);imshow(bw_l,[],'InitialMagnification','fit','Border','tight');title(['Identified synapses - Animal is - ',text,reason]);
%                         else
%                             wildtypetrue=1;
%                         end
% 
%                     else
%                         wildtypetrue=1;
%                     end
%                     
%                 else
%                     wildtypetrue=1;
%                 end
%             else
%                 wildtypetrue=1;
%             end
%             
% 
%             
%             if wildtypetrue
%                 status=st_wt_flushing(Valve);set(handles.status,'String',status);
%             else
%                 status=st_mutant_flushing(Valve);set(handles.status,'String',status);
%             end
%             
%             ftic=tic;
%             im=getsnapshot(CCam.pCam1);
%             im_mean=mean2(im);
%             set(handles.ImMean,'String',num2str(im_mean,4));
%             im_std=std2(double(im));
%             set(handles.ImStd,'String',num2str(im_std,4));
%             
%             switch get(handles.LoadingMethod,'Value')
%                 case 1
%                     animal_loaded=(im_mean>CWaitParameters.DetectionMean);
%                 case 2
%                     animal_loaded=(im_std>CWaitParameters.DetectionStd);
%             end
%             
%             flushing_cycles=1;
%             while animal_loaded                                                                
%                 pause(0.1);
%                 im=getsnapshot(CCam.pCam1);
%                 im_mean=mean2(im);
%                 set(handles.ImMean,'String',num2str(im_mean,4));
%                 im_std=std2(double(im));
%                 set(handles.ImStd,'String',num2str(im_std,4));
%                 switch get(handles.LoadingMethod,'Value')
%                     case 1
%                         animal_loaded=(im_mean>CWaitParameters.DetectionMean);
%                     case 2
%                         animal_loaded=(im_std>CWaitParameters.DetectionStd);
%                 end
%                 if toc(ftic)>2.5
%                     status=st_worm_imaging(Valve);
%                     pause(0.1)
%                     if wildtypetrue
%                         status=st_wt_flushing(Valve);set(handles.status,'String',status);
%                     else
%                         status=st_mutant_flushing(Valve);set(handles.status,'String',status);
%                     end
%                     ftic=tic;
%                     flushing_cycles=flushing_cycles+1;
%                 end
%                 if flushing_cycles>3
%                     sendmail(myaddress, 'CLOG', 'Worm stuck in imaging channel, please check operation');
%                     break
%                 end        
%                 
%             end
%             if wildtypetrue
%                 status=st_worm_loading(Valve);set(handles.status,'String',status);
%                 flush=0;tic;
%             else
%                 pause(1);
%                 status=st_worm_loading(Valve);set(handles.status,'String',status);
%                 flush=0;tic;
%             end
% 
%             
%         else
%             status=st_wt_flushing(Valve);set(handles.status,'String',status);
%             pause(Valve.ReleaseTime);
%             status=st_worm_loading(Valve);set(handles.status,'String',status);
%             tic;
%         end
%         
%     elseif toc>CWaitParameters.EntryWaitBeforeSpeed && flush<4
%         status=st_speed_loading(Valve);set(handles.status,'String',status);
%         pause(0.3);status=st_worm_loading(Valve);set(handles.status,'String',status);
%         flush=flush+1;
%         tic
%     elseif toc>CWaitParameters.WaitBeforeFlush && flush<8
%         status=st_wt_flushing(Valve);set(handles.status,'String',status);
%         pause(Valve.ReleaseTime);
%         status=st_worm_loading(Valve);set(handles.status,'String',status);
%         flush=flush+1;
%         tic
%     elseif flush>7
%         sendmail(myaddress, 'STOPPED OPERATION', 'Worm loading has failed, please check operation');
%         status=st_stop(Valve);set(handles.status,'String',status);
% 
%         break
%     end
%     
% end


% --- Executes on button press in SelectScreeningModel.
function SelectScreeningModel_Callback(hObject, eventdata, handles)
% hObject    handle to SelectScreeningModel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = uigetfile('*.mat', 'Pick the mat file containing the phenospace classifier');
name=[pathname filename];
% addpath('Vision&Support');
CDevices=getappdata(handles.figure1,'CDevices');
load(fullfile(pathname,filename));
CDevices.cPhenospace=cPhenotype;
setappdata(handles.figure1,'CDevices',CDevices);

% --- Executes on button press in SelectSynapseModel.
function SelectSynapseModel_Callback(hObject, eventdata, handles)
% hObject    handle to SelectSynapseModel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = uigetfile('*.mat', 'Pick the mat file containing the synapse classifier');
name=[pathname filename];
% addpath('Vision&Support');
CDevices=getappdata(handles.figure1,'CDevices');
load(fullfile(pathname,filename));
CDevices.cPixelTraining=cPixelTraining;
setappdata(handles.figure1,'CDevices',CDevices);

% --- Executes on button press in MutantRelease.
function MutantRelease_Callback(hObject, eventdata, handles)
% hObject    handle to MutantRelease (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
CDevices=getappdata(handles.figure1,'CDevices');
CCam=getappdata(handles.figure1,'CCam');
Valve=getappdata(handles.figure1,'Valve');


status=st_mutant_flushing(Valve);set(handles.status,'String',status);

    pause(Valve.ReleaseTime*9);

status=st_worm_loading(Valve);set(handles.status,'String',status);
            

% --- Executes on button press in WildTypeRelease.
function WildTypeRelease_Callback(hObject, eventdata, handles)
% hObject    handle to WildTypeRelease (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
CDevices=getappdata(handles.figure1,'CDevices');
CCam=getappdata(handles.figure1,'CCam');
Valve=getappdata(handles.figure1,'Valve');
status=st_wt_flushing(Valve);set(handles.status,'String',status);
pause(Valve.ReleaseTime*3)

status=st_worm_loading(Valve);set(handles.status,'String',status);


% --- Executes on button press in WormPresent.
function WormPresent_Callback(hObject, eventdata, handles)
% hObject    handle to WormPresent (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Valve=getappdata(handles.figure1,'Valve');
status=st_worm_imaging(Valve);set(handles.status,'String',status);
% WormPresentValveSequence(Valve);

% --- Executes on button press in WormLoading.
function WormLoading_Callback(hObject, eventdata, handles)
% hObject    handle to WormLoading (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Valve=getappdata(handles.figure1,'Valve');
status=st_worm_loading(Valve);set(handles.status,'String',status);


% --- Executes on button press in AutoLoading.
function AutoLoading_Callback(hObject, eventdata, handles)
% hObject    handle to AutoLoading (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
CDevices=getappdata(handles.figure1,'CDevices');
CCam=getappdata(handles.figure1,'CCam');
Valve=getappdata(handles.figure1,'Valve');
status=st_initi_loading(Valve);set(handles.status,'String',status);
tic;


% disp(qbvalue)
% qbvalue=get(handles.QuitAutomation,'Value')
    
while ~get(handles.QuitAutomation,'Value')
% i=0;
% while ~qbvalue
%     qbvalue=get(handles.QuitAutomation,'Value')
%     i=i+1
%     set(handles.status,'String',qbvalue);

        CWaitParameters.DetectionMean=str2double(get(handles.LoadMean,'String'));
        CWaitParameters.DetectionStd=str2double(get(handles.LoadStd,'String'));
      
        im=getsnapshot(CCam.pCam1);
        im_mean=mean2(im);
        set(handles.ImMean,'String',num2str(im_mean,4));
        im_std=std2(double(im));
        set(handles.ImStd,'String',num2str(im_std,4));
        
        pause(.05);
 
        switch get(handles.LoadingMethod,'Value')
            case 1
                animal_loaded=(im_mean>CWaitParameters.DetectionMean);
            case 2
                animal_loaded=(im_std>CWaitParameters.DetectionStd);
        end
        if animal_loaded||toc>60
            status=st_worm_loading(Valve);set(handles.status,'String',status);
            break
        end
% pause(1)
end
              


% --- Executes on button press in Snapshot.
function Snapshot_Callback(hObject, eventdata, handles)
% hObject    handle to Snapshot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

CCam=getappdata(handles.figure1,'CCam');
CCam.rgImg1 = getsnapshot(CCam.pCam1);
% CCam.rgImg2 = getsnapshot(CCam.pCam2);
figure(5);imshow(CCam.rgImg1,[],'InitialMagnification',50);impixelinfo;
snapshot_mean=mean2(CCam.rgImg1);
a=double(CCam.rgImg1);
snapshot_std=std(a(:));
% loadtic=tic;

% file='C:\Data\Dan\test.tif';
% ii =1;
% while toc(loadtic)<300
%     CCam.rgImg1 = getsnapshot(CCam.pCam1);
%     file = ['C:\Data\Dan\' sprintf('frame%i.png',ii)]
%     imwrite(CCam.rgImg1,file);
%     ii = ii + 1;
% end

set(handles.ImMean,'String',num2str(snapshot_mean));
set(handles.ImStd,'String',num2str(snapshot_std));


% --- Executes on button press in zstack.
function zstack_Callback(hObject, eventdata, handles)
% hObject    handle to zstack (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% addpath('Vision&Support')
CCam=getappdata(handles.figure1,'CCam');
CDevices=getappdata(handles.figure1,'CDevices');

CStageSettings.uiZHeight=str2double(get(handles.ZStackSize,'String'));
CStageSettings.uiStepSize=str2double(get(handles.ZStackStepSize,'String'));
stepsize=get(handles.ZStackStepSize,'String');
% gain=get(handles.GainBox,'String');
exposure_time=get(handles.ExposureTimeBox,'String');
% gain2=get(handles.GainBox2,'String');
% exposure_time2=get(handles.ExposureTimeBox2,'String');
% CStack.fileinfo=['ExposureTime1-',exposure_time,' StepSize-',stepsize];
CStack.num=get(handles.NumStacks,'String');
CStack.folder=get(handles.SaveDirectory,'String');
CStack.strain=get(handles.StrainName,'String');
CStack.DisplayChoices=get(handles.StackDisplayChoices,'Value');
CStack.StackSaveChoices=get(handles.StackSaveChoices,'Value');
increment=str2num(CStack.num)+1;
set(handles.NumStacks,'String',num2str(increment));
tic
[stack]=GetZStackStepperG(CDevices,CCam,CStageSettings);
disp(toc)
AcquireStackG(stack,CStack);
image=max(zstack,[],3);
[wildtypetrue phenotyped reason]=AnalyzeWorm_pab1(image);
if phenotyped
                                if ~wildtypetrue
                                    pause(3)
                                    [zstack]=GetZStackStepperG(CDevices,CCam,CStageSettings);
                                    image=max(zstack,[],3);
                                    %[predict_image]=pixel_analyzelin(image,1,CDevices.cPixelTraining);
                                    status='Phenotyping 2';set(handles.status,'String',status);
                                    [wildtypetrue phenotyped reason]=AnalyzeWorm_pab1(image);

                                    if ~wildtypetrue
                                        max_g=max(zstack,[],3);
                                        %figure(2);imshow(max_g(1:480,:),[],'InitialMagnification','fit','Border','tight');impixelinfo();
                                        %sendmail(myaddress, strcat('Mutant Found',reason));
                                        
                                        evalResponse=1;
%                                         
                                        if evalResponse
                                            CStack.strain=strcat('M_',get(handles.StrainName,'String'));
%                                             CStack.strain='Mutant';
                                            CStack.StackSaveChoices=3; 
                                            CStack.DisplayChoices=4;
                                            status='Saving Mutant Image';set(handles.status,'String',status);
                                            AcquireStack(zstack,CStack);
                                            nummutants=get(handles.NumMutants,'String');
                                            increment=str2num(nummutants)+1;
                                            set(handles.NumMutants,'String',num2str(increment));
                                            text='Mutant';
                                            
                                        else
                                            wildtypetrue=1;
                                            text='Wild Type';
                                        end
                                    else
                                        wildtypetrue=1;
                                        text='Wild Type';
                                        CStack.StackSaveChoices=3;   
                                        status='Saving WT Image';set(handles.status,'String',status);
                                        CStack.DisplayChoices=4;
                                        AcquireStack(zstack,CStack);
                                    end
                                else
                                    wildtypetrue=1;
                                    text='Wild Type';
                                    CStack.StackSaveChoices=3;
                                    CStack.DisplayChoices=4;
                                    status='Saving WT Image';set(handles.status,'String',status);
                                    AcquireStack(zstack,CStack);
                                end

                                wtnum=get(handles.NumPhenotyped,'String');
                                increment=str2num(wtnum)+1;
                                %syn_mean;
                                str2num(get(handles.AvgSize,'String'));
                                %avg_syn_size=(str2num(wtnum)*str2num(get(handles.AvgSize,'String'))+syn_mean)/increment;
                                set(handles.NumPhenotyped,'String',num2str(increment));
                                %set(handles.AvgSize,'String',num2str(avg_syn_size));
                            else
                                wildtypetrue=1;
                                %figure(2);imshow(image(1:480,:),[],'InitialMagnification','fit','Border','tight');
                                text='Not Phenotyped; ';
end
disp(text)


                            %figure(3);imshow(bw_l,[],'InitialMagnification','fit','Border','tight');title(['Identified synapses - Animal is - ',text,reason]);
                


% --- Executes on button press in SelectSaveDirectory.
function SelectSaveDirectory_Callback(hObject, eventdata, handles)
% hObject    handle to SelectSaveDirectory (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
directory_name = uigetdir;
set(handles.SaveDirectory,'string',[directory_name,'\']);


function SaveDirectory_Callback(hObject, eventdata, handles)
% hObject    handle to SaveDirectory (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of SaveDirectory as text
%        str2double(get(hObject,'String')) returns contents of SaveDirectory as a double


% --- Executes during object creation, after setting all properties.
function SaveDirectory_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SaveDirectory (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function StrainName_Callback(hObject, eventdata, handles)
% hObject    handle to StrainName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of StrainName as text
%        str2double(get(hObject,'String')) returns contents of StrainName as a double


% --- Executes during object creation, after setting all properties.
function StrainName_CreateFcn(hObject, eventdata, handles)
% hObject    handle to StrainName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function WormsProcessed_Callback(hObject, eventdata, handles)
% hObject    handle to WormsProcessed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of WormsProcessed as text
%        str2double(get(hObject,'String')) returns contents of WormsProcessed as a double


% --- Executes during object creation, after setting all properties.
function WormsProcessed_CreateFcn(hObject, eventdata, handles)
% hObject    handle to WormsProcessed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function NumPhenotyped_Callback(hObject, eventdata, handles)
% hObject    handle to NumPhenotyped (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of NumPhenotyped as text
%        str2double(get(hObject,'String')) returns contents of NumPhenotyped as a double


% --- Executes during object creation, after setting all properties.
function NumPhenotyped_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NumPhenotyped (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function NumMutants_Callback(hObject, eventdata, handles)
% hObject    handle to NumMutants (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of NumMutants as text
%        str2double(get(hObject,'String')) returns contents of NumMutants as a double


% --- Executes during object creation, after setting all properties.
function NumMutants_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NumMutants (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function NumStacks_Callback(hObject, eventdata, handles)
% hObject    handle to NumStacks (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of NumStacks as text
%        str2double(get(hObject,'String')) returns contents of NumStacks as a double


% --- Executes during object creation, after setting all properties.
function NumStacks_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NumStacks (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% --- Executes on button press in GoodBadModel.
function GoodBadModel_Callback(hObject, eventdata, handles)
% hObject    handle to GoodBadModel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = uigetfile('*.mat', 'Pick the mat file containing the good/bad classifier');
name=[pathname filename];
% addpath('Vision&Support');
CDevices=getappdata(handles.figure1,'CDevices');
load(fullfile(pathname,filename))
CDevices.cGBParameters=cGBParameters;
setappdata(handles.figure1,'CDevices',CDevices);



function ZStackStepSizeC_Callback(hObject, eventdata, handles)
% hObject    handle to ZStackStepSizeC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ZStackStepSizeC as text
%        str2double(get(hObject,'String')) returns contents of ZStackStepSizeC as a double


% --- Executes during object creation, after setting all properties.
function ZStackStepSizeC_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ZStackStepSizeC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ZStackSizeC_Callback(hObject, eventdata, handles)
% hObject    handle to ZStackSizeC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ZStackSizeC as text
%        str2double(get(hObject,'String')) returns contents of ZStackSizeC as a double


% --- Executes during object creation, after setting all properties.
function ZStackSizeC_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ZStackSizeC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on key press with focus on ResolutionMenu and none of its controls.
function ResolutionMenu_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to ResolutionMenu (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)



function NumHeads_Callback(hObject, eventdata, handles)
% hObject    handle to NumHeads (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of NumHeads as text
%        str2double(get(hObject,'String')) returns contents of NumHeads as a double


% --- Executes during object creation, after setting all properties.
function NumHeads_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NumHeads (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function NumTails_Callback(hObject, eventdata, handles)
% hObject    handle to NumTails (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of NumTails as text
%        str2double(get(hObject,'String')) returns contents of NumTails as a double


% --- Executes during object creation, after setting all properties.
function NumTails_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NumTails (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function InjPinchValve_Callback(hObject, eventdata, handles)
% hObject    handle to InjPinchValve (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of InjPinchValve as text
%        str2double(get(hObject,'String')) returns contents of InjPinchValve as a double


% --- Executes during object creation, after setting all properties.
function InjPinchValve_CreateFcn(hObject, eventdata, handles)
% hObject    handle to InjPinchValve (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end






function goodtails_Callback(hObject, eventdata, handles)
% hObject    handle to etes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of etes as text
%        str2double(get(hObject,'String')) returns contents of etes as a double


% --- Executes during object creation, after setting all properties.
function goodtails_CreateFcn(hObject, eventdata, handles)
% hObject    handle to etes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function status_Callback(hObject, eventdata, handles)
% hObject    handle to status (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of status as text
%        str2double(get(hObject,'String')) returns contents of status as a double


% --- Executes during object creation, after setting all properties.
function status_CreateFcn(hObject, eventdata, handles)
% hObject    handle to status (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Init_Loading.
function Init_Loading_Callback(hObject, eventdata, handles)
% hObject    handle to Init_Loading (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

Valve=getappdata(handles.figure1,'Valve');
status=st_initi_loading(Valve);set(handles.status,'String',status);
setappdata(handles.figure1,'Valve',Valve);

% --- Executes on button press in Unload_Device.
function Unload_Device_Callback(hObject, eventdata, handles)
% hObject    handle to Unload_Device (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Valve=getappdata(handles.figure1,'Valve');
status=st_unload(Valve);set(handles.status,'String',status);
setappdata(handles.figure1,'Valve',Valve);


% --- Executes on button press in email.
function email_Callback(hObject, eventdata, handles)
% hObject    handle to email (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


prompt = {'Enter e-mail address:','Enter password:'};
dlg_title = 'Gmail settings';
num_lines = 1;
def = {'invertedscopedevice@gmail.com',''};
answer = inputdlg(prompt,dlg_title,num_lines,def);
myaddress=char(answer(1));
mypassword=char(answer(2));

setpref('Internet','E_mail',myaddress);
setpref('Internet','SMTP_Server','smtp.gmail.com');
setpref('Internet','SMTP_Username',myaddress);
setpref('Internet','SMTP_Password',mypassword);

props = java.lang.System.getProperties;
props.setProperty('mail.smtp.auth','true');
props.setProperty('mail.smtp.socketFactory.class', ...
                  'javax.net.ssl.SSLSocketFactory');
props.setProperty('mail.smtp.socketFactory.port','465');
setappdata(handles.figure1,'email',myaddress);


% --- Executes on button press in Dev_Angle.
function Dev_Angle_Callback(hObject, eventdata, handles)
% hObject    handle to Dev_Angle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


CCam=getappdata(handles.figure1,'CCam');
CCam.rgImg1 = getsnapshot(CCam.pCam1);
% CCam.rgImg2 = getsnapshot(CCam.pCam2);
figure(3);imshow(CCam.rgImg1,[]);impixelinfo;
pts=getline(gcf);
delx=pts(2,1)-pts(1,1);
dely=pts(1,2)-pts(2,2);
theta=atan(dely/delx)*180/pi();
set(handles.DevAngle_disp,'String',num2str(theta,3));
% setappdata(handles.figure1,'Dev_angle',theta);
    



function AvgSize_Callback(hObject, eventdata, handles)
% hObject    handle to AvgSize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of AvgSize as text
%        str2double(get(hObject,'String')) returns contents of AvgSize as a double


% --- Executes during object creation, after setting all properties.
function AvgSize_CreateFcn(hObject, eventdata, handles)
% hObject    handle to AvgSize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Or1_Callback(hObject, eventdata, handles)
% hObject    handle to Or1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Or1 as text
%        str2double(get(hObject,'String')) returns contents of Or1 as a double


% --- Executes during object creation, after setting all properties.
function Or1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Or1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Or2_Callback(hObject, eventdata, handles)
% hObject    handle to Or2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Or2 as text
%        str2double(get(hObject,'String')) returns contents of Or2 as a double


% --- Executes during object creation, after setting all properties.
function Or2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Or2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function DevAngle_disp_Callback(hObject, eventdata, handles)
% hObject    handle to DevAngle_disp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of DevAngle_disp as text
%        str2double(get(hObject,'String')) returns contents of DevAngle_disp as a double


% --- Executes during object creation, after setting all properties.
function DevAngle_disp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to DevAngle_disp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Ecc_Callback(hObject, eventdata, handles)
% hObject    handle to Ecc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Ecc as text
%        str2double(get(hObject,'String')) returns contents of Ecc as a double


% --- Executes during object creation, after setting all properties.
function Ecc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Ecc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ht_disp_Callback(hObject, eventdata, handles)
% hObject    handle to ht_disp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ht_disp as text
%        str2double(get(hObject,'String')) returns contents of ht_disp as a double


% --- Executes during object creation, after setting all properties.
function ht_disp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ht_disp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Imm2Valve_Callback(hObject, eventdata, handles)
% hObject    handle to Imm2Valve (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Imm2Valve as text
%        str2double(get(hObject,'String')) returns contents of Imm2Valve as a double


% --- Executes during object creation, after setting all properties.
function Imm2Valve_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Imm2Valve (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on selection change in MarkerStrain.
function MarkerStrain_Callback(hObject, eventdata, handles)
% hObject    handle to MarkerStrain (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns MarkerStrain contents as cell array
%        contents{get(hObject,'Value')} returns selected item from MarkerStrain


% --- Executes during object creation, after setting all properties.
function MarkerStrain_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MarkerStrain (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ImageDelay2_Callback(hObject, eventdata, handles)
% hObject    handle to ImageDelay2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ImageDelay2 as text
%        str2double(get(hObject,'String')) returns contents of ImageDelay2 as a double


% --- Executes during object creation, after setting all properties.
function ImageDelay2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ImageDelay2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Piezo_init.
function Piezo_init_Callback(hObject, eventdata, handles)
% hObject    handle to Piezo_init (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


CDevices=getappdata(handles.figure1,'CDevices');
try
    fclose(CDevices.pSerialPiezo);
end
CDevices.pSerialPiezo = serial('COM4','BaudRate',9600,'DataBits',8); % check for com port
set(CDevices.pSerialPiezo,'Terminator','CR')

fopen(CDevices.pSerialPiezo);

setappdata(handles.figure1,'CDevices',CDevices); 


% --- Executes on button press in PiezoYup.
function PiezoYup_Callback(hObject, eventdata, handles)
% hObject    handle to PiezoYup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
CDevices=getappdata(handles.figure1,'CDevices');
PiezoDistance = num2str(str2double(get(handles.MoveMicrons,'String'))/10);
% fprintf(CDevices.pSerialPiezo,'RESET')
fprintf(CDevices.pSerialPiezo,strcat('R Y=',PiezoDistance));
fscanf(CDevices.pSerialPiezo)


% --- Executes on button press in PiezoYdown.
function PiezoYdown_Callback(hObject, eventdata, handles)
% hObject    handle to PiezoYdown (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
CDevices=getappdata(handles.figure1,'CDevices');
PiezoDistance = num2str(-str2double(get(handles.MoveMicrons,'String'))/10);
fprintf(CDevices.pSerialPiezo,strcat('R Y=',PiezoDistance));
% fprintf(CDevices.pSerialPiezo,'~')
% pause(60)
fscanf(CDevices.pSerialPiezo)



function MoveMicrons_Callback(hObject, eventdata, handles)
% hObject    handle to MoveMicrons (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of MoveMicrons as text
%        str2double(get(hObject,'String')) returns contents of MoveMicrons as a double


% --- Executes during object creation, after setting all properties.
function MoveMicrons_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MoveMicrons (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in PiezoXright.
function PiezoXright_Callback(hObject, eventdata, handles)
% hObject    handle to PiezoXright (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
CDevices=getappdata(handles.figure1,'CDevices');
PiezoDistance = num2str(str2double(get(handles.MoveMicrons,'String'))*10);
fprintf(CDevices.pSerialPiezo,strcat('R X=',PiezoDistance));
fscanf(CDevices.pSerialPiezo)


% --- Executes on button press in PiezoXleft.
function PiezoXleft_Callback(hObject, eventdata, handles)
% hObject    handle to PiezoXleft (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
CDevices=getappdata(handles.figure1,'CDevices');
PiezoDistance = num2str(-str2double(get(handles.MoveMicrons,'String'))*10);
fprintf(CDevices.pSerialPiezo,strcat('R X=',PiezoDistance));
% fprintf(CDevices.pSerialPiezo,'I X');
fscanf(CDevices.pSerialPiezo)


% --- Executes on selection change in Dichroic.
function Dichroic_Callback(hObject, eventdata, handles)
% hObject    handle to Dichroic (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Dichroic contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Dichroic
CDevices=getappdata(handles.figure1,'CDevices');
dichroic = get(handles.Dichroic,'Value')-1;
CDevices.mmc.setState('XLIGHT Dichroic',dichroic);
setappdata(handles.figure1,'CDevices',CDevices);



% --- Executes during object creation, after setting all properties.
function Dichroic_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Dichroic (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in EmissionFilter.
function EmissionFilter_Callback(hObject, eventdata, handles)
% hObject    handle to EmissionFilter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns EmissionFilter contents as cell array
%        contents{get(hObject,'Value')} returns selected item from EmissionFilter
CDevices=getappdata(handles.figure1,'CDevices');

filter = get(handles.EmissionFilter,'Value')-1;
CDevices.mmc.setState('XLIGHT Emission Wheel',filter);

% mmc.getState('XLIGHT Emission Wheel')
setappdata(handles.figure1,'CDevices',CDevices);


% --- Executes during object creation, after setting all properties.
function EmissionFilter_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EmissionFilter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in InitConfocal.
function InitConfocal_Callback(hObject, eventdata, handles)
% hObject    handle to InitConfocal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
CDevices=getappdata(handles.figure1,'CDevices');
import mmcorej.*;
CDevices.mmc = CMMCore;
CDevices.mmc.loadSystemConfiguration ('C:\Program Files\Micro-Manager-1.4\Confocalv02.cfg');
% CDevices.mmc.setState('XLIGHT Emission Wheel',1)
CDevices.mmc.setState('XLIGHT Dichroic',0);

filter = get(handles.EmissionFilter,'Value')-1;
CDevices.mmc.setState('XLIGHT Emission Wheel',filter);

dichroic = get(handles.Dichroic,'Value')-1;
CDevices.mmc.setState('XLIGHT Dichroic',dichroic);

% mmc.getState('XLIGHT Emission Wheel')
setappdata(handles.figure1,'CDevices',CDevices);


% --- Executes on button press in ConfocalOff.
function ConfocalOff_Callback(hObject, eventdata, handles)
% hObject    handle to ConfocalOff (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
CDevices=getappdata(handles.figure1,'CDevices');

set(handles.Dichroic,'Value',4);
dichroic = get(handles.Dichroic,'Value')-1;
CDevices.mmc.setState('XLIGHT Dichroic',dichroic);
% 
set(handles.EmissionFilter,'Value',8);
filter = get(handles.EmissionFilter,'Value')-1;
CDevices.mmc.setState('XLIGHT Emission Wheel',filter);

CDevices.mmc.setState('XLIGHT Spin motor',0)
% mmc.getState('XLIGHT Spin motor')
CDevices.mmc.setState('XLIGHT Disk slider',0)



% --- Executes on button press in ConfocalOn.
function ConfocalOn_Callback(hObject, eventdata, handles)
% hObject    handle to ConfocalOn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
CDevices=getappdata(handles.figure1,'CDevices');
CDevices.mmc.setState('XLIGHT Spin motor',1)
% mmc.getState('XLIGHT Spin motor')
CDevices.mmc.setState('XLIGHT Disk slider',1)
% mmc.getState('XLIGHT Disk slider')


% --- Executes on button press in DisconnectCamera.
function DisconnectCamera_Callback(hObject, eventdata, handles)
% hObject    handle to DisconnectCamera (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
CDevices=getappdata(handles.figure1,'CDevices');

setappdata(handles.figure1,'CDevices',CDevices);
CCam=getappdata(handles.figure1,'CCam');
stop([CCam.pCam1]);
delete([CCam.pCam1]);
clear CCam.pCam1


% --- Executes on button press in ConnectCamera.
function ConnectCamera_Callback(hObject, eventdata, handles)
% hObject    handle to ConnectCamera (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
addpath('Vision_Support')

CDevices=getappdata(handles.figure1,'CDevices');
    CCam.rgImg1 = uint16(0);
    CCam.iFrames1 = 0;
    CCam.rgTime1 = 0;
    CCam.iBin = get(handles.ResolutionMenu,'Value'); %% is it ok or change to number?
    switch CCam.iBin
        case 1
            CCam.strVideoFormat = 'MONO16_2048x2048_FastMode';
        case 2
            CCam.strVideoFormat = 'MONO16_2048x2048_SlowMode';
        case 3
            CCam.strVideoFormat = 'MONO16_BIN2x2_1024x1024_FastMode';
        case 4
            CCam.strVideoFormat = 'MONO16_BIN2x2_1024x1024_SlowMode';
        case 5
            CCam.strVideoFormat = 'MONO16_BIN4x4_512x512_FastMode';
        case 6
            CCam.strVideoFormat = 'MONO16_BIN4x4_512x512_SlowMode';
        otherwise
            error('Valid binning options are 1, 2, 3,4,5 or 6.');
    end

    CCam.dExposureTime = str2double(get(handles.ExposureTimeBox,'String'));
    CCam.dFPS1 = round(1000/CCam.dExposureTime);
    CCam.bRunning1 = false;
    CCam.pCam1 = [];
    CCam.iFramesPerTrigger = 1; %
    CCam.iTriggerRepeat = Inf;
    CCam.pCam1 = videoinput('hamamatsu',1,CCam.strVideoFormat);
    CCam.pCam1.FramesPerTrigger = CCam.iFramesPerTrigger;
    CCam.pCam1.TriggerRepeat=Inf;
    triggerconfig(CCam.pCam1,'Manual');
    dExp = CCam.dExposureTime/1000;
    set(getselectedsource(CCam.pCam1),'ExposureTime',dExp);
    setappdata(handles.figure1,'CDevices',CDevices); 
    setappdata(handles.figure1,'CCam',CCam);

% --- Executes on button press in StopCameraPreview.
function StopCameraPreview_Callback(hObject, eventdata, handles)
% hObject    handle to StopCameraPreview (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
CCam=getappdata(handles.figure1,'CCam');
stoppreview(CCam.pCam1);

% --- Executes on button press in StartCameraPreview.
function StartCameraPreview_Callback(hObject, eventdata, handles)
% hObject    handle to StartCameraPreview (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
CCam=getappdata(handles.figure1,'CCam');
% figure('Name','Preview');%,'OuterPosition',[1 1 500 1080]);
vidRes=get(CCam.pCam1,'VideoResolution');
h1=image(zeros(vidRes(2),vidRes(1),1));
preview(CCam.pCam1,h1);

imageRes = fliplr(vidRes);
% subplot(1,2,1);
hImage = imshow(zeros(imageRes));
axis image;
% setappdata(hImage,'UpdatePreviewWindowFcn',@update_livehistogram_display);
preview(CCam.pCam1, hImage);


% --- Executes on selection change in ResolutionMenu.
function ResolutionMenu_Callback(hObject, eventdata, handles)
% hObject    handle to ResolutionMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns ResolutionMenu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from ResolutionMenu


% --- Executes during object creation, after setting all properties.
function ResolutionMenu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ResolutionMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
