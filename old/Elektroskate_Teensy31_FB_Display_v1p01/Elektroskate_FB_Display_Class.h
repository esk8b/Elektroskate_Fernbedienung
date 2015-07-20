#ifndef GRAPHIC_h
#define GRAPHIC_h

#define GRAPHIC_VERSION	001
#include "Arduino.h"
#include "UTFT.h"

class GRAPHIC
{
public:
  GRAPHIC();
  GRAPHIC(uint16_t ResX, uint16_t ResY, UTFT* GLCD);
  void ChartBackground(uint16_t Farbe, uint16_t x, uint16_t y, uint16_t l, uint16_t h);
  void ChartDaten(uint16_t Position, int Wert1, int WertMin1, int WertMax1, int Wert2, int WertMin2, int WertMax2);
  void TextBarDaten(uint16_t x, uint16_t y, uint16_t Colors[], int16_t ValueArray[][4], char* ValueNames[]);
private:
  uint16_t _ResX;
  uint16_t _ResY;
  UTFT* myGrLCD;

};

#endif



