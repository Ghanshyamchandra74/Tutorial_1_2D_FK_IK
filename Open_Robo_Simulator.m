function varargout = Open_Robo_Simulator(varargin)

%******************* Open_Robo_Simulator **************
%******************* Ghanshyam_Chandra ****************

% OPEN_ROBO_SIMULATOR MATLAB code for Open_Robo_Simulator.fig
%      OPEN_ROBO_SIMULATOR, by itself, creates a new OPEN_ROBO_SIMULATOR or raises the existing
%      singleton*.
%
%      H = OPEN_ROBO_SIMULATOR returns the handle to a new OPEN_ROBO_SIMULATOR or the handle to
%      the existing singleton*.
%
%      OPEN_ROBO_SIMULATOR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in OPEN_ROBO_SIMULATOR.M with the given input arguments.
%
%      OPEN_ROBO_SIMULATOR('Property','Value',...) creates a new OPEN_ROBO_SIMULATOR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Open_Robo_Simulator_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Open_Robo_Simulator_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Open_Robo_Simulator

% Last Modified by GUIDE v2.5 18-Apr-2019 07:06:20

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Open_Robo_Simulator_OpeningFcn, ...
                   'gui_OutputFcn',  @Open_Robo_Simulator_OutputFcn, ...
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


% --- Executes just before Open_Robo_Simulator is made visible.
function Open_Robo_Simulator_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Open_Robo_Simulator (see VARARGIN)

% Choose default command line output for Open_Robo_Simulator
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Open_Robo_Simulator wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Open_Robo_Simulator_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Forward_Kinematics_plot.
function Forward_Kinematics_plot_Callback(hObject, eventdata, handles)
% hObject    handle to Forward_Kinematics_plot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Assigning Theta
Th_1 = str2double(handles.theta_1.String);
Th_2 = str2double(handles.theta_2.String);
% Assigning d
d_1 = str2double(handles.d_1.String);
d_2 = str2double(handles.d_2.String);

% Assigning a
a_1 = str2double(handles.a_1.String);
a_2 = str2double(handles.a_2.String);


% Assigning alpha
al_1 = str2double(handles.alpha_1.String);
al_2 = str2double(handles.alpha_2.String);


al_1=al_1*(pi/180);
al_2=al_2*(pi/180);

Th_1=Th_1*(pi/180);
Th_2=Th_2*(pi/180);


[T00,T01,T12]=forwardKinematics(Th_1,d_1,a_1,al_1,Th_2,d_2,a_2,al_2);


Etip = T00*T01*T12;
handles.X0.String = num2str((T00(1,4)));handles.Y0.String = num2str((T00(2,4)));handles.Z0.String = num2str((T00(3,4)));
handles.X1.String = num2str((T01(1,4)));handles.Y1.String = num2str((T01(2,4)));handles.Z1.String = num2str((T01(3,4)));
handles.X2.String = num2str((Etip(1,4)));handles.Y2.String = num2str((Etip(2,4)));handles.Z2.String = num2str((Etip(3,4)));

%FK_plot
FK_plot3D(Th_1, Th_2, a_1, a_2, d_1, d_2, al_1, al_2)


function a_1_Callback(hObject, eventdata, handles)
% hObject    handle to a_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of a_1 as text
%        str2double(get(hObject,'String')) returns contents of a_1 as a double


% --- Executes during object creation, after setting all properties.
function a_1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to a_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function a_2_Callback(hObject, eventdata, handles)
% hObject    handle to a_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of a_2 as text
%        str2double(get(hObject,'String')) returns contents of a_2 as a double


% --- Executes during object creation, after setting all properties.
function a_2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to a_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function a_3_Callback(hObject, eventdata, handles)
% hObject    handle to a_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of a_3 as text
%        str2double(get(hObject,'String')) returns contents of a_3 as a double


% --- Executes during object creation, after setting all properties.
function a_3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to a_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function a_4_Callback(hObject, eventdata, handles)
% hObject    handle to a_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of a_4 as text
%        str2double(get(hObject,'String')) returns contents of a_4 as a double


