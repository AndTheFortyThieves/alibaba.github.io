#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
;~ #Warn  ; Recommended for catching common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

modus=%1% ;Parameter in Variable

if modus<>laut ;Wenn der Update Checker nicht vom Hauptprogramm gestartet wurde. (Das Hauptprogramm teilt über Parameter mit, ob leise oder laut)
if modus<>leise
{
;Hauptprogramm aufrufen und auffordern, die Update-Infos zu übergeben
run,_AppDateiName_.exe "UpdateCheck"	 ;Programmname wird von Grundgerüst ersetzt
	
ExitApp	
}



; Die vom Hauptprogramm übergebenen Update Informationen (Als Parameter) in leserlichen Variablen speichern
AppVersion=%2%
AppGenaueVersion=%3%
AppName=%4%
AppNameLang=%5%
AppDateiName=%6%
stringtrimright,AppDateiName,AppDateiName,4 ;Dateiendung entfernen
AppUrlTxt1=%7%
AppUrlTxt2=%8%
AppUrlTxt3=%9%

;~ msgbox,%1% %2% %3% %4% %5% %6% %7% %8% %9%;Debugging
	

if modus=laut ;Wenn leise, keine Meldung zeigen
	splashtexton,300,70,Update Checker für %AppName%,Lade Update-Informationen für %AppNameLang% herunter

FileDelete,%A_WorkingDir%\Online verfügbare Version.txt ;Alte Dateien löschen

;Ermittelt die Anzahl der mitgegebenen Update-Info-URLs
AnzahlvonTxtUrls=0
ifinstring, AppUrlTxt1,http
	AnzahlvonTxtUrls++
ifinstring, AppUrlTxt2,http
	AnzahlvonTxtUrls++
ifinstring, AppUrlTxt3,http
	AnzahlvonTxtUrls++

