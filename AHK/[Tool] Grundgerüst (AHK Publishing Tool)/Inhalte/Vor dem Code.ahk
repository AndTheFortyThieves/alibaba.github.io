#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

goto,LizenzbedingungenÜberspringen
LizenzbedingungenÜber:


Gui, 22:destroy
gui, 22:+owner  
Gui, 22:Add,edit, vübertext  readonly, %AppNameLang% v%AppGenaueVersion%`nGeschrieben von _AutorName_.`nEmail: _AutorEmail_`nVerwendete Skriptsprache: AutoHotkey`nLizenziert unter GNU General Public License v3`n`nDieses Programm ist freie Software. Sie können es unter den Bedingungen der GNU General Public License,`nwie von der Free Software Foundation veröffentlicht, weitergeben und/oder modifizieren, entweder gemäß`nVersion 3 der Lizenz oder (nach Ihrer Option) jeder späteren Version.`nDie Veröffentlichung dieses Programms erfolgt in der Hoffnung, daß es Ihnen von Nutzen sein wird,`naber OHNE IRGENDEINE GARANTIE, sogar ohne die implizite Garantie der MARKTREIFE oder der`nVERWENDBARKEIT FÜR EINEN BESTIMMTEN ZWECK. Details finden Sie in der GNU General Public License.

Gui, 22:Add, Button, g22ButtonSchließen  +default w100 h30 , Schließen
Gui, 22:Add, Button, g22ButtonLizenz yp xp+110 w100 h30 , Lizenz zeigen
Gui, 22:Show,, Über



send,{right}
return

22ButtonSchließen:
22GuiClose:
Gui, 22:destroy
return

22ButtonLizenz:
run,Lizenz.txt
return




LizenzbedingungenÜberspringen: ;die Anzeige von Lizentbedingungen überspringen








if 0>0 ;Wenn ein Parameter übergeben wurde.
{
	if 1=UpdateCheck ;Wenn das Programm von Update Checker aufgerufen wurde
	{
		;Update Checker aufrufen und ihm Programminfos als Parameter übergeben
		run, Update Checker.exe "laut" "%AppVersion%" "%AppGenaueVersion%" "%AppName%" "%AppNameLang%" "%A_ScriptName%" "%AppUrlTxtVersion%" "%AppUrlTxtVersion2%" "%AppUrlTxtVersion3%" 
		exitapp
		
	}
	
	if 1=ProgrammGenerieren ;wenn das Installationsprogramm generiert werden soll
	{
		;Programmgenerator aufrufen und ihm Programminfos als Parameter übergeben
		run, Installationsdatei generieren.ahk "ProgrammGenerieren" "%AppVersion%" "%AppGenaueVersion%" "%AppName%" "%AppNameLang%" "%A_ScriptName%" "%AppUrlTxtVersion%" "%AppOrdner%"
		exitapp
	}
	
	
	
}

;In den Einstellungen kann mit entsprechendem Eintrag die Überprüfung auf Updates beim Start unterbunden werden. Idealerweise im Hauptprogramm einstellbar.
iniread,setObAufUpdatesPrüfen,Einstellungen.ini,Allgemein,Auf Updates Prüfen,1 ;Standardmäßig prüfen, wenn nix da steht
if setObAufUpdatesPrüfen=1 ;Wenn Update Funktion nicht abgeschaltet
{
	;Update Checker aufrufen und ihm Programminfos als Parameter übergeben. Sagen, dass er leise sein soll.
	run, Update Checker.exe "leise" "%AppVersion%" "%AppGenaueVersion%" "%AppName%" "%AppNameLang%" "%A_ScriptName%" "%AppUrlTxtVersion%" "%AppUrlTxtVersion2%" "%AppUrlTxtVersion3%" 
}


;_Jetzt kommt der Code_