% --- Executes during object creation, after setting all properties.
function a_4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to a_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function a_5_Callback(hObject, eventdata, handles)
% hObject    handle to a_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of a_5 as text
%        str2double(get(hObject,'String')) returns contents of a_5 as a double


% --- Executes during object creation, after setting all properties.
function a_5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to a_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function a_6_Callback(hObject, eventdata, handles)
% hObject    handle to a_6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of a_6 as text
%        str2double(get(hObject,'String')) returns contents of a_6 as a double


% --- Executes during object creation, after setting all properties.
function a_6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to a_6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function alpha_1_Callback(hObject, eventdata, handles)
% hObject    handle to alpha_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of alpha_1 as text
%        str2double(get(hObject,'String')) returns contents of alpha_1 as a double


% --- Executes during object creation, after setting all properties.
function alpha_1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to alpha_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function alpha_2_Callback(hObject, eventdata, handles)
% hObject    handle to alpha_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of alpha_2 as text
%        str2double(get(hObject,'String')) returns contents of alpha_2 as a double


% --- Executes during object creation, after setting all properties.
function alpha_2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to alpha_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function alpha_3_Callback(hObject, eventdata, handles)
% hObject    handle to alpha_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of alpha_3 as text
%        str2double(get(hObject,'String')) returns contents of alpha_3 as a double


% --- Executes during object creation, after setting all properties.
function alpha_3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to alpha_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function alpha_4_Callback(hObject, eventdata, handles)
% hObject    handle to alpha_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of alpha_4 as text
%        str2double(get(hObject,'String')) returns contents of alpha_4 as a double


% --- Executes during object creation, after setting all properties.
function alpha_4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to alpha_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function alpha_5_Callback(hObject, eventdata, handles)
% hObject    handle to alpha_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of alpha_5 as text
%        str2double(get(hObject,'String')) returns contents of alpha_5 as a double


% --- Executes during object creation, after setting all properties.
function alpha_5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to alpha_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function alpha_6_Callback(hObject, eventdata, handles)
% hObject    handle to alpha_6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of alpha_6 as text
%        str2double(get(hObject,'String')) returns contents of alpha_6 as a double


% --- Executes during object creation, after setting all properties.
function alpha_6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to alpha_6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function theta_1_Callback(hObject, eventdata, handles)
% hObject    handle to theta_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of theta_1 as text
%        str2double(get(hObject,'String')) returns contents of theta_1 as a double


% --- Executes during object creation, after setting all properties.
function theta_1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to theta_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function theta_2_Callback(hObject, eventdata, handles)
% hObject    handle to theta_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of theta_2 as text
%        str2double(get(hObject,'String')) returns contents of theta_2 as a double


% --- Executes during object creation, after setting all properties.
function theta_2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to theta_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function theta_3_Callback(hObject, eventdata, handles)
% hObject    handle to theta_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of theta_3 as text
%        str2double(get(hObject,'String')) returns contents of theta_3 as a double


% --- Executes during object creation, after setting all properties.
function theta_3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to theta_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function theta_4_Callback(hObject, eventdata, handles)
% hObject    handle to theta_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of theta_4 as text
%        str2double(get(hObject,'String')) returns contents of theta_4 as a double


% --- Executes during object creation, after setting all properties.
function theta_4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to theta_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function theta_6_Callback(hObject, eventdata, handles)
% hObject    handle to theta_6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of theta_6 as text
%        str2double(get(hObject,'String')) returns contents of theta_6 as a double


% --- Executes during object creation, after setting all properties.
function theta_6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to theta_6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function d_1_Callback(hObject, eventdata, handles)
% hObject    handle to d_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of d_1 as text
%        str2double(get(hObject,'String')) returns contents of d_1 as a double


% --- Executes during object creation, after setting all properties.
function d_1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to d_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function d_2_Callback(hObject, eventdata, handles)
% hObject    handle to d_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of d_2 as text
%        str2double(get(hObject,'String')) returns contents of d_2 as a double


