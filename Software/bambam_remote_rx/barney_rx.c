/** wireless_adc_rx app:
First, load the wireless_adc_tx app onto one or more Wixels and connect each
analog voltage output you wish to measure to one of the 6 ADC channels present
on each Wixel: P0_0, P0_1, P0_2, P0_3, P0_4, or P0_5.  Make sure that the ground
(GND) pins of the Wixel and the device producing the analog voltage are connected,
and ensure that everything is sufficiently powered.


07-37-8B-69 12697 16      -65   87     1     226   226   1501  2931   226   226
 (Serial)  (Time) (Bytes) (dBm) (LQI) (CRC)  (0)   (1)    (2)   (3)   (4)   (5)

(Serial) The serial number of the Wixel that measured the voltages.
(Time)   A 32bit measure of the time when the receiver processed the report, in
         milliseconds (ms).
(Bytes)  Menge der empfangenden Bytes
(dBm)	 Empfangsstaerke in dBm
(LQI)	 Bitfehlerrate
(CRC)	 CRC-Check bestanden? 1:Ja , 0:Nein
(0-5)    The voltages measured on P0_0, P0_1, P0_2, P0_3, P0_4, and P0_5 in
         units of dezimal. Wertebereich 0..2047
*/

/** Dependencies **************************************************************/
#include <wixel.h>
#include <usb.h>
#include <usb_com.h>
#include <radio_queue.h>
#include <stdio.h>
#include <uart1.h>

/** Types *********************************************************************/
typedef struct adcReport
{
    uint8 length;			//Anzahl der empfangenden Bytes
    uint8 serialNumber[4];	//Seriennummer des Senders 
    uint16 readings[6];		//Messwerte ADC
	int8 rssi;				//dBm
	uint8 quality;			//LQI und CRC
} adcReport;

/** Functions *****************************************************************/
void updateLeds()
{
    LED_GREEN_TOGGLE();					//Die gruene LED blinkt bei Daten
	LED_YELLOW(ACM_CONTROL_LINE_DTR);	//Funktioniert nicht so wie gedacht
    LED_RED(0);							//Ist einfach aus
}

void putchar(char c)
{
    uart1TxSendByte(c);					//Routine für die Ausgabe einzelner char
}

void radioToUart1Service()
{
    adcReport XDATA * rxPacket;

    // Check if there is a radio packet to report and space in the
    // USB TX buffers to report it.
    if ((rxPacket = (adcReport XDATA *)radioQueueRxCurrentPacket()) && uart1TxAvailable() >= 64)
    {
        // We received a packet from a Wixel, presumably one running
        // the wireless_adc_tx app.  Format it nicely and send it to
        // the USB host (PC).

        uint8 i;

        printf("%02X-%02X-%02X-%02X,%12lu,%4d,%4d,%4d, ",
               rxPacket->serialNumber[3],	//Ausgabe der Sender Seriennummer
               rxPacket->serialNumber[2],
               rxPacket->serialNumber[1],
               rxPacket->serialNumber[0],
               getMs(),						// Millisekunden 32bit
			   rxPacket->length,			// Wie viele Pakete wurden empfangen
			   rxPacket->rssi/2 - 71,   	// RSSI dBm
			   rxPacket->quality & 0x7F 	// LQI Bitfehlerrate
	           );

		// CRC
		// 1 CRC Pass, 0 CRC Fail
		putchar((rxPacket->quality & 0x80) ? '1' : '0');
		
		//Ausgabe der ADC Werte
        for(i = 0; i < 6; i++)
        {
            printf(",%5u", rxPacket->readings[i]);
        }
		
		//Am Ende der Ausgabe Umbruch senden
        putchar('\r');
        putchar('\n');

        radioQueueRxDoneWithPacket();
    }
}

void lineCodingChanged()
{
    uart1SetBaudRate(230400); 	//Baudrate setzen
    uart1SetParity(0);			//kein Parity
    uart1SetStopBits(0);		//keine Stopbits
}

void main(void)
{
    systemInit();
	
    radioQueueInit();				//Empfaenger initialisieren
	radioQueueAllowCrcErrors = 1;	//Fehlerhafte Pakete zulassen
	
	uart1Init();					//Serielle Schnittstelle initialisieren
	lineCodingChanged();			//Einstellen der Schnittstellen Eigenschaft
	
    while(1)
    {
        updateLeds();				//Status der LEDs veraendern
        boardService();
		usbComService();
        radioToUart1Service();		//Empfangen der Daten
    }
}
