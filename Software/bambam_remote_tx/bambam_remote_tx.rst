                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.1.0 #7066 (Nov 22 2011) (MINGW32)
                              4 ; This file was generated Mon Jul 20 08:37:32 2015
                              5 ;--------------------------------------------------------
                              6 	.module bambam_remote_tx
                              7 	.optsdcc -mmcs51 --model-medium
                              8 	
                              9 ;--------------------------------------------------------
                             10 ; Public variables in this module
                             11 ;--------------------------------------------------------
                             12 	.globl _param_report_period_ms
                             13 	.globl _param_input_mode
                             14 	.globl _main
                             15 	.globl _adcToRadioService
                             16 	.globl _updateLeds
                             17 	.globl _analogInputsInit
                             18 	.globl _radioQueueTxSendPacket
                             19 	.globl _radioQueueTxCurrentPacket
                             20 	.globl _radioQueueInit
                             21 	.globl _usbComService
                             22 	.globl _usbShowStatusWithGreenLed
                             23 	.globl _usbInit
                             24 	.globl _adcRead
                             25 	.globl _getMs
                             26 	.globl _boardService
                             27 	.globl _systemInit
                             28 ;--------------------------------------------------------
                             29 ; special function registers
                             30 ;--------------------------------------------------------
                             31 	.area RSEG    (ABS,DATA)
   0000                      32 	.org 0x0000
                    0080     33 Fbambam_remote_tx$P0$0$0 == 0x0080
                    0080     34 _P0	=	0x0080
                    0081     35 Fbambam_remote_tx$SP$0$0 == 0x0081
                    0081     36 _SP	=	0x0081
                    0082     37 Fbambam_remote_tx$DPL0$0$0 == 0x0082
                    0082     38 _DPL0	=	0x0082
                    0083     39 Fbambam_remote_tx$DPH0$0$0 == 0x0083
                    0083     40 _DPH0	=	0x0083
                    0084     41 Fbambam_remote_tx$DPL1$0$0 == 0x0084
                    0084     42 _DPL1	=	0x0084
                    0085     43 Fbambam_remote_tx$DPH1$0$0 == 0x0085
                    0085     44 _DPH1	=	0x0085
                    0086     45 Fbambam_remote_tx$U0CSR$0$0 == 0x0086
                    0086     46 _U0CSR	=	0x0086
                    0087     47 Fbambam_remote_tx$PCON$0$0 == 0x0087
                    0087     48 _PCON	=	0x0087
                    0088     49 Fbambam_remote_tx$TCON$0$0 == 0x0088
                    0088     50 _TCON	=	0x0088
                    0089     51 Fbambam_remote_tx$P0IFG$0$0 == 0x0089
                    0089     52 _P0IFG	=	0x0089
                    008A     53 Fbambam_remote_tx$P1IFG$0$0 == 0x008a
                    008A     54 _P1IFG	=	0x008a
                    008B     55 Fbambam_remote_tx$P2IFG$0$0 == 0x008b
                    008B     56 _P2IFG	=	0x008b
                    008C     57 Fbambam_remote_tx$PICTL$0$0 == 0x008c
                    008C     58 _PICTL	=	0x008c
                    008D     59 Fbambam_remote_tx$P1IEN$0$0 == 0x008d
                    008D     60 _P1IEN	=	0x008d
                    008F     61 Fbambam_remote_tx$P0INP$0$0 == 0x008f
                    008F     62 _P0INP	=	0x008f
                    0090     63 Fbambam_remote_tx$P1$0$0 == 0x0090
                    0090     64 _P1	=	0x0090
                    0091     65 Fbambam_remote_tx$RFIM$0$0 == 0x0091
                    0091     66 _RFIM	=	0x0091
                    0092     67 Fbambam_remote_tx$DPS$0$0 == 0x0092
                    0092     68 _DPS	=	0x0092
                    0093     69 Fbambam_remote_tx$MPAGE$0$0 == 0x0093
                    0093     70 _MPAGE	=	0x0093
                    0095     71 Fbambam_remote_tx$ENDIAN$0$0 == 0x0095
                    0095     72 _ENDIAN	=	0x0095
                    0098     73 Fbambam_remote_tx$S0CON$0$0 == 0x0098
                    0098     74 _S0CON	=	0x0098
                    009A     75 Fbambam_remote_tx$IEN2$0$0 == 0x009a
                    009A     76 _IEN2	=	0x009a
                    009B     77 Fbambam_remote_tx$S1CON$0$0 == 0x009b
                    009B     78 _S1CON	=	0x009b
                    009C     79 Fbambam_remote_tx$T2CT$0$0 == 0x009c
                    009C     80 _T2CT	=	0x009c
                    009D     81 Fbambam_remote_tx$T2PR$0$0 == 0x009d
                    009D     82 _T2PR	=	0x009d
                    009E     83 Fbambam_remote_tx$T2CTL$0$0 == 0x009e
                    009E     84 _T2CTL	=	0x009e
                    00A0     85 Fbambam_remote_tx$P2$0$0 == 0x00a0
                    00A0     86 _P2	=	0x00a0
                    00A1     87 Fbambam_remote_tx$WORIRQ$0$0 == 0x00a1
                    00A1     88 _WORIRQ	=	0x00a1
                    00A2     89 Fbambam_remote_tx$WORCTRL$0$0 == 0x00a2
                    00A2     90 _WORCTRL	=	0x00a2
                    00A3     91 Fbambam_remote_tx$WOREVT0$0$0 == 0x00a3
                    00A3     92 _WOREVT0	=	0x00a3
                    00A4     93 Fbambam_remote_tx$WOREVT1$0$0 == 0x00a4
                    00A4     94 _WOREVT1	=	0x00a4
                    00A5     95 Fbambam_remote_tx$WORTIME0$0$0 == 0x00a5
                    00A5     96 _WORTIME0	=	0x00a5
                    00A6     97 Fbambam_remote_tx$WORTIME1$0$0 == 0x00a6
                    00A6     98 _WORTIME1	=	0x00a6
                    00A8     99 Fbambam_remote_tx$IEN0$0$0 == 0x00a8
                    00A8    100 _IEN0	=	0x00a8
                    00A9    101 Fbambam_remote_tx$IP0$0$0 == 0x00a9
                    00A9    102 _IP0	=	0x00a9
                    00AB    103 Fbambam_remote_tx$FWT$0$0 == 0x00ab
                    00AB    104 _FWT	=	0x00ab
                    00AC    105 Fbambam_remote_tx$FADDRL$0$0 == 0x00ac
                    00AC    106 _FADDRL	=	0x00ac
                    00AD    107 Fbambam_remote_tx$FADDRH$0$0 == 0x00ad
                    00AD    108 _FADDRH	=	0x00ad
                    00AE    109 Fbambam_remote_tx$FCTL$0$0 == 0x00ae
                    00AE    110 _FCTL	=	0x00ae
                    00AF    111 Fbambam_remote_tx$FWDATA$0$0 == 0x00af
                    00AF    112 _FWDATA	=	0x00af
                    00B1    113 Fbambam_remote_tx$ENCDI$0$0 == 0x00b1
                    00B1    114 _ENCDI	=	0x00b1
                    00B2    115 Fbambam_remote_tx$ENCDO$0$0 == 0x00b2
                    00B2    116 _ENCDO	=	0x00b2
                    00B3    117 Fbambam_remote_tx$ENCCS$0$0 == 0x00b3
                    00B3    118 _ENCCS	=	0x00b3
                    00B4    119 Fbambam_remote_tx$ADCCON1$0$0 == 0x00b4
                    00B4    120 _ADCCON1	=	0x00b4
                    00B5    121 Fbambam_remote_tx$ADCCON2$0$0 == 0x00b5
                    00B5    122 _ADCCON2	=	0x00b5
                    00B6    123 Fbambam_remote_tx$ADCCON3$0$0 == 0x00b6
                    00B6    124 _ADCCON3	=	0x00b6
                    00B8    125 Fbambam_remote_tx$IEN1$0$0 == 0x00b8
                    00B8    126 _IEN1	=	0x00b8
                    00B9    127 Fbambam_remote_tx$IP1$0$0 == 0x00b9
                    00B9    128 _IP1	=	0x00b9
                    00BA    129 Fbambam_remote_tx$ADCL$0$0 == 0x00ba
                    00BA    130 _ADCL	=	0x00ba
                    00BB    131 Fbambam_remote_tx$ADCH$0$0 == 0x00bb
                    00BB    132 _ADCH	=	0x00bb
                    00BC    133 Fbambam_remote_tx$RNDL$0$0 == 0x00bc
                    00BC    134 _RNDL	=	0x00bc
                    00BD    135 Fbambam_remote_tx$RNDH$0$0 == 0x00bd
                    00BD    136 _RNDH	=	0x00bd
                    00BE    137 Fbambam_remote_tx$SLEEP$0$0 == 0x00be
                    00BE    138 _SLEEP	=	0x00be
                    00C0    139 Fbambam_remote_tx$IRCON$0$0 == 0x00c0
                    00C0    140 _IRCON	=	0x00c0
                    00C1    141 Fbambam_remote_tx$U0DBUF$0$0 == 0x00c1
                    00C1    142 _U0DBUF	=	0x00c1
                    00C2    143 Fbambam_remote_tx$U0BAUD$0$0 == 0x00c2
                    00C2    144 _U0BAUD	=	0x00c2
                    00C4    145 Fbambam_remote_tx$U0UCR$0$0 == 0x00c4
                    00C4    146 _U0UCR	=	0x00c4
                    00C5    147 Fbambam_remote_tx$U0GCR$0$0 == 0x00c5
                    00C5    148 _U0GCR	=	0x00c5
                    00C6    149 Fbambam_remote_tx$CLKCON$0$0 == 0x00c6
                    00C6    150 _CLKCON	=	0x00c6
                    00C7    151 Fbambam_remote_tx$MEMCTR$0$0 == 0x00c7
                    00C7    152 _MEMCTR	=	0x00c7
                    00C9    153 Fbambam_remote_tx$WDCTL$0$0 == 0x00c9
                    00C9    154 _WDCTL	=	0x00c9
                    00CA    155 Fbambam_remote_tx$T3CNT$0$0 == 0x00ca
                    00CA    156 _T3CNT	=	0x00ca
                    00CB    157 Fbambam_remote_tx$T3CTL$0$0 == 0x00cb
                    00CB    158 _T3CTL	=	0x00cb
                    00CC    159 Fbambam_remote_tx$T3CCTL0$0$0 == 0x00cc
                    00CC    160 _T3CCTL0	=	0x00cc
                    00CD    161 Fbambam_remote_tx$T3CC0$0$0 == 0x00cd
                    00CD    162 _T3CC0	=	0x00cd
                    00CE    163 Fbambam_remote_tx$T3CCTL1$0$0 == 0x00ce
                    00CE    164 _T3CCTL1	=	0x00ce
                    00CF    165 Fbambam_remote_tx$T3CC1$0$0 == 0x00cf
                    00CF    166 _T3CC1	=	0x00cf
                    00D0    167 Fbambam_remote_tx$PSW$0$0 == 0x00d0
                    00D0    168 _PSW	=	0x00d0
                    00D1    169 Fbambam_remote_tx$DMAIRQ$0$0 == 0x00d1
                    00D1    170 _DMAIRQ	=	0x00d1
                    00D2    171 Fbambam_remote_tx$DMA1CFGL$0$0 == 0x00d2
                    00D2    172 _DMA1CFGL	=	0x00d2
                    00D3    173 Fbambam_remote_tx$DMA1CFGH$0$0 == 0x00d3
                    00D3    174 _DMA1CFGH	=	0x00d3
                    00D4    175 Fbambam_remote_tx$DMA0CFGL$0$0 == 0x00d4
                    00D4    176 _DMA0CFGL	=	0x00d4
                    00D5    177 Fbambam_remote_tx$DMA0CFGH$0$0 == 0x00d5
                    00D5    178 _DMA0CFGH	=	0x00d5
                    00D6    179 Fbambam_remote_tx$DMAARM$0$0 == 0x00d6
                    00D6    180 _DMAARM	=	0x00d6
                    00D7    181 Fbambam_remote_tx$DMAREQ$0$0 == 0x00d7
                    00D7    182 _DMAREQ	=	0x00d7
                    00D8    183 Fbambam_remote_tx$TIMIF$0$0 == 0x00d8
                    00D8    184 _TIMIF	=	0x00d8
                    00D9    185 Fbambam_remote_tx$RFD$0$0 == 0x00d9
                    00D9    186 _RFD	=	0x00d9
                    00DA    187 Fbambam_remote_tx$T1CC0L$0$0 == 0x00da
                    00DA    188 _T1CC0L	=	0x00da
                    00DB    189 Fbambam_remote_tx$T1CC0H$0$0 == 0x00db
                    00DB    190 _T1CC0H	=	0x00db
                    00DC    191 Fbambam_remote_tx$T1CC1L$0$0 == 0x00dc
                    00DC    192 _T1CC1L	=	0x00dc
                    00DD    193 Fbambam_remote_tx$T1CC1H$0$0 == 0x00dd
                    00DD    194 _T1CC1H	=	0x00dd
                    00DE    195 Fbambam_remote_tx$T1CC2L$0$0 == 0x00de
                    00DE    196 _T1CC2L	=	0x00de
                    00DF    197 Fbambam_remote_tx$T1CC2H$0$0 == 0x00df
                    00DF    198 _T1CC2H	=	0x00df
                    00E0    199 Fbambam_remote_tx$ACC$0$0 == 0x00e0
                    00E0    200 _ACC	=	0x00e0
                    00E1    201 Fbambam_remote_tx$RFST$0$0 == 0x00e1
                    00E1    202 _RFST	=	0x00e1
                    00E2    203 Fbambam_remote_tx$T1CNTL$0$0 == 0x00e2
                    00E2    204 _T1CNTL	=	0x00e2
                    00E3    205 Fbambam_remote_tx$T1CNTH$0$0 == 0x00e3
                    00E3    206 _T1CNTH	=	0x00e3
                    00E4    207 Fbambam_remote_tx$T1CTL$0$0 == 0x00e4
                    00E4    208 _T1CTL	=	0x00e4
                    00E5    209 Fbambam_remote_tx$T1CCTL0$0$0 == 0x00e5
                    00E5    210 _T1CCTL0	=	0x00e5
                    00E6    211 Fbambam_remote_tx$T1CCTL1$0$0 == 0x00e6
                    00E6    212 _T1CCTL1	=	0x00e6
                    00E7    213 Fbambam_remote_tx$T1CCTL2$0$0 == 0x00e7
                    00E7    214 _T1CCTL2	=	0x00e7
                    00E8    215 Fbambam_remote_tx$IRCON2$0$0 == 0x00e8
                    00E8    216 _IRCON2	=	0x00e8
                    00E9    217 Fbambam_remote_tx$RFIF$0$0 == 0x00e9
                    00E9    218 _RFIF	=	0x00e9
                    00EA    219 Fbambam_remote_tx$T4CNT$0$0 == 0x00ea
                    00EA    220 _T4CNT	=	0x00ea
                    00EB    221 Fbambam_remote_tx$T4CTL$0$0 == 0x00eb
                    00EB    222 _T4CTL	=	0x00eb
                    00EC    223 Fbambam_remote_tx$T4CCTL0$0$0 == 0x00ec
                    00EC    224 _T4CCTL0	=	0x00ec
                    00ED    225 Fbambam_remote_tx$T4CC0$0$0 == 0x00ed
                    00ED    226 _T4CC0	=	0x00ed
                    00EE    227 Fbambam_remote_tx$T4CCTL1$0$0 == 0x00ee
                    00EE    228 _T4CCTL1	=	0x00ee
                    00EF    229 Fbambam_remote_tx$T4CC1$0$0 == 0x00ef
                    00EF    230 _T4CC1	=	0x00ef
                    00F0    231 Fbambam_remote_tx$B$0$0 == 0x00f0
                    00F0    232 _B	=	0x00f0
                    00F1    233 Fbambam_remote_tx$PERCFG$0$0 == 0x00f1
                    00F1    234 _PERCFG	=	0x00f1
                    00F2    235 Fbambam_remote_tx$ADCCFG$0$0 == 0x00f2
                    00F2    236 _ADCCFG	=	0x00f2
                    00F3    237 Fbambam_remote_tx$P0SEL$0$0 == 0x00f3
                    00F3    238 _P0SEL	=	0x00f3
                    00F4    239 Fbambam_remote_tx$P1SEL$0$0 == 0x00f4
                    00F4    240 _P1SEL	=	0x00f4
                    00F5    241 Fbambam_remote_tx$P2SEL$0$0 == 0x00f5
                    00F5    242 _P2SEL	=	0x00f5
                    00F6    243 Fbambam_remote_tx$P1INP$0$0 == 0x00f6
                    00F6    244 _P1INP	=	0x00f6
                    00F7    245 Fbambam_remote_tx$P2INP$0$0 == 0x00f7
                    00F7    246 _P2INP	=	0x00f7
                    00F8    247 Fbambam_remote_tx$U1CSR$0$0 == 0x00f8
                    00F8    248 _U1CSR	=	0x00f8
                    00F9    249 Fbambam_remote_tx$U1DBUF$0$0 == 0x00f9
                    00F9    250 _U1DBUF	=	0x00f9
                    00FA    251 Fbambam_remote_tx$U1BAUD$0$0 == 0x00fa
                    00FA    252 _U1BAUD	=	0x00fa
                    00FB    253 Fbambam_remote_tx$U1UCR$0$0 == 0x00fb
                    00FB    254 _U1UCR	=	0x00fb
                    00FC    255 Fbambam_remote_tx$U1GCR$0$0 == 0x00fc
                    00FC    256 _U1GCR	=	0x00fc
                    00FD    257 Fbambam_remote_tx$P0DIR$0$0 == 0x00fd
                    00FD    258 _P0DIR	=	0x00fd
                    00FE    259 Fbambam_remote_tx$P1DIR$0$0 == 0x00fe
                    00FE    260 _P1DIR	=	0x00fe
                    00FF    261 Fbambam_remote_tx$P2DIR$0$0 == 0x00ff
                    00FF    262 _P2DIR	=	0x00ff
                    FFFFD5D4    263 Fbambam_remote_tx$DMA0CFG$0$0 == 0xffffd5d4
                    FFFFD5D4    264 _DMA0CFG	=	0xffffd5d4
                    FFFFD3D2    265 Fbambam_remote_tx$DMA1CFG$0$0 == 0xffffd3d2
                    FFFFD3D2    266 _DMA1CFG	=	0xffffd3d2
                    FFFFADAC    267 Fbambam_remote_tx$FADDR$0$0 == 0xffffadac
                    FFFFADAC    268 _FADDR	=	0xffffadac
                    FFFFBBBA    269 Fbambam_remote_tx$ADC$0$0 == 0xffffbbba
                    FFFFBBBA    270 _ADC	=	0xffffbbba
                    FFFFDBDA    271 Fbambam_remote_tx$T1CC0$0$0 == 0xffffdbda
                    FFFFDBDA    272 _T1CC0	=	0xffffdbda
                    FFFFDDDC    273 Fbambam_remote_tx$T1CC1$0$0 == 0xffffdddc
                    FFFFDDDC    274 _T1CC1	=	0xffffdddc
                    FFFFDFDE    275 Fbambam_remote_tx$T1CC2$0$0 == 0xffffdfde
                    FFFFDFDE    276 _T1CC2	=	0xffffdfde
                            277 ;--------------------------------------------------------
                            278 ; special function bits
                            279 ;--------------------------------------------------------
                            280 	.area RSEG    (ABS,DATA)
   0000                     281 	.org 0x0000
                    0080    282 Fbambam_remote_tx$P0_0$0$0 == 0x0080
                    0080    283 _P0_0	=	0x0080
                    0081    284 Fbambam_remote_tx$P0_1$0$0 == 0x0081
                    0081    285 _P0_1	=	0x0081
                    0082    286 Fbambam_remote_tx$P0_2$0$0 == 0x0082
                    0082    287 _P0_2	=	0x0082
                    0083    288 Fbambam_remote_tx$P0_3$0$0 == 0x0083
                    0083    289 _P0_3	=	0x0083
                    0084    290 Fbambam_remote_tx$P0_4$0$0 == 0x0084
                    0084    291 _P0_4	=	0x0084
                    0085    292 Fbambam_remote_tx$P0_5$0$0 == 0x0085
                    0085    293 _P0_5	=	0x0085
                    0086    294 Fbambam_remote_tx$P0_6$0$0 == 0x0086
                    0086    295 _P0_6	=	0x0086
                    0087    296 Fbambam_remote_tx$P0_7$0$0 == 0x0087
                    0087    297 _P0_7	=	0x0087
                    0088    298 Fbambam_remote_tx$_TCON_0$0$0 == 0x0088
                    0088    299 __TCON_0	=	0x0088
                    0089    300 Fbambam_remote_tx$RFTXRXIF$0$0 == 0x0089
                    0089    301 _RFTXRXIF	=	0x0089
                    008A    302 Fbambam_remote_tx$_TCON_2$0$0 == 0x008a
                    008A    303 __TCON_2	=	0x008a
                    008B    304 Fbambam_remote_tx$URX0IF$0$0 == 0x008b
                    008B    305 _URX0IF	=	0x008b
                    008C    306 Fbambam_remote_tx$_TCON_4$0$0 == 0x008c
                    008C    307 __TCON_4	=	0x008c
                    008D    308 Fbambam_remote_tx$ADCIF$0$0 == 0x008d
                    008D    309 _ADCIF	=	0x008d
                    008E    310 Fbambam_remote_tx$_TCON_6$0$0 == 0x008e
                    008E    311 __TCON_6	=	0x008e
                    008F    312 Fbambam_remote_tx$URX1IF$0$0 == 0x008f
                    008F    313 _URX1IF	=	0x008f
                    0090    314 Fbambam_remote_tx$P1_0$0$0 == 0x0090
                    0090    315 _P1_0	=	0x0090
                    0091    316 Fbambam_remote_tx$P1_1$0$0 == 0x0091
                    0091    317 _P1_1	=	0x0091
                    0092    318 Fbambam_remote_tx$P1_2$0$0 == 0x0092
                    0092    319 _P1_2	=	0x0092
                    0093    320 Fbambam_remote_tx$P1_3$0$0 == 0x0093
                    0093    321 _P1_3	=	0x0093
                    0094    322 Fbambam_remote_tx$P1_4$0$0 == 0x0094
                    0094    323 _P1_4	=	0x0094
                    0095    324 Fbambam_remote_tx$P1_5$0$0 == 0x0095
                    0095    325 _P1_5	=	0x0095
                    0096    326 Fbambam_remote_tx$P1_6$0$0 == 0x0096
                    0096    327 _P1_6	=	0x0096
                    0097    328 Fbambam_remote_tx$P1_7$0$0 == 0x0097
                    0097    329 _P1_7	=	0x0097
                    0098    330 Fbambam_remote_tx$ENCIF_0$0$0 == 0x0098
                    0098    331 _ENCIF_0	=	0x0098
                    0099    332 Fbambam_remote_tx$ENCIF_1$0$0 == 0x0099
                    0099    333 _ENCIF_1	=	0x0099
                    009A    334 Fbambam_remote_tx$_SOCON2$0$0 == 0x009a
                    009A    335 __SOCON2	=	0x009a
                    009B    336 Fbambam_remote_tx$_SOCON3$0$0 == 0x009b
                    009B    337 __SOCON3	=	0x009b
                    009C    338 Fbambam_remote_tx$_SOCON4$0$0 == 0x009c
                    009C    339 __SOCON4	=	0x009c
                    009D    340 Fbambam_remote_tx$_SOCON5$0$0 == 0x009d
                    009D    341 __SOCON5	=	0x009d
                    009E    342 Fbambam_remote_tx$_SOCON6$0$0 == 0x009e
                    009E    343 __SOCON6	=	0x009e
                    009F    344 Fbambam_remote_tx$_SOCON7$0$0 == 0x009f
                    009F    345 __SOCON7	=	0x009f
                    00A0    346 Fbambam_remote_tx$P2_0$0$0 == 0x00a0
                    00A0    347 _P2_0	=	0x00a0
                    00A1    348 Fbambam_remote_tx$P2_1$0$0 == 0x00a1
                    00A1    349 _P2_1	=	0x00a1
                    00A2    350 Fbambam_remote_tx$P2_2$0$0 == 0x00a2
                    00A2    351 _P2_2	=	0x00a2
                    00A3    352 Fbambam_remote_tx$P2_3$0$0 == 0x00a3
                    00A3    353 _P2_3	=	0x00a3
                    00A4    354 Fbambam_remote_tx$P2_4$0$0 == 0x00a4
                    00A4    355 _P2_4	=	0x00a4
                    00A5    356 Fbambam_remote_tx$P2_5$0$0 == 0x00a5
                    00A5    357 _P2_5	=	0x00a5
                    00A6    358 Fbambam_remote_tx$P2_6$0$0 == 0x00a6
                    00A6    359 _P2_6	=	0x00a6
                    00A7    360 Fbambam_remote_tx$P2_7$0$0 == 0x00a7
                    00A7    361 _P2_7	=	0x00a7
                    00A8    362 Fbambam_remote_tx$RFTXRXIE$0$0 == 0x00a8
                    00A8    363 _RFTXRXIE	=	0x00a8
                    00A9    364 Fbambam_remote_tx$ADCIE$0$0 == 0x00a9
                    00A9    365 _ADCIE	=	0x00a9
                    00AA    366 Fbambam_remote_tx$URX0IE$0$0 == 0x00aa
                    00AA    367 _URX0IE	=	0x00aa
                    00AB    368 Fbambam_remote_tx$URX1IE$0$0 == 0x00ab
                    00AB    369 _URX1IE	=	0x00ab
                    00AC    370 Fbambam_remote_tx$ENCIE$0$0 == 0x00ac
                    00AC    371 _ENCIE	=	0x00ac
                    00AD    372 Fbambam_remote_tx$STIE$0$0 == 0x00ad
                    00AD    373 _STIE	=	0x00ad
                    00AE    374 Fbambam_remote_tx$_IEN06$0$0 == 0x00ae
                    00AE    375 __IEN06	=	0x00ae
                    00AF    376 Fbambam_remote_tx$EA$0$0 == 0x00af
                    00AF    377 _EA	=	0x00af
                    00B8    378 Fbambam_remote_tx$DMAIE$0$0 == 0x00b8
                    00B8    379 _DMAIE	=	0x00b8
                    00B9    380 Fbambam_remote_tx$T1IE$0$0 == 0x00b9
                    00B9    381 _T1IE	=	0x00b9
                    00BA    382 Fbambam_remote_tx$T2IE$0$0 == 0x00ba
                    00BA    383 _T2IE	=	0x00ba
                    00BB    384 Fbambam_remote_tx$T3IE$0$0 == 0x00bb
                    00BB    385 _T3IE	=	0x00bb
                    00BC    386 Fbambam_remote_tx$T4IE$0$0 == 0x00bc
                    00BC    387 _T4IE	=	0x00bc
                    00BD    388 Fbambam_remote_tx$P0IE$0$0 == 0x00bd
                    00BD    389 _P0IE	=	0x00bd
                    00BE    390 Fbambam_remote_tx$_IEN16$0$0 == 0x00be
                    00BE    391 __IEN16	=	0x00be
                    00BF    392 Fbambam_remote_tx$_IEN17$0$0 == 0x00bf
                    00BF    393 __IEN17	=	0x00bf
                    00C0    394 Fbambam_remote_tx$DMAIF$0$0 == 0x00c0
                    00C0    395 _DMAIF	=	0x00c0
                    00C1    396 Fbambam_remote_tx$T1IF$0$0 == 0x00c1
                    00C1    397 _T1IF	=	0x00c1
                    00C2    398 Fbambam_remote_tx$T2IF$0$0 == 0x00c2
                    00C2    399 _T2IF	=	0x00c2
                    00C3    400 Fbambam_remote_tx$T3IF$0$0 == 0x00c3
                    00C3    401 _T3IF	=	0x00c3
                    00C4    402 Fbambam_remote_tx$T4IF$0$0 == 0x00c4
                    00C4    403 _T4IF	=	0x00c4
                    00C5    404 Fbambam_remote_tx$P0IF$0$0 == 0x00c5
                    00C5    405 _P0IF	=	0x00c5
                    00C6    406 Fbambam_remote_tx$_IRCON6$0$0 == 0x00c6
                    00C6    407 __IRCON6	=	0x00c6
                    00C7    408 Fbambam_remote_tx$STIF$0$0 == 0x00c7
                    00C7    409 _STIF	=	0x00c7
                    00D0    410 Fbambam_remote_tx$P$0$0 == 0x00d0
                    00D0    411 _P	=	0x00d0
                    00D1    412 Fbambam_remote_tx$F1$0$0 == 0x00d1
                    00D1    413 _F1	=	0x00d1
                    00D2    414 Fbambam_remote_tx$OV$0$0 == 0x00d2
                    00D2    415 _OV	=	0x00d2
                    00D3    416 Fbambam_remote_tx$RS0$0$0 == 0x00d3
                    00D3    417 _RS0	=	0x00d3
                    00D4    418 Fbambam_remote_tx$RS1$0$0 == 0x00d4
                    00D4    419 _RS1	=	0x00d4
                    00D5    420 Fbambam_remote_tx$F0$0$0 == 0x00d5
                    00D5    421 _F0	=	0x00d5
                    00D6    422 Fbambam_remote_tx$AC$0$0 == 0x00d6
                    00D6    423 _AC	=	0x00d6
                    00D7    424 Fbambam_remote_tx$CY$0$0 == 0x00d7
                    00D7    425 _CY	=	0x00d7
                    00D8    426 Fbambam_remote_tx$T3OVFIF$0$0 == 0x00d8
                    00D8    427 _T3OVFIF	=	0x00d8
                    00D9    428 Fbambam_remote_tx$T3CH0IF$0$0 == 0x00d9
                    00D9    429 _T3CH0IF	=	0x00d9
                    00DA    430 Fbambam_remote_tx$T3CH1IF$0$0 == 0x00da
                    00DA    431 _T3CH1IF	=	0x00da
                    00DB    432 Fbambam_remote_tx$T4OVFIF$0$0 == 0x00db
                    00DB    433 _T4OVFIF	=	0x00db
                    00DC    434 Fbambam_remote_tx$T4CH0IF$0$0 == 0x00dc
                    00DC    435 _T4CH0IF	=	0x00dc
                    00DD    436 Fbambam_remote_tx$T4CH1IF$0$0 == 0x00dd
                    00DD    437 _T4CH1IF	=	0x00dd
                    00DE    438 Fbambam_remote_tx$OVFIM$0$0 == 0x00de
                    00DE    439 _OVFIM	=	0x00de
                    00DF    440 Fbambam_remote_tx$_TIMIF7$0$0 == 0x00df
                    00DF    441 __TIMIF7	=	0x00df
                    00E0    442 Fbambam_remote_tx$ACC_0$0$0 == 0x00e0
                    00E0    443 _ACC_0	=	0x00e0
                    00E1    444 Fbambam_remote_tx$ACC_1$0$0 == 0x00e1
                    00E1    445 _ACC_1	=	0x00e1
                    00E2    446 Fbambam_remote_tx$ACC_2$0$0 == 0x00e2
                    00E2    447 _ACC_2	=	0x00e2
                    00E3    448 Fbambam_remote_tx$ACC_3$0$0 == 0x00e3
                    00E3    449 _ACC_3	=	0x00e3
                    00E4    450 Fbambam_remote_tx$ACC_4$0$0 == 0x00e4
                    00E4    451 _ACC_4	=	0x00e4
                    00E5    452 Fbambam_remote_tx$ACC_5$0$0 == 0x00e5
                    00E5    453 _ACC_5	=	0x00e5
                    00E6    454 Fbambam_remote_tx$ACC_6$0$0 == 0x00e6
                    00E6    455 _ACC_6	=	0x00e6
                    00E7    456 Fbambam_remote_tx$ACC_7$0$0 == 0x00e7
                    00E7    457 _ACC_7	=	0x00e7
                    00E8    458 Fbambam_remote_tx$P2IF$0$0 == 0x00e8
                    00E8    459 _P2IF	=	0x00e8
                    00E9    460 Fbambam_remote_tx$UTX0IF$0$0 == 0x00e9
                    00E9    461 _UTX0IF	=	0x00e9
                    00EA    462 Fbambam_remote_tx$UTX1IF$0$0 == 0x00ea
                    00EA    463 _UTX1IF	=	0x00ea
                    00EB    464 Fbambam_remote_tx$P1IF$0$0 == 0x00eb
                    00EB    465 _P1IF	=	0x00eb
                    00EC    466 Fbambam_remote_tx$WDTIF$0$0 == 0x00ec
                    00EC    467 _WDTIF	=	0x00ec
                    00ED    468 Fbambam_remote_tx$_IRCON25$0$0 == 0x00ed
                    00ED    469 __IRCON25	=	0x00ed
                    00EE    470 Fbambam_remote_tx$_IRCON26$0$0 == 0x00ee
                    00EE    471 __IRCON26	=	0x00ee
                    00EF    472 Fbambam_remote_tx$_IRCON27$0$0 == 0x00ef
                    00EF    473 __IRCON27	=	0x00ef
                    00F0    474 Fbambam_remote_tx$B_0$0$0 == 0x00f0
                    00F0    475 _B_0	=	0x00f0
                    00F1    476 Fbambam_remote_tx$B_1$0$0 == 0x00f1
                    00F1    477 _B_1	=	0x00f1
                    00F2    478 Fbambam_remote_tx$B_2$0$0 == 0x00f2
                    00F2    479 _B_2	=	0x00f2
                    00F3    480 Fbambam_remote_tx$B_3$0$0 == 0x00f3
                    00F3    481 _B_3	=	0x00f3
                    00F4    482 Fbambam_remote_tx$B_4$0$0 == 0x00f4
                    00F4    483 _B_4	=	0x00f4
                    00F5    484 Fbambam_remote_tx$B_5$0$0 == 0x00f5
                    00F5    485 _B_5	=	0x00f5
                    00F6    486 Fbambam_remote_tx$B_6$0$0 == 0x00f6
                    00F6    487 _B_6	=	0x00f6
                    00F7    488 Fbambam_remote_tx$B_7$0$0 == 0x00f7
                    00F7    489 _B_7	=	0x00f7
                    00F8    490 Fbambam_remote_tx$U1ACTIVE$0$0 == 0x00f8
                    00F8    491 _U1ACTIVE	=	0x00f8
                    00F9    492 Fbambam_remote_tx$U1TX_BYTE$0$0 == 0x00f9
                    00F9    493 _U1TX_BYTE	=	0x00f9
                    00FA    494 Fbambam_remote_tx$U1RX_BYTE$0$0 == 0x00fa
                    00FA    495 _U1RX_BYTE	=	0x00fa
                    00FB    496 Fbambam_remote_tx$U1ERR$0$0 == 0x00fb
                    00FB    497 _U1ERR	=	0x00fb
                    00FC    498 Fbambam_remote_tx$U1FE$0$0 == 0x00fc
                    00FC    499 _U1FE	=	0x00fc
                    00FD    500 Fbambam_remote_tx$U1SLAVE$0$0 == 0x00fd
                    00FD    501 _U1SLAVE	=	0x00fd
                    00FE    502 Fbambam_remote_tx$U1RE$0$0 == 0x00fe
                    00FE    503 _U1RE	=	0x00fe
                    00FF    504 Fbambam_remote_tx$U1MODE$0$0 == 0x00ff
                    00FF    505 _U1MODE	=	0x00ff
                            506 ;--------------------------------------------------------
                            507 ; overlayable register banks
                            508 ;--------------------------------------------------------
                            509 	.area REG_BANK_0	(REL,OVR,DATA)
   0000                     510 	.ds 8
                            511 ;--------------------------------------------------------
                            512 ; internal ram data
                            513 ;--------------------------------------------------------
                            514 	.area DSEG    (DATA)
                    0000    515 Lbambam_remote_tx.adcToRadioService$sloc0$1$0==.
   0008                     516 _adcToRadioService_sloc0_1_0:
   0008                     517 	.ds 4
                            518 ;--------------------------------------------------------
                            519 ; overlayable items in internal ram 
                            520 ;--------------------------------------------------------
                            521 	.area OSEG    (OVR,DATA)
                            522 ;--------------------------------------------------------
                            523 ; Stack segment in internal ram 
                            524 ;--------------------------------------------------------
                            525 	.area	SSEG	(DATA)
   0023                     526 __start__stack:
   0023                     527 	.ds	1
                            528 
                            529 ;--------------------------------------------------------
                            530 ; indirectly addressable internal ram data
                            531 ;--------------------------------------------------------
                            532 	.area ISEG    (DATA)
                            533 ;--------------------------------------------------------
                            534 ; absolute internal ram data
                            535 ;--------------------------------------------------------
                            536 	.area IABS    (ABS,DATA)
                            537 	.area IABS    (ABS,DATA)
                            538 ;--------------------------------------------------------
                            539 ; bit data
                            540 ;--------------------------------------------------------
                            541 	.area BSEG    (BIT)
                            542 ;--------------------------------------------------------
                            543 ; paged external ram data
                            544 ;--------------------------------------------------------
                            545 	.area PSEG    (PAG,XDATA)
                    0000    546 Lbambam_remote_tx.adcToRadioService$lastTx$1$1==.
   F000                     547 _adcToRadioService_lastTx_1_1:
   F000                     548 	.ds 2
                    0002    549 Lbambam_remote_tx.adcToRadioService$ptr$2$2==.
   F002                     550 _adcToRadioService_ptr_2_2:
   F002                     551 	.ds 2
                            552 ;--------------------------------------------------------
                            553 ; external ram data
                            554 ;--------------------------------------------------------
                            555 	.area XSEG    (XDATA)
                    DF00    556 Fbambam_remote_tx$SYNC1$0$0 == 0xdf00
                    DF00    557 _SYNC1	=	0xdf00
                    DF01    558 Fbambam_remote_tx$SYNC0$0$0 == 0xdf01
                    DF01    559 _SYNC0	=	0xdf01
                    DF02    560 Fbambam_remote_tx$PKTLEN$0$0 == 0xdf02
                    DF02    561 _PKTLEN	=	0xdf02
                    DF03    562 Fbambam_remote_tx$PKTCTRL1$0$0 == 0xdf03
                    DF03    563 _PKTCTRL1	=	0xdf03
                    DF04    564 Fbambam_remote_tx$PKTCTRL0$0$0 == 0xdf04
                    DF04    565 _PKTCTRL0	=	0xdf04
                    DF05    566 Fbambam_remote_tx$ADDR$0$0 == 0xdf05
                    DF05    567 _ADDR	=	0xdf05
                    DF06    568 Fbambam_remote_tx$CHANNR$0$0 == 0xdf06
                    DF06    569 _CHANNR	=	0xdf06
                    DF07    570 Fbambam_remote_tx$FSCTRL1$0$0 == 0xdf07
                    DF07    571 _FSCTRL1	=	0xdf07
                    DF08    572 Fbambam_remote_tx$FSCTRL0$0$0 == 0xdf08
                    DF08    573 _FSCTRL0	=	0xdf08
                    DF09    574 Fbambam_remote_tx$FREQ2$0$0 == 0xdf09
                    DF09    575 _FREQ2	=	0xdf09
                    DF0A    576 Fbambam_remote_tx$FREQ1$0$0 == 0xdf0a
                    DF0A    577 _FREQ1	=	0xdf0a
                    DF0B    578 Fbambam_remote_tx$FREQ0$0$0 == 0xdf0b
                    DF0B    579 _FREQ0	=	0xdf0b
                    DF0C    580 Fbambam_remote_tx$MDMCFG4$0$0 == 0xdf0c
                    DF0C    581 _MDMCFG4	=	0xdf0c
                    DF0D    582 Fbambam_remote_tx$MDMCFG3$0$0 == 0xdf0d
                    DF0D    583 _MDMCFG3	=	0xdf0d
                    DF0E    584 Fbambam_remote_tx$MDMCFG2$0$0 == 0xdf0e
                    DF0E    585 _MDMCFG2	=	0xdf0e
                    DF0F    586 Fbambam_remote_tx$MDMCFG1$0$0 == 0xdf0f
                    DF0F    587 _MDMCFG1	=	0xdf0f
                    DF10    588 Fbambam_remote_tx$MDMCFG0$0$0 == 0xdf10
                    DF10    589 _MDMCFG0	=	0xdf10
                    DF11    590 Fbambam_remote_tx$DEVIATN$0$0 == 0xdf11
                    DF11    591 _DEVIATN	=	0xdf11
                    DF12    592 Fbambam_remote_tx$MCSM2$0$0 == 0xdf12
                    DF12    593 _MCSM2	=	0xdf12
                    DF13    594 Fbambam_remote_tx$MCSM1$0$0 == 0xdf13
                    DF13    595 _MCSM1	=	0xdf13
                    DF14    596 Fbambam_remote_tx$MCSM0$0$0 == 0xdf14
                    DF14    597 _MCSM0	=	0xdf14
                    DF15    598 Fbambam_remote_tx$FOCCFG$0$0 == 0xdf15
                    DF15    599 _FOCCFG	=	0xdf15
                    DF16    600 Fbambam_remote_tx$BSCFG$0$0 == 0xdf16
                    DF16    601 _BSCFG	=	0xdf16
                    DF17    602 Fbambam_remote_tx$AGCCTRL2$0$0 == 0xdf17
                    DF17    603 _AGCCTRL2	=	0xdf17
                    DF18    604 Fbambam_remote_tx$AGCCTRL1$0$0 == 0xdf18
                    DF18    605 _AGCCTRL1	=	0xdf18
                    DF19    606 Fbambam_remote_tx$AGCCTRL0$0$0 == 0xdf19
                    DF19    607 _AGCCTRL0	=	0xdf19
                    DF1A    608 Fbambam_remote_tx$FREND1$0$0 == 0xdf1a
                    DF1A    609 _FREND1	=	0xdf1a
                    DF1B    610 Fbambam_remote_tx$FREND0$0$0 == 0xdf1b
                    DF1B    611 _FREND0	=	0xdf1b
                    DF1C    612 Fbambam_remote_tx$FSCAL3$0$0 == 0xdf1c
                    DF1C    613 _FSCAL3	=	0xdf1c
                    DF1D    614 Fbambam_remote_tx$FSCAL2$0$0 == 0xdf1d
                    DF1D    615 _FSCAL2	=	0xdf1d
                    DF1E    616 Fbambam_remote_tx$FSCAL1$0$0 == 0xdf1e
                    DF1E    617 _FSCAL1	=	0xdf1e
                    DF1F    618 Fbambam_remote_tx$FSCAL0$0$0 == 0xdf1f
                    DF1F    619 _FSCAL0	=	0xdf1f
                    DF23    620 Fbambam_remote_tx$TEST2$0$0 == 0xdf23
                    DF23    621 _TEST2	=	0xdf23
                    DF24    622 Fbambam_remote_tx$TEST1$0$0 == 0xdf24
                    DF24    623 _TEST1	=	0xdf24
                    DF25    624 Fbambam_remote_tx$TEST0$0$0 == 0xdf25
                    DF25    625 _TEST0	=	0xdf25
                    DF2E    626 Fbambam_remote_tx$PA_TABLE0$0$0 == 0xdf2e
                    DF2E    627 _PA_TABLE0	=	0xdf2e
                    DF2F    628 Fbambam_remote_tx$IOCFG2$0$0 == 0xdf2f
                    DF2F    629 _IOCFG2	=	0xdf2f
                    DF30    630 Fbambam_remote_tx$IOCFG1$0$0 == 0xdf30
                    DF30    631 _IOCFG1	=	0xdf30
                    DF31    632 Fbambam_remote_tx$IOCFG0$0$0 == 0xdf31
                    DF31    633 _IOCFG0	=	0xdf31
                    DF36    634 Fbambam_remote_tx$PARTNUM$0$0 == 0xdf36
                    DF36    635 _PARTNUM	=	0xdf36
                    DF37    636 Fbambam_remote_tx$VERSION$0$0 == 0xdf37
                    DF37    637 _VERSION	=	0xdf37
                    DF38    638 Fbambam_remote_tx$FREQEST$0$0 == 0xdf38
                    DF38    639 _FREQEST	=	0xdf38
                    DF39    640 Fbambam_remote_tx$LQI$0$0 == 0xdf39
                    DF39    641 _LQI	=	0xdf39
                    DF3A    642 Fbambam_remote_tx$RSSI$0$0 == 0xdf3a
                    DF3A    643 _RSSI	=	0xdf3a
                    DF3B    644 Fbambam_remote_tx$MARCSTATE$0$0 == 0xdf3b
                    DF3B    645 _MARCSTATE	=	0xdf3b
                    DF3C    646 Fbambam_remote_tx$PKTSTATUS$0$0 == 0xdf3c
                    DF3C    647 _PKTSTATUS	=	0xdf3c
                    DF3D    648 Fbambam_remote_tx$VCO_VC_DAC$0$0 == 0xdf3d
                    DF3D    649 _VCO_VC_DAC	=	0xdf3d
                    DF40    650 Fbambam_remote_tx$I2SCFG0$0$0 == 0xdf40
                    DF40    651 _I2SCFG0	=	0xdf40
                    DF41    652 Fbambam_remote_tx$I2SCFG1$0$0 == 0xdf41
                    DF41    653 _I2SCFG1	=	0xdf41
                    DF42    654 Fbambam_remote_tx$I2SDATL$0$0 == 0xdf42
                    DF42    655 _I2SDATL	=	0xdf42
                    DF43    656 Fbambam_remote_tx$I2SDATH$0$0 == 0xdf43
                    DF43    657 _I2SDATH	=	0xdf43
                    DF44    658 Fbambam_remote_tx$I2SWCNT$0$0 == 0xdf44
                    DF44    659 _I2SWCNT	=	0xdf44
                    DF45    660 Fbambam_remote_tx$I2SSTAT$0$0 == 0xdf45
                    DF45    661 _I2SSTAT	=	0xdf45
                    DF46    662 Fbambam_remote_tx$I2SCLKF0$0$0 == 0xdf46
                    DF46    663 _I2SCLKF0	=	0xdf46
                    DF47    664 Fbambam_remote_tx$I2SCLKF1$0$0 == 0xdf47
                    DF47    665 _I2SCLKF1	=	0xdf47
                    DF48    666 Fbambam_remote_tx$I2SCLKF2$0$0 == 0xdf48
                    DF48    667 _I2SCLKF2	=	0xdf48
                    DE00    668 Fbambam_remote_tx$USBADDR$0$0 == 0xde00
                    DE00    669 _USBADDR	=	0xde00
                    DE01    670 Fbambam_remote_tx$USBPOW$0$0 == 0xde01
                    DE01    671 _USBPOW	=	0xde01
                    DE02    672 Fbambam_remote_tx$USBIIF$0$0 == 0xde02
                    DE02    673 _USBIIF	=	0xde02
                    DE04    674 Fbambam_remote_tx$USBOIF$0$0 == 0xde04
                    DE04    675 _USBOIF	=	0xde04
                    DE06    676 Fbambam_remote_tx$USBCIF$0$0 == 0xde06
                    DE06    677 _USBCIF	=	0xde06
                    DE07    678 Fbambam_remote_tx$USBIIE$0$0 == 0xde07
                    DE07    679 _USBIIE	=	0xde07
                    DE09    680 Fbambam_remote_tx$USBOIE$0$0 == 0xde09
                    DE09    681 _USBOIE	=	0xde09
                    DE0B    682 Fbambam_remote_tx$USBCIE$0$0 == 0xde0b
                    DE0B    683 _USBCIE	=	0xde0b
                    DE0C    684 Fbambam_remote_tx$USBFRML$0$0 == 0xde0c
                    DE0C    685 _USBFRML	=	0xde0c
                    DE0D    686 Fbambam_remote_tx$USBFRMH$0$0 == 0xde0d
                    DE0D    687 _USBFRMH	=	0xde0d
                    DE0E    688 Fbambam_remote_tx$USBINDEX$0$0 == 0xde0e
                    DE0E    689 _USBINDEX	=	0xde0e
                    DE10    690 Fbambam_remote_tx$USBMAXI$0$0 == 0xde10
                    DE10    691 _USBMAXI	=	0xde10
                    DE11    692 Fbambam_remote_tx$USBCSIL$0$0 == 0xde11
                    DE11    693 _USBCSIL	=	0xde11
                    DE12    694 Fbambam_remote_tx$USBCSIH$0$0 == 0xde12
                    DE12    695 _USBCSIH	=	0xde12
                    DE13    696 Fbambam_remote_tx$USBMAXO$0$0 == 0xde13
                    DE13    697 _USBMAXO	=	0xde13
                    DE14    698 Fbambam_remote_tx$USBCSOL$0$0 == 0xde14
                    DE14    699 _USBCSOL	=	0xde14
                    DE15    700 Fbambam_remote_tx$USBCSOH$0$0 == 0xde15
                    DE15    701 _USBCSOH	=	0xde15
                    DE16    702 Fbambam_remote_tx$USBCNTL$0$0 == 0xde16
                    DE16    703 _USBCNTL	=	0xde16
                    DE17    704 Fbambam_remote_tx$USBCNTH$0$0 == 0xde17
                    DE17    705 _USBCNTH	=	0xde17
                    DE20    706 Fbambam_remote_tx$USBF0$0$0 == 0xde20
                    DE20    707 _USBF0	=	0xde20
                    DE22    708 Fbambam_remote_tx$USBF1$0$0 == 0xde22
                    DE22    709 _USBF1	=	0xde22
                    DE24    710 Fbambam_remote_tx$USBF2$0$0 == 0xde24
                    DE24    711 _USBF2	=	0xde24
                    DE26    712 Fbambam_remote_tx$USBF3$0$0 == 0xde26
                    DE26    713 _USBF3	=	0xde26
                    DE28    714 Fbambam_remote_tx$USBF4$0$0 == 0xde28
                    DE28    715 _USBF4	=	0xde28
                    DE2A    716 Fbambam_remote_tx$USBF5$0$0 == 0xde2a
                    DE2A    717 _USBF5	=	0xde2a
                            718 ;--------------------------------------------------------
                            719 ; absolute external ram data
                            720 ;--------------------------------------------------------
                            721 	.area XABS    (ABS,XDATA)
                            722 ;--------------------------------------------------------
                            723 ; external initialized ram data
                            724 ;--------------------------------------------------------
                            725 	.area XISEG   (XDATA)
                            726 	.area HOME    (CODE)
                            727 	.area GSINIT0 (CODE)
                            728 	.area GSINIT1 (CODE)
                            729 	.area GSINIT2 (CODE)
                            730 	.area GSINIT3 (CODE)
                            731 	.area GSINIT4 (CODE)
                            732 	.area GSINIT5 (CODE)
                            733 	.area GSINIT  (CODE)
                            734 	.area GSFINAL (CODE)
                            735 	.area CSEG    (CODE)
                            736 ;--------------------------------------------------------
                            737 ; interrupt vector 
                            738 ;--------------------------------------------------------
                            739 	.area HOME    (CODE)
   0400                     740 __interrupt_vect:
   0400 02 04 8D            741 	ljmp	__sdcc_gsinit_startup
   0403 32                  742 	reti
   0404                     743 	.ds	7
   040B 32                  744 	reti
   040C                     745 	.ds	7
   0413 32                  746 	reti
   0414                     747 	.ds	7
   041B 32                  748 	reti
   041C                     749 	.ds	7
   0423 32                  750 	reti
   0424                     751 	.ds	7
   042B 32                  752 	reti
   042C                     753 	.ds	7
   0433 32                  754 	reti
   0434                     755 	.ds	7
   043B 32                  756 	reti
   043C                     757 	.ds	7
   0443 32                  758 	reti
   0444                     759 	.ds	7
   044B 32                  760 	reti
   044C                     761 	.ds	7
   0453 32                  762 	reti
   0454                     763 	.ds	7
   045B 32                  764 	reti
   045C                     765 	.ds	7
   0463 02 0E 4B            766 	ljmp	_ISR_T4
   0466                     767 	.ds	5
   046B 32                  768 	reti
   046C                     769 	.ds	7
   0473 32                  770 	reti
   0474                     771 	.ds	7
   047B 32                  772 	reti
   047C                     773 	.ds	7
   0483 02 07 0F            774 	ljmp	_ISR_RF
                            775 ;--------------------------------------------------------
                            776 ; global & static initialisations
                            777 ;--------------------------------------------------------
                            778 	.area HOME    (CODE)
                            779 	.area GSINIT  (CODE)
                            780 	.area GSFINAL (CODE)
                            781 	.area GSINIT  (CODE)
                            782 	.globl __sdcc_gsinit_startup
                            783 	.globl __sdcc_program_startup
                            784 	.globl __start__stack
                            785 	.globl __mcs51_genXINIT
                            786 	.globl __mcs51_genXRAMCLEAR
                            787 	.globl __mcs51_genRAMCLEAR
                            788 ;------------------------------------------------------------
                            789 ;Allocation info for local variables in function 'adcToRadioService'
                            790 ;------------------------------------------------------------
                            791 ;sloc0                     Allocated with name '_adcToRadioService_sloc0_1_0'
                            792 ;------------------------------------------------------------
                    0000    793 	G$adcToRadioService$0$0 ==.
                    0000    794 	C$bambam_remote_tx.c$64$2$1 ==.
                            795 ;	apps/bambam_remote_tx/bambam_remote_tx.c:64: static uint16 lastTx = 0;
   04E6 78 00               796 	mov	r0,#_adcToRadioService_lastTx_1_1
   04E8 E4                  797 	clr	a
   04E9 F2                  798 	movx	@r0,a
   04EA 08                  799 	inc	r0
   04EB F2                  800 	movx	@r0,a
                            801 	.area GSFINAL (CODE)
   052D 02 04 86            802 	ljmp	__sdcc_program_startup
                            803 ;--------------------------------------------------------
                            804 ; Home
                            805 ;--------------------------------------------------------
                            806 	.area HOME    (CODE)
                            807 	.area HOME    (CODE)
   0486                     808 __sdcc_program_startup:
   0486 12 06 97            809 	lcall	_main
                            810 ;	return from main will lock up
   0489 80 FE               811 	sjmp .
                            812 ;--------------------------------------------------------
                            813 ; code
                            814 ;--------------------------------------------------------
                            815 	.area CSEG    (CODE)
                            816 ;------------------------------------------------------------
                            817 ;Allocation info for local variables in function 'analogInputsInit'
                            818 ;------------------------------------------------------------
                    0000    819 	G$analogInputsInit$0$0 ==.
                    0000    820 	C$bambam_remote_tx.c$31$0$0 ==.
                            821 ;	apps/bambam_remote_tx/bambam_remote_tx.c:31: void analogInputsInit()
                            822 ;	-----------------------------------------
                            823 ;	 function analogInputsInit
                            824 ;	-----------------------------------------
   0530                     825 _analogInputsInit:
                    0007    826 	ar7 = 0x07
                    0006    827 	ar6 = 0x06
                    0005    828 	ar5 = 0x05
                    0004    829 	ar4 = 0x04
                    0003    830 	ar3 = 0x03
                    0002    831 	ar2 = 0x02
                    0001    832 	ar1 = 0x01
                    0000    833 	ar0 = 0x00
                    0000    834 	C$bambam_remote_tx.c$33$1$1 ==.
                            835 ;	apps/bambam_remote_tx/bambam_remote_tx.c:33: switch(param_input_mode)
   0530 90 16 CB            836 	mov	dptr,#_param_input_mode
   0533 E4                  837 	clr	a
   0534 93                  838 	movc	a,@a+dptr
   0535 FC                  839 	mov	r4,a
   0536 74 01               840 	mov	a,#0x01
   0538 93                  841 	movc	a,@a+dptr
   0539 FD                  842 	mov	r5,a
   053A 74 02               843 	mov	a,#0x02
   053C 93                  844 	movc	a,@a+dptr
   053D FE                  845 	mov	r6,a
   053E 74 03               846 	mov	a,#0x03
   0540 93                  847 	movc	a,@a+dptr
   0541 FF                  848 	mov	r7,a
   0542 BC FF 0B            849 	cjne	r4,#0xFF,00109$
   0545 BD FF 08            850 	cjne	r5,#0xFF,00109$
   0548 BE FF 05            851 	cjne	r6,#0xFF,00109$
   054B BF FF 02            852 	cjne	r7,#0xFF,00109$
   054E 80 18               853 	sjmp	00102$
   0550                     854 00109$:
   0550 BC 01 1D            855 	cjne	r4,#0x01,00103$
   0553 BD 00 1A            856 	cjne	r5,#0x00,00103$
   0556 BE 00 17            857 	cjne	r6,#0x00,00103$
   0559 BF 00 14            858 	cjne	r7,#0x00,00103$
                    002C    859 	C$bambam_remote_tx.c$37$2$2 ==.
                            860 ;	apps/bambam_remote_tx/bambam_remote_tx.c:37: P2INP &= ~(1<<5);  // PDUP0 = 0: Pull-ups on Port 0.
   055C AF F7               861 	mov	r7,_P2INP
   055E 53 07 DF            862 	anl	ar7,#0xDF
   0561 8F F7               863 	mov	_P2INP,r7
                    0033    864 	C$bambam_remote_tx.c$38$2$2 ==.
                            865 ;	apps/bambam_remote_tx/bambam_remote_tx.c:38: P0INP = 0;
   0563 75 8F 00            866 	mov	_P0INP,#0x00
                    0036    867 	C$bambam_remote_tx.c$39$2$2 ==.
                            868 ;	apps/bambam_remote_tx/bambam_remote_tx.c:39: break;
                    0036    869 	C$bambam_remote_tx.c$41$2$2 ==.
                            870 ;	apps/bambam_remote_tx/bambam_remote_tx.c:41: case -1: // Enable pull-down resistors for all pins on Port 0.
   0566 80 0B               871 	sjmp	00105$
   0568                     872 00102$:
                    0038    873 	C$bambam_remote_tx.c$42$2$2 ==.
                            874 ;	apps/bambam_remote_tx/bambam_remote_tx.c:42: P2INP |= (1<<5);   // PDUP0 = 1: Pull-downs on Port 0.
   0568 43 F7 20            875 	orl	_P2INP,#0x20
                    003B    876 	C$bambam_remote_tx.c$43$2$2 ==.
                            877 ;	apps/bambam_remote_tx/bambam_remote_tx.c:43: P0INP = 0;         // This line should not be necessary because P0SEL is 0 on reset.
   056B 75 8F 00            878 	mov	_P0INP,#0x00
                    003E    879 	C$bambam_remote_tx.c$44$2$2 ==.
                            880 ;	apps/bambam_remote_tx/bambam_remote_tx.c:44: break;
                    003E    881 	C$bambam_remote_tx.c$46$2$2 ==.
                            882 ;	apps/bambam_remote_tx/bambam_remote_tx.c:46: default: // Disable pull-ups and pull-downs for all pins on Port 0.
   056E 80 03               883 	sjmp	00105$
   0570                     884 00103$:
                    0040    885 	C$bambam_remote_tx.c$47$2$2 ==.
                            886 ;	apps/bambam_remote_tx/bambam_remote_tx.c:47: P0INP = 0x3F;
   0570 75 8F 3F            887 	mov	_P0INP,#0x3F
                    0043    888 	C$bambam_remote_tx.c$49$1$1 ==.
                            889 ;	apps/bambam_remote_tx/bambam_remote_tx.c:49: }
   0573                     890 00105$:
                    0043    891 	C$bambam_remote_tx.c$50$1$1 ==.
                    0043    892 	XG$analogInputsInit$0$0 ==.
   0573 22                  893 	ret
                            894 ;------------------------------------------------------------
                            895 ;Allocation info for local variables in function 'updateLeds'
                            896 ;------------------------------------------------------------
                    0044    897 	G$updateLeds$0$0 ==.
                    0044    898 	C$bambam_remote_tx.c$52$1$1 ==.
                            899 ;	apps/bambam_remote_tx/bambam_remote_tx.c:52: void updateLeds()
                            900 ;	-----------------------------------------
                            901 ;	 function updateLeds
                            902 ;	-----------------------------------------
   0574                     903 _updateLeds:
                    0044    904 	C$bambam_remote_tx.c$54$1$1 ==.
                            905 ;	apps/bambam_remote_tx/bambam_remote_tx.c:54: usbShowStatusWithGreenLed();
   0574 12 16 0E            906 	lcall	_usbShowStatusWithGreenLed
                    0047    907 	C$bambam_remote_tx.c$55$2$2 ==.
                            908 ;	apps/bambam_remote_tx/bambam_remote_tx.c:55: LED_YELLOW(1);
   0577 43 FF 04            909 	orl	_P2DIR,#0x04
                    004A    910 	C$bambam_remote_tx.c$56$2$3 ==.
                            911 ;	apps/bambam_remote_tx/bambam_remote_tx.c:56: LED_RED(0);
   057A AF FF               912 	mov	r7,_P2DIR
   057C 53 07 FD            913 	anl	ar7,#0xFD
   057F 8F FF               914 	mov	_P2DIR,r7
                    0051    915 	C$bambam_remote_tx.c$57$2$3 ==.
                    0051    916 	XG$updateLeds$0$0 ==.
   0581 22                  917 	ret
                            918 ;------------------------------------------------------------
                            919 ;Allocation info for local variables in function 'adcToRadioService'
                            920 ;------------------------------------------------------------
                            921 ;sloc0                     Allocated with name '_adcToRadioService_sloc0_1_0'
                            922 ;------------------------------------------------------------
                    0052    923 	G$adcToRadioService$0$0 ==.
                    0052    924 	C$bambam_remote_tx.c$62$2$3 ==.
                            925 ;	apps/bambam_remote_tx/bambam_remote_tx.c:62: void adcToRadioService()
                            926 ;	-----------------------------------------
                            927 ;	 function adcToRadioService
                            928 ;	-----------------------------------------
   0582                     929 _adcToRadioService:
                    0052    930 	C$bambam_remote_tx.c$70$1$1 ==.
                            931 ;	apps/bambam_remote_tx/bambam_remote_tx.c:70: if ((uint16)(getMs() - lastTx) >= param_report_period_ms && (txPacket = radioQueueTxCurrentPacket()))
   0582 12 0E 70            932 	lcall	_getMs
   0585 85 82 08            933 	mov	_adcToRadioService_sloc0_1_0,dpl
   0588 85 83 09            934 	mov	(_adcToRadioService_sloc0_1_0 + 1),dph
   058B 85 F0 0A            935 	mov	(_adcToRadioService_sloc0_1_0 + 2),b
   058E F5 0B               936 	mov	(_adcToRadioService_sloc0_1_0 + 3),a
   0590 78 00               937 	mov	r0,#_adcToRadioService_lastTx_1_1
   0592 E2                  938 	movx	a,@r0
   0593 FA                  939 	mov	r2,a
   0594 08                  940 	inc	r0
   0595 E2                  941 	movx	a,@r0
   0596 FB                  942 	mov	r3,a
   0597 E4                  943 	clr	a
   0598 FE                  944 	mov	r6,a
   0599 FF                  945 	mov	r7,a
   059A E5 08               946 	mov	a,_adcToRadioService_sloc0_1_0
   059C C3                  947 	clr	c
   059D 9A                  948 	subb	a,r2
   059E FA                  949 	mov	r2,a
   059F E5 09               950 	mov	a,(_adcToRadioService_sloc0_1_0 + 1)
   05A1 9B                  951 	subb	a,r3
   05A2 FB                  952 	mov	r3,a
   05A3 E5 0A               953 	mov	a,(_adcToRadioService_sloc0_1_0 + 2)
   05A5 9E                  954 	subb	a,r6
   05A6 E5 0B               955 	mov	a,(_adcToRadioService_sloc0_1_0 + 3)
   05A8 9F                  956 	subb	a,r7
   05A9 90 16 CF            957 	mov	dptr,#_param_report_period_ms
   05AC E4                  958 	clr	a
   05AD 93                  959 	movc	a,@a+dptr
   05AE F5 08               960 	mov	_adcToRadioService_sloc0_1_0,a
   05B0 74 01               961 	mov	a,#0x01
   05B2 93                  962 	movc	a,@a+dptr
   05B3 F5 09               963 	mov	(_adcToRadioService_sloc0_1_0 + 1),a
   05B5 74 02               964 	mov	a,#0x02
   05B7 93                  965 	movc	a,@a+dptr
   05B8 F5 0A               966 	mov	(_adcToRadioService_sloc0_1_0 + 2),a
   05BA 74 03               967 	mov	a,#0x03
   05BC 93                  968 	movc	a,@a+dptr
   05BD F5 0B               969 	mov	(_adcToRadioService_sloc0_1_0 + 3),a
   05BF 7E 00               970 	mov	r6,#0x00
   05C1 7F 00               971 	mov	r7,#0x00
   05C3 C3                  972 	clr	c
   05C4 EA                  973 	mov	a,r2
   05C5 95 08               974 	subb	a,_adcToRadioService_sloc0_1_0
   05C7 EB                  975 	mov	a,r3
   05C8 95 09               976 	subb	a,(_adcToRadioService_sloc0_1_0 + 1)
   05CA EE                  977 	mov	a,r6
   05CB 95 0A               978 	subb	a,(_adcToRadioService_sloc0_1_0 + 2)
   05CD EF                  979 	mov	a,r7
   05CE 64 80               980 	xrl	a,#0x80
   05D0 85 0B F0            981 	mov	b,(_adcToRadioService_sloc0_1_0 + 3)
   05D3 63 F0 80            982 	xrl	b,#0x80
   05D6 95 F0               983 	subb	a,b
   05D8 50 03               984 	jnc	00115$
   05DA 02 06 96            985 	ljmp	00108$
   05DD                     986 00115$:
   05DD 12 09 3B            987 	lcall	_radioQueueTxCurrentPacket
   05E0 AE 82               988 	mov	r6,dpl
   05E2 AF 83               989 	mov	r7,dph
   05E4 8E 04               990 	mov	ar4,r6
   05E6 8F 05               991 	mov	ar5,r7
   05E8 EE                  992 	mov	a,r6
   05E9 4F                  993 	orl	a,r7
   05EA 70 03               994 	jnz	00116$
   05EC 02 06 96            995 	ljmp	00108$
   05EF                     996 00116$:
                    00BF    997 	C$bambam_remote_tx.c$75$2$2 ==.
                            998 ;	apps/bambam_remote_tx/bambam_remote_tx.c:75: uint16 XDATA * ptr = (uint16 XDATA *)&txPacket[5];
   05EF 74 05               999 	mov	a,#0x05
   05F1 2C                 1000 	add	a,r4
   05F2 FE                 1001 	mov	r6,a
   05F3 E4                 1002 	clr	a
   05F4 3D                 1003 	addc	a,r5
   05F5 FF                 1004 	mov	r7,a
   05F6 78 02              1005 	mov	r0,#_adcToRadioService_ptr_2_2
   05F8 EE                 1006 	mov	a,r6
   05F9 F2                 1007 	movx	@r0,a
   05FA 08                 1008 	inc	r0
   05FB EF                 1009 	mov	a,r7
   05FC F2                 1010 	movx	@r0,a
                    00CD   1011 	C$bambam_remote_tx.c$78$2$2 ==.
                           1012 ;	apps/bambam_remote_tx/bambam_remote_tx.c:78: lastTx = getMs();
   05FD C0 05              1013 	push	ar5
   05FF C0 04              1014 	push	ar4
   0601 12 0E 70           1015 	lcall	_getMs
   0604 AA 82              1016 	mov	r2,dpl
   0606 AB 83              1017 	mov	r3,dph
   0608 D0 04              1018 	pop	ar4
   060A D0 05              1019 	pop	ar5
   060C 78 00              1020 	mov	r0,#_adcToRadioService_lastTx_1_1
   060E EA                 1021 	mov	a,r2
   060F F2                 1022 	movx	@r0,a
   0610 08                 1023 	inc	r0
   0611 EB                 1024 	mov	a,r3
   0612 F2                 1025 	movx	@r0,a
                    00E3   1026 	C$bambam_remote_tx.c$81$2$2 ==.
                           1027 ;	apps/bambam_remote_tx/bambam_remote_tx.c:81: txPacket[0] = 16;
   0613 8C 82              1028 	mov	dpl,r4
   0615 8D 83              1029 	mov	dph,r5
   0617 74 10              1030 	mov	a,#0x10
   0619 F0                 1031 	movx	@dptr,a
                    00EA   1032 	C$bambam_remote_tx.c$84$2$2 ==.
                           1033 ;	apps/bambam_remote_tx/bambam_remote_tx.c:84: txPacket[1] = serialNumber[0];
   061A 74 01              1034 	mov	a,#0x01
   061C 2C                 1035 	add	a,r4
   061D FE                 1036 	mov	r6,a
   061E E4                 1037 	clr	a
   061F 3D                 1038 	addc	a,r5
   0620 FF                 1039 	mov	r7,a
   0621 90 03 E0           1040 	mov	dptr,#_serialNumber
   0624 E4                 1041 	clr	a
   0625 93                 1042 	movc	a,@a+dptr
   0626 8E 82              1043 	mov	dpl,r6
   0628 8F 83              1044 	mov	dph,r7
   062A F0                 1045 	movx	@dptr,a
                    00FB   1046 	C$bambam_remote_tx.c$85$2$2 ==.
                           1047 ;	apps/bambam_remote_tx/bambam_remote_tx.c:85: txPacket[2] = serialNumber[1];
   062B 74 02              1048 	mov	a,#0x02
   062D 2C                 1049 	add	a,r4
   062E FE                 1050 	mov	r6,a
   062F E4                 1051 	clr	a
   0630 3D                 1052 	addc	a,r5
   0631 FF                 1053 	mov	r7,a
   0632 90 03 E1           1054 	mov	dptr,#(_serialNumber + 0x0001)
   0635 E4                 1055 	clr	a
   0636 93                 1056 	movc	a,@a+dptr
   0637 8E 82              1057 	mov	dpl,r6
   0639 8F 83              1058 	mov	dph,r7
   063B F0                 1059 	movx	@dptr,a
                    010C   1060 	C$bambam_remote_tx.c$86$2$2 ==.
                           1061 ;	apps/bambam_remote_tx/bambam_remote_tx.c:86: txPacket[3] = serialNumber[2];
   063C 74 03              1062 	mov	a,#0x03
   063E 2C                 1063 	add	a,r4
   063F FE                 1064 	mov	r6,a
   0640 E4                 1065 	clr	a
   0641 3D                 1066 	addc	a,r5
   0642 FF                 1067 	mov	r7,a
   0643 90 03 E2           1068 	mov	dptr,#(_serialNumber + 0x0002)
   0646 E4                 1069 	clr	a
   0647 93                 1070 	movc	a,@a+dptr
   0648 FB                 1071 	mov	r3,a
   0649 8E 82              1072 	mov	dpl,r6
   064B 8F 83              1073 	mov	dph,r7
   064D F0                 1074 	movx	@dptr,a
                    011E   1075 	C$bambam_remote_tx.c$87$2$2 ==.
                           1076 ;	apps/bambam_remote_tx/bambam_remote_tx.c:87: txPacket[4] = serialNumber[3];
   064E 74 04              1077 	mov	a,#0x04
   0650 2C                 1078 	add	a,r4
   0651 FC                 1079 	mov	r4,a
   0652 E4                 1080 	clr	a
   0653 3D                 1081 	addc	a,r5
   0654 FD                 1082 	mov	r5,a
   0655 90 03 E3           1083 	mov	dptr,#(_serialNumber + 0x0003)
   0658 E4                 1084 	clr	a
   0659 93                 1085 	movc	a,@a+dptr
   065A 8C 82              1086 	mov	dpl,r4
   065C 8D 83              1087 	mov	dph,r5
   065E F0                 1088 	movx	@dptr,a
                    012F   1089 	C$bambam_remote_tx.c$92$2$1 ==.
                           1090 ;	apps/bambam_remote_tx/bambam_remote_tx.c:92: for (i = 0; i < 6; i++)
   065F 78 02              1091 	mov	r0,#_adcToRadioService_ptr_2_2
   0661 E2                 1092 	movx	a,@r0
   0662 FE                 1093 	mov	r6,a
   0663 08                 1094 	inc	r0
   0664 E2                 1095 	movx	a,@r0
   0665 FF                 1096 	mov	r7,a
   0666 7D 00              1097 	mov	r5,#0x00
   0668                    1098 00104$:
   0668 BD 06 00           1099 	cjne	r5,#0x06,00117$
   066B                    1100 00117$:
   066B 50 26              1101 	jnc	00107$
                    013D   1102 	C$bambam_remote_tx.c$95$3$3 ==.
                           1103 ;	apps/bambam_remote_tx/bambam_remote_tx.c:95: *(ptr++) = adcRead(i); // Die Werte sollen dezimal ausgegeben werden
   066D 8D 82              1104 	mov	dpl,r5
   066F C0 07              1105 	push	ar7
   0671 C0 06              1106 	push	ar6
   0673 C0 05              1107 	push	ar5
   0675 12 06 B2           1108 	lcall	_adcRead
   0678 AB 82              1109 	mov	r3,dpl
   067A AC 83              1110 	mov	r4,dph
   067C D0 05              1111 	pop	ar5
   067E D0 06              1112 	pop	ar6
   0680 D0 07              1113 	pop	ar7
   0682 8E 82              1114 	mov	dpl,r6
   0684 8F 83              1115 	mov	dph,r7
   0686 EB                 1116 	mov	a,r3
   0687 F0                 1117 	movx	@dptr,a
   0688 A3                 1118 	inc	dptr
   0689 EC                 1119 	mov	a,r4
   068A F0                 1120 	movx	@dptr,a
   068B A3                 1121 	inc	dptr
   068C AE 82              1122 	mov	r6,dpl
   068E AF 83              1123 	mov	r7,dph
                    0160   1124 	C$bambam_remote_tx.c$92$2$2 ==.
                           1125 ;	apps/bambam_remote_tx/bambam_remote_tx.c:92: for (i = 0; i < 6; i++)
   0690 0D                 1126 	inc	r5
   0691 80 D5              1127 	sjmp	00104$
   0693                    1128 00107$:
                    0163   1129 	C$bambam_remote_tx.c$98$2$2 ==.
                           1130 ;	apps/bambam_remote_tx/bambam_remote_tx.c:98: radioQueueTxSendPacket();
   0693 12 09 59           1131 	lcall	_radioQueueTxSendPacket
   0696                    1132 00108$:
                    0166   1133 	C$bambam_remote_tx.c$100$2$1 ==.
                    0166   1134 	XG$adcToRadioService$0$0 ==.
   0696 22                 1135 	ret
                           1136 ;------------------------------------------------------------
                           1137 ;Allocation info for local variables in function 'main'
                           1138 ;------------------------------------------------------------
                    0167   1139 	G$main$0$0 ==.
                    0167   1140 	C$bambam_remote_tx.c$102$2$1 ==.
                           1141 ;	apps/bambam_remote_tx/bambam_remote_tx.c:102: void main(void)
                           1142 ;	-----------------------------------------
                           1143 ;	 function main
                           1144 ;	-----------------------------------------
   0697                    1145 _main:
                    0167   1146 	C$bambam_remote_tx.c$104$1$1 ==.
                           1147 ;	apps/bambam_remote_tx/bambam_remote_tx.c:104: systemInit();
   0697 12 0A B8           1148 	lcall	_systemInit
                    016A   1149 	C$bambam_remote_tx.c$105$1$1 ==.
                           1150 ;	apps/bambam_remote_tx/bambam_remote_tx.c:105: analogInputsInit();
   069A 12 05 30           1151 	lcall	_analogInputsInit
                    016D   1152 	C$bambam_remote_tx.c$106$1$1 ==.
                           1153 ;	apps/bambam_remote_tx/bambam_remote_tx.c:106: usbInit();
   069D 12 0E D7           1154 	lcall	_usbInit
                    0170   1155 	C$bambam_remote_tx.c$107$1$1 ==.
                           1156 ;	apps/bambam_remote_tx/bambam_remote_tx.c:107: radioQueueInit();
   06A0 12 08 F7           1157 	lcall	_radioQueueInit
                    0173   1158 	C$bambam_remote_tx.c$109$1$1 ==.
                           1159 ;	apps/bambam_remote_tx/bambam_remote_tx.c:109: while(1)
   06A3                    1160 00102$:
                    0173   1161 	C$bambam_remote_tx.c$111$2$2 ==.
                           1162 ;	apps/bambam_remote_tx/bambam_remote_tx.c:111: updateLeds();
   06A3 12 05 74           1163 	lcall	_updateLeds
                    0176   1164 	C$bambam_remote_tx.c$112$2$2 ==.
                           1165 ;	apps/bambam_remote_tx/bambam_remote_tx.c:112: boardService();
   06A6 12 0A C5           1166 	lcall	_boardService
                    0179   1167 	C$bambam_remote_tx.c$113$2$2 ==.
                           1168 ;	apps/bambam_remote_tx/bambam_remote_tx.c:113: usbComService();
   06A9 12 0C E9           1169 	lcall	_usbComService
                    017C   1170 	C$bambam_remote_tx.c$114$2$2 ==.
                           1171 ;	apps/bambam_remote_tx/bambam_remote_tx.c:114: adcToRadioService();
   06AC 12 05 82           1172 	lcall	_adcToRadioService
   06AF 80 F2              1173 	sjmp	00102$
                    0181   1174 	C$bambam_remote_tx.c$116$1$1 ==.
                    0181   1175 	XG$main$0$0 ==.
   06B1 22                 1176 	ret
                           1177 	.area CSEG    (CODE)
                           1178 	.area CONST   (CODE)
                    0000   1179 G$param_input_mode$0$0 == .
   16CB                    1180 _param_input_mode:
   16CB 00 00 00 00        1181 	.byte #0x00,#0x00,#0x00,#0x00	;  0
                    0004   1182 G$param_report_period_ms$0$0 == .
   16CF                    1183 _param_report_period_ms:
   16CF 64 00 00 00        1184 	.byte #0x64,#0x00,#0x00,#0x00	;  100
                           1185 	.area XINIT   (CODE)
                           1186 	.area CABS    (ABS,CODE)
