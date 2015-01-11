Funktionen
----------
Einige Beispiele:
X,Y,Z und dann senden

Im Serial Monitor folgendes eingeben und Senden drücken:
 
10;0;265 und dann senden
oder
1;1;0 Rote LED an
1;0;0 Rote LED aus
oder
1;2;10 Rote LED für 1 Sekunde an
oder
1;3;10 Rote LED blinkt 10 ist die Geschwindigkeit

2;Y;Z ist die Grüne LED
3;Y;Z ist der Buzzer

Formale Definition:

Werte für X:
0-> Piezo
1-> Vibrations Motor

Werte für Y:
0-> Aus Z, ist egal und sollte auf 0 gesetzt werden
1-> Ein, ist egal und sollte auf 0 gesetzt werden
2-> Impuls, Z ist die Impulszeit in 100ms Zeiteinheiten
3-> Blinken, Z ist die Ein/ Auszeit in 100ms Zeiteinheiten

------------------------
Ab X >= 10 kommen die Display Werte:

X:
10..16;0;Z ist das Display
10 -> "Ub" - > UBatterie des Motorantriebes
11 -> "I"    -> Strom durch den Batteriebpack
12 -> "Pm" -> Leistung des Motors
13 -> "Pa" -> Leistung Akku
14 -> "Ta" -> Temperatur Akku
15 -> "Tm" -> Temperatur Motor
16 -> "Uf" -> Spannung des Fernbedienungs Akku

Wie ist der Parameter Y aufgebaut:
derzeitiger Wert, min Wert, max Wert, Farbe

Y:
0-> derzeitiger Wert
1-> min Wert (ist für die Skalierung im Bar zuständig)
2-> max Wert (ist für die Skalierung im Bar zuständig)
3-> Farbe

Zum Thema Bar Graph:
Der Bar sollte zum Messbereich passen. Beispiel Ub:
Wenn die Batterienspannung typisch 3.6V beträgt und Ubatt leer 3.2V, so sollte die Skalierung so ausgelegt werden, dass der minimale Wert auf 30 und maximale Wert auf 38 gesetzt wird.
30 -> 3.0V
38 -> 3.8V

Der Bar skaliert dann optisch sehr übersichtlich:
10;1;30 -> min Wert gesetzt
10;2;38 -> max Wert gesetzt
10;0;34 -> Ub 3.4V zur Demonstration des möglichen Messwertes

Jetzt kommt noch die Möglichkeit die Farben der Bar Graphen und der Schrift zu ändern.
10;3;3 -> Ub wird grün und signalisiert damit, dass alles O.K. ist.

Grün -> O.K
Gelb -> Achtung
Rot -> Störung, Problem, ....
Die restlichen Farben können frei Vergeben werden.

Diese Werte kommen als Rückwert vom Empfänger! Es ist natürlich möglich, die Standartwerte für das Minimum und Maximum im Array vorzugeben.

Farben der Schrift und Bar Graphen:
10;3;0-6 verändert die Farbe des Messwertes
10;3;3 Ub wird grün

10;0;40 -> Ub;derzeitiger Wert;40
10;3;1 -> Ub;Farbe;Grün

Farben (Z-Wert):
0-> VGA_RED
1-> VGA_GREEN
2-> VGA_BLUE
3-> VGA_SILVER
4-> VGA_GRAY
5-> VGA_MAROON
6-> VGA_YELLOW
7-> VGA_OLIVE
8-> VGA_LIME
9-> VGA_AQUA
10-> VGA_TEAL
11-> VGA_NAVY
12-> VGA_FUCHSIA
13-> VGA_PURPLE
14-> VGA_BLACK
15-> VGA_WHITE
16-> VGA_TRANSPARENT

Zusammenfassend:
X,Y,Z/r/n und dann senden /r /n steht für NL "New Line" und CR "Carriage Return"

Revision
 --------
24.01.2014 v00P00 Bareny
29.04.2014 v00P00 Barney Anpassen der Beschreibung, Aufloesung 12Bit
02.05.2014 v00P00 Barney Spannungsmessung Ufernbedienung programmiert. Farben Handhabung vereinfacht
06.09.2014 v00P00 Barney Zerlegen des Programms in einzelne Tabs
07.09.2014 v01P01 Barney umstellung auf die UTFT-Lib