% --- Executes during object creation, after setting all properties.
function d_2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to d_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function d_3_Callback(hObject, eventdata, handles)
% hObject    handle to d_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of d_3 as text
%        str2double(get(hObject,'String')) returns contents of d_3 as a double


% --- Executes during object creation, after setting all properties.
function d_3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to d_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function d_4_Callback(hObject, eventdata, handles)
% hObject    handle to d_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of d_4 as text
%        str2double(get(hObject,'String')) returns contents of d_4 as a double


% --- Executes during object creation, after setting all properties.
function d_4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to d_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function d_5_Callback(hObject, eventdata, handles)
% hObject    handle to d_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of d_5 as text
%        str2double(get(hObject,'String')) returns contents of d_5 as a double


% --- Executes during object creation, after setting all properties.
function d_5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to d_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function d_6_Callback(hObject, eventdata, handles)
% hObject    handle to d_6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of d_6 as text
%        str2double(get(hObject,'String')) returns contents of d_6 as a double


% --- Executes during object creation, after setting all properties.
function d_6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to d_6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Z1_Callback(hObject, eventdata, handles)
% hObject    handle to Z1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Z1 as text
%        str2double(get(hObject,'String')) returns contents of Z1 as a double


% --- Executes during object creation, after setting all properties.
function Z1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Z1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Z2_Callback(hObject, eventdata, handles)
% hObject    handle to Z2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Z2 as text
%        str2double(get(hObject,'String')) returns contents of Z2 as a double


% --- Executes during object creation, after setting all properties.
function Z2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Z2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Z3_Callback(hObject, eventdata, handles)
% hObject    handle to Z3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Z3 as text
%        str2double(get(hObject,'String')) returns contents of Z3 as a double


% --- Executes during object creation, after setting all properties.
function Z3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Z3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Z4_Callback(hObject, eventdata, handles)
% hObject    handle to Z4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Z4 as text
%        str2double(get(hObject,'String')) returns contents of Z4 as a double


% --- Executes during object creation, after setting all properties.
function Z4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Z4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Z5_Callback(hObject, eventdata, handles)
% hObject    handle to Z5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Z5 as text
%        str2double(get(hObject,'String')) returns contents of Z5 as a double


% --- Executes during object creation, after setting all properties.
function Z5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Z5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Z6_Callback(hObject, eventdata, handles)
% hObject    handle to Z6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Z6 as text
%        str2double(get(hObject,'String')) returns contents of Z6 as a double


% --- Executes during object creation, after setting all properties.
function Z6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Z6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Y1_Callback(hObject, eventdata, handles)
% hObject    handle to Y1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Y1 as text
%        str2double(get(hObject,'String')) returns contents of Y1 as a double


% --- Executes during object creation, after setting all properties.
function Y1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Y1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Y2_Callback(hObject, eventdata, handles)
% hObject    handle to Y2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Y2 as text
%        str2double(get(hObject,'String')) returns contents of Y2 as a double


% --- Executes during object creation, after setting all properties.
function Y2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Y2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Y3_Callback(hObject, eventdata, handles)
% hObject    handle to Y3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Y3 as text
%        str2double(get(hObject,'String')) returns contents of Y3 as a double


% --- Executes during object creation, after setting all properties.
function Y3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Y3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Y4_Callback(hObject, eventdata, handles)
% hObject    handle to Y4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Y4 as text
%        str2double(get(hObject,'String')) returns contents of Y4 as a double


% --- Executes during object creation, after setting all properties.
function Y4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Y4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Y5_Callback(hObject, eventdata, handles)
% hObject    handle to Y5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Y5 as text
%        str2double(get(hObject,'String')) returns contents of Y5 as a double


% --- Executes during object creation, after setting all properties.
function Y5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Y5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Y6_Callback(hObject, eventdata, handles)
% hObject    handle to Y6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Y6 as text
%        str2double(get(hObject,'String')) returns contents of Y6 as a double


% --- Executes during object creation, after setting all properties.
function Y6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Y6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function X1_Callback(hObject, eventdata, handles)
% hObject    handle to X1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of X1 as text
%        str2double(get(hObject,'String')) returns contents of X1 as a double


