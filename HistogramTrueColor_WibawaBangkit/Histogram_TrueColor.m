function varargout = Histogram_TrueColor(varargin)
% HISTOGRAM_TRUECOLOR MATLAB code for Histogram_TrueColor.fig
%      HISTOGRAM_TRUECOLOR, by itself, creates a new HISTOGRAM_TRUECOLOR or raises the existing
%      singleton*.
%
%      H = HISTOGRAM_TRUECOLOR returns the handle to a new HISTOGRAM_TRUECOLOR or the handle to
%      the existing singleton*.
%
%      HISTOGRAM_TRUECOLOR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HISTOGRAM_TRUECOLOR.M with the given input arguments.
%
%      HISTOGRAM_TRUECOLOR('Property','Value',...) creates a new HISTOGRAM_TRUECOLOR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Histogram_TrueColor_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Histogram_TrueColor_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Histogram_TrueColor

% Last Modified by GUIDE v2.5 18-May-2021 01:05:20

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Histogram_TrueColor_OpeningFcn, ...
                   'gui_OutputFcn',  @Histogram_TrueColor_OutputFcn, ...
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


% --- Executes just before Histogram_TrueColor is made visible.
function Histogram_TrueColor_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Histogram_TrueColor (see VARARGIN)

% Choose default command line output for Histogram_TrueColor
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Histogram_TrueColor wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Histogram_TrueColor_OutputFcn(hObject, eventdata, handles) 
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
[filename, pathname] = uigetfile({'*.jpg';'*.jpeg';'*.png';'*.*'});
citra = imread([pathname, filename]);
axes(handles.axes1);
imshow(citra);

ket = imfinfo(fullfile(pathname, filename));
set(handles.text4, 'String', ket.ColorType);
handles.citraInput = citra;
guidata(hObject,handles);

cla(handles.axes2);



% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

InputCitra = handles.citraInput;
jenisCitra = get(handles.text4, 'String');
axes(handles.axes2);

if isequal(jenisCitra,'grayscale')
    histogram(InputCitra);
    grid on;
else
    red = InputCitra(:,:,1);
    green = InputCitra(:,:,2);
    blue = InputCitra(:,:,3);
    
    histogram(red, 'EdgeColor', 'R');
    hold on;
    grid on;
    histogram(green, 'EdgeColor', 'G');
    histogram(blue, 'EdgeColor', 'B');
end
