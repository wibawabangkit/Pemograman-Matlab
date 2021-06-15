function varargout = Layer_RGB(varargin)
% LAYER_RGB MATLAB code for Layer_RGB.fig
%      LAYER_RGB, by itself, creates a new LAYER_RGB or raises the existing
%      singleton*.
%
%      H = LAYER_RGB returns the handle to a new LAYER_RGB or the handle to
%      the existing singleton*.
%
%      LAYER_RGB('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LAYER_RGB.M with the given input arguments.
%
%      LAYER_RGB('Property','Value',...) creates a new LAYER_RGB or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Layer_RGB_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Layer_RGB_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Layer_RGB

% Last Modified by GUIDE v2.5 17-May-2021 23:13:56

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Layer_RGB_OpeningFcn, ...
                   'gui_OutputFcn',  @Layer_RGB_OutputFcn, ...
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


% --- Executes just before Layer_RGB is made visible.
function Layer_RGB_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Layer_RGB (see VARARGIN)

% Choose default command line output for Layer_RGB
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Layer_RGB wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Layer_RGB_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[filename, pathname] = uigetfile({'*.jpg';'*.png';'*.*'});
citra = imread([pathname, filename]);
axes(handles.axes1);
imshow(citra);

% membuat objek global
handles.citraInput = citra;
guidata(hObject, handles);


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1

% panggil citra input
foto = handles.citraInput;
% pisahkan layer RGB
R = foto(:,:,1);
G = foto(:,:,2);
B = foto(:,:,3);
% gabung kembali layer RGB
Red = cat(3,R,G*0,B*0);
% tentukan tempat tampilan citra hasil
axes(handles.axes2);
% tampilkan citranya
imshow(Red);


% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2

foto = handles.citraInput;

R = foto(:,:,1);
G = foto(:,:,2);
B = foto(:,:,3);

Green = cat(3,R*0,G,B*0);
axes(handles.axes2);
imshow(Green);


% --- Executes on button press in radiobutton3.
function radiobutton3_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton3

foto = handles.citraInput;

R = foto(:,:,1);
G = foto(:,:,2);
B = foto(:,:,3);

Blue = cat(3,R*0,G*0,B);
axes(handles.axes2);
imshow(Blue);
