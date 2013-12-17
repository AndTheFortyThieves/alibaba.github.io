;------------------------------------------------------------------------------
   lib:			Commands As Functions
   author:		Alibaba
   standard lib
   compatible:		yes
   info:		- generated with autohotkey
			- contains 177 functions (in alphabetical order)
;------------------------------------------------------------------------------

Command_AutoTrim(On_or_Off="")
{
	AutoTrim, %On_or_Off%
	Return Errorlevel
}
Command_BlockInput(Mode="")
{
	BlockInput, %Mode%
	Return Errorlevel
}
Command_Click(x="", y="")
{
	Click, %x%, %y%
	Return Errorlevel
}
Command_ClipWait(Seconds="", 1="")
{
	ClipWait, %Seconds%, %1%
	Return Errorlevel
}
Command_Control(Cmd="", Value="", Control="", WinTitle="", WinText="", ExcludeTitle="", ExcludeText="")
{
	Control, %Cmd%, %Value%, %Control%, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
	Return Errorlevel
}
Command_ControlClick(Control_or_Pos="", WinTitle="", WinText="", WhichButton="", ClickCount="", Options="", ExcludeTitle="", ExcludeText="")
{
	ControlClick, %Control_or_Pos%, %WinTitle%, %WinText%, %WhichButton%, %ClickCount%, %Options%, %ExcludeTitle%, %ExcludeText%
	Return Errorlevel
}
Command_ControlFocus(Control="", WinTitle="", WinText="", ExcludeTitle="", ExcludeText="")
{
	ControlFocus, %Control%, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
	Return Errorlevel
}
Command_ControlMove(Control="", X="", Y="", Width="", Height="", WinTitle="", WinText="", ExcludeTitle="", ExcludeText="")
{
	ControlMove, %Control%, %X%, %Y%, %Width%, %Height%, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
	Return Errorlevel
}
Command_ControlSend(Control="", Keys="", WinTitle="", WinText="", ExcludeTitle="", ExcludeText="")
{
	ControlSend, %Control%, %Keys%, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
	Return Errorlevel
}
Command_ControlSendRaw(Control="", Keys="", WinTitle="", WinText="", ExcludeTitle="", ExcludeText="")
{
	ControlSendRaw, %Control%, %Keys%, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
	Return Errorlevel
}
Command_ControlSetText(Control="", NewText="", WinTitle="", WinText="", ExcludeTitle="", ExcludeText="")
{
	ControlSetText, %Control%, %NewText%, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
	Return Errorlevel
}
Command_CoordMode(ToolTip_or_Pixel_or_Mouse_or_Caret_or_Menu="", Screen_or_Relative="")
{
	CoordMode, %ToolTip_or_Pixel_or_Mouse_or_Caret_or_Menu%, %Screen_or_Relative%
	Return Errorlevel
}
Command_Critical(Off_or_Integer="")
{
	Critical, %Off_or_Integer%
	Return Errorlevel
}
Command_DetectHiddenText(On_or_Off="")
{
	DetectHiddenText, %On_or_Off%
	Return Errorlevel
}
Command_DetectHiddenWindows(On_or_Off="")
{
	DetectHiddenWindows, %On_or_Off%
	Return Errorlevel
}
Command_Drive(Sub_command="", Drive="", Value="")
{
	Drive, %Sub_command%, %Drive%, %Value%
	Return Errorlevel
}
Command_Edit()
{
	Edit
	Return Errorlevel
}
Command_EnvAdd(Var="", Value="", TimeUnits="")
{
	EnvAdd, %Var%, %Value%, %TimeUnits%
	Return Errorlevel
}
Command_EnvDiv(Var="", Value="")
{
	EnvDiv, %Var%, %Value%
	Return Errorlevel
}
Command_EnvMult(Var="", Value="")
{
	EnvMult, %Var%, %Value%
	Return Errorlevel
}
Command_EnvSub(Var="", Value="", TimeUnits="")
{
	EnvSub, %Var%, %Value%, %TimeUnits%
	Return Errorlevel
}
Command_EnvUpdate()
{
	EnvUpdate
	Return Errorlevel
}
Command_Exit(ExitCode="")
{
	Exit, %ExitCode%
	Return Errorlevel
}
Command_ExitApp(ExitCode="")
{
	ExitApp, %ExitCode%
	Return Errorlevel
}
Command_FileAppend(Text="", Filename="")
{
	FileAppend, %Text%, %Filename%
	Return Errorlevel
}
Command_FileCopy(SourcePattern="", DestPattern="", Flag="")
{
	FileCopy, %SourcePattern%, %DestPattern%, %Flag%
	Return Errorlevel
}
Command_FileCopyDir(Source="", Dest="", Flag="")
{
	FileCopyDir, %Source%, %Dest%, %Flag%
	Return Errorlevel
}
Command_FileCreateDir(DirName="")
{
	FileCreateDir, %DirName%
	Return Errorlevel
}
Command_FileCreateShortcut(Target="", LinkFile="", WorkingDir="", Args="", Description="", IconFile="", ShortcutKey="", IconNumber="", RunState="")
{
	FileCreateShortcut, %Target%, %LinkFile%, %WorkingDir%, %Args%, %Description%, %IconFile%, %ShortcutKey%, %IconNumber%, %RunState%
	Return Errorlevel
}
Command_FileDelete(FilePattern="")
{
	FileDelete, %FilePattern%
	Return Errorlevel
}
Command_FileMove(SourcePattern="", DestPattern="", Flag="")
{
	FileMove, %SourcePattern%, %DestPattern%, %Flag%
	Return Errorlevel
}
Command_FileMoveDir(Source="", Dest="", Flag="")
{
	FileMoveDir, %Source%, %Dest%, %Flag%
	Return Errorlevel
}
Command_FileRecycle(FilePattern="")
{
	FileRecycle, %FilePattern%
	Return Errorlevel
}
Command_FileRecycleEmpty(DriveLetter="")
{
	FileRecycleEmpty, %DriveLetter%
	Return Errorlevel
}
Command_FileRemoveDir(DirName="", Recurse="")
{
	FileRemoveDir, %DirName%, %Recurse%
	Return Errorlevel
}
Command_FileSetAttrib(Attributes="", FilePattern="", OperateOnFolders="", Recurse="")
{
	FileSetAttrib, %Attributes%, %FilePattern%, %OperateOnFolders%, %Recurse%
	Return Errorlevel
}
Command_FileSetTime(YYYYMMDDHH24MISS="", FilePattern="", WhichTime="", OperateOnFolders="", Recurse="")
{
	FileSetTime, %YYYYMMDDHH24MISS%, %FilePattern%, %WhichTime%, %OperateOnFolders%, %Recurse%
	Return Errorlevel
}
Command_Gosub(Label="")
{
	Gosub, %Label%
	Return Errorlevel
}
Command_Goto(Label="")
{
	Goto, %Label%
	Return Errorlevel
}
Command_GroupActivate(GroupName="", R="")
{
	GroupActivate, %GroupName%, %R%
	Return Errorlevel
}
Command_GroupAdd(GroupName="", WinTitle="", WinText="", Label="", ExcludeTitle="", ExcludeText="")
{
	GroupAdd, %GroupName%, %WinTitle%, %WinText%, %Label%, %ExcludeTitle%, %ExcludeText%
	Return Errorlevel
}
Command_GroupClose(GroupName="", A_or_R="")
{
	GroupClose, %GroupName%, %A_or_R%
	Return Errorlevel
}
Command_GroupDeactivate(GroupName="", R="")
{
	GroupDeactivate, %GroupName%, %R%
	Return Errorlevel
}
Command_Gui(Sub_command="", Param2="", Param3="", Param4="")
{
	Gui, %Sub_command%, %Param2%, %Param3%, %Param4%
	Return Errorlevel
}
Command_GuiControl(Sub_command="", ControlID="", Param3="")
{
	GuiControl, %Sub_command%, %ControlID%, %Param3%
	Return Errorlevel
}
Command_Hotkey(TastenName="", Label="", Optionen="")
{
	Hotkey, %TastenName%, %Label%, %Optionen%
	Return Errorlevel
}
Command_IniDelete(Filename="", Section="", Key="")
{
	IniDelete, %Filename%, %Section%, %Key%
	Return Errorlevel
}
Command_IniWrite(Value="", Filename="", Section="", Key="")
{
	IniWrite, %Value%, %Filename%, %Section%, %Key%
	Return Errorlevel
}
Command_KeyHistory()
{
	KeyHistory
	Return Errorlevel
}
Command_KeyWait(KeyName="", Options="")
{
	KeyWait, %KeyName%, %Options%
	Return Errorlevel
}
Command_ListHotkeys()
{
	ListHotkeys
	Return Errorlevel
}
Command_ListLines()
{
	ListLines
	Return Errorlevel
}
Command_ListVars()
{
	ListVars
	Return Errorlevel
}
Command_Menu(MenuName="", Cmd="", P3="", P4="", P5="")
{
	Menu, %MenuName%, %Cmd%, %P3%, %P4%, %P5%
	Return Errorlevel
}
Command_MouseClick(WhichButton="", X="", Y="", ClickCount="", Speed="", D_or_U="", R="")
{
	MouseClick, %WhichButton%, %X%, %Y%, %ClickCount%, %Speed%, %D_or_U%, %R%
	Return Errorlevel
}
Command_MouseClickDrag(WhichButton="", X1="", Y1="", X2="", Y2="", Speed="", R="")
{
	MouseClickDrag, %WhichButton%, %X1%, %Y1%, %X2%, %Y2%, %Speed%, %R%
	Return Errorlevel
}
Command_MouseMove(X="", Y="", Speed="", R="")
{
	MouseMove, %X%, %Y%, %Speed%, %R%
	Return Errorlevel
}
Command_MsgBox(Options="", Title="", Text="", Timeout="")
{
	If (Title = "" and Text = "" and Timeout = "")
		MsgBox %Options%
	Else
		MsgBox, %Options%, %Title%, %Text%, %Timeout%
	Return Errorlevel
}
Command_OnExit(Label="")
{
	OnExit, %Label%
	Return Errorlevel
}
Command_OutputDebug(Text="")
{
	OutputDebug, %Text%
	Return Errorlevel
}
Command_Pause(On_or_Off_or_Toggle="", OperateOnUnderlyingThread="")
{
	Pause, %On_or_Off_or_Toggle%, %OperateOnUnderlyingThread%
	Return Errorlevel
}
Command_PostMessage(Msg="", wParam="", lParam="", Control="", WinTitle="", WinText="", ExcludeTitle="", ExcludeText="")
{
	PostMessage, %Msg%, %wParam%, %lParam%, %Control%, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
	Return Errorlevel
}
Command_SendMessage(Msg="", wParam="", lParam="", Control="", WinTitle="", WinText="", ExcludeTitle="", ExcludeText="")
{
	SendMessage, %Msg%, %wParam%, %lParam%, %Control%, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
	Return Errorlevel
}
Command_Process(Cmd="", PID_or_Name="", Param3="")
{
	Process, %Cmd%, %PID_or_Name%, %Param3%
	Return Errorlevel
}
Command_Progress(ProgressParam1="", SubText="", MainText="", WinTitle="", FontName="")
{
	Progress, %ProgressParam1%, %SubText%, %MainText%, %WinTitle%, %FontName%
	Return Errorlevel
}
Command_RegDelete(RootKey="", SubKey="", ValueName="")
{
	RegDelete, %RootKey%, %SubKey%, %ValueName%
	Return Errorlevel
}
Command_RegWrite(ValueType="", RootKey="", SubKey="", ValueName="", Value="")
{
	RegWrite, %ValueType%, %RootKey%, %SubKey%, %ValueName%, %Value%
	Return Errorlevel
}
Command_Reload()
{
	Reload
	Return Errorlevel
}
Command_Run(Target="", WorkingDir="", Max_or_Min_or_Hide_or_UseErrorLevel="", OutputVarPID="")
{
	Run, %Target%, %WorkingDir%, %Max_or_Min_or_Hide_or_UseErrorLevel%, %OutputVarPID%
	Return Errorlevel
}
Command_RunAs(User="", Password="", Domain="")
{
	RunAs, %User%, %Password%, %Domain%
	Return Errorlevel
}
Command_RunWait(Target="", WorkingDir="", Max_or_Min_or_Hide_or_UseErrorLevel="", OutputVarPID="")
{
	RunWait, %Target%, %WorkingDir%, %Max_or_Min_or_Hide_or_UseErrorLevel%, %OutputVarPID%
	Return Errorlevel
}
Command_Send(Keys="")
{
	Send, %Keys%
	Return Errorlevel
}
Command_SendRaw(Keys="")
{
	SendRaw, %Keys%
	Return Errorlevel
}
Command_SendInput(Keys="")
{
	SendInput, %Keys%
	Return Errorlevel
}
Command_SendPlay(Keys="")
{
	SendPlay, %Keys%
	Return Errorlevel
}
Command_SendEvent(Keys="")
{
	SendEvent, %Keys%
	Return Errorlevel
}
Command_SendMode(Input_or_Play_or_Event_or_InputThenPlay="")
{
	SendMode, %Input_or_Play_or_Event_or_InputThenPlay%
	Return Errorlevel
}
Command_SetBatchLines(LineCount="")
{
	SetBatchLines, %LineCount%
	Return Errorlevel
}
Command_SetCapsLockState(State="")
{
	SetCapsLockState, %State%
	Return Errorlevel
}
Command_SetControlDelay(Delay="")
{
	SetControlDelay, %Delay%
	Return Errorlevel
}
Command_SetDefaultMouseSpeed(Speed="")
{
	SetDefaultMouseSpeed, %Speed%
	Return Errorlevel
}
Command_SetEnv(Var="", Value="")
{
	SetEnv, %Var%, %Value%
	Return Errorlevel
}
Command_SetFormat(NumberType="", Format="")
{
	SetFormat, %NumberType%, %Format%
	Return Errorlevel
}
Command_SetKeyDelay(Delay="", PressDuration="", Play="")
{
	SetKeyDelay, %Delay%, %PressDuration%, %Play%
	Return Errorlevel
}
Command_SetMouseDelay(Delay="", Play="")
{
	SetMouseDelay, %Delay%, %Play%
	Return Errorlevel
}
Command_SetNumLockState(State="")
{
	SetNumLockState, %State%
	Return Errorlevel
}
Command_SetScrollLockState(State="")
{
	SetScrollLockState, %State%
	Return Errorlevel
}
Command_SetStoreCapslockMode(On_or_Off="")
{
	SetStoreCapslockMode, %On_or_Off%
	Return Errorlevel
}
Command_SetTimer(Label="", Period_or_On_or_Off="", Priority="")
{
	SetTimer, %Label%, %Period_or_On_or_Off%, %Priority%
	Return Errorlevel
}
Command_SetTitleMatchMode(MatchMode="")
{
	SetTitleMatchMode, %MatchMode%
	Return Errorlevel
}
Command_SetWinDelay(Delay="")
{
	SetWinDelay, %Delay%
	Return Errorlevel
}
Command_SetWorkingDir(DirName="")
{
	SetWorkingDir, %DirName%
	Return Errorlevel
}
Command_Shutdown(Code="")
{
	Shutdown, %Code%
	Return Errorlevel
}
Command_Sleep(DelayInMilliseconds="")
{
	Sleep, %DelayInMilliseconds%
	Return Errorlevel
}
Command_Sort(VarName="", Options="")
{
	global
	Sort, %VarName%, %Options%
	Return Errorlevel
}
Command_SoundBeep(Frequency="", Duration="")
{
	SoundBeep, %Frequency%, %Duration%
	Return Errorlevel
}
Command_SoundPlay(Filename="", wait="")
{
	SoundPlay, %Filename%, %wait%
	Return Errorlevel
}
Command_SoundSet(NewSetting="", ComponentType="", ControlType="", DeviceNumber="")
{
	SoundSet, %NewSetting%, %ComponentType%, %ControlType%, %DeviceNumber%
	Return Errorlevel
}
Command_SoundSetWaveVolume(Percent="", DeviceNumber="")
{
	SoundSetWaveVolume, %Percent%, %DeviceNumber%
	Return Errorlevel
}
Command_SplashImage(ImageFile="", Options="", SubText="", MainText="", WinTitle="", FontName="")
{
	SplashImage, %ImageFile%, %Options%, %SubText%, %MainText%, %WinTitle%, %FontName%
	Return Errorlevel
}
Command_SplashTextOff()
{
	SplashTextOff
	Return Errorlevel
}
Command_SplashTextOn(Width="", Height="", Title="", Text="")
{
	SplashTextOn, %Width%, %Height%, %Title%, %Text%
	Return Errorlevel
}
Command_StatusBarWait(BarText="", Seconds="", Part="", WinTitle="", WinText="", Interval="", ExcludeTitle="", ExcludeText="")
{
	StatusBarWait, %BarText%, %Seconds%, %Part%, %WinTitle%, %WinText%, %Interval%, %ExcludeTitle%, %ExcludeText%
	Return Errorlevel
}
Command_StringCaseSense(On_or_Off_or_Locale="")
{
	StringCaseSense, %On_or_Off_or_Locale%
	Return Errorlevel
}
Command_Suspend(On_or_Off_or_Toggle_or_Permit="")
{
	Suspend, %On_or_Off_or_Toggle_or_Permit%
	Return Errorlevel
}
Command_Thread(p1="", p2="", p3="")
{
	Thread %p1%,%p2%,%p3%
	Return Errorlevel
}
Command_ToolTip(Text="", X="", Y="", WhichToolTip="")
{
	If (X = "" and Y = "" and WhichToolTip = "")
		ToolTip, %Text%
	Else
		ToolTip, %Text%, %X%, %Y%, %WhichToolTip%
	Return Errorlevel
}
Command_TrayTip(Title="", Text="", Seconds="", Options="")
{
	TrayTip, %Title%, %Text%, %Seconds%, %Options%
	Return Errorlevel
}
Command_UrlDownloadToFile(URL="", Filename="")
{
	UrlDownloadToFile, %URL%, %Filename%
	Return Errorlevel
}
Command_WinActivate(WinTitle="", WinText="", ExcludeTitle="", ExcludeText="")
{
	WinActivate, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
	Return Errorlevel
}
Command_WinActivateBottom(WinTitle="", WinText="", ExcludeTitle="", ExcludeText="")
{
	WinActivateBottom, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
	Return Errorlevel
}
Command_WinClose(WinTitle="", WinText="", SecondsToWait="", ExcludeTitle="", ExcludeText="")
{
	WinClose, %WinTitle%, %WinText%, %SecondsToWait%, %ExcludeTitle%, %ExcludeText%
	Return Errorlevel
}
Command_WinHide(WinTitle="", WinText="", ExcludeTitle="", ExcludeText="")
{
	WinHide, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
	Return Errorlevel
}
Command_WinKill(WinTitle="", WinText="", SecondsToWait="", ExcludeTitle="", ExcludeText="")
{
	WinKill, %WinTitle%, %WinText%, %SecondsToWait%, %ExcludeTitle%, %ExcludeText%
	Return Errorlevel
}
Command_WinMaximize(WinTitle="", WinText="", ExcludeTitle="", ExcludeText="")
{
	WinMaximize, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
	Return Errorlevel
}
Command_WinMenuSelectItem(WinTitle="", WinText="", Menu="", SubMenu1="", SubMenu2="", SubMenu3="", SubMenu4="", SubMenu5="", SubMenu6="", ExcludeTitle="", ExcludeText="")
{
	WinMenuSelectItem, %WinTitle%, %WinText%, %Menu%, %SubMenu1%, %SubMenu2%, %SubMenu3%, %SubMenu4%, %SubMenu5%, %SubMenu6%, %ExcludeTitle%, %ExcludeText%
	Return Errorlevel
}
Command_WinMinimize(WinTitle="", WinText="", ExcludeTitle="", ExcludeText="")
{
	WinMinimize, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
	Return Errorlevel
}
Command_WinMinimizeAll()
{
	WinMinimizeAll
	Return Errorlevel
}
Command_WinMinimizeAllUndo()
{
	WinMinimizeAllUndo
	Return Errorlevel
}
Command_WinMove(WinTitle="", WinText="", X="", Y="", Width="", Height="", ExcludeTitle="", ExcludeText="")
{
	WinMove, %WinTitle%, %WinText%, %X%, %Y%, %Width%, %Height%, %ExcludeTitle%, %ExcludeText%
	Return Errorlevel
}
Command_WinRestore(WinTitle="", WinText="", ExcludeTitle="", ExcludeText="")
{
	WinRestore, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
	Return Errorlevel
}
Command_WinSet(Attribute="", Value="", WinTitle="", WinText="", ExcludeTitle="", ExcludeText="")
{
	WinSet, %Attribute%, %Value%, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
	Return Errorlevel
}
Command_WinSetTitle(WinTitle="", WinText="", NewTitle="", ExcludeTitle="", ExcludeText="")
{
	WinSetTitle, %WinTitle%, %WinText%, %NewTitle%, %ExcludeTitle%, %ExcludeText%
	Return Errorlevel
}
Command_WinShow(WinTitle="", WinText="", ExcludeTitle="", ExcludeText="")
{
	WinShow, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
	Return Errorlevel
}
Command_WinWait(WinTitle="", WinText="", Seconds="", ExcludeTitle="", ExcludeText="")
{
	WinWait, %WinTitle%, %WinText%, %Seconds%, %ExcludeTitle%, %ExcludeText%
	Return Errorlevel
}
Command_WinWaitActive(WinTitle="", WinText="", Seconds="", ExcludeTitle="", ExcludeText="")
{
	WinWaitActive, %WinTitle%, %WinText%, %Seconds%, %ExcludeTitle%, %ExcludeText%
	Return Errorlevel
}
Command_WinWaitClose(WinTitle="", WinText="", Seconds="", ExcludeTitle="", ExcludeText="")
{
	WinWaitClose, %WinTitle%, %WinText%, %Seconds%, %ExcludeTitle%, %ExcludeText%
	Return Errorlevel
}
Command_WinWaitNotActive(WinTitle="", WinText="", Seconds="", ExcludeTitle="", ExcludeText="")
{
	WinWaitNotActive, %WinTitle%, %WinText%, %Seconds%, %ExcludeTitle%, %ExcludeText%
	Return Errorlevel
}
Command_ControlGet(Cmd="", Value="", Control="", WinTitle="", WinText="", ExcludeTitle="", ExcludeText="")
{
	ControlGet, out, %Cmd%, %Value%, %Control%, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
	Return out
}
Command_ControlGetFocus(WinTitle="", WinText="", ExcludeTitle="", ExcludeText="")
{
	ControlGetFocus, out, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
	Return out
}
Command_ControlGetText(Control="", WinTitle="", WinText="", ExcludeTitle="", ExcludeText="")
{
	ControlGetText, out, %Control%, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
	Return out
}
Command_DriveGet(Cmd="", Value="")
{
	DriveGet, out, %Cmd%, %Value%
	Return out
}
Command_DriveSpaceFree(Path="")
{
	DriveSpaceFree, out, %Path%
	Return out
}
Command_EnvGet(EnvVarName="")
{
	EnvGet, out, %EnvVarName%
	Return out
}
Command_FileGetAttrib(Filename="")
{
	FileGetAttrib, out, %Filename%
	Return out
}
Command_FileGetSize(Filename="", Units="")
{
	FileGetSize, out, %Filename%, %Units%
	Return out
}
Command_FileGetTime(Filename="", WhichTime="")
{
	FileGetTime, out, %Filename%, %WhichTime%
	Return out
}
Command_FileGetVersion(Filename="")
{
	FileGetVersion, out, %Filename%
	Return out
}
Command_FileRead(Filename="")
{
	FileRead, out, %Filename%
	Return out
}
Command_FileReadLine(Filename="", LineNum="")
{
	FileReadLine, out, %Filename%, %LineNum%
	Return out
}
Command_FileSelectFile(Options="", Path="", Prompt="", Filter="")
{
	FileSelectFile, out, %Options%, %Path%, %Prompt%, %Filter%
	Return out
}
Command_FileSelectFolder(StartingFolder="", Options="", Prompt="")
{
	FileSelectFolder, out, %StartingFolder%, %Options%, %Prompt%
	Return out
}
Command_FormatTime(YYYYMMDDHH24MISS="", Format="")
{
	FormatTime, out, %YYYYMMDDHH24MISS%, %Format%
	Return out
}
Command_GetKeyState(KeyName="", Mode="")
{
	GetKeyState, out, %KeyName%, %Mode%
	Return out
}
Command_GuiControlGet(Sub_command="", ControlID="", Param4="")
{
	GuiControlGet, out, %Sub_command%, %ControlID%, %Param4%
	Return out
}
Command_IniRead(Filename="", Section="", Key="", Default="")
{
	
	IniRead, out, %Filename%, %Section%, %Key%, %Default%
	Return out
}
Command_Input(Options="", EndKeys="", MatchList="")
{
	Input, out, %Options%, %EndKeys%, %MatchList%
	Return out
}
Command_InputBox(Title="", Prompt="", HIDE="", Width="", Height="", X="", Y="", Font="", Timeout="", Default="")
{
	InputBox, out, %Title%, %Prompt%, %HIDE%, %Width%, %Height%, %X%, %Y%,, %Timeout%, %Default%
	Return out
}
Command_IsType(var_name, type)
{
	global
	if %var_name% is %type%
		Return 1
	Return 0
}
Command_IsBetween(var_name, min, max)
{
	global
	if %var_name% between %min% and %max%
		Return 1
	Return 0
}
Command_PixelGetColor(X="", Y="", Alt_or_Slow_or_RGB="")
{
	PixelGetColor, out, %X%, %Y%, %Alt_or_Slow_or_RGB%
	Return out
}
Command_Random(Min="", Max="")
{
	Random, out, %Min%, %Max%
	Return out
}
Command_RegRead(RootKey="", SubKey="", ValueName="") {
	RegRead, out, %RootKey%, %SubKey%, %ValueName%
	if Errorlevel
		Throw { what: A_ThisFunc, file: A_LineFile, message: "Error in " . A_ThisFunc . "() !", extra: "Errorlevel was set to " . Errorlevel }
	Return out
}
Command_SoundGet(ComponentType="", ControlType="", DeviceNumber="")
{
	SoundGet, out, %ComponentType%, %ControlType%, %DeviceNumber%
	Return out
}
Command_SoundGetWaveVolume(DeviceNumber="")
{
	
	SoundGetWaveVolume, out, %DeviceNumber%
	Return out
}
Command_StatusBarGetText(Part="", WinTitle="", WinText="", ExcludeTitle="", ExcludeText="")
{
	StatusBarGetText, out, %Part#%, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
	Return out
}
Command_StringLower(InputVar="", T="")
{
	StringLower, out, InputVar, %T%
	Return out
}
Command_StringReplace(InputVar="", SearchText="", ReplaceText="", ReplaceAll="")
{
	StringReplace, out, InputVar, %SearchText%, %ReplaceText%, %ReplaceAll%
	Return out
}
Command_StringTrimLeft(InputVar="", Count="")
{
	StringTrimLeft, out, InputVar, %Count%
	Return out
}
Command_StringTrimRight(InputVar="", Count="")
{
	StringTrimRight, out, InputVar, %Count%
	Return out
}
Command_StringUpper(InputVar="", T="")
{
	StringUpper, out, InputVar, %T%
	Return out
}
Command_SysGet(Sub_command="", Param3="")
{
	SysGet, out, %Sub_command%, %Param3%
	Return out
}
Command_Transform(Cmd="", Value1="", Value2="")
{
	Transform, out, %Cmd%, %Value1%, %Value2%
	Return out
}
Command_WinGetActiveTitle()
{
	
	WinGetActiveTitle, out
	Return out
}
Command_WinGetClass(WinTitle="", WinText="", ExcludeTitle="", ExcludeText="")
{
	WinGetClass, out, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
	Return out
}
Command_WinGet(Cmd="", WinTitle="", WinText="", ExcludeTitle="", ExcludeText="")
{
	
	WinGet, out, %Cmd%, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
	Return out
}
Command_WinGetText(WinTitle="", WinText="", ExcludeTitle="", ExcludeText="")
{
	WinGetText, out, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
	Return out
}
Command_WinGetTitle(WinTitle="", WinText="", ExcludeTitle="", ExcludeText="")
{
	
	WinGetTitle, out, %WinTitle%, %WinText%, %ExcludeTitle%, %ExcludeText%
	Return out
}
Command_ControlGetPos(Control="", WinTitle="", WinText="", ExcludeTitle="", ExcludeText="")
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
Command_FileGetShortcut(LinkFile="")
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
Command_ImageSearch(X1="", Y1="", X2="", Y2="", ImageFile="")
{
	out := Object()
	ImageSearch, X, Y, %X1%, %Y1%, %X2%, %Y2%, %ImageFile%
	out["X"] := X
	out["Y"] := Y
	out["Errorlevel"] := Errorlevel
	Return out
}
Command_MouseGetPos(Mode="")
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
Command_PixelSearch(X1="", Y1="", X2="", Y2="", ColorID="", Variation="", Fast_or_RGB="")
{
	out := Object()
	PixelSearch, X, Y, %X1%, %Y1%, %X2%, %Y2%, %ColorID%, %Variation%, %Fast_or_RGB%
	out["X"] := X
	out["Y"] := Y
	out["Errorlevel"] := Errorlevel
	Return out
}
Command_SplitPath(InputVar="")
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
Command_StringSplit(InputVar="", Delimiters="", OmitChars="")
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
Command_WinGetActiveStats()
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
Command_WinGetPos(WinTitle="", WinText="", ExcludeTitle="", ExcludeText="")
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