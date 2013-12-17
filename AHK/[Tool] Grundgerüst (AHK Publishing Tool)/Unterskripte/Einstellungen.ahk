MenuStandardsSetzen:

Gui,hide

Gui 2:default

iniread,StandardAutorName,Einstellungen.ini,Standardwerte,AutorName,%a_space%
iniread,StandardAutorEmail,Einstellungen.ini,Standardwerte,AutorEmail,%a_space%

gui,add,text,,%_Tragen_Sie_hier_die_Standardwerte_für_neue_Projekte_ein_%:
Gui, Add, Text, x15 Y+10, %_Autor_%:
Gui, Add, Edit, x105 yp vStandardAutorName w160,%StandardAutorName%
Gui, Add, Text, x15 yp+25, %_Email_%:
Gui, Add, Edit, x105 yp vStandardAutorEmail w160,%StandardAutorEmail%
gui,add,button,x15 Y+10 w120 h25 g2OK,%_OK_%
gui,add,button,X+10 yp w120 h25 g2Abbrechen,%_Abbrechen_%

gui,show,,%_Standardwerte_setzen_%

return
2OK:
gui,submit
iniwrite,%StandardAutorName%,Einstellungen.ini,Standardwerte,AutorName
iniwrite,%StandardAutorEmail%,Einstellungen.ini,Standardwerte,AutorEmail


2Abbrechen:
2GuiClose:
gui destroy
gui 1:default
gui show,restore
return



ButtonErweiterteInformationen:
gui,hide

Gui, 3:Default

stringreplace,ApChangelogZumZeigen,ApChangelog,``n,`n,all ;Zeilenumbrüche fixen

Gui, Add, Text, x15 y15, %_Update_Abgleich_% 2:
Gui, Add, Edit, x120 yp w200 vApUrlTxtVersion2,%ApUrlTxtVersion2%
Gui, Add, Text, x15 yp+25, %_Update_Abgleich_% 3:
Gui, Add, Edit, x120 yp w200 vApUrlTxtVersion3,%ApUrlTxtVersion3%
gui, Add, Text, x15 yp+25, %_Changelog_%:
Gui, Add, Edit, x120 yp w200 h80 vApChangelog,%ApChangelogZumZeigen%
gui, add, Button, x15 yp+30 w95 g3ButtonEintragHinzufügen , %_Eintrag_hinzufügen_%



gui, add, Button, x15 y150 w100 h30 v3ok g3OK +default, %_OK_%
gui, add, button, X+10 yp w100 h30 g3Abbrechen, %_Abbrechen_%

guicontrol,focus,3ok
gui,show,,Erweiterte Informationen
return

3OK:
gui,submit
StringReplace,ApChangelog,ApChangelog,`n,``n,all ;Zeilenumbrüche fixen

3Abbrechen:
3guiclose:
gui destroy
gui 1:default
gui show,restore
sleep,100
gui show

return

3ButtonEintragHinzufügen:
gui,1:submit,nohide
gui,submit,nohide
ApChangelog=%ApGenaueVersion%`n`n`n%ApChangelog%
guicontrol,,ApChangelog,%ApChangelog%

return





