;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.1.0 #7066 (Nov 22 2011) (MINGW32)
; This file was generated Mon Jul 20 08:37:32 2015
;--------------------------------------------------------
	.module bambam_remote_tx
	.optsdcc -mmcs51 --model-medium
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _param_report_period_ms
	.globl _param_input_mode
	.globl _main
	.globl _adcToRadioService
	.globl _updateLeds
	.globl _analogInputsInit
	.globl _radioQueueTxSendPacket
	.globl _radioQueueTxCurrentPacket
	.globl _radioQueueInit
	.globl _usbComService
	.globl _usbShowStatusWithGreenLed
	.globl _usbInit
	.globl _adcRead
	.globl _getMs
	.globl _boardService
	.globl _systemInit
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
Fbambam_remote_tx$P0$0$0 == 0x0080
_P0	=	0x0080
Fbambam_remote_tx$SP$0$0 == 0x0081
_SP	=	0x0081
Fbambam_remote_tx$DPL0$0$0 == 0x0082
_DPL0	=	0x0082
Fbambam_remote_tx$DPH0$0$0 == 0x0083
_DPH0	=	0x0083
Fbambam_remote_tx$DPL1$0$0 == 0x0084
_DPL1	=	0x0084
Fbambam_remote_tx$DPH1$0$0 == 0x0085
_DPH1	=	0x0085
Fbambam_remote_tx$U0CSR$0$0 == 0x0086
_U0CSR	=	0x0086
Fbambam_remote_tx$PCON$0$0 == 0x0087
_PCON	=	0x0087
Fbambam_remote_tx$TCON$0$0 == 0x0088
_TCON	=	0x0088
Fbambam_remote_tx$P0IFG$0$0 == 0x0089
_P0IFG	=	0x0089
Fbambam_remote_tx$P1IFG$0$0 == 0x008a
_P1IFG	=	0x008a
Fbambam_remote_tx$P2IFG$0$0 == 0x008b
_P2IFG	=	0x008b
Fbambam_remote_tx$PICTL$0$0 == 0x008c
_PICTL	=	0x008c
Fbambam_remote_tx$P1IEN$0$0 == 0x008d
_P1IEN	=	0x008d
Fbambam_remote_tx$P0INP$0$0 == 0x008f
_P0INP	=	0x008f
Fbambam_remote_tx$P1$0$0 == 0x0090
_P1	=	0x0090
Fbambam_remote_tx$RFIM$0$0 == 0x0091
_RFIM	=	0x0091
Fbambam_remote_tx$DPS$0$0 == 0x0092
_DPS	=	0x0092
Fbambam_remote_tx$MPAGE$0$0 == 0x0093
_MPAGE	=	0x0093
Fbambam_remote_tx$ENDIAN$0$0 == 0x0095
_ENDIAN	=	0x0095
Fbambam_remote_tx$S0CON$0$0 == 0x0098
_S0CON	=	0x0098
Fbambam_remote_tx$IEN2$0$0 == 0x009a
_IEN2	=	0x009a
Fbambam_remote_tx$S1CON$0$0 == 0x009b
_S1CON	=	0x009b
Fbambam_remote_tx$T2CT$0$0 == 0x009c
_T2CT	=	0x009c
Fbambam_remote_tx$T2PR$0$0 == 0x009d
_T2PR	=	0x009d
Fbambam_remote_tx$T2CTL$0$0 == 0x009e
_T2CTL	=	0x009e
Fbambam_remote_tx$P2$0$0 == 0x00a0
_P2	=	0x00a0
Fbambam_remote_tx$WORIRQ$0$0 == 0x00a1
_WORIRQ	=	0x00a1
Fbambam_remote_tx$WORCTRL$0$0 == 0x00a2
_WORCTRL	=	0x00a2
Fbambam_remote_tx$WOREVT0$0$0 == 0x00a3
_WOREVT0	=	0x00a3
Fbambam_remote_tx$WOREVT1$0$0 == 0x00a4
_WOREVT1	=	0x00a4
Fbambam_remote_tx$WORTIME0$0$0 == 0x00a5
_WORTIME0	=	0x00a5
Fbambam_remote_tx$WORTIME1$0$0 == 0x00a6
_WORTIME1	=	0x00a6
Fbambam_remote_tx$IEN0$0$0 == 0x00a8
_IEN0	=	0x00a8
Fbambam_remote_tx$IP0$0$0 == 0x00a9
_IP0	=	0x00a9
Fbambam_remote_tx$FWT$0$0 == 0x00ab
_FWT	=	0x00ab
Fbambam_remote_tx$FADDRL$0$0 == 0x00ac
_FADDRL	=	0x00ac
Fbambam_remote_tx$FADDRH$0$0 == 0x00ad
_FADDRH	=	0x00ad
Fbambam_remote_tx$FCTL$0$0 == 0x00ae
_FCTL	=	0x00ae
Fbambam_remote_tx$FWDATA$0$0 == 0x00af
_FWDATA	=	0x00af
Fbambam_remote_tx$ENCDI$0$0 == 0x00b1
_ENCDI	=	0x00b1
Fbambam_remote_tx$ENCDO$0$0 == 0x00b2
_ENCDO	=	0x00b2
Fbambam_remote_tx$ENCCS$0$0 == 0x00b3
_ENCCS	=	0x00b3
Fbambam_remote_tx$ADCCON1$0$0 == 0x00b4
_ADCCON1	=	0x00b4
Fbambam_remote_tx$ADCCON2$0$0 == 0x00b5
_ADCCON2	=	0x00b5
Fbambam_remote_tx$ADCCON3$0$0 == 0x00b6
_ADCCON3	=	0x00b6
Fbambam_remote_tx$IEN1$0$0 == 0x00b8
_IEN1	=	0x00b8
Fbambam_remote_tx$IP1$0$0 == 0x00b9
_IP1	=	0x00b9
Fbambam_remote_tx$ADCL$0$0 == 0x00ba
_ADCL	=	0x00ba
Fbambam_remote_tx$ADCH$0$0 == 0x00bb
_ADCH	=	0x00bb
Fbambam_remote_tx$RNDL$0$0 == 0x00bc
_RNDL	=	0x00bc
Fbambam_remote_tx$RNDH$0$0 == 0x00bd
_RNDH	=	0x00bd
Fbambam_remote_tx$SLEEP$0$0 == 0x00be
_SLEEP	=	0x00be
Fbambam_remote_tx$IRCON$0$0 == 0x00c0
_IRCON	=	0x00c0
Fbambam_remote_tx$U0DBUF$0$0 == 0x00c1
_U0DBUF	=	0x00c1
Fbambam_remote_tx$U0BAUD$0$0 == 0x00c2
_U0BAUD	=	0x00c2
Fbambam_remote_tx$U0UCR$0$0 == 0x00c4
_U0UCR	=	0x00c4
Fbambam_remote_tx$U0GCR$0$0 == 0x00c5
_U0GCR	=	0x00c5
Fbambam_remote_tx$CLKCON$0$0 == 0x00c6
_CLKCON	=	0x00c6
Fbambam_remote_tx$MEMCTR$0$0 == 0x00c7
_MEMCTR	=	0x00c7
Fbambam_remote_tx$WDCTL$0$0 == 0x00c9
_WDCTL	=	0x00c9
Fbambam_remote_tx$T3CNT$0$0 == 0x00ca
_T3CNT	=	0x00ca
Fbambam_remote_tx$T3CTL$0$0 == 0x00cb
_T3CTL	=	0x00cb
Fbambam_remote_tx$T3CCTL0$0$0 == 0x00cc
_T3CCTL0	=	0x00cc
Fbambam_remote_tx$T3CC0$0$0 == 0x00cd
_T3CC0	=	0x00cd
Fbambam_remote_tx$T3CCTL1$0$0 == 0x00ce
_T3CCTL1	=	0x00ce
Fbambam_remote_tx$T3CC1$0$0 == 0x00cf
_T3CC1	=	0x00cf
Fbambam_remote_tx$PSW$0$0 == 0x00d0
_PSW	=	0x00d0
Fbambam_remote_tx$DMAIRQ$0$0 == 0x00d1
_DMAIRQ	=	0x00d1
Fbambam_remote_tx$DMA1CFGL$0$0 == 0x00d2
_DMA1CFGL	=	0x00d2
Fbambam_remote_tx$DMA1CFGH$0$0 == 0x00d3
_DMA1CFGH	=	0x00d3
Fbambam_remote_tx$DMA0CFGL$0$0 == 0x00d4
_DMA0CFGL	=	0x00d4
Fbambam_remote_tx$DMA0CFGH$0$0 == 0x00d5
_DMA0CFGH	=	0x00d5
Fbambam_remote_tx$DMAARM$0$0 == 0x00d6
_DMAARM	=	0x00d6
Fbambam_remote_tx$DMAREQ$0$0 == 0x00d7
_DMAREQ	=	0x00d7
Fbambam_remote_tx$TIMIF$0$0 == 0x00d8
_TIMIF	=	0x00d8
Fbambam_remote_tx$RFD$0$0 == 0x00d9
_RFD	=	0x00d9
Fbambam_remote_tx$T1CC0L$0$0 == 0x00da
_T1CC0L	=	0x00da
Fbambam_remote_tx$T1CC0H$0$0 == 0x00db
_T1CC0H	=	0x00db
Fbambam_remote_tx$T1CC1L$0$0 == 0x00dc
_T1CC1L	=	0x00dc
Fbambam_remote_tx$T1CC1H$0$0 == 0x00dd
_T1CC1H	=	0x00dd
Fbambam_remote_tx$T1CC2L$0$0 == 0x00de
_T1CC2L	=	0x00de
Fbambam_remote_tx$T1CC2H$0$0 == 0x00df
_T1CC2H	=	0x00df
Fbambam_remote_tx$ACC$0$0 == 0x00e0
_ACC	=	0x00e0
Fbambam_remote_tx$RFST$0$0 == 0x00e1
_RFST	=	0x00e1
Fbambam_remote_tx$T1CNTL$0$0 == 0x00e2
_T1CNTL	=	0x00e2
Fbambam_remote_tx$T1CNTH$0$0 == 0x00e3
_T1CNTH	=	0x00e3
Fbambam_remote_tx$T1CTL$0$0 == 0x00e4
_T1CTL	=	0x00e4
Fbambam_remote_tx$T1CCTL0$0$0 == 0x00e5
_T1CCTL0	=	0x00e5
Fbambam_remote_tx$T1CCTL1$0$0 == 0x00e6
_T1CCTL1	=	0x00e6
Fbambam_remote_tx$T1CCTL2$0$0 == 0x00e7
_T1CCTL2	=	0x00e7
Fbambam_remote_tx$IRCON2$0$0 == 0x00e8
_IRCON2	=	0x00e8
Fbambam_remote_tx$RFIF$0$0 == 0x00e9
_RFIF	=	0x00e9
Fbambam_remote_tx$T4CNT$0$0 == 0x00ea
_T4CNT	=	0x00ea
Fbambam_remote_tx$T4CTL$0$0 == 0x00eb
_T4CTL	=	0x00eb
Fbambam_remote_tx$T4CCTL0$0$0 == 0x00ec
_T4CCTL0	=	0x00ec
Fbambam_remote_tx$T4CC0$0$0 == 0x00ed
_T4CC0	=	0x00ed
Fbambam_remote_tx$T4CCTL1$0$0 == 0x00ee
_T4CCTL1	=	0x00ee
Fbambam_remote_tx$T4CC1$0$0 == 0x00ef
_T4CC1	=	0x00ef
Fbambam_remote_tx$B$0$0 == 0x00f0
_B	=	0x00f0
Fbambam_remote_tx$PERCFG$0$0 == 0x00f1
_PERCFG	=	0x00f1
Fbambam_remote_tx$ADCCFG$0$0 == 0x00f2
_ADCCFG	=	0x00f2
Fbambam_remote_tx$P0SEL$0$0 == 0x00f3
_P0SEL	=	0x00f3
Fbambam_remote_tx$P1SEL$0$0 == 0x00f4
_P1SEL	=	0x00f4
Fbambam_remote_tx$P2SEL$0$0 == 0x00f5
_P2SEL	=	0x00f5
Fbambam_remote_tx$P1INP$0$0 == 0x00f6
_P1INP	=	0x00f6
Fbambam_remote_tx$P2INP$0$0 == 0x00f7
_P2INP	=	0x00f7
Fbambam_remote_tx$U1CSR$0$0 == 0x00f8
_U1CSR	=	0x00f8
Fbambam_remote_tx$U1DBUF$0$0 == 0x00f9
_U1DBUF	=	0x00f9
Fbambam_remote_tx$U1BAUD$0$0 == 0x00fa
_U1BAUD	=	0x00fa
Fbambam_remote_tx$U1UCR$0$0 == 0x00fb
_U1UCR	=	0x00fb
Fbambam_remote_tx$U1GCR$0$0 == 0x00fc
_U1GCR	=	0x00fc
Fbambam_remote_tx$P0DIR$0$0 == 0x00fd
_P0DIR	=	0x00fd
Fbambam_remote_tx$P1DIR$0$0 == 0x00fe
_P1DIR	=	0x00fe
Fbambam_remote_tx$P2DIR$0$0 == 0x00ff
_P2DIR	=	0x00ff
Fbambam_remote_tx$DMA0CFG$0$0 == 0xffffd5d4
_DMA0CFG	=	0xffffd5d4
Fbambam_remote_tx$DMA1CFG$0$0 == 0xffffd3d2
_DMA1CFG	=	0xffffd3d2
Fbambam_remote_tx$FADDR$0$0 == 0xffffadac
_FADDR	=	0xffffadac
Fbambam_remote_tx$ADC$0$0 == 0xffffbbba
_ADC	=	0xffffbbba
Fbambam_remote_tx$T1CC0$0$0 == 0xffffdbda
_T1CC0	=	0xffffdbda
Fbambam_remote_tx$T1CC1$0$0 == 0xffffdddc
_T1CC1	=	0xffffdddc
Fbambam_remote_tx$T1CC2$0$0 == 0xffffdfde
_T1CC2	=	0xffffdfde
;--------------------------------------------------------
; special function bits
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
Fbambam_remote_tx$P0_0$0$0 == 0x0080
_P0_0	=	0x0080
Fbambam_remote_tx$P0_1$0$0 == 0x0081
_P0_1	=	0x0081
Fbambam_remote_tx$P0_2$0$0 == 0x0082
_P0_2	=	0x0082
Fbambam_remote_tx$P0_3$0$0 == 0x0083
_P0_3	=	0x0083
Fbambam_remote_tx$P0_4$0$0 == 0x0084
_P0_4	=	0x0084
Fbambam_remote_tx$P0_5$0$0 == 0x0085
_P0_5	=	0x0085
Fbambam_remote_tx$P0_6$0$0 == 0x0086
_P0_6	=	0x0086
Fbambam_remote_tx$P0_7$0$0 == 0x0087
_P0_7	=	0x0087
Fbambam_remote_tx$_TCON_0$0$0 == 0x0088
__TCON_0	=	0x0088
Fbambam_remote_tx$RFTXRXIF$0$0 == 0x0089
_RFTXRXIF	=	0x0089
Fbambam_remote_tx$_TCON_2$0$0 == 0x008a
__TCON_2	=	0x008a
Fbambam_remote_tx$URX0IF$0$0 == 0x008b
_URX0IF	=	0x008b
Fbambam_remote_tx$_TCON_4$0$0 == 0x008c
__TCON_4	=	0x008c
Fbambam_remote_tx$ADCIF$0$0 == 0x008d
_ADCIF	=	0x008d
Fbambam_remote_tx$_TCON_6$0$0 == 0x008e
__TCON_6	=	0x008e
Fbambam_remote_tx$URX1IF$0$0 == 0x008f
_URX1IF	=	0x008f
Fbambam_remote_tx$P1_0$0$0 == 0x0090
_P1_0	=	0x0090
Fbambam_remote_tx$P1_1$0$0 == 0x0091
_P1_1	=	0x0091
Fbambam_remote_tx$P1_2$0$0 == 0x0092
_P1_2	=	0x0092
Fbambam_remote_tx$P1_3$0$0 == 0x0093
_P1_3	=	0x0093
Fbambam_remote_tx$P1_4$0$0 == 0x0094
_P1_4	=	0x0094
Fbambam_remote_tx$P1_5$0$0 == 0x0095
_P1_5	=	0x0095
Fbambam_remote_tx$P1_6$0$0 == 0x0096
_P1_6	=	0x0096
Fbambam_remote_tx$P1_7$0$0 == 0x0097
_P1_7	=	0x0097
Fbambam_remote_tx$ENCIF_0$0$0 == 0x0098
_ENCIF_0	=	0x0098
Fbambam_remote_tx$ENCIF_1$0$0 == 0x0099
_ENCIF_1	=	0x0099
Fbambam_remote_tx$_SOCON2$0$0 == 0x009a
__SOCON2	=	0x009a
Fbambam_remote_tx$_SOCON3$0$0 == 0x009b
__SOCON3	=	0x009b
Fbambam_remote_tx$_SOCON4$0$0 == 0x009c
__SOCON4	=	0x009c
Fbambam_remote_tx$_SOCON5$0$0 == 0x009d
__SOCON5	=	0x009d
Fbambam_remote_tx$_SOCON6$0$0 == 0x009e
__SOCON6	=	0x009e
Fbambam_remote_tx$_SOCON7$0$0 == 0x009f
__SOCON7	=	0x009f
Fbambam_remote_tx$P2_0$0$0 == 0x00a0
_P2_0	=	0x00a0
Fbambam_remote_tx$P2_1$0$0 == 0x00a1
_P2_1	=	0x00a1
Fbambam_remote_tx$P2_2$0$0 == 0x00a2
_P2_2	=	0x00a2
Fbambam_remote_tx$P2_3$0$0 == 0x00a3
_P2_3	=	0x00a3
Fbambam_remote_tx$P2_4$0$0 == 0x00a4
_P2_4	=	0x00a4
Fbambam_remote_tx$P2_5$0$0 == 0x00a5
_P2_5	=	0x00a5
Fbambam_remote_tx$P2_6$0$0 == 0x00a6
_P2_6	=	0x00a6
Fbambam_remote_tx$P2_7$0$0 == 0x00a7
_P2_7	=	0x00a7
Fbambam_remote_tx$RFTXRXIE$0$0 == 0x00a8
_RFTXRXIE	=	0x00a8
Fbambam_remote_tx$ADCIE$0$0 == 0x00a9
_ADCIE	=	0x00a9
Fbambam_remote_tx$URX0IE$0$0 == 0x00aa
_URX0IE	=	0x00aa
Fbambam_remote_tx$URX1IE$0$0 == 0x00ab
_URX1IE	=	0x00ab
Fbambam_remote_tx$ENCIE$0$0 == 0x00ac
_ENCIE	=	0x00ac
Fbambam_remote_tx$STIE$0$0 == 0x00ad
_STIE	=	0x00ad
Fbambam_remote_tx$_IEN06$0$0 == 0x00ae
__IEN06	=	0x00ae
Fbambam_remote_tx$EA$0$0 == 0x00af
_EA	=	0x00af
Fbambam_remote_tx$DMAIE$0$0 == 0x00b8
_DMAIE	=	0x00b8
Fbambam_remote_tx$T1IE$0$0 == 0x00b9
_T1IE	=	0x00b9
Fbambam_remote_tx$T2IE$0$0 == 0x00ba
_T2IE	=	0x00ba
Fbambam_remote_tx$T3IE$0$0 == 0x00bb
_T3IE	=	0x00bb
Fbambam_remote_tx$T4IE$0$0 == 0x00bc
_T4IE	=	0x00bc
Fbambam_remote_tx$P0IE$0$0 == 0x00bd
_P0IE	=	0x00bd
Fbambam_remote_tx$_IEN16$0$0 == 0x00be
__IEN16	=	0x00be
Fbambam_remote_tx$_IEN17$0$0 == 0x00bf
__IEN17	=	0x00bf
Fbambam_remote_tx$DMAIF$0$0 == 0x00c0
_DMAIF	=	0x00c0
Fbambam_remote_tx$T1IF$0$0 == 0x00c1
_T1IF	=	0x00c1
Fbambam_remote_tx$T2IF$0$0 == 0x00c2
_T2IF	=	0x00c2
Fbambam_remote_tx$T3IF$0$0 == 0x00c3
_T3IF	=	0x00c3
Fbambam_remote_tx$T4IF$0$0 == 0x00c4
_T4IF	=	0x00c4
Fbambam_remote_tx$P0IF$0$0 == 0x00c5
_P0IF	=	0x00c5
Fbambam_remote_tx$_IRCON6$0$0 == 0x00c6
__IRCON6	=	0x00c6
Fbambam_remote_tx$STIF$0$0 == 0x00c7
_STIF	=	0x00c7
Fbambam_remote_tx$P$0$0 == 0x00d0
_P	=	0x00d0
Fbambam_remote_tx$F1$0$0 == 0x00d1
_F1	=	0x00d1
Fbambam_remote_tx$OV$0$0 == 0x00d2
_OV	=	0x00d2
Fbambam_remote_tx$RS0$0$0 == 0x00d3
_RS0	=	0x00d3
Fbambam_remote_tx$RS1$0$0 == 0x00d4
_RS1	=	0x00d4
Fbambam_remote_tx$F0$0$0 == 0x00d5
_F0	=	0x00d5
Fbambam_remote_tx$AC$0$0 == 0x00d6
_AC	=	0x00d6
Fbambam_remote_tx$CY$0$0 == 0x00d7
_CY	=	0x00d7
Fbambam_remote_tx$T3OVFIF$0$0 == 0x00d8
_T3OVFIF	=	0x00d8
Fbambam_remote_tx$T3CH0IF$0$0 == 0x00d9
_T3CH0IF	=	0x00d9
Fbambam_remote_tx$T3CH1IF$0$0 == 0x00da
_T3CH1IF	=	0x00da
Fbambam_remote_tx$T4OVFIF$0$0 == 0x00db
_T4OVFIF	=	0x00db
Fbambam_remote_tx$T4CH0IF$0$0 == 0x00dc
_T4CH0IF	=	0x00dc
Fbambam_remote_tx$T4CH1IF$0$0 == 0x00dd
_T4CH1IF	=	0x00dd
Fbambam_remote_tx$OVFIM$0$0 == 0x00de
_OVFIM	=	0x00de
Fbambam_remote_tx$_TIMIF7$0$0 == 0x00df
__TIMIF7	=	0x00df
Fbambam_remote_tx$ACC_0$0$0 == 0x00e0
_ACC_0	=	0x00e0
Fbambam_remote_tx$ACC_1$0$0 == 0x00e1
_ACC_1	=	0x00e1
Fbambam_remote_tx$ACC_2$0$0 == 0x00e2
_ACC_2	=	0x00e2
Fbambam_remote_tx$ACC_3$0$0 == 0x00e3
_ACC_3	=	0x00e3
Fbambam_remote_tx$ACC_4$0$0 == 0x00e4
_ACC_4	=	0x00e4
Fbambam_remote_tx$ACC_5$0$0 == 0x00e5
_ACC_5	=	0x00e5
Fbambam_remote_tx$ACC_6$0$0 == 0x00e6
_ACC_6	=	0x00e6
Fbambam_remote_tx$ACC_7$0$0 == 0x00e7
_ACC_7	=	0x00e7
Fbambam_remote_tx$P2IF$0$0 == 0x00e8
_P2IF	=	0x00e8
Fbambam_remote_tx$UTX0IF$0$0 == 0x00e9
_UTX0IF	=	0x00e9
Fbambam_remote_tx$UTX1IF$0$0 == 0x00ea
_UTX1IF	=	0x00ea
Fbambam_remote_tx$P1IF$0$0 == 0x00eb
_P1IF	=	0x00eb
Fbambam_remote_tx$WDTIF$0$0 == 0x00ec
_WDTIF	=	0x00ec
Fbambam_remote_tx$_IRCON25$0$0 == 0x00ed
__IRCON25	=	0x00ed
Fbambam_remote_tx$_IRCON26$0$0 == 0x00ee
__IRCON26	=	0x00ee
Fbambam_remote_tx$_IRCON27$0$0 == 0x00ef
__IRCON27	=	0x00ef
Fbambam_remote_tx$B_0$0$0 == 0x00f0
_B_0	=	0x00f0
Fbambam_remote_tx$B_1$0$0 == 0x00f1
_B_1	=	0x00f1
Fbambam_remote_tx$B_2$0$0 == 0x00f2
_B_2	=	0x00f2
Fbambam_remote_tx$B_3$0$0 == 0x00f3
_B_3	=	0x00f3
Fbambam_remote_tx$B_4$0$0 == 0x00f4
_B_4	=	0x00f4
Fbambam_remote_tx$B_5$0$0 == 0x00f5
_B_5	=	0x00f5
Fbambam_remote_tx$B_6$0$0 == 0x00f6
_B_6	=	0x00f6
Fbambam_remote_tx$B_7$0$0 == 0x00f7
_B_7	=	0x00f7
Fbambam_remote_tx$U1ACTIVE$0$0 == 0x00f8
_U1ACTIVE	=	0x00f8
Fbambam_remote_tx$U1TX_BYTE$0$0 == 0x00f9
_U1TX_BYTE	=	0x00f9
Fbambam_remote_tx$U1RX_BYTE$0$0 == 0x00fa
_U1RX_BYTE	=	0x00fa
Fbambam_remote_tx$U1ERR$0$0 == 0x00fb
_U1ERR	=	0x00fb
Fbambam_remote_tx$U1FE$0$0 == 0x00fc
_U1FE	=	0x00fc
Fbambam_remote_tx$U1SLAVE$0$0 == 0x00fd
_U1SLAVE	=	0x00fd
Fbambam_remote_tx$U1RE$0$0 == 0x00fe
_U1RE	=	0x00fe
Fbambam_remote_tx$U1MODE$0$0 == 0x00ff
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
Lbambam_remote_tx.adcToRadioService$sloc0$1$0==.
_adcToRadioService_sloc0_1_0:
	.ds 4
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
Lbambam_remote_tx.adcToRadioService$lastTx$1$1==.
_adcToRadioService_lastTx_1_1:
	.ds 2