% --- Executes during object creation, after setting all properties.
function X1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to X1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function X2_Callback(hObject, eventdata, handles)
% hObject    handle to X2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of X2 as text
%        str2double(get(hObject,'String')) returns contents of X2 as a double


% --- Executes during object creation, after setting all properties.
function X2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to X2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function X3_Callback(hObject, eventdata, handles)
% hObject    handle to X3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of X3 as text
%        str2double(get(hObject,'String')) returns contents of X3 as a double


% --- Executes during object creation, after setting all properties.
function X3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to X3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function X4_Callback(hObject, eventdata, handles)
% hObject    handle to X4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of X4 as text
%        str2double(get(hObject,'String')) returns contents of X4 as a double


% --- Executes during object creation, after setting all properties.
function X4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to X4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function X5_Callback(hObject, eventdata, handles)
% hObject    handle to X5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of X5 as text
%        str2double(get(hObject,'String')) returns contents of X5 as a double


% --- Executes during object creation, after setting all properties.
function X5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to X5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function X6_Callback(hObject, eventdata, handles)
% hObject    handle to X6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of X6 as text
%        str2double(get(hObject,'String')) returns contents of X6 as a double


% --- Executes during object creation, after setting all properties.
function X6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to X6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function L_1_Callback(hObject, eventdata, handles)
% hObject    handle to L_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of L_1 as text
%        str2double(get(hObject,'String')) returns contents of L_1 as a double


% --- Executes during object creation, after setting all properties.
function L_1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to L_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function L_2_Callback(hObject, eventdata, handles)
% hObject    handle to L_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of L_2 as text
%        str2double(get(hObject,'String')) returns contents of L_2 as a double


% --- Executes during object creation, after setting all properties.
function L_2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to L_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit53_Callback(hObject, eventdata, handles)
% hObject    handle to edit53 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit53 as text
%        str2double(get(hObject,'String')) returns contents of edit53 as a double


% --- Executes during object creation, after setting all properties.
function edit53_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit53 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function L_4_Callback(hObject, eventdata, handles)
% hObject    handle to L_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of L_4 as text
%        str2double(get(hObject,'String')) returns contents of L_4 as a double


% --- Executes during object creation, after setting all properties.
function L_4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to L_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function L_5_Callback(hObject, eventdata, handles)
% hObject    handle to L_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of L_5 as text
%        str2double(get(hObject,'String')) returns contents of L_5 as a double


% --- Executes during object creation, after setting all properties.
function L_5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to L_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function L_6_Callback(hObject, eventdata, handles)
% hObject    handle to L_6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of L_6 as text
%        str2double(get(hObject,'String')) returns contents of L_6 as a double


% --- Executes during object creation, after setting all properties.
function L_6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to L_6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function theta_5_Callback(hObject, eventdata, handles)
% hObject    handle to theta_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of theta_5 as text
%        str2double(get(hObject,'String')) returns contents of theta_5 as a double


% --- Executes during object creation, after setting all properties.
function theta_5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to theta_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Z0_Callback(hObject, eventdata, handles)
% hObject    handle to Z0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Z0 as text
%        str2double(get(hObject,'String')) returns contents of Z0 as a double


% --- Executes during object creation, after setting all properties.
function Z0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Z0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Y0_Callback(hObject, eventdata, handles)
% hObject    handle to Y0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Y0 as text
%        str2double(get(hObject,'String')) returns contents of Y0 as a double


% --- Executes during object creation, after setting all properties.
function Y0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Y0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function X0_Callback(hObject, eventdata, handles)
% hObject    handle to X0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of X0 as text
%        str2double(get(hObject,'String')) returns contents of X0 as a double


% --- Executes during object creation, after setting all properties.
function X0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to X0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in a_11.
function a_11_Callback(hObject, eventdata, handles)
% hObject    handle to a_11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns a_11 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from a_11


% --- Executes during object creation, after setting all properties.
function a_11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to a_11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on key press with focus on a_11 and none of its controls.
function a_11_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to a_11 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)



