;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.1.0 #7066 (Nov 22 2011) (MINGW32)
; This file was generated Wed Jul 15 09:35:42 2015
;--------------------------------------------------------
	.module barney_rx
	.optsdcc -mmcs51 --model-medium
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _lineCodingChanged
	.globl _radioToUart1Service
	.globl _updateLeds
	.globl _uart1TxSendByte
	.globl _uart1TxAvailable
	.globl _uart1SetStopBits
	.globl _uart1SetParity
	.globl _uart1SetBaudRate
	.globl _uart1Init
	.globl _printf
	.globl _radioQueueRxDoneWithPacket
	.globl _radioQueueRxCurrentPacket
	.globl _radioQueueInit
	.globl _usbComService
	.globl _getMs
	.globl _boardService
	.globl _systemInit
	.globl _putchar
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
Fbarney_rx$P0$0$0 == 0x0080
_P0	=	0x0080
Fbarney_rx$SP$0$0 == 0x0081
_SP	=	0x0081
Fbarney_rx$DPL0$0$0 == 0x0082
_DPL0	=	0x0082
Fbarney_rx$DPH0$0$0 == 0x0083
_DPH0	=	0x0083
Fbarney_rx$DPL1$0$0 == 0x0084
_DPL1	=	0x0084
Fbarney_rx$DPH1$0$0 == 0x0085
_DPH1	=	0x0085
Fbarney_rx$U0CSR$0$0 == 0x0086
_U0CSR	=	0x0086
Fbarney_rx$PCON$0$0 == 0x0087
_PCON	=	0x0087
Fbarney_rx$TCON$0$0 == 0x0088
_TCON	=	0x0088
Fbarney_rx$P0IFG$0$0 == 0x0089
_P0IFG	=	0x0089
Fbarney_rx$P1IFG$0$0 == 0x008a
_P1IFG	=	0x008a
Fbarney_rx$P2IFG$0$0 == 0x008b
_P2IFG	=	0x008b
Fbarney_rx$PICTL$0$0 == 0x008c
_PICTL	=	0x008c
Fbarney_rx$P1IEN$0$0 == 0x008d
_P1IEN	=	0x008d
Fbarney_rx$P0INP$0$0 == 0x008f
_P0INP	=	0x008f
Fbarney_rx$P1$0$0 == 0x0090
_P1	=	0x0090
Fbarney_rx$RFIM$0$0 == 0x0091
_RFIM	=	0x0091
Fbarney_rx$DPS$0$0 == 0x0092
_DPS	=	0x0092
Fbarney_rx$MPAGE$0$0 == 0x0093
_MPAGE	=	0x0093
Fbarney_rx$ENDIAN$0$0 == 0x0095
_ENDIAN	=	0x0095
Fbarney_rx$S0CON$0$0 == 0x0098
_S0CON	=	0x0098
Fbarney_rx$IEN2$0$0 == 0x009a
_IEN2	=	0x009a
Fbarney_rx$S1CON$0$0 == 0x009b
_S1CON	=	0x009b
Fbarney_rx$T2CT$0$0 == 0x009c
_T2CT	=	0x009c
Fbarney_rx$T2PR$0$0 == 0x009d
_T2PR	=	0x009d
Fbarney_rx$T2CTL$0$0 == 0x009e
_T2CTL	=	0x009e
Fbarney_rx$P2$0$0 == 0x00a0
_P2	=	0x00a0
Fbarney_rx$WORIRQ$0$0 == 0x00a1
_WORIRQ	=	0x00a1
Fbarney_rx$WORCTRL$0$0 == 0x00a2
_WORCTRL	=	0x00a2
Fbarney_rx$WOREVT0$0$0 == 0x00a3
_WOREVT0	=	0x00a3
Fbarney_rx$WOREVT1$0$0 == 0x00a4
_WOREVT1	=	0x00a4
Fbarney_rx$WORTIME0$0$0 == 0x00a5
_WORTIME0	=	0x00a5
Fbarney_rx$WORTIME1$0$0 == 0x00a6
_WORTIME1	=	0x00a6
Fbarney_rx$IEN0$0$0 == 0x00a8
_IEN0	=	0x00a8
Fbarney_rx$IP0$0$0 == 0x00a9
_IP0	=	0x00a9
Fbarney_rx$FWT$0$0 == 0x00ab
_FWT	=	0x00ab
Fbarney_rx$FADDRL$0$0 == 0x00ac
_FADDRL	=	0x00ac
Fbarney_rx$FADDRH$0$0 == 0x00ad
_FADDRH	=	0x00ad
Fbarney_rx$FCTL$0$0 == 0x00ae
_FCTL	=	0x00ae
Fbarney_rx$FWDATA$0$0 == 0x00af
_FWDATA	=	0x00af
Fbarney_rx$ENCDI$0$0 == 0x00b1
_ENCDI	=	0x00b1
Fbarney_rx$ENCDO$0$0 == 0x00b2
_ENCDO	=	0x00b2
Fbarney_rx$ENCCS$0$0 == 0x00b3
_ENCCS	=	0x00b3
Fbarney_rx$ADCCON1$0$0 == 0x00b4
_ADCCON1	=	0x00b4
Fbarney_rx$ADCCON2$0$0 == 0x00b5
_ADCCON2	=	0x00b5
Fbarney_rx$ADCCON3$0$0 == 0x00b6
_ADCCON3	=	0x00b6
Fbarney_rx$IEN1$0$0 == 0x00b8
_IEN1	=	0x00b8
Fbarney_rx$IP1$0$0 == 0x00b9
_IP1	=	0x00b9
Fbarney_rx$ADCL$0$0 == 0x00ba
_ADCL	=	0x00ba
Fbarney_rx$ADCH$0$0 == 0x00bb
_ADCH	=	0x00bb
Fbarney_rx$RNDL$0$0 == 0x00bc
_RNDL	=	0x00bc
Fbarney_rx$RNDH$0$0 == 0x00bd
_RNDH	=	0x00bd
Fbarney_rx$SLEEP$0$0 == 0x00be
_SLEEP	=	0x00be
Fbarney_rx$IRCON$0$0 == 0x00c0
_IRCON	=	0x00c0
Fbarney_rx$U0DBUF$0$0 == 0x00c1
_U0DBUF	=	0x00c1
Fbarney_rx$U0BAUD$0$0 == 0x00c2
_U0BAUD	=	0x00c2
Fbarney_rx$U0UCR$0$0 == 0x00c4
_U0UCR	=	0x00c4
Fbarney_rx$U0GCR$0$0 == 0x00c5
_U0GCR	=	0x00c5
Fbarney_rx$CLKCON$0$0 == 0x00c6
_CLKCON	=	0x00c6
Fbarney_rx$MEMCTR$0$0 == 0x00c7
_MEMCTR	=	0x00c7
Fbarney_rx$WDCTL$0$0 == 0x00c9
_WDCTL	=	0x00c9
Fbarney_rx$T3CNT$0$0 == 0x00ca
_T3CNT	=	0x00ca
Fbarney_rx$T3CTL$0$0 == 0x00cb
_T3CTL	=	0x00cb
Fbarney_rx$T3CCTL0$0$0 == 0x00cc
_T3CCTL0	=	0x00cc
Fbarney_rx$T3CC0$0$0 == 0x00cd
_T3CC0	=	0x00cd
Fbarney_rx$T3CCTL1$0$0 == 0x00ce
_T3CCTL1	=	0x00ce
Fbarney_rx$T3CC1$0$0 == 0x00cf
_T3CC1	=	0x00cf
Fbarney_rx$PSW$0$0 == 0x00d0
_PSW	=	0x00d0
Fbarney_rx$DMAIRQ$0$0 == 0x00d1
_DMAIRQ	=	0x00d1
Fbarney_rx$DMA1CFGL$0$0 == 0x00d2
_DMA1CFGL	=	0x00d2
Fbarney_rx$DMA1CFGH$0$0 == 0x00d3
_DMA1CFGH	=	0x00d3
Fbarney_rx$DMA0CFGL$0$0 == 0x00d4
_DMA0CFGL	=	0x00d4
Fbarney_rx$DMA0CFGH$0$0 == 0x00d5
_DMA0CFGH	=	0x00d5
Fbarney_rx$DMAARM$0$0 == 0x00d6
_DMAARM	=	0x00d6
Fbarney_rx$DMAREQ$0$0 == 0x00d7
_DMAREQ	=	0x00d7
Fbarney_rx$TIMIF$0$0 == 0x00d8
_TIMIF	=	0x00d8
Fbarney_rx$RFD$0$0 == 0x00d9
_RFD	=	0x00d9
Fbarney_rx$T1CC0L$0$0 == 0x00da
_T1CC0L	=	0x00da
Fbarney_rx$T1CC0H$0$0 == 0x00db
_T1CC0H	=	0x00db
Fbarney_rx$T1CC1L$0$0 == 0x00dc
_T1CC1L	=	0x00dc
Fbarney_rx$T1CC1H$0$0 == 0x00dd
_T1CC1H	=	0x00dd
Fbarney_rx$T1CC2L$0$0 == 0x00de
_T1CC2L	=	0x00de
Fbarney_rx$T1CC2H$0$0 == 0x00df
_T1CC2H	=	0x00df
Fbarney_rx$ACC$0$0 == 0x00e0
_ACC	=	0x00e0
Fbarney_rx$RFST$0$0 == 0x00e1
_RFST	=	0x00e1
Fbarney_rx$T1CNTL$0$0 == 0x00e2
_T1CNTL	=	0x00e2
Fbarney_rx$T1CNTH$0$0 == 0x00e3
_T1CNTH	=	0x00e3
Fbarney_rx$T1CTL$0$0 == 0x00e4
_T1CTL	=	0x00e4
Fbarney_rx$T1CCTL0$0$0 == 0x00e5
_T1CCTL0	=	0x00e5
Fbarney_rx$T1CCTL1$0$0 == 0x00e6
_T1CCTL1	=	0x00e6
Fbarney_rx$T1CCTL2$0$0 == 0x00e7
_T1CCTL2	=	0x00e7
Fbarney_rx$IRCON2$0$0 == 0x00e8
_IRCON2	=	0x00e8
Fbarney_rx$RFIF$0$0 == 0x00e9
_RFIF	=	0x00e9
Fbarney_rx$T4CNT$0$0 == 0x00ea
_T4CNT	=	0x00ea
Fbarney_rx$T4CTL$0$0 == 0x00eb
_T4CTL	=	0x00eb
Fbarney_rx$T4CCTL0$0$0 == 0x00ec
_T4CCTL0	=	0x00ec
Fbarney_rx$T4CC0$0$0 == 0x00ed
_T4CC0	=	0x00ed
Fbarney_rx$T4CCTL1$0$0 == 0x00ee
_T4CCTL1	=	0x00ee
Fbarney_rx$T4CC1$0$0 == 0x00ef
_T4CC1	=	0x00ef
Fbarney_rx$B$0$0 == 0x00f0
_B	=	0x00f0
Fbarney_rx$PERCFG$0$0 == 0x00f1
_PERCFG	=	0x00f1
Fbarney_rx$ADCCFG$0$0 == 0x00f2
_ADCCFG	=	0x00f2
Fbarney_rx$P0SEL$0$0 == 0x00f3
_P0SEL	=	0x00f3
Fbarney_rx$P1SEL$0$0 == 0x00f4
_P1SEL	=	0x00f4
Fbarney_rx$P2SEL$0$0 == 0x00f5
_P2SEL	=	0x00f5
Fbarney_rx$P1INP$0$0 == 0x00f6
_P1INP	=	0x00f6
Fbarney_rx$P2INP$0$0 == 0x00f7
_P2INP	=	0x00f7
Fbarney_rx$U1CSR$0$0 == 0x00f8
_U1CSR	=	0x00f8
Fbarney_rx$U1DBUF$0$0 == 0x00f9
_U1DBUF	=	0x00f9
Fbarney_rx$U1BAUD$0$0 == 0x00fa
_U1BAUD	=	0x00fa
Fbarney_rx$U1UCR$0$0 == 0x00fb
_U1UCR	=	0x00fb
Fbarney_rx$U1GCR$0$0 == 0x00fc
_U1GCR	=	0x00fc
Fbarney_rx$P0DIR$0$0 == 0x00fd
_P0DIR	=	0x00fd
Fbarney_rx$P1DIR$0$0 == 0x00fe
_P1DIR	=	0x00fe
Fbarney_rx$P2DIR$0$0 == 0x00ff
_P2DIR	=	0x00ff
Fbarney_rx$DMA0CFG$0$0 == 0xffffd5d4
_DMA0CFG	=	0xffffd5d4
Fbarney_rx$DMA1CFG$0$0 == 0xffffd3d2
_DMA1CFG	=	0xffffd3d2
Fbarney_rx$FADDR$0$0 == 0xffffadac
_FADDR	=	0xffffadac
Fbarney_rx$ADC$0$0 == 0xffffbbba
_ADC	=	0xffffbbba
Fbarney_rx$T1CC0$0$0 == 0xffffdbda
_T1CC0	=	0xffffdbda
Fbarney_rx$T1CC1$0$0 == 0xffffdddc
_T1CC1	=	0xffffdddc
Fbarney_rx$T1CC2$0$0 == 0xffffdfde
_T1CC2	=	0xffffdfde
;--------------------------------------------------------
; special function bits
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
Fbarney_rx$P0_0$0$0 == 0x0080
_P0_0	=	0x0080
Fbarney_rx$P0_1$0$0 == 0x0081
_P0_1	=	0x0081
Fbarney_rx$P0_2$0$0 == 0x0082
_P0_2	=	0x0082
Fbarney_rx$P0_3$0$0 == 0x0083
_P0_3	=	0x0083
Fbarney_rx$P0_4$0$0 == 0x0084
_P0_4	=	0x0084
Fbarney_rx$P0_5$0$0 == 0x0085
_P0_5	=	0x0085
Fbarney_rx$P0_6$0$0 == 0x0086
_P0_6	=	0x0086
Fbarney_rx$P0_7$0$0 == 0x0087
_P0_7	=	0x0087
Fbarney_rx$_TCON_0$0$0 == 0x0088
__TCON_0	=	0x0088
Fbarney_rx$RFTXRXIF$0$0 == 0x0089
_RFTXRXIF	=	0x0089
Fbarney_rx$_TCON_2$0$0 == 0x008a
__TCON_2	=	0x008a
Fbarney_rx$URX0IF$0$0 == 0x008b
_URX0IF	=	0x008b
Fbarney_rx$_TCON_4$0$0 == 0x008c
__TCON_4	=	0x008c
Fbarney_rx$ADCIF$0$0 == 0x008d
_ADCIF	=	0x008d
Fbarney_rx$_TCON_6$0$0 == 0x008e
__TCON_6	=	0x008e
Fbarney_rx$URX1IF$0$0 == 0x008f
_URX1IF	=	0x008f
Fbarney_rx$P1_0$0$0 == 0x0090
_P1_0	=	0x0090
Fbarney_rx$P1_1$0$0 == 0x0091
_P1_1	=	0x0091
Fbarney_rx$P1_2$0$0 == 0x0092
_P1_2	=	0x0092
Fbarney_rx$P1_3$0$0 == 0x0093
_P1_3	=	0x0093
Fbarney_rx$P1_4$0$0 == 0x0094
_P1_4	=	0x0094
Fbarney_rx$P1_5$0$0 == 0x0095
_P1_5	=	0x0095
Fbarney_rx$P1_6$0$0 == 0x0096
_P1_6	=	0x0096
Fbarney_rx$P1_7$0$0 == 0x0097
_P1_7	=	0x0097
Fbarney_rx$ENCIF_0$0$0 == 0x0098
_ENCIF_0	=	0x0098
Fbarney_rx$ENCIF_1$0$0 == 0x0099
_ENCIF_1	=	0x0099
Fbarney_rx$_SOCON2$0$0 == 0x009a
__SOCON2	=	0x009a
Fbarney_rx$_SOCON3$0$0 == 0x009b
__SOCON3	=	0x009b
Fbarney_rx$_SOCON4$0$0 == 0x009c
__SOCON4	=	0x009c
Fbarney_rx$_SOCON5$0$0 == 0x009d
__SOCON5	=	0x009d
Fbarney_rx$_SOCON6$0$0 == 0x009e
__SOCON6	=	0x009e
Fbarney_rx$_SOCON7$0$0 == 0x009f
__SOCON7	=	0x009f
Fbarney_rx$P2_0$0$0 == 0x00a0
_P2_0	=	0x00a0
Fbarney_rx$P2_1$0$0 == 0x00a1
_P2_1	=	0x00a1
Fbarney_rx$P2_2$0$0 == 0x00a2
_P2_2	=	0x00a2
Fbarney_rx$P2_3$0$0 == 0x00a3
_P2_3	=	0x00a3
Fbarney_rx$P2_4$0$0 == 0x00a4
_P2_4	=	0x00a4
Fbarney_rx$P2_5$0$0 == 0x00a5
_P2_5	=	0x00a5
Fbarney_rx$P2_6$0$0 == 0x00a6
_P2_6	=	0x00a6
Fbarney_rx$P2_7$0$0 == 0x00a7
_P2_7	=	0x00a7
Fbarney_rx$RFTXRXIE$0$0 == 0x00a8
_RFTXRXIE	=	0x00a8
Fbarney_rx$ADCIE$0$0 == 0x00a9
_ADCIE	=	0x00a9
Fbarney_rx$URX0IE$0$0 == 0x00aa
_URX0IE	=	0x00aa
Fbarney_rx$URX1IE$0$0 == 0x00ab
_URX1IE	=	0x00ab
Fbarney_rx$ENCIE$0$0 == 0x00ac
_ENCIE	=	0x00ac
Fbarney_rx$STIE$0$0 == 0x00ad
_STIE	=	0x00ad
Fbarney_rx$_IEN06$0$0 == 0x00ae
__IEN06	=	0x00ae
Fbarney_rx$EA$0$0 == 0x00af
_EA	=	0x00af
Fbarney_rx$DMAIE$0$0 == 0x00b8
_DMAIE	=	0x00b8
Fbarney_rx$T1IE$0$0 == 0x00b9
_T1IE	=	0x00b9
Fbarney_rx$T2IE$0$0 == 0x00ba
_T2IE	=	0x00ba
Fbarney_rx$T3IE$0$0 == 0x00bb
_T3IE	=	0x00bb
Fbarney_rx$T4IE$0$0 == 0x00bc
_T4IE	=	0x00bc
Fbarney_rx$P0IE$0$0 == 0x00bd
_P0IE	=	0x00bd
Fbarney_rx$_IEN16$0$0 == 0x00be
__IEN16	=	0x00be
Fbarney_rx$_IEN17$0$0 == 0x00bf
__IEN17	=	0x00bf
Fbarney_rx$DMAIF$0$0 == 0x00c0
_DMAIF	=	0x00c0
Fbarney_rx$T1IF$0$0 == 0x00c1
_T1IF	=	0x00c1
Fbarney_rx$T2IF$0$0 == 0x00c2
_T2IF	=	0x00c2
Fbarney_rx$T3IF$0$0 == 0x00c3
_T3IF	=	0x00c3
Fbarney_rx$T4IF$0$0 == 0x00c4
_T4IF	=	0x00c4
Fbarney_rx$P0IF$0$0 == 0x00c5
_P0IF	=	0x00c5
Fbarney_rx$_IRCON6$0$0 == 0x00c6
__IRCON6	=	0x00c6
Fbarney_rx$STIF$0$0 == 0x00c7
_STIF	=	0x00c7
Fbarney_rx$P$0$0 == 0x00d0
_P	=	0x00d0
Fbarney_rx$F1$0$0 == 0x00d1
_F1	=	0x00d1
Fbarney_rx$OV$0$0 == 0x00d2
_OV	=	0x00d2
Fbarney_rx$RS0$0$0 == 0x00d3
_RS0	=	0x00d3
Fbarney_rx$RS1$0$0 == 0x00d4
_RS1	=	0x00d4
Fbarney_rx$F0$0$0 == 0x00d5
_F0	=	0x00d5
Fbarney_rx$AC$0$0 == 0x00d6
_AC	=	0x00d6
Fbarney_rx$CY$0$0 == 0x00d7
_CY	=	0x00d7
Fbarney_rx$T3OVFIF$0$0 == 0x00d8
_T3OVFIF	=	0x00d8
Fbarney_rx$T3CH0IF$0$0 == 0x00d9
_T3CH0IF	=	0x00d9
Fbarney_rx$T3CH1IF$0$0 == 0x00da
_T3CH1IF	=	0x00da
Fbarney_rx$T4OVFIF$0$0 == 0x00db
_T4OVFIF	=	0x00db
Fbarney_rx$T4CH0IF$0$0 == 0x00dc
_T4CH0IF	=	0x00dc
Fbarney_rx$T4CH1IF$0$0 == 0x00dd
_T4CH1IF	=	0x00dd
Fbarney_rx$OVFIM$0$0 == 0x00de
_OVFIM	=	0x00de
Fbarney_rx$_TIMIF7$0$0 == 0x00df
__TIMIF7	=	0x00df
Fbarney_rx$ACC_0$0$0 == 0x00e0
_ACC_0	=	0x00e0
Fbarney_rx$ACC_1$0$0 == 0x00e1
_ACC_1	=	0x00e1
Fbarney_rx$ACC_2$0$0 == 0x00e2
_ACC_2	=	0x00e2
Fbarney_rx$ACC_3$0$0 == 0x00e3
_ACC_3	=	0x00e3
Fbarney_rx$ACC_4$0$0 == 0x00e4
_ACC_4	=	0x00e4
Fbarney_rx$ACC_5$0$0 == 0x00e5
_ACC_5	=	0x00e5
Fbarney_rx$ACC_6$0$0 == 0x00e6
_ACC_6	=	0x00e6
Fbarney_rx$ACC_7$0$0 == 0x00e7
_ACC_7	=	0x00e7
Fbarney_rx$P2IF$0$0 == 0x00e8
_P2IF	=	0x00e8
Fbarney_rx$UTX0IF$0$0 == 0x00e9
_UTX0IF	=	0x00e9
Fbarney_rx$UTX1IF$0$0 == 0x00ea
_UTX1IF	=	0x00ea
Fbarney_rx$P1IF$0$0 == 0x00eb
_P1IF	=	0x00eb
Fbarney_rx$WDTIF$0$0 == 0x00ec
_WDTIF	=	0x00ec
Fbarney_rx$_IRCON25$0$0 == 0x00ed
__IRCON25	=	0x00ed
Fbarney_rx$_IRCON26$0$0 == 0x00ee
__IRCON26	=	0x00ee
Fbarney_rx$_IRCON27$0$0 == 0x00ef
__IRCON27	=	0x00ef
Fbarney_rx$B_0$0$0 == 0x00f0
_B_0	=	0x00f0
Fbarney_rx$B_1$0$0 == 0x00f1
_B_1	=	0x00f1
Fbarney_rx$B_2$0$0 == 0x00f2
_B_2	=	0x00f2
Fbarney_rx$B_3$0$0 == 0x00f3
_B_3	=	0x00f3
Fbarney_rx$B_4$0$0 == 0x00f4
_B_4	=	0x00f4
Fbarney_rx$B_5$0$0 == 0x00f5
_B_5	=	0x00f5
Fbarney_rx$B_6$0$0 == 0x00f6
_B_6	=	0x00f6
Fbarney_rx$B_7$0$0 == 0x00f7
_B_7	=	0x00f7
Fbarney_rx$U1ACTIVE$0$0 == 0x00f8
_U1ACTIVE	=	0x00f8
Fbarney_rx$U1TX_BYTE$0$0 == 0x00f9
_U1TX_BYTE	=	0x00f9
Fbarney_rx$U1RX_BYTE$0$0 == 0x00fa
_U1RX_BYTE	=	0x00fa
Fbarney_rx$U1ERR$0$0 == 0x00fb
_U1ERR	=	0x00fb
Fbarney_rx$U1FE$0$0 == 0x00fc
_U1FE	=	0x00fc
Fbarney_rx$U1SLAVE$0$0 == 0x00fd
_U1SLAVE	=	0x00fd
Fbarney_rx$U1RE$0$0 == 0x00fe
_U1RE	=	0x00fe
Fbarney_rx$U1MODE$0$0 == 0x00ff
_U1MODE	=	0x00ff
;--------------------------------------------------------
; overlayable register banks
;--------------------------------------------------------
	.area REG_BANK_0	(REL,OVR,DATA)
	.ds 8
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	.area DSEG    (DATA)
Lbarney_rx.radioToUart1Service$sloc0$1$0==.
_radioToUart1Service_sloc0_1_0:
	.ds 1