Lbambam_remote_tx.adcToRadioService$ptr$2$2==.
_adcToRadioService_ptr_2_2:
	.ds 2
;--------------------------------------------------------
; external ram data
;--------------------------------------------------------
	.area XSEG    (XDATA)
Fbambam_remote_tx$SYNC1$0$0 == 0xdf00
_SYNC1	=	0xdf00
Fbambam_remote_tx$SYNC0$0$0 == 0xdf01
_SYNC0	=	0xdf01
Fbambam_remote_tx$PKTLEN$0$0 == 0xdf02
_PKTLEN	=	0xdf02
Fbambam_remote_tx$PKTCTRL1$0$0 == 0xdf03
_PKTCTRL1	=	0xdf03
Fbambam_remote_tx$PKTCTRL0$0$0 == 0xdf04
_PKTCTRL0	=	0xdf04
Fbambam_remote_tx$ADDR$0$0 == 0xdf05
_ADDR	=	0xdf05
Fbambam_remote_tx$CHANNR$0$0 == 0xdf06
_CHANNR	=	0xdf06
Fbambam_remote_tx$FSCTRL1$0$0 == 0xdf07
_FSCTRL1	=	0xdf07
Fbambam_remote_tx$FSCTRL0$0$0 == 0xdf08
_FSCTRL0	=	0xdf08
Fbambam_remote_tx$FREQ2$0$0 == 0xdf09
_FREQ2	=	0xdf09
Fbambam_remote_tx$FREQ1$0$0 == 0xdf0a
_FREQ1	=	0xdf0a
Fbambam_remote_tx$FREQ0$0$0 == 0xdf0b
_FREQ0	=	0xdf0b
Fbambam_remote_tx$MDMCFG4$0$0 == 0xdf0c
_MDMCFG4	=	0xdf0c
Fbambam_remote_tx$MDMCFG3$0$0 == 0xdf0d
_MDMCFG3	=	0xdf0d
Fbambam_remote_tx$MDMCFG2$0$0 == 0xdf0e
_MDMCFG2	=	0xdf0e
Fbambam_remote_tx$MDMCFG1$0$0 == 0xdf0f
_MDMCFG1	=	0xdf0f
Fbambam_remote_tx$MDMCFG0$0$0 == 0xdf10
_MDMCFG0	=	0xdf10
Fbambam_remote_tx$DEVIATN$0$0 == 0xdf11
_DEVIATN	=	0xdf11
Fbambam_remote_tx$MCSM2$0$0 == 0xdf12
_MCSM2	=	0xdf12
Fbambam_remote_tx$MCSM1$0$0 == 0xdf13
_MCSM1	=	0xdf13
Fbambam_remote_tx$MCSM0$0$0 == 0xdf14
_MCSM0	=	0xdf14
Fbambam_remote_tx$FOCCFG$0$0 == 0xdf15
_FOCCFG	=	0xdf15
Fbambam_remote_tx$BSCFG$0$0 == 0xdf16
_BSCFG	=	0xdf16
Fbambam_remote_tx$AGCCTRL2$0$0 == 0xdf17
_AGCCTRL2	=	0xdf17
Fbambam_remote_tx$AGCCTRL1$0$0 == 0xdf18
_AGCCTRL1	=	0xdf18
Fbambam_remote_tx$AGCCTRL0$0$0 == 0xdf19
_AGCCTRL0	=	0xdf19
Fbambam_remote_tx$FREND1$0$0 == 0xdf1a
_FREND1	=	0xdf1a
Fbambam_remote_tx$FREND0$0$0 == 0xdf1b
_FREND0	=	0xdf1b
Fbambam_remote_tx$FSCAL3$0$0 == 0xdf1c
_FSCAL3	=	0xdf1c
Fbambam_remote_tx$FSCAL2$0$0 == 0xdf1d
_FSCAL2	=	0xdf1d
Fbambam_remote_tx$FSCAL1$0$0 == 0xdf1e
_FSCAL1	=	0xdf1e
Fbambam_remote_tx$FSCAL0$0$0 == 0xdf1f
_FSCAL0	=	0xdf1f
Fbambam_remote_tx$TEST2$0$0 == 0xdf23
_TEST2	=	0xdf23
Fbambam_remote_tx$TEST1$0$0 == 0xdf24
_TEST1	=	0xdf24
Fbambam_remote_tx$TEST0$0$0 == 0xdf25
_TEST0	=	0xdf25
Fbambam_remote_tx$PA_TABLE0$0$0 == 0xdf2e
_PA_TABLE0	=	0xdf2e
Fbambam_remote_tx$IOCFG2$0$0 == 0xdf2f
_IOCFG2	=	0xdf2f
Fbambam_remote_tx$IOCFG1$0$0 == 0xdf30
_IOCFG1	=	0xdf30
Fbambam_remote_tx$IOCFG0$0$0 == 0xdf31
_IOCFG0	=	0xdf31
Fbambam_remote_tx$PARTNUM$0$0 == 0xdf36
_PARTNUM	=	0xdf36
Fbambam_remote_tx$VERSION$0$0 == 0xdf37
_VERSION	=	0xdf37
Fbambam_remote_tx$FREQEST$0$0 == 0xdf38
_FREQEST	=	0xdf38
Fbambam_remote_tx$LQI$0$0 == 0xdf39
_LQI	=	0xdf39
Fbambam_remote_tx$RSSI$0$0 == 0xdf3a
_RSSI	=	0xdf3a
Fbambam_remote_tx$MARCSTATE$0$0 == 0xdf3b
_MARCSTATE	=	0xdf3b
Fbambam_remote_tx$PKTSTATUS$0$0 == 0xdf3c
_PKTSTATUS	=	0xdf3c
Fbambam_remote_tx$VCO_VC_DAC$0$0 == 0xdf3d
_VCO_VC_DAC	=	0xdf3d
Fbambam_remote_tx$I2SCFG0$0$0 == 0xdf40
_I2SCFG0	=	0xdf40
Fbambam_remote_tx$I2SCFG1$0$0 == 0xdf41
_I2SCFG1	=	0xdf41
Fbambam_remote_tx$I2SDATL$0$0 == 0xdf42
_I2SDATL	=	0xdf42
Fbambam_remote_tx$I2SDATH$0$0 == 0xdf43
_I2SDATH	=	0xdf43
Fbambam_remote_tx$I2SWCNT$0$0 == 0xdf44
_I2SWCNT	=	0xdf44
Fbambam_remote_tx$I2SSTAT$0$0 == 0xdf45
_I2SSTAT	=	0xdf45
Fbambam_remote_tx$I2SCLKF0$0$0 == 0xdf46
_I2SCLKF0	=	0xdf46
Fbambam_remote_tx$I2SCLKF1$0$0 == 0xdf47
_I2SCLKF1	=	0xdf47
Fbambam_remote_tx$I2SCLKF2$0$0 == 0xdf48
_I2SCLKF2	=	0xdf48
Fbambam_remote_tx$USBADDR$0$0 == 0xde00
_USBADDR	=	0xde00
Fbambam_remote_tx$USBPOW$0$0 == 0xde01
_USBPOW	=	0xde01
Fbambam_remote_tx$USBIIF$0$0 == 0xde02
_USBIIF	=	0xde02
Fbambam_remote_tx$USBOIF$0$0 == 0xde04
_USBOIF	=	0xde04
Fbambam_remote_tx$USBCIF$0$0 == 0xde06
_USBCIF	=	0xde06
Fbambam_remote_tx$USBIIE$0$0 == 0xde07
_USBIIE	=	0xde07
Fbambam_remote_tx$USBOIE$0$0 == 0xde09
_USBOIE	=	0xde09
Fbambam_remote_tx$USBCIE$0$0 == 0xde0b
_USBCIE	=	0xde0b
Fbambam_remote_tx$USBFRML$0$0 == 0xde0c
_USBFRML	=	0xde0c
Fbambam_remote_tx$USBFRMH$0$0 == 0xde0d
_USBFRMH	=	0xde0d
Fbambam_remote_tx$USBINDEX$0$0 == 0xde0e
_USBINDEX	=	0xde0e
Fbambam_remote_tx$USBMAXI$0$0 == 0xde10
_USBMAXI	=	0xde10
Fbambam_remote_tx$USBCSIL$0$0 == 0xde11
_USBCSIL	=	0xde11
Fbambam_remote_tx$USBCSIH$0$0 == 0xde12
_USBCSIH	=	0xde12
Fbambam_remote_tx$USBMAXO$0$0 == 0xde13
_USBMAXO	=	0xde13
Fbambam_remote_tx$USBCSOL$0$0 == 0xde14
_USBCSOL	=	0xde14
Fbambam_remote_tx$USBCSOH$0$0 == 0xde15
_USBCSOH	=	0xde15
Fbambam_remote_tx$USBCNTL$0$0 == 0xde16
_USBCNTL	=	0xde16
Fbambam_remote_tx$USBCNTH$0$0 == 0xde17
_USBCNTH	=	0xde17
Fbambam_remote_tx$USBF0$0$0 == 0xde20
_USBF0	=	0xde20
Fbambam_remote_tx$USBF1$0$0 == 0xde22
_USBF1	=	0xde22
Fbambam_remote_tx$USBF2$0$0 == 0xde24
_USBF2	=	0xde24
Fbambam_remote_tx$USBF3$0$0 == 0xde26
_USBF3	=	0xde26
Fbambam_remote_tx$USBF4$0$0 == 0xde28
_USBF4	=	0xde28
Fbambam_remote_tx$USBF5$0$0 == 0xde2a
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
	reti
	.ds	7
	ljmp	_ISR_T4
	.ds	5
	reti
	.ds	7
	reti
	.ds	7
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
;------------------------------------------------------------
;Allocation info for local variables in function 'adcToRadioService'
;------------------------------------------------------------
;sloc0                     Allocated with name '_adcToRadioService_sloc0_1_0'
;------------------------------------------------------------
	G$adcToRadioService$0$0 ==.
	C$bambam_remote_tx.c$64$2$1 ==.
