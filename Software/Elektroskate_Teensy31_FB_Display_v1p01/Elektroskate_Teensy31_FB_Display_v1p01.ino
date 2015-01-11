#include <UTFT.h>            // TFT Lib fuer das Display
#include <UTouch.h>          // Touch Lib fuer das Display
extern uint8_t BigFont[];    // es werden auch die großen Schriften benoetigt.
#include <Nunchuk.h>         // Nunchuk Lib
#include <Wire.h>            // Wird fuer die Nunchuk Lib benoetigt
#include <SD.h>              // SD-Card Lib
#include <SPI.h>             // auch fuer die SD-Card
#include "DCF77.h"           // DCF-77 Lib
#include <Time.h>            // Echtzeituhr Teensy 3.1
#include "Elektroskate_FB_Display_Connection.h"
#include "Elektroskate_FB_Display_Parameters.h"
#include "Elektroskate_FB_Display_Custom_Settings.h"
#include "Elektroskate_FB_Display_Class.h"

byte Position = 11;

// Blinken, Blitzen
byte CounterOutput01 = 0;                  // Counter fuer Output01
byte CounterOutput02 = 0;                  // Counter fuer Output02
byte Flag_Blink_Output01 = LOW;            // Flag Blinken Outpu01
byte Flag_Blink_Output02 = LOW;            // Flag Blinken Outpu02
unsigned long Time_Output01 = 0;           // Counter fuer Blitzen Output01
unsigned long Time_Output02 = 0;           // Counter fuer Blitzen Output02
byte Flag_Time_Output01 = LOW;             // Blitzen ermoeglichen Output01
byte Flag_Time_Output02 = LOW;             // Blitzen ermoeglichen Output02
// Index
unsigned long Index = 0;                   // Fortlaufender Index
// Festlegen der Kommandowerte beim Einschalten der FB
byte Command_Output01 = 0;                 // Kommando fuer den Ausgang
byte Flash_Output01   = 0;                 // Blitzen langsam Wert x 100ms
byte Blink_Output01   = 0;                 // Blinken langsam Wert x 100ms
byte Command_Output02 = 0;                 // Kommando fuer den Ausgang
byte Flash_Output02   = 0;                 // Blitzen langsam Wert x 100ms
byte Blink_Output02   = 0;                 // Blinken langsam Wert x 100ms
// Kommando Interpreter
byte Command_Output  = 0;                  // Kommando
byte Command_Value01 = 0;                  // Kommando
int  Command_Value02 = 0;                  // Kommando

// Startup des Kontrollers
IntervalTimer timer_1Hz;                   // 1 Sekunden Timer
IntervalTimer timer_10Hz;                  // 0.1 Sekunden Timer
IntervalTimer timer_100Hz;                 // 0.01 Sekunden Timer

// Nunchuk
Nunchuk nunchuk = Nunchuk();
// DCF-77
DCF77 DCF = DCF77(DCF_PIN,DCF_INTERRUPT);
time_t time;
// Display
GRAPHIC SC(320, 240, &tft); // SC Initialisieren und Aufloesung Display X/Y festlegen




void setup() {
  // Timer Initialisieren
  timer_1Hz.begin(Timer1Hz, 1000000);    // 1 Sekunden Timer
  timer_10Hz.begin(Timer10Hz, 100000);   // 0.1 Sekunden Timer
  timer_100Hz.begin(Timer100Hz, 10000);  // 0.01 Sekunden Timer
  // Ende Zyklischer IRQ-Timer

  if (DEBUG) Serial.begin(DEBUG_BAUDRATE);   // Debugausgabe ueber USB Schnittstelle definieren
  Serial_BT.begin(BT_BAUDRATE); // Serieller Schnittstelle und oder Bluetooth definieren
  Serial_BT.setTimeout(50);     // Timeout für den Empfang nach 50ms

  // Alle Eingangspins definieren
  pinMode(Pin_X_Achse, INPUT);          // analog Input X
  pinMode(Pin_Y_Achse, INPUT);          // analog Input Y
  pinMode(Pin_Z_Achse, INPUT);          // analog Input Z
  pinMode(Pin_Ubatt,   INPUT);          // analog Input Ubatt
  pinMode(Pin_Input01, INPUT_PULLUP);   // Taster gegen GND mit Pullup Widerstand
  pinMode(Pin_Input02, INPUT_PULLUP);   // Taster gegen GND mit Pullup Widerstand
  pinMode(Pin_Input03, INPUT_PULLUP);   // Taster gegen GND mit Pullup Widerstand
  // Alle Ausgangspins definieren
  pinMode(Pin_Output01, OUTPUT);        // Ausgang 01 Buzzer
  pinMode(Pin_Output02, OUTPUT);        // Ausgang 02 Vibrationsmotor
  pinMode(Pin_chipSelect, OUTPUT);      // Ausgang fuer SD-Card chip select
  // Startwert der Ausgägnge definieren
  digitalWrite(Pin_Output01, LOW);      // Ausgang 01 aus
  digitalWrite(Pin_Output02, LOW);      // Ausgang 02 aus

  nunchuk.init();                                 // Nunchuk initialisieren
  analogReadResolution(AnalogReadResolutionBits); // analoge Auflösung setzen

  // Display initialisieren
  tft.InitLCD(LANDSCAPE);
  tft.setFont(BigFont);
  tft.clrScr();  // Bildschirm loeschen

  // SD Card Initialiserung
  // see if the card is present and can be initialized:
  if (!SD.begin(Pin_chipSelect)) {
    Serial_DB.println("Card failed, or not present");
    // don't do anything more:
    return;
  }
  Serial_DB.println("card initialized.");
  // SD Card Initialiserung

  SC.ChartBackground(Colors[1], 10, 10, 300, 80); // Farbe, X-Position, Y-Position, Laenge, Hoehe
  
  // DCF-77 Empfänger aktivieren
  DCF.Start();
  //setSyncInterval(30);
  //setSyncProvider(DCF.getTime);
  setSyncProvider(getTeensy3Time);     // Zeitquelle ist der Teensy
}

