function varargout = Negatif_Citra(varargin)
% NEGATIF_CITRA MATLAB code for Negatif_Citra.fig
%      NEGATIF_CITRA, by itself, creates a new NEGATIF_CITRA or raises the existing
%      singleton*.
%
%      H = NEGATIF_CITRA returns the handle to a new NEGATIF_CITRA or the handle to
%      the existing singleton*.
%
%      NEGATIF_CITRA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NEGATIF_CITRA.M with the given input arguments.
%
%      NEGATIF_CITRA('Property','Value',...) creates a new NEGATIF_CITRA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Negatif_Citra_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Negatif_Citra_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Negatif_Citra

% Last Modified by GUIDE v2.5 30-Apr-2021 22:58:07

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Negatif_Citra_OpeningFcn, ...
                   'gui_OutputFcn',  @Negatif_Citra_OutputFcn, ...
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


% --- Executes just before Negatif_Citra is made visible.
function Negatif_Citra_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Negatif_Citra (see VARARGIN)

% Choose default command line output for Negatif_Citra
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Negatif_Citra wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Negatif_Citra_OutputFcn(hObject, eventdata, handles) 
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

handles.citraInput = citra;
guidata(hObject, handles);


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
negatif = handles.citraInput;
hasil = negatif;
[m,n] = size(negatif);
for x = 1:m
    for y = 1:n
        hasil(x,y) = 255 - negatif(x,y);
    end
end     
axes(handles.axes2);
imshow(hasil);
