function varargout = Latihan1_GUI(varargin)
% LATIHAN1_GUI MATLAB code for Latihan1_GUI.fig
%      LATIHAN1_GUI, by itself, creates a new LATIHAN1_GUI or raises the existing
%      singleton*.
%
%      H = LATIHAN1_GUI returns the handle to a new LATIHAN1_GUI or the handle to
%      the existing singleton*.
%
%      LATIHAN1_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LATIHAN1_GUI.M with the given input arguments.
%
%      LATIHAN1_GUI('Property','Value',...) creates a new LATIHAN1_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Latihan1_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Latihan1_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Latihan1_GUI

% Last Modified by GUIDE v2.5 17-May-2021 23:24:20

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Latihan1_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @Latihan1_GUI_OutputFcn, ...
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


% --- Executes just before Latihan1_GUI is made visible.
function Latihan1_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Latihan1_GUI (see VARARGIN)

% Choose default command line output for Latihan1_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Latihan1_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Latihan1_GUI_OutputFcn(hObject, eventdata, handles) 
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


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = uigetfile({'*.jpg';'*.png';'*.*'});
citra = imread([pathname, filename]);
axes(handles.axes1);
imshow(citra);