// Dauerschleife
void loop() {
  // Input Parser, hier werden alle Kommandos, die an die FB gesendet werden, eingelesen und zugewiesen.
  unsigned char bytecount = 0;
  while (Serial_BT.available()  && bytecount < 5) {
    Command_Output  = Serial_BT.parseInt();  // Suche den ersten Byte Wert
    Command_Value01 = Serial_BT.parseInt();  // Suche den zweiten Byte Wert
    Command_Value02 = Serial_BT.parseInt();  // Suche den dritten Integer Wert
    if (Serial_BT.read() == '\r') {
      switch (Command_Output) {
      case 1: // Kommando 1
        Command_Output01 = Command_Value01;
        Flash_Output01   = Command_Value02;
        Blink_Output01   = Command_Value02;
        break;
      case 2: // Kommando 2
        Command_Output02 = Command_Value01;
        Flash_Output02   = Command_Value02;
        Blink_Output02   = Command_Value02;
        break;
      case 10 ... 16: // Die Werte fuer das Display werden angesprochen
        // Ein Wert wird Array wird angesteuert, damit kann jeder Wert im Array erreicht werden
        // siehe Definition des zweidimensionalen Arrays
        // Das Array kann nur von [0..6][0..3] angesprochen werden
        if (Command_Value01 >= 0 && Command_Value01 <= 3) { 
          ValueArray[Command_Output-10][Command_Value01] = Command_Value02;
        }
        break;
      }
    }
  }
  // Ende Input Parser
}

// Interupt Service Routine im 10ms Intervall
// Timer100Hz ISR
void Timer100Hz() {
  // Blink Counter Output 01
  CounterOutput01++;
  if (CounterOutput01 > Blink_Output01) {        // 
    CounterOutput01 = 0 ;                        // Zaehler zuruecksetzen
    Flag_Blink_Output01 = !Flag_Blink_Output01 ; // Toggle Flag_Blink_Output01
  }
  // Blink Counter Output 02
  CounterOutput02++;
  if (CounterOutput02 > Blink_Output02) {        // 
    CounterOutput02 = 0 ;                        // Zaehler zuruecksetzen
    Flag_Blink_Output02 = !Flag_Blink_Output02 ; // Toggle Flag_Blink_Output01
  }
  // Ausfuehren der Ausgangsroutinen, die LEDs, Piezo oder den Vibrationsmotor ansteuern
  RoutineCommand_Output01();
  RoutineCommand_Output02();
}

// Timer10Hz ISR
void Timer10Hz() {
  String dataString = "";  // String leeren
  byte counter_1 = 0;

  nunchuk.init(); // Nicht ganz sauber, aber holt den Wireless wieder ins Leben zurück.
  nunchuk.update(); // neue Werte vom Nunchuk holen
  // Senderoutine
  // Ausgabe der Taster und Analogen Achsen ueber die BT-Schnittstelle
  Serial_BT.print("<FB>;");
  Serial_BT.print(Index++);
  Serial_BT.print(";");
  Serial_BT.print(nunchuk.analogY);
  //Serial_BT.print(analogRead(Pin_X_Achse));
  Serial_BT.print(";");
  Serial_BT.print(nunchuk.analogX);
  //Serial_BT.print(analogRead(Pin_Y_Achse));
  Serial_BT.print(";");
  Serial_BT.print(analogRead(Pin_Z_Achse));
  Serial_BT.print(";");
  Serial_BT.print(analogRead(Pin_Ubatt));
  Serial_BT.print(";");
  Serial_BT.print(!digitalRead(Pin_Input01)); // Taster Joystick
  Serial_BT.print(";");
  Serial_BT.print(nunchuk.zButton);
  //Serial_BT.print(!digitalRead(Pin_Input02)); // Taster 01
  Serial_BT.print(";");
  Serial_BT.print(nunchuk.cButton);
  //Serial_BT.print(!digitalRead(Pin_Input03)); // Taster 02
  Serial_BT.print(";");
  Serial_BT.print(Command_Output01);          // Rueckgabe des Kommandos fuer den Ausgang 01
  Serial_BT.print(";");
  Serial_BT.println(Command_Output02);          // Rueckgabe des Kommandos fuer den Ausgang 02

    dataString += String(Index);        // Nummerierung der Messdaten, spaeter Datum Uhrzeit
  dataString += ",";
  while (counter_1 < 7)
  {
    dataString += String(ValueArray[counter_1][0]);
    dataString += ",";
    counter_1++;
  }
  counter_1 = 0;  // Counter fuer naechsten lauf zuruecksetzen
  dataString += ";";


  // open the file. note that only one file can be open at a time,
  // so you have to close this one before opening another.
  File dataFile = SD.open("test00.txt", FILE_WRITE);

  // if the file is available, write to it:
  if (dataFile) {
    dataFile.println(dataString);
    dataFile.close();
    if (DEBUG_SD) Serial_DB.println(dataString);
  }  
  // if the file isn't open, pop up an error:
  else {
    Serial_DB.println("error opening datalog.txt");
  } 
}