;	apps/bambam_remote_tx/bambam_remote_tx.c:64: static uint16 lastTx = 0;
	mov	r0,#_adcToRadioService_lastTx_1_1
	clr	a
	movx	@r0,a
	inc	r0
	movx	@r0,a
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
;Allocation info for local variables in function 'analogInputsInit'
;------------------------------------------------------------
	G$analogInputsInit$0$0 ==.
	C$bambam_remote_tx.c$31$0$0 ==.
;	apps/bambam_remote_tx/bambam_remote_tx.c:31: void analogInputsInit()
;	-----------------------------------------
;	 function analogInputsInit
;	-----------------------------------------
_analogInputsInit:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
	C$bambam_remote_tx.c$33$1$1 ==.
;	apps/bambam_remote_tx/bambam_remote_tx.c:33: switch(param_input_mode)
	mov	dptr,#_param_input_mode
	clr	a
	movc	a,@a+dptr
	mov	r4,a
	mov	a,#0x01
	movc	a,@a+dptr
	mov	r5,a
	mov	a,#0x02
	movc	a,@a+dptr
	mov	r6,a
	mov	a,#0x03
	movc	a,@a+dptr
	mov	r7,a
	cjne	r4,#0xFF,00109$
	cjne	r5,#0xFF,00109$
	cjne	r6,#0xFF,00109$
	cjne	r7,#0xFF,00109$
	sjmp	00102$
