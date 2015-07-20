// Version v3.4p8
// Serielle Geschwindigkeit
#define BT_BAUDRATE    (uint32_t) 230400      // Datenrate fuer das Bluetooth Modul, ggf. fuer ein anderes BT-Modul anpassen, Ausgabe ueber Serielle Schnittstelle 1
#define DEBUG_BAUDRATE (uint32_t) 230400      // Datenrate fuer das Debugging in der Arduino IDE per USB

// Definition der ADC / DAC Eigenschaften
#define AnalogReadResolutionBits 12       // Bit-Aufloesung fuer die Analog Digital Umsetzer (ADC) zur Strom- und Spannungsmessung
#define AnalogReadResolutionValue (uint32_t) pow(2,AnalogReadResolutionBits)   // Festlegen der ADC-Aufloesung (Wertebereich)
#define AnalogAveraging 8                 // Durchschnittswert bei der ADC-Messung bilden
#define AnalogeReferenzspannung 33        // 3.3V Referenzspannung


// UFernbedienung Parameter
#define Ufgelb 28   // Fernbedienug Akku fast alle
#define Ufgruen 30  // Fernbedieung Akku voll

// Declare which fonts we will be using
extern uint8_t SmallFont[];

uint16_t Colors[]=
{ VGA_RED, VGA_GREEN, VGA_BLUE, VGA_SILVER, VGA_GRAY, VGA_MAROON, VGA_YELLOW,
  VGA_OLIVE, VGA_LIME, VGA_AQUA, VGA_TEAL, VGA_NAVY, VGA_FUCHSIA, VGA_PURPLE, 
  VGA_BLACK, VGA_WHITE, VGA_TRANSPARENT };

// Initialisieren der Einschaltwerte
// Alle Werte auf min und rot

int16_t ValueArray[][4] = {
  {   
    220, 200,  280, 3            }
  , // Ub -> derzeitiger Wert, min Wert, max Wert, Farbe
  {   
    350,  0,   500, 0            }
  , // I
  {   
    -750,  0, 1300, 0            }
  , // Pm
  {   
    0,  0,  2400, 0            }
  , // Pa
  {   
    0,  0,   600, 0            }
  , // Ta
  {   
    311,  0,   600, 1            }
  , // Tm
  {   
    0, 25,    33, 1            }
  , // Ufb
};
char* ValueNames[7] = {
  "Ub", "I", "Pm", "Pa", "Ta", "Tm", "Uf"}; // Was verbirgt sich hinter ValueArray