function PR_Callback(hObject, eventdata, handles)
% hObject    handle to a_11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of a_11 as text
%        str2double(get(hObject,'String')) returns contents of a_11 as a double


% --- Executes during object creation, after setting all properties.
function PR_CreateFcn(hObject, eventdata, handles)
% hObject    handle to a_11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function a_22_Callback(hObject, eventdata, handles)
% hObject    handle to a_22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of a_22 as text
%        str2double(get(hObject,'String')) returns contents of a_22 as a double


% --- Executes during object creation, after setting all properties.
function a_22_CreateFcn(hObject, eventdata, handles)
% hObject    handle to a_22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function a_33_Callback(hObject, eventdata, handles)
% hObject    handle to a_33 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of a_33 as text
%        str2double(get(hObject,'String')) returns contents of a_33 as a double


% --- Executes during object creation, after setting all properties.
function a_33_CreateFcn(hObject, eventdata, handles)
% hObject    handle to a_33 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function a_44_Callback(hObject, eventdata, handles)
% hObject    handle to a_44 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of a_44 as text
%        str2double(get(hObject,'String')) returns contents of a_44 as a double


% --- Executes during object creation, after setting all properties.
function a_44_CreateFcn(hObject, eventdata, handles)
% hObject    handle to a_44 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function a_55_Callback(hObject, eventdata, handles)
% hObject    handle to a_55 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of a_55 as text
%        str2double(get(hObject,'String')) returns contents of a_55 as a double


% --- Executes during object creation, after setting all properties.
function a_55_CreateFcn(hObject, eventdata, handles)
% hObject    handle to a_55 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function a_66_Callback(hObject, eventdata, handles)
% hObject    handle to a_66 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of a_66 as text
%        str2double(get(hObject,'String')) returns contents of a_66 as a double


% --- Executes during object creation, after setting all properties.
function a_66_CreateFcn(hObject, eventdata, handles)
% hObject    handle to a_66 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
%% 


% --- Executes when uipanel2 is resized.
function uipanel2_SizeChangedFcn(hObject, eventdata, handles)
% hObject    handle to uipanel2 (see GCBO)
% eventdatat  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Inverse_Kinematics_plot.
function Inverse_Kinematics_plot_Callback(hObject, eventdata, handles)
% hObject    handle to Inverse_Kinematics_plot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Assigning Theta
%Th_1 = str2double(handles.theta_1.String);
Th_2 = str2double(handles.theta_2.String);
% Assigning d
d_1 = str2double(handles.d_1.String);
%d_2 = str2double(handles.d_2.String);

% Assigning a
a_1 = str2double(handles.a_1.String);
a_2 = str2double(handles.a_2.String);


% Assigning alpha
al_1 = str2double(handles.alpha_1.String);
al_2 = str2double(handles.alpha_2.String);


al_1=al_1*(pi/180);
al_2=al_2*(pi/180);

Th_2=Th_2*(pi/180);


%IK2FK
Y2 = str2double(handles.Y2.String);
X2 = str2double(handles.X2.String);
Th_1 = atan2(Y2,X2);
d_2 = sqrt((X2^2)+(Y2^2));

%FK_plot
FK_plot3D(Th_1, Th_2, a_1, a_2, d_1, d_2, al_1, al_2);

%Assigning Values
[T00,T01,T12]=forwardKinematics(Th_1,d_1,a_1,al_1,Th_2,d_2,a_2,al_2);

Etip = T00*T01*T12;
handles.X0.String = num2str((T00(1,4)));handles.Y0.String = num2str((T00(2,4)));handles.Z0.String = num2str((T00(3,4)));
handles.X1.String = num2str((T01(1,4)));handles.Y1.String = num2str((T01(2,4)));handles.Z1.String = num2str((T01(3,4)));
%handles.X2.String = num2str((Etip(1,4)));handles.Y2.String = num2str((Etip(2,4)));handles.Z2.String = num2str((Etip(3,4)));
handles.theta_1.String = num2str(Th_1*(180/pi));handles.d_2.String = num2str(d_2);