00109$:
	cjne	r4,#0x01,00103$
	cjne	r5,#0x00,00103$
	cjne	r6,#0x00,00103$
	cjne	r7,#0x00,00103$
	C$bambam_remote_tx.c$37$2$2 ==.
;	apps/bambam_remote_tx/bambam_remote_tx.c:37: P2INP &= ~(1<<5);  // PDUP0 = 0: Pull-ups on Port 0.
	mov	r7,_P2INP
	anl	ar7,#0xDF
	mov	_P2INP,r7
	C$bambam_remote_tx.c$38$2$2 ==.
;	apps/bambam_remote_tx/bambam_remote_tx.c:38: P0INP = 0;
	mov	_P0INP,#0x00
	C$bambam_remote_tx.c$39$2$2 ==.
;	apps/bambam_remote_tx/bambam_remote_tx.c:39: break;
	C$bambam_remote_tx.c$41$2$2 ==.
;	apps/bambam_remote_tx/bambam_remote_tx.c:41: case -1: // Enable pull-down resistors for all pins on Port 0.
	sjmp	00105$
00102$:
	C$bambam_remote_tx.c$42$2$2 ==.
;	apps/bambam_remote_tx/bambam_remote_tx.c:42: P2INP |= (1<<5);   // PDUP0 = 1: Pull-downs on Port 0.
	orl	_P2INP,#0x20
	C$bambam_remote_tx.c$43$2$2 ==.
