// Anschluesse Bluetooth Modul, hier nur zur Dokumentation hat keine technische Bewandnis
// Das BT-Modul wird an GND und +3.3V angeschlossen
// Wer will kann die zwei Statuspins vom BT-Modul an zwei LEDs anschliessen
#define Pin_Rx1 0    // Dummy Hinweis, Pin  0 Rx Teensy -> Tx BT-Modul
#define Pin_Tx1 1    // Dummy Hinweis, Pin  1 Tx Teensy -> Rx BT-Modul

// Display Anschluesse
#define RS   3           // Reset Pin am Display
#define WR   4           // Reset Pin am Display
#define CS  15           // Reset Pin am Display
#define RST 16           // Reset Pin am Display
// UTFT(Model,RS, WR, CS, RST); 
UTFT tft(SSD1289_8, RS, WR, CS, RST);  // Modell des Display hier eintragen

#define TCLK  25         // Reset Pin am Display
#define TCS   26         // Reset Pin am Display
#define TDIN  27         // Reset Pin am Display
#define TDOUT 28         // Reset Pin am Display
#define TIRQ  29         // Reset Pin am Display
UTouch  myTouch( TCLK, TCS, TDIN, TDOUT, TIRQ);

#define CAL_X 0x00380e85UL  // Kalibrierung X-Achse
#define CAL_Y 0x03CE0150UL  // Kalibrierung Y-Achse
#define CAL_S 0x000EF13FUL  // Kalibrierung S-Achse

// DCF-77 Modul Funkuhr Frankfurt
#define DCF_PIN 24	         // Connection pin to DCF 77 device
#define DCF_INTERRUPT 24	 // Interrupt number associated with pin


// Eingaenge analog
#define Pin_Y_Achse A17    // Pin A0 Joystick Y-Achse hier Mittelanschluss, ein Pin an +3.3V der andere an GND
#define Pin_X_Achse A18    // Pin A1 Joystick X-Achse hier Mittelanschluss, ein Pin an +3.3V der andere an GND
#define Pin_Z_Achse A19    // Pin A2 Z-Achse hier Mittelanschluss, ein Pin an +3.3V der andere an GND
#define Pin_Ubatt   A20    // Pin A3 UBatterie Achtung Signal auf 3.3V begrenzen!
// Eingaenge digital
#define Pin_Input01 24     // Pin 6 Joystick Taster anderer Anschluss an GND
#define Pin_Input02 25     // Pin 7 Taster schwarz anderer Anschluss an GND
#define Pin_Input03 33     // Pin 8 Taster rot anderer Anschluss an GND
// Ausgaenge digital
#define Pin_Output01 17    // Pin 3 LED rot 200 Ohm Vorwiderstand anderer Anschluss an GND
#define Pin_Output02 18    // Pin 4 LED grün 200 Ohm Vorwiderstand anderer Anschluss an GND

// Nunchuk alles Dummypins da durch Lib festgelegt
//#define Pin_SDATA A4    // Pin 18 grün Data Verbindung Nunchuk
//#define Pin_SCLK  A5    // Pin 19 gelb Clock Verbindung Nunchuk
//#define                 // Pin 3.3V rot Spannungsversorgung Nunchuk
//#define                 // Pin GND weiss Ground Nunchuk

// SD card attached to SPI bus as follows:
//   CS - pin 10
// MOSI - pin 11
// MISO - pin 12
//  CLK - pin 13
#define Pin_chipSelect 10  // Chip Select ist variable zu belegen.