Lbarney_rx.radioToUart1Service$sloc1$1$0==.
_radioToUart1Service_sloc1_1_0:
	.ds 2
Lbarney_rx.radioToUart1Service$sloc2$1$0==.
_radioToUart1Service_sloc2_1_0:
	.ds 2
Lbarney_rx.radioToUart1Service$sloc3$1$0==.
_radioToUart1Service_sloc3_1_0:
	.ds 2
Lbarney_rx.radioToUart1Service$sloc4$1$0==.
_radioToUart1Service_sloc4_1_0:
	.ds 4
Lbarney_rx.radioToUart1Service$sloc5$1$0==.
_radioToUart1Service_sloc5_1_0:
	.ds 2
Lbarney_rx.radioToUart1Service$sloc6$1$0==.
_radioToUart1Service_sloc6_1_0:
	.ds 2
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
	.area OSEG    (OVR,DATA)
;--------------------------------------------------------
; Stack segment in internal ram 
;--------------------------------------------------------
	.area	SSEG	(DATA)
__start__stack:
	.ds	1

;--------------------------------------------------------
; indirectly addressable internal ram data
;--------------------------------------------------------
	.area ISEG    (DATA)
;--------------------------------------------------------
; absolute internal ram data
;--------------------------------------------------------
	.area IABS    (ABS,DATA)
	.area IABS    (ABS,DATA)