;	apps/bambam_remote_tx/bambam_remote_tx.c:43: P0INP = 0;         // This line should not be necessary because P0SEL is 0 on reset.
	mov	_P0INP,#0x00
	C$bambam_remote_tx.c$44$2$2 ==.
;	apps/bambam_remote_tx/bambam_remote_tx.c:44: break;
	C$bambam_remote_tx.c$46$2$2 ==.
;	apps/bambam_remote_tx/bambam_remote_tx.c:46: default: // Disable pull-ups and pull-downs for all pins on Port 0.
	sjmp	00105$
00103$:
	C$bambam_remote_tx.c$47$2$2 ==.
;	apps/bambam_remote_tx/bambam_remote_tx.c:47: P0INP = 0x3F;
	mov	_P0INP,#0x3F
	C$bambam_remote_tx.c$49$1$1 ==.
;	apps/bambam_remote_tx/bambam_remote_tx.c:49: }
00105$:
	C$bambam_remote_tx.c$50$1$1 ==.
	XG$analogInputsInit$0$0 ==.
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'updateLeds'
;------------------------------------------------------------
	G$updateLeds$0$0 ==.
	C$bambam_remote_tx.c$52$1$1 ==.
;	apps/bambam_remote_tx/bambam_remote_tx.c:52: void updateLeds()
;	-----------------------------------------
;	 function updateLeds
;	-----------------------------------------
_updateLeds:
	C$bambam_remote_tx.c$54$1$1 ==.
