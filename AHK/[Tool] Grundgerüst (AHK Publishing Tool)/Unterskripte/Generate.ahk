
;Die Generate Subroutine generiert die 3 erforderlichen Scripte:
Generate:

Gui, Submit, NoHide ;Eingabe nochmal holen
;Nochmal überprüfen, ob alle linken Felder ausgefüllt wurden:
If (Source = "" or ApName = "" or ApNameKurz = "" or ApNameLang = "" or ApOrdner = "" or AutorName = "" or AutorEmail = "" or ApVersion = "" or ApGenaueVersion = "" or ApUrlTxtVersion = "")
   Return

gui,hide ;Gui verstecken

SetTimer, Check, off ;timer aus


;Den Ausgabeordner festlegen
AugabeDir=%dir%
FileCreateDir,%AugabeDir% ;Ordner erstellen
FileDelete, %AugabeDir%\%AppDateiName% modified.ahk ;Alte Datei löschen


filecopy,Lizenzen\%ApLizenz% %ApInstallationLanguage%.txt,%AugabeDir%\Lizenz.txt,1 ;kopiert Lizenz

;~ ToolTip Bitte Warten...



;Einstellungen speichern

iniwrite,%ApName%,%Dir%\Einstellungen.ini,Grundgerüst,Appname
iniwrite,%ApNameKurz%,%Dir%\Einstellungen.ini,Grundgerüst,AppNameKurz
iniwrite,%ApNameLang%,%Dir%\Einstellungen.ini,Grundgerüst,AppNameLang
iniwrite,%ApOrdner%,%Dir%\Einstellungen.ini,Grundgerüst,AppOrdner
iniwrite,%AutorName%,%Dir%\Einstellungen.ini,Grundgerüst,AutorName
iniwrite,%AutorEmail%,%Dir%\Einstellungen.ini,Grundgerüst,AutorEmail
iniwrite,%ApVersion%,%Dir%\Einstellungen.ini,Grundgerüst,AppVersion
iniwrite,%ApGenaueVersion%,%Dir%\Einstellungen.ini,Grundgerüst,AppGenaueVersion
iniwrite,%ApUrlTxtVersion%,%Dir%\Einstellungen.ini,Grundgerüst,AppUrlTxtVersion
iniwrite,%ApUrlTxtVersion2%,%Dir%\Einstellungen.ini,Grundgerüst,AppUrlTxtVersion2
iniwrite,%ApUrlTxtVersion3%,%Dir%\Einstellungen.ini,Grundgerüst,AppUrlTxtVersion3
iniwrite,%ApChangelog%,%Dir%\Einstellungen.ini,Grundgerüst,AppChangelog
iniwrite,%ApInstallationLanguage%,%Dir%\Einstellungen.ini,Grundgerüst,AppInstallationLanguage
iniwrite,%ApLizenz%,%Dir%\Einstellungen.ini,Grundgerüst,AppLizenz

iniwrite,%ApDirList%,%Dir%\Einstellungen.ini,Grundgerüst,AppDirList
iniwrite,%ApFileList%,%Dir%\Einstellungen.ini,Grundgerüst,AppFileList
iniwrite,%ApExeList%,%Dir%\Einstellungen.ini,Grundgerüst,AppExeList
iniwrite,%ApIconList%,%Dir%\Einstellungen.ini,Grundgerüst,AppIconList



;---Die Hauptprogramm.ahk erstellen---




FileRead, Code, %File% ;Code der Haupt-ahk lesen

stringreplace,Code,Code,LizenzbedingungenÜber: ;Speziell für den Fall, dass die Lizenzbedingungen vom Programm aus nochmal angezeigt werden sollen (Z.B. mit dem Button "Über"). Das Label wird entfernt, die Datei Inhalte\Vor dem Code.ahk enthält ebenfalls dieses Label.

