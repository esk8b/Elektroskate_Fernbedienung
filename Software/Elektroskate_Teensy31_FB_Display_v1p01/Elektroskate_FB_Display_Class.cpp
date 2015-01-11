#include "Elektroskate_FB_Display_Class.h"

GRAPHIC::GRAPHIC()
{
}

GRAPHIC::GRAPHIC(uint16_t ResX, uint16_t ResY, UTFT* GLCD)
{
  myGrLCD = GLCD;
  _ResX = ResX;
  _ResY = ResY;
}

// Chart Rahmen erzeugen
void  GRAPHIC::ChartBackground(uint16_t Farbe, uint16_t x, uint16_t y, uint16_t l, uint16_t h)
{ 
  myGrLCD->setColor(Farbe);
  myGrLCD->drawLine(x, _ResY-y, x+l, _ResY-y); // X-Achse
  myGrLCD->drawLine(x, _ResY-y, x  , _ResY-y-h); // Y-Achse
}

// Daten in den Chart zeichnen
void GRAPHIC::ChartDaten(uint16_t Position, int Wert1, int WertMin1, int WertMax1, int Wert2, int WertMin2, int WertMax2)
{
  unsigned int WertScale1 = 0;   // Die Messwerte werden zu Min und Max relativiert
  unsigned int WertScale2 = 0;   // Die Messwerte werden zu Min und Max relativiert
  byte NegativF1 = 5;            // Flag fuer negative Messwerte blau
  if (Wert1 < 0) {
    Wert1 = -Wert1;              // negativen Wert negieren
    NegativF1 = 6;               // Farbe fuer Backgroud Mangenta
  }
  if (Wert1 > WertMax1) Wert1 = WertMax1;  // Sollte der Wert > WertMax sein begrenzen
  if (Wert1 < WertMin1) Wert1 = WertMin1;  // Sollte der Wert < WertMin sein begrenzen
  WertScale1 = 50 / (float) (WertMax1 - WertMin1) * (Wert1 - WertMin1); // Die Messwerte werden zu Min und Max relativiert

  byte NegativF2 = 1;            // Flag fuer negative Messwerte rot
  if (Wert2 < 0) {
    Wert2 = -Wert2;              // negativen Wert negieren
    NegativF2 = 6;               // Farbe fuer Backgroud Mangenta
  }
  if (Wert2 > WertMax2) Wert2 = WertMax2;  // Sollte der Wert > WertMax sein begrenzen
  if (Wert2 < WertMin2) Wert2 = WertMin2;  // Sollte der Wert < WertMin sein begrenzen
  WertScale2 = 50 / (float) (WertMax2 - WertMin2) * (Wert2 - WertMin2); // Die Messwerte werden zu Min und Max relativiert

  if (Position == 150) {
    myGrLCD->setColor(VGA_RED);    // ist der Rechtsanschlag erreicht?
    myGrLCD->drawLine(Position, 124, Position, 75);
    Position = 11;                                               // zurueck nach links
  }
  myGrLCD->setColor(VGA_BLACK);
  myGrLCD->drawLine(Position, 180, Position, 230);         // Lösche alte Datenwerte in der Ansicht
  myGrLCD->setColor(VGA_WHITE);
  myGrLCD->drawLine(Position + 1, 180, Position + 1, 230); // Zeichne den Positionsbalken
  myGrLCD->setColor(VGA_BLUE);
  myGrLCD->drawPixel(Position, 231 - WertScale1);       // zeichne Strom in blau
  myGrLCD->setColor(VGA_RED);
  myGrLCD->drawPixel(Position, 231 - WertScale2);       // zeichne Spannung in rot
}

void GRAPHIC::TextBarDaten(uint16_t x, uint16_t y, uint16_t Colors[],int16_t ValueArray[][4], char* ValueNames[]) 
{
  byte counter = 0;
  int16_t Wert    = 0;
  int16_t WertMin = 0;
  int16_t WertMax = 0;
  uint16_t WertScale = 0;         // Die Messwerte werden zu Min und Max relativiert
  uint16_t NegativF = VGA_BLACK;  // Flag fuer negative Messwerte
  uint16_t xvaloffset =  40;      // X-Achsen Verschiebung Bargraph
  uint16_t xbaroffset = 160;      // X-Achsen Verschiebung Bargraph
  while (counter < 7)
  {
    // Alle Texte und Werte Ausgeben
    // Bezeichner und Messwert anzeigen
    myGrLCD->setColor(Colors[(ValueArray[counter][3])]);
    myGrLCD->print(ValueNames[counter]                    ,  x,             y + 18 * counter);       // Text ausgeben
    myGrLCD->printNumF(ValueArray[counter][0]/float(10), 2,  x+xvaloffset,  y + 18 * counter,',',7); // Float Wert, x, y , Trennzeichen, Stellen ausgeben
    // Alle BarCharts zeichnen
    Wert    = ValueArray[counter][0];
    WertMin = ValueArray[counter][1];
    WertMax = ValueArray[counter][2];
    if (Wert < 0) {
      Wert = -Wert;               // negativen Wert negieren
      NegativF = VGA_TEAL;      // Farbe fuer Backgroud Mangenta
    }
    else NegativF = VGA_BLACK;    // Farbe fuer Backgroud Mangenta

    if (Wert > WertMax) Wert = WertMax;     // Sollte der Wert > WertMax sein begrenzen
    if (Wert < WertMin) Wert = WertMin;     // Sollte der Wert < WertMin sein begrenzen
    WertScale = (float) 100 / (float) (WertMax - WertMin) * (Wert - WertMin); // Die Messwerte werden zu Min und Max relativiert
    myGrLCD->setColor(NegativF);
    myGrLCD->fillRect(x+xbaroffset, y+5+18*counter, x+xbaroffset+100, y+11+18*counter); // Graph loeschen, oder bei negativen Wert magenta
    myGrLCD->setColor(VGA_YELLOW);
    myGrLCD->drawRect(x+xbaroffset-1, y+4+18*counter, x+xbaroffset+100, y+12+18*counter);     // Hintergrund fuer Graphen zeichnen
    myGrLCD->setColor(Colors[(ValueArray[counter][3])]);
    myGrLCD->fillRect(x+xbaroffset, y+5+18*counter, x+xbaroffset+WertScale, y+11+18*counter); // Wert zeichen
    counter++;
  } 
}