;--------------------------------------------------------
; bit data
;--------------------------------------------------------
	.area BSEG    (BIT)
;--------------------------------------------------------
; paged external ram data
;--------------------------------------------------------
	.area PSEG    (PAG,XDATA)
Lbarney_rx.radioToUart1Service$rxPacket$1$1==.
_radioToUart1Service_rxPacket_1_1:
	.ds 2
;--------------------------------------------------------
; external ram data
;--------------------------------------------------------
	.area XSEG    (XDATA)
Fbarney_rx$SYNC1$0$0 == 0xdf00
_SYNC1	=	0xdf00
Fbarney_rx$SYNC0$0$0 == 0xdf01
_SYNC0	=	0xdf01
Fbarney_rx$PKTLEN$0$0 == 0xdf02
_PKTLEN	=	0xdf02
Fbarney_rx$PKTCTRL1$0$0 == 0xdf03
_PKTCTRL1	=	0xdf03
Fbarney_rx$PKTCTRL0$0$0 == 0xdf04
_PKTCTRL0	=	0xdf04
Fbarney_rx$ADDR$0$0 == 0xdf05
_ADDR	=	0xdf05
Fbarney_rx$CHANNR$0$0 == 0xdf06
_CHANNR	=	0xdf06
Fbarney_rx$FSCTRL1$0$0 == 0xdf07
_FSCTRL1	=	0xdf07
Fbarney_rx$FSCTRL0$0$0 == 0xdf08
_FSCTRL0	=	0xdf08
Fbarney_rx$FREQ2$0$0 == 0xdf09
_FREQ2	=	0xdf09
Fbarney_rx$FREQ1$0$0 == 0xdf0a
_FREQ1	=	0xdf0a
Fbarney_rx$FREQ0$0$0 == 0xdf0b
_FREQ0	=	0xdf0b
Fbarney_rx$MDMCFG4$0$0 == 0xdf0c
_MDMCFG4	=	0xdf0c
Fbarney_rx$MDMCFG3$0$0 == 0xdf0d
_MDMCFG3	=	0xdf0d
Fbarney_rx$MDMCFG2$0$0 == 0xdf0e
_MDMCFG2	=	0xdf0e
Fbarney_rx$MDMCFG1$0$0 == 0xdf0f
_MDMCFG1	=	0xdf0f
Fbarney_rx$MDMCFG0$0$0 == 0xdf10
_MDMCFG0	=	0xdf10
Fbarney_rx$DEVIATN$0$0 == 0xdf11
_DEVIATN	=	0xdf11
Fbarney_rx$MCSM2$0$0 == 0xdf12
_MCSM2	=	0xdf12
Fbarney_rx$MCSM1$0$0 == 0xdf13
_MCSM1	=	0xdf13
Fbarney_rx$MCSM0$0$0 == 0xdf14
_MCSM0	=	0xdf14
Fbarney_rx$FOCCFG$0$0 == 0xdf15
_FOCCFG	=	0xdf15
Fbarney_rx$BSCFG$0$0 == 0xdf16
_BSCFG	=	0xdf16
Fbarney_rx$AGCCTRL2$0$0 == 0xdf17
_AGCCTRL2	=	0xdf17
Fbarney_rx$AGCCTRL1$0$0 == 0xdf18
_AGCCTRL1	=	0xdf18
Fbarney_rx$AGCCTRL0$0$0 == 0xdf19
_AGCCTRL0	=	0xdf19
Fbarney_rx$FREND1$0$0 == 0xdf1a
_FREND1	=	0xdf1a
Fbarney_rx$FREND0$0$0 == 0xdf1b
_FREND0	=	0xdf1b
Fbarney_rx$FSCAL3$0$0 == 0xdf1c
_FSCAL3	=	0xdf1c
Fbarney_rx$FSCAL2$0$0 == 0xdf1d
_FSCAL2	=	0xdf1d
Fbarney_rx$FSCAL1$0$0 == 0xdf1e
_FSCAL1	=	0xdf1e
Fbarney_rx$FSCAL0$0$0 == 0xdf1f
_FSCAL0	=	0xdf1f
Fbarney_rx$TEST2$0$0 == 0xdf23
_TEST2	=	0xdf23
Fbarney_rx$TEST1$0$0 == 0xdf24
_TEST1	=	0xdf24
Fbarney_rx$TEST0$0$0 == 0xdf25
_TEST0	=	0xdf25
Fbarney_rx$PA_TABLE0$0$0 == 0xdf2e
_PA_TABLE0	=	0xdf2e
Fbarney_rx$IOCFG2$0$0 == 0xdf2f
_IOCFG2	=	0xdf2f
Fbarney_rx$IOCFG1$0$0 == 0xdf30
_IOCFG1	=	0xdf30
Fbarney_rx$IOCFG0$0$0 == 0xdf31
_IOCFG0	=	0xdf31
Fbarney_rx$PARTNUM$0$0 == 0xdf36
_PARTNUM	=	0xdf36
Fbarney_rx$VERSION$0$0 == 0xdf37
_VERSION	=	0xdf37
Fbarney_rx$FREQEST$0$0 == 0xdf38
_FREQEST	=	0xdf38
Fbarney_rx$LQI$0$0 == 0xdf39
_LQI	=	0xdf39
Fbarney_rx$RSSI$0$0 == 0xdf3a
_RSSI	=	0xdf3a
Fbarney_rx$MARCSTATE$0$0 == 0xdf3b
_MARCSTATE	=	0xdf3b
Fbarney_rx$PKTSTATUS$0$0 == 0xdf3c
_PKTSTATUS	=	0xdf3c
Fbarney_rx$VCO_VC_DAC$0$0 == 0xdf3d
_VCO_VC_DAC	=	0xdf3d
Fbarney_rx$I2SCFG0$0$0 == 0xdf40
_I2SCFG0	=	0xdf40
Fbarney_rx$I2SCFG1$0$0 == 0xdf41
_I2SCFG1	=	0xdf41
Fbarney_rx$I2SDATL$0$0 == 0xdf42
_I2SDATL	=	0xdf42
Fbarney_rx$I2SDATH$0$0 == 0xdf43
_I2SDATH	=	0xdf43
Fbarney_rx$I2SWCNT$0$0 == 0xdf44
_I2SWCNT	=	0xdf44
Fbarney_rx$I2SSTAT$0$0 == 0xdf45
_I2SSTAT	=	0xdf45
Fbarney_rx$I2SCLKF0$0$0 == 0xdf46
_I2SCLKF0	=	0xdf46
Fbarney_rx$I2SCLKF1$0$0 == 0xdf47
_I2SCLKF1	=	0xdf47
Fbarney_rx$I2SCLKF2$0$0 == 0xdf48
_I2SCLKF2	=	0xdf48
Fbarney_rx$USBADDR$0$0 == 0xde00
_USBADDR	=	0xde00
Fbarney_rx$USBPOW$0$0 == 0xde01
_USBPOW	=	0xde01
Fbarney_rx$USBIIF$0$0 == 0xde02
_USBIIF	=	0xde02
Fbarney_rx$USBOIF$0$0 == 0xde04
_USBOIF	=	0xde04
Fbarney_rx$USBCIF$0$0 == 0xde06
_USBCIF	=	0xde06
Fbarney_rx$USBIIE$0$0 == 0xde07
_USBIIE	=	0xde07
Fbarney_rx$USBOIE$0$0 == 0xde09
_USBOIE	=	0xde09
Fbarney_rx$USBCIE$0$0 == 0xde0b
_USBCIE	=	0xde0b
Fbarney_rx$USBFRML$0$0 == 0xde0c
_USBFRML	=	0xde0c
Fbarney_rx$USBFRMH$0$0 == 0xde0d
_USBFRMH	=	0xde0d
Fbarney_rx$USBINDEX$0$0 == 0xde0e
_USBINDEX	=	0xde0e
Fbarney_rx$USBMAXI$0$0 == 0xde10
_USBMAXI	=	0xde10
Fbarney_rx$USBCSIL$0$0 == 0xde11
_USBCSIL	=	0xde11
Fbarney_rx$USBCSIH$0$0 == 0xde12
_USBCSIH	=	0xde12
Fbarney_rx$USBMAXO$0$0 == 0xde13
_USBMAXO	=	0xde13
Fbarney_rx$USBCSOL$0$0 == 0xde14
_USBCSOL	=	0xde14
Fbarney_rx$USBCSOH$0$0 == 0xde15
_USBCSOH	=	0xde15
Fbarney_rx$USBCNTL$0$0 == 0xde16
_USBCNTL	=	0xde16
Fbarney_rx$USBCNTH$0$0 == 0xde17
_USBCNTH	=	0xde17
Fbarney_rx$USBF0$0$0 == 0xde20
_USBF0	=	0xde20
Fbarney_rx$USBF1$0$0 == 0xde22
_USBF1	=	0xde22
Fbarney_rx$USBF2$0$0 == 0xde24
_USBF2	=	0xde24
Fbarney_rx$USBF3$0$0 == 0xde26
_USBF3	=	0xde26
Fbarney_rx$USBF4$0$0 == 0xde28
_USBF4	=	0xde28
Fbarney_rx$USBF5$0$0 == 0xde2a
_USBF5	=	0xde2a
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area XABS    (ABS,XDATA)
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
	.area XISEG   (XDATA)
	.area HOME    (CODE)
	.area GSINIT0 (CODE)
	.area GSINIT1 (CODE)
	.area GSINIT2 (CODE)
	.area GSINIT3 (CODE)
	.area GSINIT4 (CODE)
	.area GSINIT5 (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area CSEG    (CODE)
;--------------------------------------------------------
; interrupt vector 
;--------------------------------------------------------
	.area HOME    (CODE)
__interrupt_vect:
	ljmp	__sdcc_gsinit_startup
	reti
	.ds	7
	reti
	.ds	7
	reti
	.ds	7
	ljmp	_ISR_URX1
	.ds	5
	reti
	.ds	7
	reti
	.ds	7
	reti
	.ds	7
	reti
	.ds	7
	reti
	.ds	7
	reti
	.ds	7
	reti
	.ds	7
	reti
	.ds	7
	ljmp	_ISR_T4
	.ds	5
	reti
	.ds	7
	ljmp	_ISR_UTX1
	.ds	5
	reti
	.ds	7
	ljmp	_ISR_RF
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME    (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area GSINIT  (CODE)
	.globl __sdcc_gsinit_startup
	.globl __sdcc_program_startup
	.globl __start__stack
	.globl __mcs51_genXINIT
	.globl __mcs51_genXRAMCLEAR
	.globl __mcs51_genRAMCLEAR
	.area GSFINAL (CODE)
	ljmp	__sdcc_program_startup
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME    (CODE)
	.area HOME    (CODE)
__sdcc_program_startup:
	lcall	_main
;	return from main will lock up
	sjmp .
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CSEG    (CODE)
;------------------------------------------------------------
;Allocation info for local variables in function 'updateLeds'
;------------------------------------------------------------
	G$updateLeds$0$0 ==.
	C$barney_rx.c$41$0$0 ==.
;	apps/barney_rx/barney_rx.c:41: void updateLeds()
;	-----------------------------------------
;	 function updateLeds
;	-----------------------------------------
_updateLeds:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
	C$barney_rx.c$43$2$2 ==.
;	apps/barney_rx/barney_rx.c:43: LED_GREEN_TOGGLE();
	xrl	_P2DIR,#0x10
	C$barney_rx.c$44$2$3 ==.
;	apps/barney_rx/barney_rx.c:44: LED_YELLOW(ACM_CONTROL_LINE_DTR);
	orl	_P2DIR,#0x04
	C$barney_rx.c$45$2$4 ==.
;	apps/barney_rx/barney_rx.c:45: LED_RED(0);
	mov	r7,_P2DIR
	anl	ar7,#0xFD
	mov	_P2DIR,r7
	C$barney_rx.c$46$2$4 ==.
	XG$updateLeds$0$0 ==.
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'putchar'
;------------------------------------------------------------
	G$putchar$0$0 ==.
	C$barney_rx.c$48$2$4 ==.
;	apps/barney_rx/barney_rx.c:48: void putchar(char c)
;	-----------------------------------------
;	 function putchar
;	-----------------------------------------
_putchar:
	C$barney_rx.c$50$1$1 ==.
;	apps/barney_rx/barney_rx.c:50: uart1TxSendByte(c);
	lcall	_uart1TxSendByte
	C$barney_rx.c$51$1$1 ==.
	XG$putchar$0$0 ==.
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'radioToUart1Service'
;------------------------------------------------------------
;sloc0                     Allocated with name '_radioToUart1Service_sloc0_1_0'
;sloc1                     Allocated with name '_radioToUart1Service_sloc1_1_0'
;sloc2                     Allocated with name '_radioToUart1Service_sloc2_1_0'
;sloc3                     Allocated with name '_radioToUart1Service_sloc3_1_0'
;sloc4                     Allocated with name '_radioToUart1Service_sloc4_1_0'
;sloc5                     Allocated with name '_radioToUart1Service_sloc5_1_0'
;sloc6                     Allocated with name '_radioToUart1Service_sloc6_1_0'
;------------------------------------------------------------
	G$radioToUart1Service$0$0 ==.
	C$barney_rx.c$53$1$1 ==.
;	apps/barney_rx/barney_rx.c:53: void radioToUart1Service()
;	-----------------------------------------
;	 function radioToUart1Service
;	-----------------------------------------
_radioToUart1Service:
	C$barney_rx.c$59$1$1 ==.
;	apps/barney_rx/barney_rx.c:59: if ((rxPacket = (adcReport XDATA *)radioQueueRxCurrentPacket()) && uart1TxAvailable() >= 64)
	lcall	_radioQueueRxCurrentPacket
	mov	r6,dpl
	mov	r7,dph
	mov	r0,#_radioToUart1Service_rxPacket_1_1
	mov	a,r6
	movx	@r0,a
	inc	r0
	mov	a,r7
	movx	@r0,a
	mov	a,r6
	orl	a,r7
	jnz	00118$
	ljmp	00108$
00118$:
	lcall	_uart1TxAvailable
	mov	r7,dpl
	cjne	r7,#0x40,00119$
00119$:
	jnc	00120$
	ljmp	00108$
00120$:
	C$barney_rx.c$75$2$2 ==.
;	apps/barney_rx/barney_rx.c:75: rxPacket->quality & 0x7F // LQI
	mov	r0,#_radioToUart1Service_rxPacket_1_1
	movx	a,@r0
	add	a,#0x12
	mov	r6,a
	inc	r0
	movx	a,@r0
	addc	a,#0x00
	mov	r7,a
	mov	dpl,r6
	mov	dph,r7
	movx	a,@dptr
	mov	r3,a
	anl	ar3,#0x7F
	mov	_radioToUart1Service_sloc3_1_0,r3
	mov	(_radioToUart1Service_sloc3_1_0 + 1),#0x00
	C$barney_rx.c$74$2$2 ==.
;	apps/barney_rx/barney_rx.c:74: rxPacket->rssi/2 - 71,   // RSSI
	mov	r0,#_radioToUart1Service_rxPacket_1_1
	movx	a,@r0
	add	a,#0x11
	mov	dpl,a
	inc	r0
	movx	a,@r0
	addc	a,#0x00
	mov	dph,a
	movx	a,@dptr
	mov	_radioToUart1Service_sloc0_1_0,a
	clr	F0
	mov	b,#0x02
	mov	a,_radioToUart1Service_sloc0_1_0
	jnb	acc.7,00121$
	cpl	F0
	cpl	a
	inc	a
00121$:
	div	ab
	jnb	F0,00122$
	cpl	a
	inc	a
00122$:
	push	acc
	mov	c,F0
	subb	a,acc
	mov	b,a
	pop	acc
	add	a,#0xB9
	mov	_radioToUart1Service_sloc1_1_0,a
	mov	a,b
	addc	a,#0xFF
	mov	(_radioToUart1Service_sloc1_1_0 + 1),a
	C$barney_rx.c$73$2$2 ==.
;	apps/barney_rx/barney_rx.c:73: rxPacket->length,		// Wie viele Pakete wurden empfangen
	mov	r0,#_radioToUart1Service_rxPacket_1_1
	movx	a,@r0
	mov	dpl,a
	inc	r0
	movx	a,@r0
	mov	dph,a
	movx	a,@dptr
	mov	r5,a
	mov	_radioToUart1Service_sloc2_1_0,r5
	mov	(_radioToUart1Service_sloc2_1_0 + 1),#0x00
	C$barney_rx.c$72$2$2 ==.
;	apps/barney_rx/barney_rx.c:72: getMs(),					// Millisekunden 32bit
	push	ar7
	push	ar6
	lcall	_getMs
	mov	_radioToUart1Service_sloc4_1_0,dpl
	mov	(_radioToUart1Service_sloc4_1_0 + 1),dph
	mov	(_radioToUart1Service_sloc4_1_0 + 2),b
	mov	(_radioToUart1Service_sloc4_1_0 + 3),a
	C$barney_rx.c$71$2$2 ==.
;	apps/barney_rx/barney_rx.c:71: rxPacket->serialNumber[0],
	mov	r0,#_radioToUart1Service_rxPacket_1_1
	movx	a,@r0
	add	a,#0x01
	mov	dpl,a
	inc	r0
	movx	a,@r0
	addc	a,#0x00
	mov	dph,a
	movx	a,@dptr
	mov	r5,a
	mov	r4,#0x00
	C$barney_rx.c$70$2$2 ==.
;	apps/barney_rx/barney_rx.c:70: rxPacket->serialNumber[1],
	mov	r0,#_radioToUart1Service_rxPacket_1_1
	movx	a,@r0
	add	a,#0x02
	mov	dpl,a
	inc	r0
	movx	a,@r0
	addc	a,#0x00
	mov	dph,a
	movx	a,@dptr
	mov	r3,a
	mov	_radioToUart1Service_sloc5_1_0,r3
	mov	(_radioToUart1Service_sloc5_1_0 + 1),#0x00
	C$barney_rx.c$69$2$2 ==.
;	apps/barney_rx/barney_rx.c:69: rxPacket->serialNumber[2],
	mov	r0,#_radioToUart1Service_rxPacket_1_1
	movx	a,@r0
	add	a,#0x03
	mov	dpl,a
	inc	r0
	movx	a,@r0
	addc	a,#0x00
	mov	dph,a
	movx	a,@dptr
	mov	r3,a
	mov	_radioToUart1Service_sloc6_1_0,r3
	mov	(_radioToUart1Service_sloc6_1_0 + 1),#0x00
	C$barney_rx.c$68$2$2 ==.
;	apps/barney_rx/barney_rx.c:68: rxPacket->serialNumber[3],
	mov	r0,#_radioToUart1Service_rxPacket_1_1
	movx	a,@r0
	add	a,#0x04
	mov	dpl,a
	inc	r0
	movx	a,@r0
	addc	a,#0x00
	mov	dph,a
	movx	a,@dptr
	mov	r3,a
	mov	r2,#0x00
	C$barney_rx.c$67$2$2 ==.
;	apps/barney_rx/barney_rx.c:67: printf("%02X-%02X-%02X-%02X,%12lu,%4d,%4d,%4d, ",
	push	_radioToUart1Service_sloc3_1_0
	push	(_radioToUart1Service_sloc3_1_0 + 1)
	push	_radioToUart1Service_sloc1_1_0
	push	(_radioToUart1Service_sloc1_1_0 + 1)
	push	_radioToUart1Service_sloc2_1_0
	push	(_radioToUart1Service_sloc2_1_0 + 1)
	push	_radioToUart1Service_sloc4_1_0
	push	(_radioToUart1Service_sloc4_1_0 + 1)
	push	(_radioToUart1Service_sloc4_1_0 + 2)
	push	(_radioToUart1Service_sloc4_1_0 + 3)
	push	ar5
	push	ar4
	push	_radioToUart1Service_sloc5_1_0
	push	(_radioToUart1Service_sloc5_1_0 + 1)
	push	_radioToUart1Service_sloc6_1_0
	push	(_radioToUart1Service_sloc6_1_0 + 1)
	push	ar3
	push	ar2
	mov	a,#__str_0
	push	acc
	mov	a,#(__str_0 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xeb
	mov	sp,a
	pop	ar6
	pop	ar7
	C$barney_rx.c$80$2$2 ==.
;	apps/barney_rx/barney_rx.c:80: putchar((rxPacket->quality & 0x80) ? '1' : '0');
	mov	dpl,r6
	mov	dph,r7
	movx	a,@dptr
	mov	r6,a
	jnb	acc.7,00110$
	mov	r7,#0x31
	sjmp	00111$
00110$:
	mov	r7,#0x30
00111$:
	mov	dpl,r7
	lcall	_putchar
	C$barney_rx.c$82$3$3 ==.
;	apps/barney_rx/barney_rx.c:82: for(i = 0; i < 6; i++)
	mov	r0,#_radioToUart1Service_rxPacket_1_1
	movx	a,@r0
	add	a,#0x05
	mov	r6,a
	inc	r0
	movx	a,@r0
	addc	a,#0x00
	mov	r7,a
	mov	r5,#0x00
00104$:
	cjne	r5,#0x06,00124$
00124$:
	jnc	00107$
	C$barney_rx.c$84$3$3 ==.
;	apps/barney_rx/barney_rx.c:84: printf(",%5u", rxPacket->readings[i]);
	mov	a,r5
	add	a,r5
	add	a,r6
	mov	dpl,a
	clr	a
	addc	a,r7
	mov	dph,a
	movx	a,@dptr
	mov	r3,a
	inc	dptr
	movx	a,@dptr
	mov	r4,a
	push	ar7
	push	ar6
	push	ar5
	push	ar3
	push	ar4
	mov	a,#__str_1
	push	acc
	mov	a,#(__str_1 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xfb
	mov	sp,a
	pop	ar5
	pop	ar6
	pop	ar7
	C$barney_rx.c$82$2$2 ==.
;	apps/barney_rx/barney_rx.c:82: for(i = 0; i < 6; i++)
	inc	r5
	sjmp	00104$
00107$:
	C$barney_rx.c$87$2$2 ==.
;	apps/barney_rx/barney_rx.c:87: putchar('\r');
	mov	dpl,#0x0D
	lcall	_putchar
	C$barney_rx.c$88$2$2 ==.
;	apps/barney_rx/barney_rx.c:88: putchar('\n');
	mov	dpl,#0x0A
	lcall	_putchar
	C$barney_rx.c$90$2$2 ==.
;	apps/barney_rx/barney_rx.c:90: radioQueueRxDoneWithPacket();
	lcall	_radioQueueRxDoneWithPacket
00108$:
	C$barney_rx.c$92$2$1 ==.
	XG$radioToUart1Service$0$0 ==.
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'lineCodingChanged'
;------------------------------------------------------------
	G$lineCodingChanged$0$0 ==.
	C$barney_rx.c$94$2$1 ==.
;	apps/barney_rx/barney_rx.c:94: void lineCodingChanged()
;	-----------------------------------------
;	 function lineCodingChanged
;	-----------------------------------------
_lineCodingChanged:
	C$barney_rx.c$96$1$1 ==.
;	apps/barney_rx/barney_rx.c:96: uart1SetBaudRate(230400); //230400
	mov	dptr,#0x8400
	mov	b,#0x03
	clr	a
	lcall	_uart1SetBaudRate
	C$barney_rx.c$97$1$1 ==.
;	apps/barney_rx/barney_rx.c:97: uart1SetParity(0);
	mov	dpl,#0x00
	lcall	_uart1SetParity
	C$barney_rx.c$98$1$1 ==.
;	apps/barney_rx/barney_rx.c:98: uart1SetStopBits(0);
	mov	dpl,#0x00
	lcall	_uart1SetStopBits
	C$barney_rx.c$99$1$1 ==.
	XG$lineCodingChanged$0$0 ==.
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
	G$main$0$0 ==.
	C$barney_rx.c$101$1$1 ==.
;	apps/barney_rx/barney_rx.c:101: void main(void)
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
	C$barney_rx.c$103$1$1 ==.
;	apps/barney_rx/barney_rx.c:103: systemInit();
	lcall	_systemInit
	C$barney_rx.c$105$1$1 ==.
;	apps/barney_rx/barney_rx.c:105: radioQueueInit();
	lcall	_radioQueueInit
	C$barney_rx.c$106$1$1 ==.
;	apps/barney_rx/barney_rx.c:106: radioQueueAllowCrcErrors = 1;  //Fehlerhafte Pakete zulassen
	setb	_radioQueueAllowCrcErrors
	C$barney_rx.c$108$1$1 ==.
;	apps/barney_rx/barney_rx.c:108: uart1Init();
	lcall	_uart1Init
	C$barney_rx.c$109$1$1 ==.
;	apps/barney_rx/barney_rx.c:109: lineCodingChanged();
	lcall	_lineCodingChanged
	C$barney_rx.c$111$1$1 ==.
;	apps/barney_rx/barney_rx.c:111: while(1)
00102$:
	C$barney_rx.c$113$2$2 ==.
;	apps/barney_rx/barney_rx.c:113: updateLeds();
	lcall	_updateLeds
	C$barney_rx.c$114$2$2 ==.
;	apps/barney_rx/barney_rx.c:114: boardService();
	lcall	_boardService
	C$barney_rx.c$115$2$2 ==.
;	apps/barney_rx/barney_rx.c:115: usbComService();
	lcall	_usbComService
	C$barney_rx.c$116$2$2 ==.
;	apps/barney_rx/barney_rx.c:116: radioToUart1Service();
	lcall	_radioToUart1Service
	sjmp	00102$
	C$barney_rx.c$118$1$1 ==.
	XG$main$0$0 ==.
	ret
	.area CSEG    (CODE)
	.area CONST   (CODE)
Fbarney_rx$_str_0$0$0 == .
__str_0:
	.ascii "%02X-%02X-%02X-%02X,%12lu,%4d,%4d,%4d, "
	.db 0x00
Fbarney_rx$_str_1$0$0 == .
__str_1:
	.ascii ",%5u"
	.db 0x00
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
