SetWorkingDir,%a_scriptdir%

Gui, Add,edit, vübertext  readonly, _AppShortLicenseDescription_
 
 
 Gui, Add,text,,Stimmen Sie den Lizenzbedingungen zu?
 Gui, Add, Button, gLizenzButtonIchStimmeZu   w100 h30 , Ja, ich stimme zu
 Gui, Add, Button, vLizenzButtonNein gLizenzButtonNein +default yp xp+110 w100 h30 , Nein
 Gui, Add, Button, gLizenzButtonLizenz yp xp+110 w100 h30 , Lizenz zeigen
 gui, add, button, gLizenzButtonChangelog yp X+10 w100 h30, Changelog
 Gui, Show,, Lizenzbedingungen




guicontrol,focus,LizenzButtonNein
return

LizenzButtonSchließen:
LizenzButtonNein:
GuiClose:
ExitApp
return

LizenzButtonLizenz:
fileinstall,Lizenz.txt,%A_Temp%\Lizenz.txt,1
run,%A_Temp%\Lizenz.txt
return

LizenzButtonChangelog:
gui, +Disabled
gui, 2:default
gui, +alwaysontop
gui,add,edit,x10 y10 w300 h200 readonly,_AppChangelog_
gui,add,button, x100 Y+10 w100 h30 +default vLizenz2ButtonOK gLizenz2ButtonOK, OK
gui,show,,Changelog

guicontrol,focus,Lizenz2ButtonOK
return

Lizenz2ButtonOK:
gui,destroy
gui 1:default
gui, -disabled
sleep,100
gui show
return



LizenzButtonIchStimmeZu:
filedelete,%A_Temp%\Lizenz.txt ;Da wir sauber arbeiten und den PC nicht zumüllen wollen :-)
gui,destroy



;Nun wird nach dem Programm gesucht, um eventuell ein Update durchzuführen
DateiImUnterordner:=fileexist("_AppOrdner_\_AppDateiName_.exe") ;Schauen, ob das Programm sich im Unterordner befindet
if DateiImUnterordner<> ;Wenn Datei existiert, wird im Unterordner installiert,...
ObInUnterornder=true

DateiImOrdner:=fileexist("_AppDateiName_.exe") ;Schauen, ob das Programm sich in diesem Ordner befindet


;Nun wissen wir, ob wir das Programm neu installieren oder nur Updaten wollen
if (DateiImUnterordner="" and DateiImOrdner="")
{
   ObInUnterornder=true ;Wenn Neuinstallation, dann in Unterordner installieren

   MsgBox, 1, _AppNameLang_ v_AppVersion_ Installer, Dieser Installer installiert _AppName_ in den Ordner "_AppOrdner_".`n`nWenn Sie bereits _AppName_ benutzen und ihre Version aktualisieren wollen`, dann verschieben Sie den Installer in den Ordner von _AppName_ und starten Sie ihn dort.`n`nWenn Sie _AppName_ das erste mal installieren, dann klicken Sie auf OK.
}
Else
MsgBox, 1, _AppNameLang_ v_AppVersion_ Installer, Dieser Installer Aktualisiert _AppName_ auf die Version _AppGenaueVersion_.`nKlicken Sie zum Fortfahren auf OK.

IfMsgBox,cancel
exitapp


_GuiInstallationsStatus_


if ObInUnterornder=true
{

   filecreatedir,%a_workingdir%\_AppOrdner_ ;Unterordner erstellen (notwendig für Erstinstallation)
   SetWorkingDir,%a_workingdir%\_AppOrdner_ ;Pfad ändern
}


_OrdnerInstallieren_

_DateienInstallieren_




MsgBox, 0, _AppNameLang_ v_AppVersion_ Installer, Installation erfolgreich!`nFalls eine Meldung von Windows kommt`, dass das Programm eventuell nicht richtig installiert wurde`, dann ignorieren Sie diese.



exitapp