;	apps/bambam_remote_tx/bambam_remote_tx.c:54: usbShowStatusWithGreenLed();
	lcall	_usbShowStatusWithGreenLed
	C$bambam_remote_tx.c$55$2$2 ==.
;	apps/bambam_remote_tx/bambam_remote_tx.c:55: LED_YELLOW(1);
	orl	_P2DIR,#0x04
	C$bambam_remote_tx.c$56$2$3 ==.
;	apps/bambam_remote_tx/bambam_remote_tx.c:56: LED_RED(0);
	mov	r7,_P2DIR
	anl	ar7,#0xFD
	mov	_P2DIR,r7
	C$bambam_remote_tx.c$57$2$3 ==.
	XG$updateLeds$0$0 ==.
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'adcToRadioService'
;------------------------------------------------------------
;sloc0                     Allocated with name '_adcToRadioService_sloc0_1_0'
;------------------------------------------------------------
	G$adcToRadioService$0$0 ==.
	C$bambam_remote_tx.c$62$2$3 ==.
;	apps/bambam_remote_tx/bambam_remote_tx.c:62: void adcToRadioService()
;	-----------------------------------------
;	 function adcToRadioService
;	-----------------------------------------
_adcToRadioService:
	C$bambam_remote_tx.c$70$1$1 ==.