;Hier kommen alle Infos mit rein
Output=
(
Appname=%ApName%
AppNameKurz=%ApNameKurz%
AppNameLang=%ApNameLang%
AppOrdner=%ApOrdner%
AppAutorName=%AutorName%
AppAutorEmail=%AutorEmail%
AppVersion=%ApVersion%
AppGenaueVersion=%ApGenaueVersion%
AppUrlTxtVersion:="%ApUrlTxtVersion%"
AppUrlTxtVersion2:="%ApUrlTxtVersion2%"
AppUrlTxtVersion3:="%ApUrlTxtVersion3%"
AppChangelog=%ApChangelog%

AppLizenz=%aplizenz%
AppInstallationLanguage=%ApInstallationLanguage%

AppDirList=%ApDirList%
AppFileList=%ApFileList%
AppExeList=%ApExeList%
AppIconList=%ApIconList%

%Inhalt_VorDemCode%

%Code%
)






;Weiß nicht mehr wozu das gut war :-(
stringreplace,output,output,_AutorName_,%AutorName%
stringreplace,output,output,_AutorEmail_,%AutorEmail%


;Modifizierten Programmcode erstellen
fileappend,%output%,%AugabeDir%\%AppDateiName% modified.ahk,utf-8





;---Update Checker.ahk erstellen. Korrekten Namen im Code einfügen.---
FileDelete, %AugabeDir%\Update Checker.ahk ; Alte Datei löschen
stringreplace,Inhalt_UpdateChecker,Inhalt_UpdateChecker,_AppDateiName_,%AppDateiName% ,a ;Korrekten Namen im Code einfügen, damit Update Checker das Programm findet.
FileAppend, %Inhalt_UpdateChecker%, %AugabeDir%\Update Checker.ahk,utf-8 ;Datei schreiben






;---Installationsdeatei erstellen.---
filedelete,%AugabeDir%\%AppDateiName% Installation.ahk ;Alte Datei löschen

fileread,ApShortLicenseDescription,Lizenzen\%ApLizenz% %ApInstallationLanguage% short.txt ;Kurze Lizenzbedingungen laden.
StringReplace,ApShortLicenseDescription,ApShortLicenseDescription,`n,``n,all ;Zeilenumbruch fixen
StringReplace,ApShortLicenseDescription,ApShortLicenseDescription,`r,,all

;Aus %ApFileList% und %ApDirList% den Inhalt der Datei-Auswahl auf der rechten Seite schrittweise auslesen und in Variable CodeFürOrdnerInstallieren schreiben:
fcounter := 0
loop,parse,ApDirList,|
{
       
   if A_loopfield
   {
      fcounter++
      CodeFürOrdnerInstallieren=
      (
      %CodeFürOrdnerInstallieren%
      OrdnerNr%A_index%:
      Gui, Submit, NoHide
      GuiControl,, Log, [%fcounter%/`%fcounter`%] Ordner %A_loopfield% erstellen...``n`%Log`%
      filecreatedir,`%a_workingdir`%\%A_loopfield%
      if errorlevel=1
      {
          GuiControl,, Log, [Fehler] Ordner %A_loopfield% kann nicht erstellt werden.``n`%Log`% 
          MsgBox, 6, %ApNameLang% v%ApVersion% Installer, Der Ordner %A_loopfield% kann nicht erstellt werden.
          ifmsgbox TryAgain
          {
              goto OrdnerNr%A_index%
          }
          ifmsgbox Cancel
              exitapp
      }
      prc := Round(100 * (%fcounter%/fcounter))
      GuiControl,, Progress, `%prc`%
      GuiControl,, Percent, `%prc`%```%
      
      )
      
   }

}

;Datei generieren: Code für neue Dateien in die Variable CodeFürDateienInstallieren speichern.
loop,parse,ApFileList,|
{
   
   if A_loopfield
   {
      fcounter++
      CodeFürDateienInstallieren=
      (
      %CodeFürDateienInstallieren%
      DateiNr%A_index%:
      Gui, Submit, NoHide
      GuiControl,, Log, [%fcounter%/`%fcounter`%] %A_loopfield% entpacken...``n`%Log`%
      FileInstall,%A_loopfield%,`%a_workingdir`%\%A_loopfield%,1
      if errorlevel=1
      {
          GuiControl,, Log, [Fehler] %A_loopfield% kann nicht entpackt werden.``n`%Log`% 
          MsgBox, 6, %ApNameLang% v%ApVersion% Installer, Die Datei %A_loopfield% kann nicht kopiert werden. Möglicherweise ist die Datei geöffnet.
          ifmsgbox TryAgain 
          {
              goto DateiNr%A_index%
          }
          ifmsgbox Cancel
              exitapp
      }
      prc := Round(100 * (%fcounter%/fcounter))
      GuiControl,, Progress, `%prc`%
      GuiControl,, Percent, `%prc`%```%
      
      )
   }

}

;Lizenz.txt hinzufügen:
fcounter++
CodeFürDateienInstallieren=
(
%CodeFürDateienInstallieren%
LizenzDatei:
Gui, Submit, NoHide
GuiControl,, Log, [%fcounter%/`%fcounter`%] Lizenz.txt entpacken...``n`%Log`%
FileInstall,Lizenz.txt,`%a_workingdir`%\Lizenz.txt,1
if errorlevel=1
{
	GuiControl,, Log, [Fehler] Lizenz.txt kann nicht entpackt werden.``n`%Log`% 
	MsgBox, 6, %ApNameLang% v%ApVersion% Installer, Die Datei Lizenz.txt kann nicht kopiert werden. Möglicherweise ist die Datei geöffnet.
	ifmsgbox TryAgain 
	{
	  goto LizenzDatei
	}
	ifmsgbox Cancel
		exitapp
}
prc := Round(100 * (%fcounter%/fcounter))
GuiControl,, Progress, `%prc`%
GuiControl,, Percent, `%prc`%```%

)

;Datei generieren: Code für Exe Dateien, die nach dem Kompilieren in der Installationsdatei aufgenommen werden.
loop,parse,ApExeList,|
{
   
   if A_loopfield
   {
      fcounter++
      CodeFürDateienInstallieren=
      (
      %CodeFürDateienInstallieren%
      ExeNr%A_index%:
      Gui, Submit, NoHide
      GuiControl,, Log, [%fcounter%/`%fcounter`%] %A_loopfield%.exe entpacken...``n`%Log`%
      FileInstall,%A_loopfield%.exe,`%a_workingdir`%\%A_loopfield%.exe,1
      if errorlevel=1
      {
          GuiControl,, Log, [Fehler] %A_loopfield%.exe kann nicht entpackt werden.``n`%Log`%
          MsgBox, 6, %ApNameLang% v%ApVersion% Installer, Die Datei %A_loopfield%.exe kann nicht kopiert werden. Möglicherweise ist die Datei geöffnet.
          ifmsgbox TryAgain 
          {
              goto ExeNr%A_index%
          }
          ifmsgbox Cancel
              exitapp
      }
      prc := Round(100 * (%fcounter%/fcounter))
      GuiControl,, Progress, `%prc`%
      GuiControl,, Percent, `%prc`%```%
      
      )
   }

}

