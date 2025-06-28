function Record(new)
vobj = new;
vobj.TimeOut = Inf;
vobj.FrameGrabInterval = 1;
vobj.LoggingMode = 'disk&memory';
vobj.FramesPerTrigger = 1;
vobj.TriggerRepeat = Inf;
timenow = datestr(now,'hhMMss_ddmmyy');
v = VideoWriter(['newfile_', timenow,'.avi']);
v.Quality = 50;
v.FrameRate = 30;
vobj.DiskLogger = v;
vobj.SelectedSourceName = 'input1';
f = figure('Name', 'Video Recording Preview');
uicontrol('String', 'Rec Stop', 'Callback', 'close(gcf)');
vidRes = vobj.VideoResolution;
nBands = vobj.NumberOfBands;
hImage = image( zeros(vidRes(2), vidRes(1), nBands) );
preview(vobj, hImage);
tic
start(vobj)
uiwait(f)
stop(vobj)
elapsedTime = toc;
framesaq = vobj.FramesAcquired;
ActualFR = framesaq/elapsedTime;
delete(vobj);
 ChangeFrameRate(['newfile_', timenow,'.avi'], timenow, ActualFR)
end 
function ChangeFrameRate(Video, timestr, ActualFR)
vidObj = VideoReader(Video);
writerObj = VideoWriter(['ActualFR_', timestr, '.avi']);
writerObj.FrameRate = ActualFR;
open(writerObj);
while hasFrame(vidObj)
    vidFrame = readFrame(vidObj);
    writeVideo(writerObj, vidFrame)
    pause(1/vidObj.FrameRate);
end
close(writerObj);
end