;	apps/bambam_remote_tx/bambam_remote_tx.c:70: if ((uint16)(getMs() - lastTx) >= param_report_period_ms && (txPacket = radioQueueTxCurrentPacket()))
	lcall	_getMs
	mov	_adcToRadioService_sloc0_1_0,dpl
	mov	(_adcToRadioService_sloc0_1_0 + 1),dph
	mov	(_adcToRadioService_sloc0_1_0 + 2),b
	mov	(_adcToRadioService_sloc0_1_0 + 3),a
	mov	r0,#_adcToRadioService_lastTx_1_1
	movx	a,@r0
	mov	r2,a
	inc	r0
	movx	a,@r0
	mov	r3,a
	clr	a
	mov	r6,a
	mov	r7,a
	mov	a,_adcToRadioService_sloc0_1_0
	clr	c
	subb	a,r2
	mov	r2,a
	mov	a,(_adcToRadioService_sloc0_1_0 + 1)
	subb	a,r3
	mov	r3,a
	mov	a,(_adcToRadioService_sloc0_1_0 + 2)
	subb	a,r6
	mov	a,(_adcToRadioService_sloc0_1_0 + 3)
	subb	a,r7
	mov	dptr,#_param_report_period_ms
	clr	a
	movc	a,@a+dptr
	mov	_adcToRadioService_sloc0_1_0,a
	mov	a,#0x01
	movc	a,@a+dptr
	mov	(_adcToRadioService_sloc0_1_0 + 1),a
	mov	a,#0x02
	movc	a,@a+dptr
	mov	(_adcToRadioService_sloc0_1_0 + 2),a
	mov	a,#0x03
	movc	a,@a+dptr
	mov	(_adcToRadioService_sloc0_1_0 + 3),a
	mov	r6,#0x00
	mov	r7,#0x00
	clr	c
	mov	a,r2
	subb	a,_adcToRadioService_sloc0_1_0
	mov	a,r3
	subb	a,(_adcToRadioService_sloc0_1_0 + 1)
	mov	a,r6
	subb	a,(_adcToRadioService_sloc0_1_0 + 2)
	mov	a,r7
	xrl	a,#0x80
	mov	b,(_adcToRadioService_sloc0_1_0 + 3)
	xrl	b,#0x80
	subb	a,b
	jnc	00115$
	ljmp	00108$
00115$:
	lcall	_radioQueueTxCurrentPacket
	mov	r6,dpl
	mov	r7,dph
	mov	ar4,r6
	mov	ar5,r7
	mov	a,r6
	orl	a,r7
	jnz	00116$
	ljmp	00108$
00116$:
	C$bambam_remote_tx.c$75$2$2 ==.
;	apps/bambam_remote_tx/bambam_remote_tx.c:75: uint16 XDATA * ptr = (uint16 XDATA *)&txPacket[5];
	mov	a,#0x05
	add	a,r4
	mov	r6,a
	clr	a
	addc	a,r5
	mov	r7,a
	mov	r0,#_adcToRadioService_ptr_2_2
	mov	a,r6
	movx	@r0,a
	inc	r0
	mov	a,r7
	movx	@r0,a
	C$bambam_remote_tx.c$78$2$2 ==.
