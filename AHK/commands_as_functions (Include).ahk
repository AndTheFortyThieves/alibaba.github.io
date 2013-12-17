;------------------------------------------------------------------------------
   lib:			Commands As Functions (Include)
   author:		Alibaba
   standard lib
   compatible:		no (use #Include)
   info:		- generated with autohotkey
			- contains 177 functions (in alphabetical order)
;------------------------------------------------------------------------------

AutoTrim(On_or_Off="")
{
	AutoTrim, %On_or_Off%
	Return Errorlevel
}
BlockInput(Mode="")
{
	BlockInput, %Mode%
	Return Errorlevel
}
Click(x="", y="")
{
	Click, %x%, %y%
	Return Errorlevel
}
ClipWait(Seconds="", 1="")
{
	ClipWait, %Seconds%, %1%
	Return Errorlevel
}
Control(Cmd="", Value="", Control="", WinTitle="", WinText="", ExcludeTitle="", ExcludeText="")
{
	Control, %Cmd%, %Value%, %Control%, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
	Return Errorlevel
}
ControlClick(Control_or_Pos="", WinTitle="", WinText="", WhichButton="", ClickCount="", Options="", ExcludeTitle="", ExcludeText="")
{
	ControlClick, %Control_or_Pos%, %WinTitle%, %WinText%, %WhichButton%, %ClickCount%, %Options%, %ExcludeTitle%, %ExcludeText%
	Return Errorlevel
}
ControlFocus(Control="", WinTitle="", WinText="", ExcludeTitle="", ExcludeText="")
{
	ControlFocus, %Control%, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
	Return Errorlevel
}
ControlMove(Control="", X="", Y="", Width="", Height="", WinTitle="", WinText="", ExcludeTitle="", ExcludeText="")
{
	ControlMove, %Control%, %X%, %Y%, %Width%, %Height%, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
	Return Errorlevel
}
ControlSend(Control="", Keys="", WinTitle="", WinText="", ExcludeTitle="", ExcludeText="")
{
	ControlSend, %Control%, %Keys%, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
	Return Errorlevel
}
ControlSendRaw(Control="", Keys="", WinTitle="", WinText="", ExcludeTitle="", ExcludeText="")
{
	ControlSendRaw, %Control%, %Keys%, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
	Return Errorlevel
}
ControlSetText(Control="", NewText="", WinTitle="", WinText="", ExcludeTitle="", ExcludeText="")
{
	ControlSetText, %Control%, %NewText%, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
	Return Errorlevel
}
CoordMode(ToolTip_or_Pixel_or_Mouse_or_Caret_or_Menu="", Screen_or_Relative="")
{
	CoordMode, %ToolTip_or_Pixel_or_Mouse_or_Caret_or_Menu%, %Screen_or_Relative%
	Return Errorlevel
}
Critical(Off_or_Integer="")
{
	Critical, %Off_or_Integer%
	Return Errorlevel
}
DetectHiddenText(On_or_Off="")
{
	DetectHiddenText, %On_or_Off%
	Return Errorlevel
}
DetectHiddenWindows(On_or_Off="")
{
	DetectHiddenWindows, %On_or_Off%
	Return Errorlevel
}
Drive(Sub_command="", Drive="", Value="")
{
	Drive, %Sub_command%, %Drive%, %Value%
	Return Errorlevel
}
Edit()
{
	Edit
	Return Errorlevel
}
EnvAdd(Var="", Value="", TimeUnits="")
{
	EnvAdd, %Var%, %Value%, %TimeUnits%
	Return Errorlevel
}
EnvDiv(Var="", Value="")
{
	EnvDiv, %Var%, %Value%
	Return Errorlevel
}
EnvMult(Var="", Value="")
{
	EnvMult, %Var%, %Value%
	Return Errorlevel
}
EnvSub(Var="", Value="", TimeUnits="")
{
	EnvSub, %Var%, %Value%, %TimeUnits%
	Return Errorlevel
}
EnvUpdate()
{
	EnvUpdate
	Return Errorlevel
}
Exit(ExitCode="")
{
	Exit, %ExitCode%
	Return Errorlevel
}
ExitApp(ExitCode="")
{
	ExitApp, %ExitCode%
	Return Errorlevel
}
FileAppend(Text="", Filename="")
{
	FileAppend, %Text%, %Filename%
	Return Errorlevel
}
FileCopy(SourcePattern="", DestPattern="", Flag="")
{
	FileCopy, %SourcePattern%, %DestPattern%, %Flag%
	Return Errorlevel
}
FileCopyDir(Source="", Dest="", Flag="")
{
	FileCopyDir, %Source%, %Dest%, %Flag%
	Return Errorlevel
}
FileCreateDir(DirName="")
{
	FileCreateDir, %DirName%
	Return Errorlevel
}
FileCreateShortcut(Target="", LinkFile="", WorkingDir="", Args="", Description="", IconFile="", ShortcutKey="", IconNumber="", RunState="")
{
	FileCreateShortcut, %Target%, %LinkFile%, %WorkingDir%, %Args%, %Description%, %IconFile%, %ShortcutKey%, %IconNumber%, %RunState%
	Return Errorlevel
}
FileDelete(FilePattern="")
{
	FileDelete, %FilePattern%
	Return Errorlevel
}
FileMove(SourcePattern="", DestPattern="", Flag="")
{
	FileMove, %SourcePattern%, %DestPattern%, %Flag%
	Return Errorlevel
}
FileMoveDir(Source="", Dest="", Flag="")
{
	FileMoveDir, %Source%, %Dest%, %Flag%
	Return Errorlevel
}
FileRecycle(FilePattern="")
{
	FileRecycle, %FilePattern%
	Return Errorlevel
}
FileRecycleEmpty(DriveLetter="")
{
	FileRecycleEmpty, %DriveLetter%
	Return Errorlevel
}
FileRemoveDir(DirName="", Recurse="")
{
	FileRemoveDir, %DirName%, %Recurse%
	Return Errorlevel
}
FileSetAttrib(Attributes="", FilePattern="", OperateOnFolders="", Recurse="")
{
	FileSetAttrib, %Attributes%, %FilePattern%, %OperateOnFolders%, %Recurse%
	Return Errorlevel
}
FileSetTime(YYYYMMDDHH24MISS="", FilePattern="", WhichTime="", OperateOnFolders="", Recurse="")
{
	FileSetTime, %YYYYMMDDHH24MISS%, %FilePattern%, %WhichTime%, %OperateOnFolders%, %Recurse%
	Return Errorlevel
}
Gosub(Label="")
{
	Gosub, %Label%
	Return Errorlevel
}
Goto(Label="")
{
	Goto, %Label%
	Return Errorlevel
}
GroupActivate(GroupName="", R="")
{
	GroupActivate, %GroupName%, %R%
	Return Errorlevel
}
GroupAdd(GroupName="", WinTitle="", WinText="", Label="", ExcludeTitle="", ExcludeText="")
{
	GroupAdd, %GroupName%, %WinTitle%, %WinText%, %Label%, %ExcludeTitle%, %ExcludeText%
	Return Errorlevel
}
GroupClose(GroupName="", A_or_R="")
{
	GroupClose, %GroupName%, %A_or_R%
	Return Errorlevel
}
GroupDeactivate(GroupName="", R="")
{
	GroupDeactivate, %GroupName%, %R%
	Return Errorlevel
}
Gui(Sub_command="", Param2="", Param3="", Param4="")
{
	Gui, %Sub_command%, %Param2%, %Param3%, %Param4%
	Return Errorlevel
}
GuiControl(Sub_command="", ControlID="", Param3="")
{
	GuiControl, %Sub_command%, %ControlID%, %Param3%
	Return Errorlevel
}
Hotkey(TastenName="", Label="", Optionen="")
{
	Hotkey, %TastenName%, %Label%, %Optionen%
	Return Errorlevel
}
IniDelete(Filename="", Section="", Key="")
{
	IniDelete, %Filename%, %Section%, %Key%
	Return Errorlevel
}
IniWrite(Value="", Filename="", Section="", Key="")
{
	IniWrite, %Value%, %Filename%, %Section%, %Key%
	Return Errorlevel
}
KeyHistory()
{
	KeyHistory
	Return Errorlevel
}
KeyWait(KeyName="", Options="")
{
	KeyWait, %KeyName%, %Options%
	Return Errorlevel
}
ListHotkeys()
{
	ListHotkeys
	Return Errorlevel
}
ListLines()
{
	ListLines
	Return Errorlevel
}
ListVars()
{
	ListVars
	Return Errorlevel
}
Menu(MenuName="", Cmd="", P3="", P4="", P5="")
{
	Menu, %MenuName%, %Cmd%, %P3%, %P4%, %P5%
	Return Errorlevel
}
MouseClick(WhichButton="", X="", Y="", ClickCount="", Speed="", D_or_U="", R="")
{
	MouseClick, %WhichButton%, %X%, %Y%, %ClickCount%, %Speed%, %D_or_U%, %R%
	Return Errorlevel
}
MouseClickDrag(WhichButton="", X1="", Y1="", X2="", Y2="", Speed="", R="")
{
	MouseClickDrag, %WhichButton%, %X1%, %Y1%, %X2%, %Y2%, %Speed%, %R%
	Return Errorlevel
}
MouseMove(X="", Y="", Speed="", R="")
{
	MouseMove, %X%, %Y%, %Speed%, %R%
	Return Errorlevel
}
MsgBox(Options="", Title="", Text="", Timeout="")
{
	If (Title = "" and Text = "" and Timeout = "")
		MsgBox %Options%
	Else
		MsgBox, %Options%, %Title%, %Text%, %Timeout%
	Return Errorlevel
}
OnExit(Label="")
{
	OnExit, %Label%
	Return Errorlevel
}
OutputDebug(Text="")
{
	OutputDebug, %Text%
	Return Errorlevel
}
Pause(On_or_Off_or_Toggle="", OperateOnUnderlyingThread="")
{
	Pause, %On_or_Off_or_Toggle%, %OperateOnUnderlyingThread%
	Return Errorlevel
}
PostMessage(Msg="", wParam="", lParam="", Control="", WinTitle="", WinText="", ExcludeTitle="", ExcludeText="")
{
	PostMessage, %Msg%, %wParam%, %lParam%, %Control%, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
	Return Errorlevel
}
SendMessage(Msg="", wParam="", lParam="", Control="", WinTitle="", WinText="", ExcludeTitle="", ExcludeText="")
{
	SendMessage, %Msg%, %wParam%, %lParam%, %Control%, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
	Return Errorlevel
}
Process(Cmd="", PID_or_Name="", Param3="")
{
	Process, %Cmd%, %PID_or_Name%, %Param3%
	Return Errorlevel
}
Progress(ProgressParam1="", SubText="", MainText="", WinTitle="", FontName="")
{
	Progress, %ProgressParam1%, %SubText%, %MainText%, %WinTitle%, %FontName%
	Return Errorlevel
}
RegDelete(RootKey="", SubKey="", ValueName="")
{
	RegDelete, %RootKey%, %SubKey%, %ValueName%
	Return Errorlevel
}
RegWrite(ValueType="", RootKey="", SubKey="", ValueName="", Value="")
{
	RegWrite, %ValueType%, %RootKey%, %SubKey%, %ValueName%, %Value%
	Return Errorlevel
}
Reload()
{
	Reload
	Return Errorlevel
}
Run(Target="", WorkingDir="", Max_or_Min_or_Hide_or_UseErrorLevel="", OutputVarPID="")
{
	Run, %Target%, %WorkingDir%, %Max_or_Min_or_Hide_or_UseErrorLevel%, %OutputVarPID%
	Return Errorlevel
}
RunAs(User="", Password="", Domain="")
{
	RunAs, %User%, %Password%, %Domain%
	Return Errorlevel
}
RunWait(Target="", WorkingDir="", Max_or_Min_or_Hide_or_UseErrorLevel="", OutputVarPID="")
{
	RunWait, %Target%, %WorkingDir%, %Max_or_Min_or_Hide_or_UseErrorLevel%, %OutputVarPID%
	Return Errorlevel
}
Send(Keys="")
{
	Send, %Keys%
	Return Errorlevel
}
SendRaw(Keys="")
{
	SendRaw, %Keys%
	Return Errorlevel
}
SendInput(Keys="")
{
	SendInput, %Keys%
	Return Errorlevel
}
SendPlay(Keys="")
{
	SendPlay, %Keys%
	Return Errorlevel
}
SendEvent(Keys="")
{
	SendEvent, %Keys%
	Return Errorlevel
}
SendMode(Input_or_Play_or_Event_or_InputThenPlay="")
{
	SendMode, %Input_or_Play_or_Event_or_InputThenPlay%
	Return Errorlevel
}
SetBatchLines(LineCount="")
{
	SetBatchLines, %LineCount%
	Return Errorlevel
}
SetCapsLockState(State="")
{
	SetCapsLockState, %State%
	Return Errorlevel
}
SetControlDelay(Delay="")
{
	SetControlDelay, %Delay%
	Return Errorlevel
}
SetDefaultMouseSpeed(Speed="")
{
	SetDefaultMouseSpeed, %Speed%
	Return Errorlevel
}
SetEnv(Var="", Value="")
{
	SetEnv, %Var%, %Value%
	Return Errorlevel
}
SetFormat(NumberType="", Format="")
{
	SetFormat, %NumberType%, %Format%
	Return Errorlevel
}
SetKeyDelay(Delay="", PressDuration="", Play="")
{
	SetKeyDelay, %Delay%, %PressDuration%, %Play%
	Return Errorlevel
}
SetMouseDelay(Delay="", Play="")
{
	SetMouseDelay, %Delay%, %Play%
	Return Errorlevel
}
SetNumLockState(State="")
{
	SetNumLockState, %State%
	Return Errorlevel
}
SetScrollLockState(State="")
{
	SetScrollLockState, %State%
	Return Errorlevel
}
SetStoreCapslockMode(On_or_Off="")
{
	SetStoreCapslockMode, %On_or_Off%
	Return Errorlevel
}
SetTimer(Label="", Period_or_On_or_Off="", Priority="")
{
	SetTimer, %Label%, %Period_or_On_or_Off%, %Priority%
	Return Errorlevel
}
SetTitleMatchMode(MatchMode="")
{
	SetTitleMatchMode, %MatchMode%
	Return Errorlevel
}
SetWinDelay(Delay="")
{
	SetWinDelay, %Delay%
	Return Errorlevel
}
SetWorkingDir(DirName="")
{
	SetWorkingDir, %DirName%
	Return Errorlevel
}
Shutdown(Code="")
{
	Shutdown, %Code%
	Return Errorlevel
}
Sleep(DelayInMilliseconds="")
{
	Sleep, %DelayInMilliseconds%
	Return Errorlevel
}
Sort(VarName="", Options="")
{
	global
	Sort, %VarName%, %Options%
	Return Errorlevel
}
SoundBeep(Frequency="", Duration="")
{
	SoundBeep, %Frequency%, %Duration%
	Return Errorlevel
}
SoundPlay(Filename="", wait="")
{
	SoundPlay, %Filename%, %wait%
	Return Errorlevel
}
SoundSet(NewSetting="", ComponentType="", ControlType="", DeviceNumber="")
{
	SoundSet, %NewSetting%, %ComponentType%, %ControlType%, %DeviceNumber%
	Return Errorlevel
}
SoundSetWaveVolume(Percent="", DeviceNumber="")
{
	SoundSetWaveVolume, %Percent%, %DeviceNumber%
	Return Errorlevel
}
SplashImage(ImageFile="", Options="", SubText="", MainText="", WinTitle="", FontName="")
{
	SplashImage, %ImageFile%, %Options%, %SubText%, %MainText%, %WinTitle%, %FontName%
	Return Errorlevel
}
SplashTextOff()
{
	SplashTextOff
	Return Errorlevel
}
SplashTextOn(Width="", Height="", Title="", Text="")
{
	SplashTextOn, %Width%, %Height%, %Title%, %Text%
	Return Errorlevel
}
StatusBarWait(BarText="", Seconds="", Part="", WinTitle="", WinText="", Interval="", ExcludeTitle="", ExcludeText="")
{
	StatusBarWait, %BarText%, %Seconds%, %Part%, %WinTitle%, %WinText%, %Interval%, %ExcludeTitle%, %ExcludeText%
	Return Errorlevel
}
StringCaseSense(On_or_Off_or_Locale="")
{
	StringCaseSense, %On_or_Off_or_Locale%
	Return Errorlevel
}
Suspend(On_or_Off_or_Toggle_or_Permit="")
{
	Suspend, %On_or_Off_or_Toggle_or_Permit%
	Return Errorlevel
}
Thread(p1="", p2="", p3="")
{
	Thread %p1%,%p2%,%p3%
	Return Errorlevel
}
ToolTip(Text="", X="", Y="", WhichToolTip="")
{
	If (X = "" and Y = "" and WhichToolTip = "")
		ToolTip, %Text%
	Else
		ToolTip, %Text%, %X%, %Y%, %WhichToolTip%
	Return Errorlevel
}
TrayTip(Title="", Text="", Seconds="", Options="")
{
	TrayTip, %Title%, %Text%, %Seconds%, %Options%
	Return Errorlevel
}
UrlDownloadToFile(URL="", Filename="")
{
	UrlDownloadToFile, %URL%, %Filename%
	Return Errorlevel
}
WinActivate(WinTitle="", WinText="", ExcludeTitle="", ExcludeText="")
{
	WinActivate, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
	Return Errorlevel
}
WinActivateBottom(WinTitle="", WinText="", ExcludeTitle="", ExcludeText="")
{
	WinActivateBottom, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
	Return Errorlevel
}
WinClose(WinTitle="", WinText="", SecondsToWait="", ExcludeTitle="", ExcludeText="")
{
	WinClose, %WinTitle%, %WinText%, %SecondsToWait%, %ExcludeTitle%, %ExcludeText%
	Return Errorlevel
}
WinHide(WinTitle="", WinText="", ExcludeTitle="", ExcludeText="")
{
	WinHide, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
	Return Errorlevel
}
WinKill(WinTitle="", WinText="", SecondsToWait="", ExcludeTitle="", ExcludeText="")
{
	WinKill, %WinTitle%, %WinText%, %SecondsToWait%, %ExcludeTitle%, %ExcludeText%
	Return Errorlevel
}
WinMaximize(WinTitle="", WinText="", ExcludeTitle="", ExcludeText="")
{
	WinMaximize, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
	Return Errorlevel
}
WinMenuSelectItem(WinTitle="", WinText="", Menu="", SubMenu1="", SubMenu2="", SubMenu3="", SubMenu4="", SubMenu5="", SubMenu6="", ExcludeTitle="", ExcludeText="")
{
	WinMenuSelectItem, %WinTitle%, %WinText%, %Menu%, %SubMenu1%, %SubMenu2%, %SubMenu3%, %SubMenu4%, %SubMenu5%, %SubMenu6%, %ExcludeTitle%, %ExcludeText%
	Return Errorlevel
}
WinMinimize(WinTitle="", WinText="", ExcludeTitle="", ExcludeText="")
{
	WinMinimize, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
	Return Errorlevel
}
WinMinimizeAll()
{
	WinMinimizeAll
	Return Errorlevel
}
WinMinimizeAllUndo()
{
	WinMinimizeAllUndo
	Return Errorlevel
}
WinMove(WinTitle="", WinText="", X="", Y="", Width="", Height="", ExcludeTitle="", ExcludeText="")
{
	WinMove, %WinTitle%, %WinText%, %X%, %Y%, %Width%, %Height%, %ExcludeTitle%, %ExcludeText%
	Return Errorlevel
}
WinRestore(WinTitle="", WinText="", ExcludeTitle="", ExcludeText="")
{
	WinRestore, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
	Return Errorlevel
}
WinSet(Attribute="", Value="", WinTitle="", WinText="", ExcludeTitle="", ExcludeText="")
{
	WinSet, %Attribute%, %Value%, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
	Return Errorlevel
}
WinSetTitle(WinTitle="", WinText="", NewTitle="", ExcludeTitle="", ExcludeText="")
{
	WinSetTitle, %WinTitle%, %WinText%, %NewTitle%, %ExcludeTitle%, %ExcludeText%
	Return Errorlevel
}
WinShow(WinTitle="", WinText="", ExcludeTitle="", ExcludeText="")
{
	WinShow, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
	Return Errorlevel
}
WinWait(WinTitle="", WinText="", Seconds="", ExcludeTitle="", ExcludeText="")
{
	WinWait, %WinTitle%, %WinText%, %Seconds%, %ExcludeTitle%, %ExcludeText%
	Return Errorlevel
}
WinWaitActive(WinTitle="", WinText="", Seconds="", ExcludeTitle="", ExcludeText="")
{
	WinWaitActive, %WinTitle%, %WinText%, %Seconds%, %ExcludeTitle%, %ExcludeText%
	Return Errorlevel
}
WinWaitClose(WinTitle="", WinText="", Seconds="", ExcludeTitle="", ExcludeText="")
{
	WinWaitClose, %WinTitle%, %WinText%, %Seconds%, %ExcludeTitle%, %ExcludeText%
	Return Errorlevel
}
WinWaitNotActive(WinTitle="", WinText="", Seconds="", ExcludeTitle="", ExcludeText="")
{
	WinWaitNotActive, %WinTitle%, %WinText%, %Seconds%, %ExcludeTitle%, %ExcludeText%
	Return Errorlevel
}
ControlGet(Cmd="", Value="", Control="", WinTitle="", WinText="", ExcludeTitle="", ExcludeText="")
{
	ControlGet, out, %Cmd%, %Value%, %Control%, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
	Return out
}
ControlGetFocus(WinTitle="", WinText="", ExcludeTitle="", ExcludeText="")
{
	ControlGetFocus, out, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
	Return out
}
ControlGetText(Control="", WinTitle="", WinText="", ExcludeTitle="", ExcludeText="")
{
	ControlGetText, out, %Control%, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
	Return out
}
DriveGet(Cmd="", Value="")
{
	DriveGet, out, %Cmd%, %Value%
	Return out
}
DriveSpaceFree(Path="")
{
	DriveSpaceFree, out, %Path%
	Return out
}
EnvGet(EnvVarName="")
{
	EnvGet, out, %EnvVarName%
	Return out
}
FileGetAttrib(Filename="")
{
	FileGetAttrib, out, %Filename%
	Return out
}
FileGetSize(Filename="", Units="")
{
	FileGetSize, out, %Filename%, %Units%
	Return out
}
FileGetTime(Filename="", WhichTime="")
{
	FileGetTime, out, %Filename%, %WhichTime%
	Return out
}
FileGetVersion(Filename="")
{
	FileGetVersion, out, %Filename%
	Return out
}
FileRead(Filename="")
{
	FileRead, out, %Filename%
	Return out
}
FileReadLine(Filename="", LineNum="")
{
	FileReadLine, out, %Filename%, %LineNum%
	Return out
}
FileSelectFile(Options="", Path="", Prompt="", Filter="")
{
	FileSelectFile, out, %Options%, %Path%, %Prompt%, %Filter%
	Return out
}
FileSelectFolder(StartingFolder="", Options="", Prompt="")
{
	FileSelectFolder, out, %StartingFolder%, %Options%, %Prompt%
	Return out
}
FormatTime(YYYYMMDDHH24MISS="", Format="")
{
	FormatTime, out, %YYYYMMDDHH24MISS%, %Format%
	Return out
}
GetKeyState(KeyName="", Mode="")
{
	GetKeyState, out, %KeyName%, %Mode%
	Return out
}
GuiControlGet(Sub_command="", ControlID="", Param4="")
{
	GuiControlGet, out, %Sub_command%, %ControlID%, %Param4%
	Return out
}
IniRead(Filename="", Section="", Key="", Default="")
{
	
	IniRead, out, %Filename%, %Section%, %Key%, %Default%
	Return out
}
Input(Options="", EndKeys="", MatchList="")
{
	Input, out, %Options%, %EndKeys%, %MatchList%
	Return out
}
InputBox(Title="", Prompt="", HIDE="", Width="", Height="", X="", Y="", Font="", Timeout="", Default="")
{
	InputBox, out, %Title%, %Prompt%, %HIDE%, %Width%, %Height%, %X%, %Y%,, %Timeout%, %Default%
	Return out
}
IsType(var_name, type)
{
	global
	if %var_name% is %type%
		Return 1
	Return 0
}
IsBetween(var_name, min, max)
{
	global
	if %var_name% between %min% and %max%
		Return 1
	Return 0
}
PixelGetColor(X="", Y="", Alt_or_Slow_or_RGB="")
{
	PixelGetColor, out, %X%, %Y%, %Alt_or_Slow_or_RGB%
	Return out
}
Random(Min="", Max="")
{
	Random, out, %Min%, %Max%
	Return out
}
RegRead(RootKey="", SubKey="", ValueName="") {
	RegRead, out, %RootKey%, %SubKey%, %ValueName%
	if Errorlevel
		Throw { what: A_ThisFunc, file: A_LineFile, message: "Error in " . A_ThisFunc . "() !", extra: "Errorlevel was set to " . Errorlevel }
	Return out
}
SoundGet(ComponentType="", ControlType="", DeviceNumber="")
{
	SoundGet, out, %ComponentType%, %ControlType%, %DeviceNumber%
	Return out
}
SoundGetWaveVolume(DeviceNumber="")
{
	
	SoundGetWaveVolume, out, %DeviceNumber%
	Return out
}
StatusBarGetText(Part="", WinTitle="", WinText="", ExcludeTitle="", ExcludeText="")
{
	StatusBarGetText, out, %Part#%, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
	Return out
}
StringLower(InputVar="", T="")
{
	StringLower, out, InputVar, %T%
	Return out
}
StringReplace(InputVar="", SearchText="", ReplaceText="", ReplaceAll="")
{
	StringReplace, out, InputVar, %SearchText%, %ReplaceText%, %ReplaceAll%
	Return out
}
StringTrimLeft(InputVar="", Count="")
{
	StringTrimLeft, out, InputVar, %Count%
	Return out
}
StringTrimRight(InputVar="", Count="")
{
	StringTrimRight, out, InputVar, %Count%
	Return out
}
StringUpper(InputVar="", T="")
{
	StringUpper, out, InputVar, %T%
	Return out
}
SysGet(Sub_command="", Param3="")
{
	SysGet, out, %Sub_command%, %Param3%
	Return out
}
Transform(Cmd="", Value1="", Value2="")
{
	Transform, out, %Cmd%, %Value1%, %Value2%
	Return out
}
WinGetActiveTitle()
{
	
	WinGetActiveTitle, out
	Return out
}
WinGetClass(WinTitle="", WinText="", ExcludeTitle="", ExcludeText="")
{
	WinGetClass, out, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
	Return out
}
WinGet(Cmd="", WinTitle="", WinText="", ExcludeTitle="", ExcludeText="")
{
	
	WinGet, out, %Cmd%, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
	Return out
}
WinGetText(WinTitle="", WinText="", ExcludeTitle="", ExcludeText="")
{
	WinGetText, out, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
	Return out
}
WinGetTitle(WinTitle="", WinText="", ExcludeTitle="", ExcludeText="")
{
	
	WinGetTitle, out, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
	Return out
}
ControlGetPos(Control="", WinTitle="", WinText="", ExcludeTitle="", ExcludeText="")
{
	out := Object()
	ControlGetPos, X, Y, Width, Height, %Control%, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
	out["X"] := X
	out["Y"] := Y
	out["Width"] := Width
	out["Height"] := Height
	out["Errorlevel"] := Errorlevel
	Return out
}
FileGetShortcut(LinkFile="")
{
	out := Object()
	FileGetShortcut, LinkFile, Target, Dir, Args, Description, Icon, IconNum, RunState
	out["LinkFile"] := LinkFile
	out["Target"] := Target
	out["Dir"] := Dir
	out["Args"] := Args
	out["Description"] := Description
	out["Icon"] := Icon
	out["IconNum"] := IconNum
	out["RunState"] := RunState
	out["Errorlevel"] := Errorlevel
	Return out
}
ImageSearch(X1="", Y1="", X2="", Y2="", ImageFile="")
{
	out := Object()
	ImageSearch, X, Y, %X1%, %Y1%, %X2%, %Y2%, %ImageFile%
	out["X"] := X
	out["Y"] := Y
	out["Errorlevel"] := Errorlevel
	Return out
}
MouseGetPos(Mode="")
{
	out := object()
	MouseGetPos, X, Y, Win, Control, %Mode%
	out.X := X
	out.Y := Y
	out.Win := Win
	out.Control := Control
	out.Errorlevel := Errorlevel
	Return out
}
PixelSearch(X1="", Y1="", X2="", Y2="", ColorID="", Variation="", Fast_or_RGB="")
{
	out := Object()
	PixelSearch, X, Y, %X1%, %Y1%, %X2%, %Y2%, %ColorID%, %Variation%, %Fast_or_RGB%
	out["X"] := X
	out["Y"] := Y
	out["Errorlevel"] := Errorlevel
	Return out
}
SplitPath(InputVar="")
{
	out := Object()
	SplitPath, InputVar, FileName, Dir, Extension, NameNoExt, Drive
	out["FileName"] := FileName
	out["Dir"] := Dir
	out["Extension"] := Extension
	out["NameNoExt"] := NameNoExt
	out["Drive"] := Drive
	out["Errorlevel"] := Errorlevel
	Return out
}
StringSplit(InputVar="", Delimiters="", OmitChars="")
{
	realArray := Object()
	StringSplit, out, InputVar, %Delimiters%, %OmitChars%
	dyn := "out0"
	size := %dyn%
	loop, % size 
	{
		dyn := "out" . A_Index
		realArray.Insert(%dyn%)
	}
	realArray["Errorlevel"] := Errorlevel
	Return realArray
}
WinGetActiveStats()
{
	out := Object()
	WinGetActiveStats, Title, Width, Height, X, Y
	out["Title"] := Title
	out["Width"] := Width
	out["Height"] := Height
	out["X"] := X
	out["Y"] := Y
	out["Errorlevel"] := Errorlevel
	Return out
}
WinGetPos(WinTitle="", WinText="", ExcludeTitle="", ExcludeText="")
{
	out := Object()
	WinGetPos, X, Y, Width, Height, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
	out["X"] := X
	out["Y"] := Y
	out["Width"] := Width
	out["Height"] := Height
	out["Errorlevel"] := Errorlevel
	Return out
}