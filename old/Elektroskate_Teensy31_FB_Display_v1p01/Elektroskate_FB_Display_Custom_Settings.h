// Version v3.3p4

// Sonderfunktionen
#define UIMESS     true         // HW UI-Messung vorhanden (TRUE,FALSE)
#define LICHTHUPE  true         // HW Licht, Hupe vorhanden (TRUE,FALSE)
#define TEMPMESS   true         // HW Temperaturmessung vorhanden (TRUE,FALSE)
#define LESOFT     true         // HW Leistungselektronik langsam hochfahren vorhanden (TRUE,FALSE)

// Debugflag
#define DEBUG              true // Aktivieren der Debugausgabe (TRUE,FALSE)
#define DEBUG_Funktion     false // Aktivieren der Debugausgabe Welche Funktionen werden aufgerufen (TRUE,FALSE)
#define DEBUG_ISR          false // Aktivieren der Debugausgabe Aufruf der ISR Interrupt Service Routinen (TRUE,FALSE)
#define DEBUG_Nunchuk      false // Aktivieren der Debugausgabe Nunchuk Werte x,y-Achse, Beschleunigung, c,z-Button(TRUE,FALSE)
#define DEBUG_Messung      false // Aktivieren der Debugausgabe interne Messwerte und Berechnungen (TRUE,FALSE)
#define DEBUG_SD           false // Aktivieren der Debugausgabe interne Messwerte und Berechnungen (TRUE,FALSE)
#define DEBUG_TIME         true // Aktivieren der Debugausgabe interne Messwerte und Berechnungen (TRUE,FALSE)

// Welche Schnittstellen sollen verwendet werden
// Serial  -> USB-Anschluss Teensy 3.1
// Serial1 -> Bluetooth Schnittstelle, auf die Baudrate in Elektroskate_Custom_Parameters achten!
#define Serial_BT Serial1       // Sollen die Werte fuer die BT-Schnittstelle auf USB oder Serial fuer das Debugging ausgegeben werden?
#define Serial_DB Serial        // Ausgabe der Debug Werte auf USB oder Serial ausgegeben werden?