// Timer1Hz ISR
void Timer1Hz() {
  uint16_t Uftemp = 0;  // Hier wird der Uf zwischengespeichert 

  time_t DCFtime = DCF.getTime(); // Check if new DCF77 time is available
  if (DCFtime!=0)
  {
    if (DEBUG_TIME)Serial_DB.println("Zeit wurde im Teensy gesetzt");
    setTime(DCFtime);
  }	

  // Akku Fernbedienung: Spannung messen Anzeigewert speichern und Bar einfaerben
  Uftemp = (uint16_t)(AnalogeReferenzspannung*analogRead(Pin_Ubatt)/AnalogReadResolutionValue); // Wie hoch ist die Akkuspannung der Fernbedienung?
  ValueArray[6][0]=Uftemp;  // Akku-Spannung der Fernbedienung auslesen und Wert in Uf speichern 
  if (Uftemp < Ufgelb) ValueArray[6][3] = 1;     // Spannung unter Ufgelb Wert -> rot
  else if (Uftemp >= Ufgelb && Uftemp < Ufgruen) ValueArray[6][3] = 2; // Spannung swischen Ufgelb und Ufgruen -> gelb
  else ValueArray[6][3] = 3;  // Spannung O.K. -> gruen
  //
  // Ueberschrift auf Display ausgeben
  tft.setColor(VGA_WHITE);
  tft.setFont(BigFont);
  tft.print("Skateboard connect", CENTER, 0);

  tft.setFont(SmallFont);
  tft.print(hour(), 240, 190);
  tft.print(minute(), 260,190);
  tft.print(second(),280,190);
  tft.print(day(), 240 , 200);
  tft.print("/", 255, 200);
  tft.print(month(), 260, 200);
  tft.print("/", 275, 200);
  tft.print(year(), 280, 200); 
  tft.setFont(BigFont);


  // Messwert ausgegeben.
  SC.TextBarDaten(0, 18, Colors, ValueArray, ValueNames);      // Bar Graphen zeichnen und Werte Anzeigen
  // Chart Werte für Ub und Ib zeichnen
  SC.ChartDaten(Position, ValueArray[0][0], ValueArray[0][1], ValueArray[0][2], ValueArray[1][0], ValueArray[1][1], ValueArray[1][2]);
  Position++;
  if (Position == 150) Position= 11;
}


void RoutineCommand_Output01() {
  switch (Command_Output01) {
  case 0: // aus
    digitalWrite(Pin_Output01, 0);
    break;
  case 1: // an
    digitalWrite(Pin_Output01, 1);
    break;
  case 2:  // Flash
    if (Flag_Time_Output01 == LOW) {
      Time_Output01 = Index;
      digitalWrite(Pin_Output01, 1);
      Flag_Time_Output01 = HIGH;
    }
    if (Index == Time_Output01 + Flash_Output01) {
      Command_Output01 = 0 ;
      Flag_Time_Output01 = LOW;
    }
    break;
  case 3:  // Blink
    digitalWrite(Pin_Output01, Flag_Blink_Output01);
    break;
  default:
    digitalWrite(Pin_Output01, 0);
  }
}

void RoutineCommand_Output02() {
  switch (Command_Output02) {
  case 0: // aus
    digitalWrite(Pin_Output02, 0);
    break;
  case 1: // an
    digitalWrite(Pin_Output02, 1);
    break;
  case 2:  // Flash
    if (Flag_Time_Output02 == LOW) {
      Time_Output02 = Index;
      digitalWrite(Pin_Output02, 1);
      Flag_Time_Output02 = HIGH;
    }
    if (Index == Time_Output02 + Flash_Output02) {
      Command_Output02 = 0 ;
      Flag_Time_Output02 = LOW;
    }
    break;
  case 3:  // Blink
    digitalWrite(Pin_Output02, Flag_Blink_Output02);
    break;
  default:
    digitalWrite(Pin_Output02, 0);
  }
}

time_t getTeensy3Time()
{
  return Teensy3Clock.get();
}