;Code für Installationsstatus GUI
CodeFürGuiInstallationsStatus=
(
fcounter=%fcounter%
Gui -Caption +Border
Gui, Add, Progress, vProgress x10 y10 h15 w350 +Border c0000AA, 0
Gui, Add, Text, x10 y35, Details:
Gui, Add, Text, x320 y35 w50 vPercent, 0```%
Gui, Add, Edit, vLog x10 y55 h75 w350 ReadOnly, Installation gestartet...
Gui, Show, w370 h140, %ApNameLang% v%ApVersion% Installer
)





;Korrekte Daten in den Installationsskript einfügen
stringreplace,Inhalt_AppInstallation,Inhalt_AppInstallation,_AppShortLicenseDescription_,%ApShortLicenseDescription% ,a ;Das muss zuerst erfolgen

stringreplace,Inhalt_AppInstallation,Inhalt_AppInstallation,_AppDateiName_,%AppDateiName% ,a
stringreplace,Inhalt_AppInstallation,Inhalt_AppInstallation,_AppOrdner_,%ApOrdner% ,a
stringreplace,Inhalt_AppInstallation,Inhalt_AppInstallation,_AppNameLang_,%ApNameLang% ,a
stringreplace,Inhalt_AppInstallation,Inhalt_AppInstallation,_AppName_,%ApName% ,a
stringreplace,Inhalt_AppInstallation,Inhalt_AppInstallation,_AppVersion_,%ApVersion% ,a
stringreplace,Inhalt_AppInstallation,Inhalt_AppInstallation,_AutorName_,%AutorName% ,a
stringreplace,Inhalt_AppInstallation,Inhalt_AppInstallation,_AutorEmail_,%AutorEmail% ,a
stringreplace,Inhalt_AppInstallation,Inhalt_AppInstallation,_AppGenaueVersion_,%ApGenaueVersion% ,a
stringreplace,Inhalt_AppInstallation,Inhalt_AppInstallation,_AppChangelog_,%ApChangelog% ,a
stringreplace,Inhalt_AppInstallation,Inhalt_AppInstallation,_AppLizenz_,%ApLizenz% ,a
stringreplace,Inhalt_AppInstallation,Inhalt_AppInstallation,_AppInstallationLanguage_,%ApInstallationLanguage% ,a

stringreplace,Inhalt_AppInstallation,Inhalt_AppInstallation,_OrdnerInstallieren_,%CodeFürOrdnerInstallieren% ,a
stringreplace,Inhalt_AppInstallation,Inhalt_AppInstallation,_DateienInstallieren_,%CodeFürDateienInstallieren%,a
stringreplace,Inhalt_AppInstallation,Inhalt_AppInstallation,_GuiInstallationsStatus_,%CodeFürGuiInstallationsStatus%
FileAppend, %Inhalt_AppInstallation%, %AugabeDir%\%AppDateiName% Installation.ahk,utf-8




;---Vor dem Kompilieren den Pfad vom Compiler ermitteln---
SplitPath, A_AhkPath,,AHK_COMPILERdir
AHK_COMPILER := AHK_COMPILERdir "\Compiler\Ahk2Exe.exe"




;---alle Dateien Kompilieren---
Loop,parse,ApExeList,|
{
  
   if a_loopfield ;sicherstellen, dass kein leerer Parameter
   {
      ;Wenn Programm selbst kompiliert werden musst, Originalskript unangetastet lassen
      If a_loopfield=%AppDateiName%
         ZuKompilen=%a_loopfield% modified
      else
         ZuKompilen=%a_loopfield%
      ;icon Finden
      IconZurExe:=IconZurExeRausfinden(a_loopfield)
      if IconZurExe
      {
         ifinstring,IconZurExe,:
            IconZurExe=/icon "%IconZurExe%"
         else
            IconZurExe=/icon "%dir%\%IconZurExe%"
      }
      
      nochmalVersuchenExeZuKompilen:
      SplashTexton,200,60,%_In_Arbeit_%,%_Kompilieren_von___1%%ZuKompilen%%_Kompilieren_von___2%
      process,close,Ahk2Exe.exe ;Falls Kompiler aktiv ist, beenden (Fehlerminimierung)
      run,%AHK_COMPILER% /in "%AugabeDir%\%ZuKompilen%.ahk" /out "%AugabeDir%\%ZuKompilen%.exe" %IconZurExe% ;Kompiler aufrufen
      process,waitclose,Ahk2Exe.exe,10 ;Warten, bis Kompiler fertig ist
      if errorlevel<>0 ;wenn der Kompiler nicht schließen will
      {
         SplashTextOff
         settimer,PrüfenObKompilerDochFertigIst ;Nebenher prüfen, ob Kompiler doch fertig wird
         MsgBox, 6, %_Achtung_%, %_Der_Kompiler_braucht_ungewöhnlich_lange_für_das_kompilieren_von___1%%ZuKompilen%%_Der_Kompiler_braucht_ungewöhnlich_lange_für_das_kompilieren_von___2%
         ifmsgbox,Cancel
            ExitApp
         IfMsgBox, tryagain
            goto,nochmalVersuchenExeZuKompilen
      } 
      
      
   }
   
}

;Den Modified-Zusatz beim kompilierten Hauptprogramm entfernen
filemove,%AugabeDir%\%AppDateiName% modified.exe,%AugabeDir%\%AppDateiName%.exe,1 



;Zuletzt Installationsdatei kompilieren
;icon Finden
IconZurExe:=IconZurExeRausfinden(AppDateiName)
if IconZurExe
{
   ifinstring,IconZurExe,:
      IconZurExe=/icon "%IconZurExe%"
   else
      IconZurExe=/icon "%dir%\%IconZurExe%"
}
nochmalVersuchenInstallationsdateiZuKompilen:
SplashTexton,200,60,%_In_Arbeit_%,%_Erstellen_der_Installationsdatei_%
process,close,Ahk2Exe.exe ;Falls Kompiler aktiv ist, beenden (Fehlerminimierung)
run,%AHK_COMPILER% /in "%AugabeDir%\%AppDateiName% Installation.ahk" /out "%AugabeDir%\%AppDateiName% Installation.exe" %IconZurExe% ;Kompiler aufrufen
process,waitclose,Ahk2Exe.exe,10 ;Warten, bis Kompiler fertig ist
if errorlevel<>0 ;wenn der Kompiler nicht schließen will
{
   SplashTextOff
   settimer,PrüfenObKompilerDochFertigIst ;Nebenher prüfen, ob Kompiler doch fertig wird
   MsgBox, 6, %_Achtung_%, %_Der_Kompiler_braucht_ungewöhnlich_lange_für_das_kompilieren_von___1%%ZuKompilen%%_Der_Kompiler_braucht_ungewöhnlich_lange_für_das_kompilieren_von___2%
   ifmsgbox,Cancel
      ExitApp
   IfMsgBox, tryagain
      goto,nochmalVersuchenInstallationsdateiZuKompilen
}

;~ Gui, Submit, NoHide
If not RestdateienBeibehalten
{
	FileDelete, %AugabeDir%\Update Checker.ahk
	FileDelete, %AugabeDir%\Update Checker.exe
	FileDelete, %AugabeDir%\%AppDateiName% Installation.ahk
	FileDelete, %AugabeDir%\%AppDateiName% modified.ahk 
	FileDelete, %AugabeDir%\%AppDateiName%.exe
	if (AugabeDir!=A_ScriptDir) ;Nicht löschen, wenn Grundgerüst sich selbst kompiliert
		FileDelete, %AugabeDir%\Lizenz.txt
}

splashtextoff


   
   





;Meldung ausgeben wenn er fertig ist und Programm beenden:
ToolTip
if 1!=FastCompile ;Mit der Meldung nicht nerven, wenn man schnell compilen will
{
   MsgBox, 4, Fertig, %___mit_Grundgerüst_ausgestattet__Verknüpfung_für_schnelles_Kompilieren_1%%ApName%%___mit_Grundgerüst_ausgestattet__Verknüpfung_für_schnelles_Kompilieren_2%
   IfMsgBox,yes
      FileCreateShortcut,%a_scriptfullpath% ,%Dir%\%ApName% %_sofort_Kompilieren_%.lnk,,"FastCompile" "%Dir%\%AppDateiName%.ahk" ;Verknüpfung erstellen, die Grundgerüst mitteilt, welche Datei kompiliert werden soll.
}
ExitApp


PrüfenObKompilerDochFertigIst: ;Falls der Kompiler ungewöhnlich lange braucht, wird eine Fehlermeldung angezeigt. Dieser Code prüft, ob der Kompiler doch fertig wird (d.h. Prozess geschlossen wird) und schließt die Fehlermeldung.
process,exist,Ahk2Exe.exe
if errorlevel=0
{
   settimer,,off ;Timer beendet sich selbst
   controlsend,Button3,{space},%_Achtung_%, %_Der_Kompiler_braucht_ungewöhnlich_lange_für_das_kompilieren_von___1%%ZuKompilen%%_Der_Kompiler_braucht_ungewöhnlich_lange_für_das_kompilieren_von___2% ;MsgBox schließen
}
return

