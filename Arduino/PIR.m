function varargout = PIR(varargin)
% PIR MATLAB code for PIR.fig
%      PIR, by itself, creates a new PIR or raises the existing
%      singleton*.
%
%      H = PIR returns the handle to a new PIR or the handle to
%      the existing singleton*.
%
%      PIR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PIR.M with the given input arguments.
%
%      PIR('Property','Value',...) creates a new PIR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before PIR_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to PIR_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help PIR

% Last Modified by GUIDE v2.5 24-Dec-2020 14:22:45

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @PIR_OpeningFcn, ...
                   'gui_OutputFcn',  @PIR_OutputFcn, ...
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


% --- Executes just before PIR is made visible.
function PIR_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to PIR (see VARARGIN)

% Choose default command line output for PIR
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes PIR wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = PIR_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
varargout{1} = handles.output;
handles.output=hObject;
global s;
handles.s=s;
handles.s=serial('COM4','BAUD',9600);
fopen(handles.s);
guidata(hObject,handles);

% --- Executes on button press in PIR1.
function PIR1_Callback(hObject, eventdata, handles)
% hObject    handle to PIR1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

fprintf(handles.s,1);
handles.output=hObject;
guidata(hObject,handles);
% --- Executes on button press in PIR0.
function PIR0_Callback(hObject, eventdata, handles)
% hObject    handle to PIR0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
fprintf(handles.s,2);
handles.output=hObject;
guidata(hObject,handles);