;	apps/bambam_remote_tx/bambam_remote_tx.c:78: lastTx = getMs();
	push	ar5
	push	ar4
	lcall	_getMs
	mov	r2,dpl
	mov	r3,dph
	pop	ar4
	pop	ar5
	mov	r0,#_adcToRadioService_lastTx_1_1
	mov	a,r2
	movx	@r0,a
	inc	r0
	mov	a,r3
	movx	@r0,a
	C$bambam_remote_tx.c$81$2$2 ==.
;	apps/bambam_remote_tx/bambam_remote_tx.c:81: txPacket[0] = 16;
	mov	dpl,r4
	mov	dph,r5
	mov	a,#0x10
	movx	@dptr,a
	C$bambam_remote_tx.c$84$2$2 ==.
;	apps/bambam_remote_tx/bambam_remote_tx.c:84: txPacket[1] = serialNumber[0];
	mov	a,#0x01
	add	a,r4
	mov	r6,a
	clr	a
	addc	a,r5
	mov	r7,a
	mov	dptr,#_serialNumber
	clr	a
	movc	a,@a+dptr
	mov	dpl,r6
	mov	dph,r7
	movx	@dptr,a
	C$bambam_remote_tx.c$85$2$2 ==.
;	apps/bambam_remote_tx/bambam_remote_tx.c:85: txPacket[2] = serialNumber[1];
	mov	a,#0x02
	add	a,r4
	mov	r6,a
	clr	a
	addc	a,r5
	mov	r7,a
	mov	dptr,#(_serialNumber + 0x0001)
	clr	a
	movc	a,@a+dptr
	mov	dpl,r6
	mov	dph,r7
	movx	@dptr,a
	C$bambam_remote_tx.c$86$2$2 ==.
;	apps/bambam_remote_tx/bambam_remote_tx.c:86: txPacket[3] = serialNumber[2];
	mov	a,#0x03
	add	a,r4
	mov	r6,a
	clr	a
	addc	a,r5
	mov	r7,a
	mov	dptr,#(_serialNumber + 0x0002)
	clr	a
	movc	a,@a+dptr
	mov	r3,a
	mov	dpl,r6
	mov	dph,r7
	movx	@dptr,a
	C$bambam_remote_tx.c$87$2$2 ==.
;	apps/bambam_remote_tx/bambam_remote_tx.c:87: txPacket[4] = serialNumber[3];
	mov	a,#0x04
	add	a,r4
	mov	r4,a
	clr	a
	addc	a,r5
	mov	r5,a
	mov	dptr,#(_serialNumber + 0x0003)
	clr	a
	movc	a,@a+dptr
	mov	dpl,r4
	mov	dph,r5
	movx	@dptr,a
	C$bambam_remote_tx.c$92$2$1 ==.
;	apps/bambam_remote_tx/bambam_remote_tx.c:92: for (i = 0; i < 6; i++)
	mov	r0,#_adcToRadioService_ptr_2_2
	movx	a,@r0
	mov	r6,a
	inc	r0
	movx	a,@r0
	mov	r7,a
	mov	r5,#0x00
00104$:
	cjne	r5,#0x06,00117$
00117$:
	jnc	00107$
	C$bambam_remote_tx.c$95$3$3 ==.
;	apps/bambam_remote_tx/bambam_remote_tx.c:95: *(ptr++) = adcRead(i); // Die Werte sollen dezimal ausgegeben werden
	mov	dpl,r5
	push	ar7
	push	ar6
	push	ar5
	lcall	_adcRead
	mov	r3,dpl
	mov	r4,dph
	pop	ar5
	pop	ar6
	pop	ar7
	mov	dpl,r6
	mov	dph,r7
	mov	a,r3
	movx	@dptr,a
	inc	dptr
	mov	a,r4
	movx	@dptr,a
	inc	dptr
	mov	r6,dpl
	mov	r7,dph
	C$bambam_remote_tx.c$92$2$2 ==.
;	apps/bambam_remote_tx/bambam_remote_tx.c:92: for (i = 0; i < 6; i++)
	inc	r5
	sjmp	00104$
00107$:
	C$bambam_remote_tx.c$98$2$2 ==.
;	apps/bambam_remote_tx/bambam_remote_tx.c:98: radioQueueTxSendPacket();
	lcall	_radioQueueTxSendPacket
00108$:
	C$bambam_remote_tx.c$100$2$1 ==.
	XG$adcToRadioService$0$0 ==.
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
	G$main$0$0 ==.
	C$bambam_remote_tx.c$102$2$1 ==.
;	apps/bambam_remote_tx/bambam_remote_tx.c:102: void main(void)
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
	C$bambam_remote_tx.c$104$1$1 ==.
;	apps/bambam_remote_tx/bambam_remote_tx.c:104: systemInit();
	lcall	_systemInit
	C$bambam_remote_tx.c$105$1$1 ==.
;	apps/bambam_remote_tx/bambam_remote_tx.c:105: analogInputsInit();
	lcall	_analogInputsInit
	C$bambam_remote_tx.c$106$1$1 ==.
;	apps/bambam_remote_tx/bambam_remote_tx.c:106: usbInit();
	lcall	_usbInit
	C$bambam_remote_tx.c$107$1$1 ==.
;	apps/bambam_remote_tx/bambam_remote_tx.c:107: radioQueueInit();
	lcall	_radioQueueInit
	C$bambam_remote_tx.c$109$1$1 ==.
;	apps/bambam_remote_tx/bambam_remote_tx.c:109: while(1)
00102$:
	C$bambam_remote_tx.c$111$2$2 ==.
;	apps/bambam_remote_tx/bambam_remote_tx.c:111: updateLeds();
	lcall	_updateLeds
	C$bambam_remote_tx.c$112$2$2 ==.
;	apps/bambam_remote_tx/bambam_remote_tx.c:112: boardService();
	lcall	_boardService
	C$bambam_remote_tx.c$113$2$2 ==.
;	apps/bambam_remote_tx/bambam_remote_tx.c:113: usbComService();
	lcall	_usbComService
	C$bambam_remote_tx.c$114$2$2 ==.
;	apps/bambam_remote_tx/bambam_remote_tx.c:114: adcToRadioService();
	lcall	_adcToRadioService
	sjmp	00102$
	C$bambam_remote_tx.c$116$1$1 ==.
	XG$main$0$0 ==.
	ret
	.area CSEG    (CODE)
	.area CONST   (CODE)
G$param_input_mode$0$0 == .
_param_input_mode:
	.byte #0x00,#0x00,#0x00,#0x00	;  0
G$param_report_period_ms$0$0 == .
_param_report_period_ms:
	.byte #0x64,#0x00,#0x00,#0x00	;  100
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
