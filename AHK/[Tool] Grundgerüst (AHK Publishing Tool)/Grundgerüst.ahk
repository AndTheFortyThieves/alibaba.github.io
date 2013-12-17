#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

ApInstallationLanguage=deutsch
ApLizenz=GPL


;Text für den GUI in der eingestellen Sprache laden.
gosub,SpracheLaden

;Inhalte auslesen:
fileread,Inhalt_VorDemCode,Inhalte\Vor dem Code.ahk
if errorlevel
   ObError=true
fileread,Inhalt_UpdateChecker,Inhalte\Update Checker.ahk
if errorlevel
   ObError=true
fileread,Inhalt_AppInstallation,Inhalte\App Installation.ahk
if errorlevel
   ObError=true

if ObError=true
{
   MsgBox, 16, Fehler, Die Dateien mit den Inhalten konnten nicht geladen werden.`nOhne diese Dateien funktioniert Grundgerüst nicht.
   ExitApp
}


;Lass die Subroutine "Check" alle 100ms durchlaufen:
SetTimer, Check, 100

;Die Variablen für die Datei-Auswahl (auf der rechten Seite) initialisieren:
ApFileList := ""
ApDirList := ""

;GUI erstellen:

;~ Menu,MenuEinstellungen,add,&Einstellungen,MenuEinstellungen
Loop,language files\*.ini
{
   stringtrimright,temp,a_loopfilename,4
   menu,MenuSprache,add,%temp%,SpracheÄndern
}

;~ menu,MenuSprache,add,English,SpracheÄndern

Menu,MenuEinstellungen,add,&%_Stadnardwerte_%,MenuStandardsSetzen
Menu,MenuEinstellungen,add,&%_Sprache_%, :MenuSprache

Menu,MenuHilfe,add, &%_Hilfe_%,MenuHilfe
Menu,MenuHilfe,add, &%_Über_%,MenuÜber

Menu, MenuLeiste, Add, &%_Einstellungen_%, :MenuEinstellungen
Menu, MenuLeiste, Add, &%_Hilfe_%, :MenuHilfe

Gui, Menu, MenuLeiste


Gui, Add, Text, x10 y10, %_Quellcode_%:
Gui, Add, Edit, x10 y30 w180 vSource ReadOnly,
Gui, Add, Button, x195 y25 h30 w50 gOpenFile +default, %_Öffnen_%
Gui, Add, Text, x10 y60, %_Programmname_%:
Gui, Add, Edit, x10 y80 w180 vApName
Gui, Add, GroupBox, x10 y110 w230 h283, %_Zusätzliche_Informationen_%
Gui, Add, Text, x15 y130, %_Kürzel_%:
Gui, Add, Edit, x105 yp vApNameKurz,
Gui, Add, Text, x15 yp+25, %_Ausführlicher_Name_%:
Gui, Add, Edit, x105 yp vApNameLang,
Gui, Add, Text, x15 yp+25, %_Installationsordner_%:
Gui, Add, Edit, x105 yp vApOrdner,
Gui, Add, Text, x15 yp+30, %_Autor_%:
Gui, Add, Edit, x105 yp vAutorName,
Gui, Add, Text, x15 yp+25, %_Email_%:
Gui, Add, Edit, x105 yp vAutorEmail,
Gui, Add, Text, x15 yp+30, %_Programmversion_%:
Gui, Add, Edit, x105 yp vApVersion,
Gui, Add, Text, x15 yp+25, %_Update_Version_%:
Gui, Add, Edit, x105 yp vApGenaueVersion,
Gui, Add, Text, x15 yp+25, %_Update_Abgleich_%:
Gui, Add, Edit, x105 yp vApUrlTxtVersion,
Gui, Add, Button, x55 yp+35 w100 h30 vButtonErweiterteInformationen gButtonErweiterteInformationen , %_Erweitert_%
;~ Gui, Add, Text, x15 yp+25, %_Update_Abgleich_% 2:
;~ Gui, Add, Edit, x105 yp vApUrlTxtVersion2,
;~ Gui, Add, Text, x15 yp+25, %_Update_Abgleich_% 3:
;~ Gui, Add, Edit, x105 yp vApUrlTxtVersion3,
Gui, Add, Text, x260 y10, %_Zugehörige_Dateien_%:
Gui, Add, Button, x260 y30 w65 vAddFileB gAddFile Disabled, + %_Dateien_%
Gui, Add, Button, X+5 y30 w70 vAddDirB gAddDir Disabled, + %_Ordners_%
Gui, Add, Button, X+5 y30 w70 vAddExeB gAddExe Disabled, + %_Exe_%
Gui, Add, Checkbox, x335 y60 -Wrap vsetting Checked, + %_Inhalt_%
Gui, Add, ListBox, vList x260 y85 w250 h280 gShowItem, --- %_Ordners_%: ---|<%_Keine_%>|%A_Tab%|--- %_Dateien_%: ---|<%_Keine_%>|%a_tab%|--- %_Skripte_kompilieren_%: ---|<%_Keine_%>
Gui, Add, Button, vButtonRemoveItem gRemoveItem x260 y365 disabled, %_Eintrag_Entfernen_%
Gui, Add, Button, vButtonIconSelect gSelectIcon X+20 yp disabled, %_Icon_wählen_%
Gui, Add, Progress, x250 y0 w1 h395 c000000, 100 ;Vertikale Trennlinie
Gui, Add, Progress, x0 y395 w520 h1 c000000, 100 ;Horizontale Trennlinie
Gui, Add, Progress, x0 y0 w520 h1 c000000, 100 ;Abtrennung zum Menü
Gui, Add, Button, x10 y400 h30 vButtonGenerieren gGenerate , %_Installationsdatei_generieren_%
Gui, Add, Checkbox, x160 yp+8 vRestdateienBeibehalten, %_Restdateien_beibehalten_%
GuiControl, Disable, ButtonGenerieren
Gui, Add, Button, x430 yp-8 w80 h30 gGuiClose, %_Schließen_%
Gui, Show,w520 , %_Grundgerüst_% v%AppVersion%



;mit einem Parameter kann man eine Datei beim Aufrufen auswählen
if 1=FastCompile
   if 2
   {
      guicontrol,+default,ButtonGenerieren
      File=%2%
      gosub,FileWurdeSchonMitParameterAngegeben
      ;~ goto,generate
      return
   }
Return

GuiClose:
ExitApp




SpracheÄndern:
WelcheSprache:=A_ThisMenuItem
MsgBox, 52, %_Achtung_%, %_Zum_Ändern_der_Sprache_muss_Grundgerüst_neugestartet_werden__Alle_vorgenommenen_Änderungen_gehen_verloren_%
   ifmsgbox,Yes
   {
      iniwrite,%WelcheSprache%,Einstellungen.ini,Allgemein,Sprache
      Reload
      return
   }
   else
      return


return


MenuHilfe:
IfNotExist, Hilfe/Index.html
{
   MsgBox, 16, %_Fehler_%, %_Es_wurden_keine_Hilfedateien_gefunden_%
   Return
}
Gui, Help:Add, ActiveX, x0 y0 w720 h490 vHB, Shell.Explorer
HB.Navigate(A_ScriptDir . "\Hilfe\Index.html")
Gui, Help:+ToolWindow +LabelHelp
Gui, Help:Color, FFFFFF
Gui, Help:Show, w720 h490, %_Grundgerüst_% - %_hilfe_%
Return

HelpClose:
Gui, Help:Destroy
Return

MenuÜber:
goto,LizenzbedingungenÜber

LizenzbedingungenÜber: ;Label wird beim Kompilieren ersetzt
msgbox,%_Über_%...
return

;Eine Datei als Quellcode-Datei auswählen:
OpenFile:

;Wenn bereits ein anderes AHK Programm geöffnet war, dann neustarten. Das abzufangen, damit dann keine Fehler entstehen ist etwas kompliziert.
if AppDateiName
{
   MsgBox, 52, %_Neuer_Quellcode_%, %_Sie_sind_in_Begriff___%
   ifmsgbox,Yes
   {
      Reload
      return
   }
   else
      return
}

;Datei auswählen:
FileSelectFile, File, 3, ::{20d04fe0-3aea-1069-a2d8-08002b30309d}, Quellcode auswählen, Autohotkey-Scripts (*.ahk)
;Fall der Benutzer abbricht:
If (File = "")
   Return



FileWurdeSchonMitParameterAngegeben:
;Ausgewählte Quellcode-Datei auf folgende Variablen aufteilen:
SplitPath File, Sourcecode, Dir, Ext, NameS, Drive
;   %Sourcecode%:   Dateiname mit Endung
;   %Dir%:      Verzeichnis in dem die Datei liegt.
;   %Ext%:      Dateiendung
;   %NameS%:   Dateiname ohne Endung (für automatische Wahl des Programmnamens)
;   %Drive%:   Laufwerk auf dem die Datei liegt.

;~ ;Wenn zuvor eine Datei ausgewählt war und sich die neue Datei in einem anderen Verzeichnis befindet, wird die gesamte Datei-Auswahl ungültig.
;~ ;Darauf hinweisen:
;~ If ((LastDir != "") and (LastDir != Dir) and (ApFileList != "" or ApDirList != "")){
   ;~ MsgBox, 52, Achtung!, Das ausgewählte Script liegt in einem anderen Verzeichnis als das zuvor ausgewählte. Ihre bisherige Ordner und Datei-Auswahl geht beim Fortfahren verloren!`n`nMöchten sie dieses Script wirklich auswählen?
   ;~ ;Wenn der Benutzer einverstanden ist wird die Datei-Auswahl komplett geleert.
   ;~ Ifmsgbox, no
   ;~ {
      ;~ Dir=%LastDir%
      ;~ Return
   ;~ }
   ;~ else {
      ;~ ApFileList := ""
      ;~ ApDirList := ""
      ;~ GuiControl,, List, |
      ;~ GuiControl,, List, Ordner:|- Keine|%A_Tab%|Dateien:|- Keine
   ;~ }
;~ }

;Prüfen ob es sich um ein AHK-Script handelt:
If (Ext != "ahk") {
   Dir := ""
   MsgBox, 16, %_Fehler_%, %_Bitte_ein_gültiges_Autohotkey_Script_wählen_%
   Return
}

;Datei im Edit-Feld anzeigen:
If (Dir != Drive) {
   GuiControl,, Source, %Drive%\...\%NameS%.%Ext%
} else {
   GuiControl,, Source, %File%
}

;Gegegenenfalls Eintellungen laden:
iniread,ApName,%Dir%\Einstellungen.ini,Grundgerüst,Appname,%a_space%
iniread,ApNameKurz,%Dir%\Einstellungen.ini,Grundgerüst,AppNameKurz,%a_space%
iniread,ApNameLang,%Dir%\Einstellungen.ini,Grundgerüst,AppNameLang,%a_space%
iniread,ApOrdner,%Dir%\Einstellungen.ini,Grundgerüst,AppOrdner,%a_space%
iniread,AutorName,%Dir%\Einstellungen.ini,Grundgerüst,AutorName,%a_space%
iniread,AutorEmail,%Dir%\Einstellungen.ini,Grundgerüst,AutorEmail,%a_space%
iniread,ApVersion,%Dir%\Einstellungen.ini,Grundgerüst,AppVersion,%a_space%
iniread,ApGenaueVersion,%Dir%\Einstellungen.ini,Grundgerüst,AppGenaueVersion,%a_space%
iniread,ApUrlTxtVersion,%Dir%\Einstellungen.ini,Grundgerüst,AppUrlTxtVersion,%a_space%
iniread,ApUrlTxtVersion2,%Dir%\Einstellungen.ini,Grundgerüst,AppUrlTxtVersion2,%a_space%
iniread,ApUrlTxtVersion3,%Dir%\Einstellungen.ini,Grundgerüst,AppUrlTxtVersion3,%a_space%
iniread,ApChangelog,%Dir%\Einstellungen.ini,Grundgerüst,AppChangelog,%a_space%

iniread,ApDirList,%Dir%\Einstellungen.ini,Grundgerüst,AppDirList,%a_space%
iniread,ApFileList,%Dir%\Einstellungen.ini,Grundgerüst,AppFileList,%a_space%
iniread,ApExeList,%Dir%\Einstellungen.ini,Grundgerüst,AppExeList,%a_space%
iniread,ApIconList,%Dir%\Einstellungen.ini,Grundgerüst,AppIconList,%a_space%

if not AutorName
   iniread,AutorName,Einstellungen.ini,Standardwerte,AutorName,%a_space%
if not AutorEmail
   iniread,AutorEmail,Einstellungen.ini,Standardwerte,AutorEmail,%a_space%

;Gui mit geladenen Einstellungen befüllen
GuiControl,,ApName,%ApName%
GuiControl,,ApNameKurz,%ApNameKurz%
GuiControl,,ApNameLang,%ApNameLang%
GuiControl,,ApOrdner,%ApOrdner%
GuiControl,,AutorName,%AutorName%
GuiControl,,AutorEmail,%AutorEmail%
GuiControl,,ApVersion,%ApVersion%
GuiControl,,ApGenaueVersion,%ApGenaueVersion%
GuiControl,,ApUrlTxtVersion,%ApUrlTxtVersion%

;Nach einer bereits modifizierten Datei suchen und gegebenenfalls dort gespeicherte Einstellungen laden; Übergangslösung
if  ApName=
   loop,read,%Dir%\%NameS% modified.ahk
   {
      ifinstring,A_LoopReadLine,Appname=
      {
         StringReplace,ApName,A_LoopReadLine,Appname=
         GuiControl,,ApName,%ApName%
      }
      ifinstring,A_LoopReadLine,AppNameKurz=
      {
         StringReplace,ApNameKurz,A_LoopReadLine,AppNameKurz=
         GuiControl,,ApNameKurz,%ApNameKurz%
      }
      ifinstring,A_LoopReadLine,AppNameLang=
      {
         StringReplace,ApNameLang,A_LoopReadLine,AppNameLang=
         GuiControl,,ApNameLang,%ApNameLang%
      }
      ifinstring,A_LoopReadLine,AppOrdner=
      {
         StringReplace,ApOrdner,A_LoopReadLine,AppOrdner=
         GuiControl,,ApOrdner,%ApOrdner%
      }
      ifinstring,A_LoopReadLine,AppAutorName=
      {
         StringReplace,AutorName,A_LoopReadLine,AppAutorName=
         GuiControl,,AutorName,%AutorName%
      }
      ifinstring,A_LoopReadLine,AppAutorEmail=
      {
         StringReplace,AutorEmail,A_LoopReadLine,AppAutorEmail=
         GuiControl,,AutorEmail,%AutorEmail%
      }
      ifinstring,A_LoopReadLine,AppVersion=
      {
         StringReplace,ApVersion,A_LoopReadLine,AppVersion=
         GuiControl,,ApVersion,%ApVersion%
      }
      ifinstring,A_LoopReadLine,AppGenaueVersion=
      {
         StringReplace,ApGenaueVersion,A_LoopReadLine,AppGenaueVersion=
         GuiControl,,ApGenaueVersion,%ApGenaueVersion%
      }
      ifinstring,A_LoopReadLine,AppUrlTxtVersion:=
      {
         StringReplace,ApUrlTxtVersion,A_LoopReadLine,AppUrlTxtVersion:="
         Stringtrimright,ApUrlTxtVersion,ApUrlTxtVersion,1
         GuiControl,,ApUrlTxtVersion,%ApUrlTxtVersion%
      }
      ifinstring,A_LoopReadLine,AppUrlTxtVersion2:=
      {
         StringReplace,ApUrlTxtVersion2,A_LoopReadLine,AppUrlTxtVersion2:="
         Stringtrimright,ApUrlTxtVersion2,ApUrlTxtVersion2,1
         GuiControl,,ApUrlTxtVersion2,%ApUrlTxtVersion2%
      }
      ifinstring,A_LoopReadLine,AppUrlTxtVersion3:=
      {
         StringReplace,ApUrlTxtVersion3,A_LoopReadLine,AppUrlTxtVersion3:="
         Stringtrimright,ApUrlTxtVersion3,ApUrlTxtVersion3,1
         GuiControl,,ApUrlTxtVersion3,%ApUrlTxtVersion3%
      }
      ifinstring,A_LoopReadLine,AppDirList=
      {
         StringReplace,ApDirList,A_LoopReadLine,AppDirList=
      }
      ifinstring,A_LoopReadLine,AppFileList=
      {
         StringReplace,ApFileList,A_LoopReadLine,AppFileList=
      }
      ifinstring,A_LoopReadLine,AppExeList=
      {
         StringReplace,ApExeList,A_LoopReadLine,AppExeList=
      }
      ifinstring,A_LoopReadLine,AppIconList=
      {
         StringReplace,ApIconList,A_LoopReadLine,AppIconList=
      }
      ifinstring,A_LoopReadLine,#NoEnv ;jetzt kommt der Code
         break
   }


;Automatisch den Programmnamen ändern, es sei denn, der Benutzer hat selbst eine Änderung am letzten Vorschlag vorgenommen:
;   In diesem Fall stimmt %ApName% (Inhalt des Edit-Felds) nämlich nicht mehr mit %lastApName% überein.
Gui, Submit, NoHide
If (AppDateiName == "") {
   AppDateiName=%NameS%
   if ApName=
      ApName=%NameS%
   GuiControl,, ApName, %ApName%
}



;wenn keine Exe ausgewählt sind, dann die drei Grudgerüst-Exe hinzufügen.
if not ApExeList
ApExeList=|%AppDateiName%|Update Checker|
   
gosub,GuiListAktualisieren





Return








;Eine Datei zu %ApFileList% hinzufügen:
AddFile:

;Eine Datei auswählen:
FileSelectFile, NewFiles, M3, %Dir%, %_Dateien_hinzufügen_%
;Falls der Benutzer abbricht:
If (NewFiles = "")
   Return

;Da es möglich ist, mehrere Dateien auf einmal auszuwählen müssen die Dateien erstmal in verschiedenen Variablen gespeichert werden:
Loop, Parse, NewFiles, `n
{
   If (A_Index = 1)
      NewDir := A_LoopField
   else {
   count := A_Index - 1
   File%count% := A_LoopField
   }
}

;Überprüfen ob sich die gewählten Dateien in %Dir% oder einem Unterordner befinden.
IfNotInString NewDir, %Dir%
{
   MsgBox, 16, %_Fehler_%, %_Zugehörige_Dateien_müssen_sich_im_Pfad_des_Quellcodes_oder_einem_Unterordner_befinden_%
   Return
}

;%Dir% aus dem absoluten Pfad des Ordners, in dem die Dateien liegen, entfernen.
;   Siehe AddDir Subroutine.
StringReplace, NewDir, NewDir, %Dir%\

;Für jede der aus gewählten Dateien folgendes ausführen:
Loop %count%
{
   ;Falls die Datei in %Dir% liegt, wird der Dateiname zur Liste hinzugefügt.
   ;Falls sie in einem Unterordner liegt, wird der Pfad des Unterordners vor den Dateinamen gesetzt:
   NewFile := (NewDir = Dir) ? File%A_Index% : NewDir . "\" . File%A_Index%

   ;Falls die Quellcode-Datei ausgewählt wurde oder sich mit in der Auswahl mehrerer Dateien befindet, Fehlermeldung:
   If (NewFile == Sourcecode) {
      If (count = 1)
         MsgBox, 64, %_Information_%, %_Das_Quellcode_Script_kann_nicht_zur_Auswahl_hinzugefügt_werden_%
      else
         MsgBox, 64, %_Information_%, %_Die_Datei___konnte_nicht_zur_Auswahl_hinzugefügt_werden_da_diese_Datei_das_Quellcode_Script_ist_1%%NewFile%%_Die_Datei___konnte_nicht_zur_Auswahl_hinzugefügt_werden_da_diese_Datei_das_Quellcode_Script_ist_2%
      continue
   }
   If (NewFile = "lizenz.txt") {
         MsgBox, 64, %_Information_%, %_Die_Datei___konnte_nicht_zur_Auswahl_hinzugefügt_werden_da_diese_Datei_die_Standard_Lizenzdatei_des_Installers_ist_1%%NewFile%%_Die_Datei___konnte_nicht_zur_Auswahl_hinzugefügt_werden_da_diese_Datei_die_Standard_Lizenzdatei_des_Installers_ist_2%
      continue
   }
   ;Datei in %ApFileList% integrieren:
   ;Falls %ApFileList% noch komplett leer ist, die Datei als ersten Eintrag speichern, ansonsten hinten ranhängen:
   If (ApFileList = "")
      ApFileList=|%NewFile%|
   else {
      IfNotInString, ApFileList, |%NewFile%|
         ApFileList=%ApFileList%%NewFile%|
   }
}

;Falls die Dateien in einem Unterordner lagen:
;Prüfen ob der Unterordner sich bereits in %ApDirList% befindet. Wenn nicht, wird er hinzugefügt:
If not (NewDir = Dir)
{
   If (ApDirList = "")
      ApDirList=|%NewDir%|
   else {
      IfNotInString, ApDirList, |%NewDir%|
         ApDirList=%ApDirList%%NewDir%|
   }
}

gosub,GuiListAktualisieren
Return








;Einen Ordner zu %ApDirList% hinzufügen:
AddDir:

;Einen Ordner auswählen:
;   (%Dir% enthält den Pfad in dem die Quellcode-Datei liegt.)
FileSelectFolder NewDir, %Dir%, 0, %_Ordner_hinzufügen_%
;Falls der Benutzer abbricht:
If (NewDir = "")
   Return

;Prüfen ob es sich wirklich um einen Unterordner von %Dir% handelt.
IfNotInString NewDir, %Dir%
{
   MsgBox, 16, %_Fehler_%, %_Der_Ordner_muss_sich_im_Pfad_des_Quellcodes_oder_einem_Unterordner_befinden_%
   Return
}

;%Dir% aus dem absolutem Pfad des ausgewählten Ordners entfernen:
;   Beispiel:
;   Die Quellcode-Datei liegt in "C:\AHK"
;   Der Ordner "C:\AHK\Ordner" wird ausgewählt
;   Aus "C:\AHK\Ordner" das "C:\AHK\" entfernen --> "Ordner" bleibt übrig und wird in der Liste gespeichert:
StringReplace, NewDir, NewDir, %Dir%\

;Falls es sich bei dem ausgewähltem Ordner um das Grundverzeichnis (%Dir%) handelt, abbrechen:
If (NewDir = Dir)
   Return

;Den ausgewählten Ordner an %ApDirList% hinten anhängen:
;Falls %ApDirList% noch komplett leer ist, den neuen Ordner als ersten Eintrag speichern, ansonsten hinten ranhängen:
If (ApDirList = "")
   ApDirList=|%NewDir%|
else {
   IfNotInString, ApDirList, |%NewDir%|
      ApDirList=%ApDirList%%NewDir%|
}

;%setting% bestimmt ob die Dateien im ausgewählten Ordner mit zur Auswahl hinzugefügt werden sollen.
;Wenn dies der Fall ist, wird in einem Loop der den Ordner ausliest für jede Datei wie in der AddFile Subroutine vorgegangen:
Gui, Submit, NoHide
If setting
{
   Loop, %Dir%\%NewDir%\*.*, 0, 0
   {
      StringReplace, NewFile, A_LoopFileLongPath, %Dir%\
      If (ApFileList = "")
         ApFileList=|%NewFile%|
      else {
         IfNotInString, ApFileList, |%NewFile%|
            ApFileList=%ApFileList%%NewFile%|
      }
      If (A_Index = 25)
         ToolTip %_Bitte_Warten_%
   }
   ToolTip
}
gosub,GuiListAktualisieren
return



AddExe:
;Eine Datei auswählen:
FileSelectFile, NewFiles, M3, %Dir%, %_Zu_kompilierende_Skripte_hinzufügen_%,Autohotkey-Scripts (*.ahk)
;Falls der Benutzer abbricht:
If (NewFiles = "")
   Return

;Da es möglich ist, mehrere Dateien auf einmal auszuwählen müssen die Dateien erstmal in verschiedenen Variablen gespeichert werden:
Loop, Parse, NewFiles, `n
{
   If (A_Index = 1)
      NewDir := A_LoopField
   else {
   count := A_Index - 1
   File%count% := A_LoopField
   }
}

;Überprüfen ob sich die gewählten Dateien in %Dir% oder einem Unterordner befinden.
IfNotInString NewDir, %Dir%
{
   MsgBox, 16, %_Fehler_%, %_Zugehörige_Dateien_müssen_sich_im_Pfad_des_Quellcodes_oder_einem_Unterordner_befinden_%
   Return
}

;%Dir% aus dem absoluten Pfad des Ordners, in dem die Dateien liegen, entfernen.
;   Siehe AddDir Subroutine.
StringReplace, NewDir, NewDir, %Dir%\

;Für jede der aus gewählten Dateien folgendes ausführen:
Loop %count%
{
   ;Falls die Datei in %Dir% liegt, wird der Dateiname zur Liste hinzugefügt.
   ;Falls sie in einem Unterordner liegt, wird der Pfad des Unterordners vor den Dateinamen gesetzt:
   NewFile := (NewDir = Dir) ? File%A_Index% : NewDir . "\" . File%A_Index%

 
   stringtrimright,newfile,newfile,4 ;Dateiendung entfernen
   ;Datei in %ApExeList% integrieren:
   ;Falls %ApExeList% noch komplett leer ist, die Datei als ersten Eintrag speichern, ansonsten hinten ranhängen:
   If (ApExeList = "")
      ApExeList=|%NewFile%|
   else {
      IfNotInString, ApExeList, |%NewFile%|
         ApExeList=%ApExeList%%NewFile%|
   }
}

;Falls die Dateien in einem Unterordner lagen:
;Prüfen ob der Unterordner sich bereits in %ApDirList% befindet. Wenn nicht, wird er hinzugefügt:
If not (NewDir = Dir)
{
   If (ApDirList = "")
      ApDirList=|%NewDir%|
   else {
      IfNotInString, ApDirList, |%NewDir%|
         ApDirList=%ApDirList%%NewDir%|
   }
}

gosub,GuiListAktualisieren
return

SelectIcon:
;wenn bereits ein Icon zugeordnet ist, zugeordnetes Icon löschen
IconZurExe:=IconZurExeRausfinden(list)
if IconZurExe
{
   stringreplace,ApIconList,ApIconList,|%List%#%IconZurExe%|,|
   if ApIconList=|
      ApIconList=
   return
}


;Eine Datei auswählen:
FileSelectFile, NewFile, 3, %dir%, %_Icon_Datei_für_den_Skript___auswählen_1%%List%%_Icon_Datei_für_den_Skript___auswählen_2%,Icons (*.ico)
;Falls der Benutzer abbricht:
If (NewFile = "")
   Return

;Falls Icon im Unterordner, relativen Pfad draus machen
StringReplace,NewFile,NewFile,%dir%\
   
;Icon mit gewähltem Eintrag verknüpfen
If (ApIconList = "")
   ApIconList=|%List%#%NewFile%|
else {
   IfNotInString, ApIconList, |%List%#
      ApIconList=%ApIconList%%List%#%NewFile%|
   else
   {
      IconZurExe:=IconZurExeRausfinden(List)
      stringreplace,ApIconList,ApIconList,#%IconZurExe%|,#%NewFile%|
   }
   
}


gosub,GuiListAktualisieren

return


GuiListAktualisieren:
;Inhalte von %ApDirList% und %ApFileList% in der Liste anzeigen:
insert1 := (ApDirList = "") ? "|<Keine>|" : ApDirList
insert2 := (ApFileList = "") ? "|<Keine>|" : ApFileList
insert3 := (ApExeList = "") ? "|<Keine>|" : ApExeList
GuiControl,, List, |
GuiControl,, List, --- %_Ordners_%: ---%insert1%%A_Tab%|--- %_Dateien_%: ---%insert2%%A_Tab%|--- %_Skripte_kompilieren_%: ---%insert3%|
Return








;Die RemoveItem Subroutine entfernt den ausgewählten Eintrag der Datei-Auswahl aus der Liste:
RemoveItem:
ToolTip
Gui, Submit, NoHide

;Falls der Eintrag eine Datei ist, aus %ApFileList% löschen:
IfInString, ApFileList, |%List%|
   StringReplace, ApFileList, ApFileList, |%List%|, |

;Falls der Eintrag ein Ordner ist, aus %ApDirList% löschen:
;   (Vorher darauf hinweisen das auch alle Dateien aus dem Ordner aus der Liste entfernt werden)
IfInString, ApDirList, |%List%|
{
   MsgBox, 52, %_Achtung_%, %_Alle_Dateien_die_aus_diesem_Ordner_stammen_werden_ebenfalls_aus_der_Auswahl_entfernt_%
   IfMsgBox no
      Return
   ;Alle Dateien aus dem zu entfernendem Ordner aus %ApFileList% entfernen:
   Loop, Parse, ApFileList, |
   {
      If ((SubStr(A_LoopField, 1, StrLen(List))) == List)
         StringReplace, ApFileList, ApFileList, |%A_LoopField%|, |
   }
   ;Den anfangs ausgewählten Ordner aus %ApDirList% entfernen:
   StringReplace, ApDirList, ApDirList, |%List%|, |
}



ifinstring,ApExeList,|%List%| 
{
   if (List="Update Checker" or List=AppDateiName)
   {
      MsgBox, 16, %_Fehler_%, %_Diese_Datei_gehört_zum_Grundgerüst_und_kann_nicht_entfernt_werden_%.
      return
   }
   StringReplace, ApExeList, ApExeList, |%List%|, |
   
}


;Wenn der letzte Eintrag aus %ApFileList% oder %ApDirList% entfernt wurde, bleibt nur ein | in der Variable zurück.
;In diesem Falle, die betroffene(n) Variablen wieder leeren:
If (ApDirList = "|")
   ApDirList := ""
If (ApFileList = "|")
   ApFileList := ""
If (ApExeList = "|")
   ApExeList := ""

;Inhalte von %ApDirList% und %ApFileList% in der Liste anzeigen:
gosub,GuiListAktualisieren
Return  





;Findet raus, welcher Icon zur Liste verknüpft wurde.
IconZurExeRausfinden(exe)
{
   global
   loop,parse,ApIconList,|
   {
      IfINstring,a_loopfield,%exe%
      {
         stringgetpos,pos,a_loopfield,#
         stringtrimleft,IconzurExe,a_loopfield,(pos + 1)
         return IconzurExe
      }
      
   }

   return
}





;Ein ToolTip mit dem Namen des ausgewählten Eintrages der Datei-Auswahl anzeigen. (Für lange Pfade und Dateinamen):
ShowItem:
Gui, Submit, NoHide
;Falls ein ungültiger Eintrag (z.B. "--- Ordner: ---" oder "<Keine>") gewählt wurde, ToolTip ausschalten:
If not (List == A_Tab or List == "--- %_Ordners_%: ---" or List == "--- %_Dateien_%: ---" or List == "--- %_Skripte_kompilieren_%: ---" or List == "<%_Keine_%>")
{
   ifinstring,ApExeList,|%List%| ;zu jeder Exe zusätzlich den dazugehörigen Icon zeigen
   {
      IconZurExe:=IconZurExeRausfinden(List)
      if IconZurExe=
         IconZurExe= <%_Kein_Icon_%>
      settimer,RemoveTooltip,-2000
      ToolTip, %List% --- %_Icon_%: %IconZurExe%
   }
   else
   {
      settimer,RemoveTooltip,-2000
      ToolTip, %List%
   }
}
else
   ToolTip
Return

RemoveTooltip:
ToolTip
return





;Die Check Subroutine regelt mehrere Dinge:
Check:

;Die Buttons "+ Datei", "+ Button" und "+ Exe" werden freigeschaltet, sobald ein Quellcode und somit auch das Grundverzeichnis festgelegt wird:
If (Dir != "") {
   GuiControl, Enable, AddFileB
   GuiControl, Enable, AddDirB
   GuiControl, Enable, AddExeB
}

;Der "Eintrag Entfernen-Button" wird erst freigeschaltet, wenn ein gültiger Eintrag ausgewählt wird:
;   (ungültige Einträge sind z.B. "--- Ordner: ---" oder "<Keine>"
Gui, Submit, NoHide
If not (List == A_Tab or List == "--- %_Ordners_%: ---" or List == "--- %_Dateien_%: ---" or List == "--- %_Skripte_kompilieren_%: ---" or List == "<%_Keine_%>" or List =="") ;Eintrag gültig?
{
   ifinstring,ApExeList,|%List%| ;Exe-Datei gewählt?
   {
      GuiControl,Enable,ButtonIconSelect
      
      IconZurExe:=IconZurExeRausfinden(list) ;Bereits ein Icon zugeordnet?
      if IconZurExe
         GuiControl,,ButtonIconSelect,%_Icon_löschen_%
      else
         GuiControl,,ButtonIconSelect,%_Icon_wählen_%
      
   }
   else
      GuiControl,Disable,ButtonIconSelect
   
   GuiControl, Enable, ButtonRemoveItem
   
   
}
else
{
   GuiControl, Disable, ButtonRemoveItem
   GuiControl,Disable,ButtonIconSelect
}


;Der "Installationsdatei Generieren-Button" wird freigeschaltet, solange alle Felder auf der linken Seite ausgefüllt sind:
If not (Source = "" or ApName = "" or ApNameKurz = "" or ApNameLang = "" or ApOrdner = "" or AutorName = "" or AutorEmail = "" or ApVersion = "" or ApGenaueVersion = "" or ApUrlTxtVersion = "")
   GuiControl, Enable, ButtonGenerieren
else
   GuiControl, Disable, ButtonGenerieren
Return



#include %a_scriptdir%
#include Unterskripte\Generate.ahk
#include Unterskripte\Einstellungen.ahk
#include Unterskripte\language.ahk