;Lade Version herunter
DownloadedVersion=0
if modus=laut ;Wenn laut, dann alle URLs Checken
{
	loop %AnzahlvonTxtUrls%
	{
		TempDownloadURL:=AppUrlTxt%a_index%
		URLDownloadToFile,%TempDownloadURL%,%A_WorkingDir%\Online verfügbare Version.txt ;Txt file mit den Update Informationen runterladen
		
		
		
		;Txt File Auslesen. Wenn die Datei korrupt ist, dann wird error gespeichert.
		iniread,TempDownloadedVersion,%A_WorkingDir%\Online verfügbare Version.txt,Update Info,Version,error 
		iniread,TempAppUpdateExe,%A_WorkingDir%\Online verfügbare Version.txt,Update Info,Download Path,error
		iniread,TempWebseiteÖffnen,%A_WorkingDir%\Online verfügbare Version.txt,Update Info,Open Site,error
		;~ msgbox,%DownloadedVersion%,%AppUpdateExe%
		
		if TempDownloadedVersion<>error
		{
			;~ msgbox
			ifinstring,TempDownloadedVersion,.
			{
				;~ msgbox
				if (TempDownloadedVersion>DownloadedVersion)
				{
					DownloadedVersion:=TempDownloadedVersion
					AppUpdateExe:=TempAppUpdateExe
					WebseiteÖffnen:=TempWebseiteÖffnen
					
				}
				
				
			}
		}
		
		;~ msgbox,%DownloadedVersion%`n%GrößteDownloadedVersion%
		
	}
}
else ;Wenn leise, dann eine zufällige URL checken
{
	random,zahl,1,%AnzahlvonTxtUrls%
	TempDownloadURL:=AppUrlTxt%zahl%
	URLDownloadToFile,%TempDownloadURL%,%A_WorkingDir%\Online verfügbare Version.txt ;Txt file mit den Update Informationen runterladen
	
	
	
	;Txt File Auslesen. Wenn die Datei korrupt ist, dann wird error gespeichert.
	iniread,TempDownloadedVersion,%A_WorkingDir%\Online verfügbare Version.txt,Update Info,Version,error 
	iniread,TempAppUpdateExe,%A_WorkingDir%\Online verfügbare Version.txt,Update Info,Download Path,error
	iniread,TempWebseiteÖffnen,%A_WorkingDir%\Online verfügbare Version.txt,Update Info,Open Site,error
	;~ msgbox,%DownloadedVersion%,%AppUpdateExe%
	
	if TempDownloadedVersion<>error
	{
		ifinstring,TempDownloadedVersion,.
		{
			DownloadedVersion:=TempDownloadedVersion
			AppUpdateExe:=TempAppUpdateExe
			WebseiteÖffnen:=TempWebseiteÖffnen
			
			
		}
	}
	
}

SplashTextOff
if DownloadedVersion=0
{
	if modus=laut ;Wenn leise, keine Meldung zeigen
		msgbox,0,Update Checker für %AppName%,Beim Download der Updateinformationen trat ein Fehler auf.
	exitapp
}




if DownloadedVersion<>error ;Prüfen, ob die heruntergeladene korrekt ist.
{
	If(DownloadedVersion>AppGenaueVersion) ;Wenn Gedownloadete Version grösser als jetzige dann... 
	{

		
		MsgBox, 68, Update Checker für %AppName%, Eine neue Version von %AppNameLang% ist verfügbar!`nMöchten Sie sie jetzt herunterladen?`n`nAktuelle Version:`tVerfügbare Version:`n%AppGenaueVersion% `t`t%DownloadedVersion%
		
		IfMsgBox,yes ;Nur wenn benutzer zustimmt
		{		
			process,close,%AppDateiName%.exe ;Programm wird geschlossen.
			FileDelete,%A_WorkingDir%\Online verfügbare Version.txt ;Die Datei mit der Versionsnummer löschen, weil sie nicht mehr benötigt wird
			
			
			if AppUpdateExe<>error ;Wenn ein Download Link in der Textdatei vorhanden war.
			{
				splashtexton,300,70,Update Checker,Download der neuen Version...
				FileDelete,%A_WorkingDir%\%AppDateiName%_Installation.exe ;Alte Installationsdatei löschen (Falls vorhanden)
				URLDownloadToFile,%AppUpdateExe% ,%A_WorkingDir%\%AppDateiName% Installation.exe ;lade Installationsdatei runter
				SplashTextOff
				if errorlevel=0 ;Wenn alles glatt lief
				{
					Msgbox,0,Update Checker für %AppName%, Download erfolgreich `,Die neue Version wurde erfolgreich heruntergeladen. Installation wird gestartet... , 2
					run,"%A_WorkingDir%\%AppDateiName% Installation.exe" ;Installation starten
				}
				else ;Wenn Download fehl schlägt
				{
					if WebseiteÖffnen<>error ;Wenn eine Webseite drin stand
					{
						Msgbox,0,Update Checker für %AppName%, Download schlug fehl. Stattdessen wird jetzt die Projektseite geöffnet.
						run, %WebseiteÖffnen% ;Webseite öffnen
					}
					else ;Wenn keine Seite drin steht, pech
					{
						Msgbox,0,Update Checker für %AppName%, Download schlug fehl. Vielleicht klappt es, wenn Sie es erneut versuchen.
					}
				}
			}
			else ;Wenn kein Download Link drin steht
			{
				if WebseiteÖffnen<>error ;Wenn stattdessen ein Webseiten Link drin steht
				{
					run, %WebseiteÖffnen% ;Webseite öffnen
				}
				else ;Wenn nix drin steht, pech
				{
					msgbox,0,Update Checker für %AppName%, In der Heruntergeladenen Update-Info steht nicht, wo sich die neue Version befindet. Download nicht möglich.
				}
			}
			
		}
		
	}
	Else ;Keine neuere Version verfügbar
	{
		
		if modus=laut ;Wenn leise, keine Meldung zeigen
			MsgBox, 0,Update Checker für %AppName%, Keine neue Version verfügbar.`nAktuelle Version:	%AppGenaueVersion%`nVerfügbare Version:	%DownloadedVersion%
		FileDelete,%A_WorkingDir%\Online verfügbare Version.txt ;Die Datei mit der Versionsnummer löschen, weil sie nicht mehr benötigt wird
		
	}
}
else ;txt defekt.
{
	if modus=laut ;Wenn leise, keine Meldung zeigen
		msgbox,0,Update Checker für %AppName%,Es trat ein Fehler auf. Möglicherweise ist der im Programm gespeicherte Link zu den Update Informationen korrupt. Es könnte sein, dass dennoch eine neue Version verfügbar ist.
}
ExitApp