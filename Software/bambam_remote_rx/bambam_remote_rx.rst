                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.1.0 #7066 (Nov 22 2011) (MINGW32)
                              4 ; This file was generated Tue Aug 04 12:15:51 2015
                              5 ;--------------------------------------------------------
                              6 	.module bambam_remote_rx
                              7 	.optsdcc -mmcs51 --model-medium
                              8 	
                              9 ;--------------------------------------------------------
                             10 ; Public variables in this module
                             11 ;--------------------------------------------------------
                             12 	.globl _main
                             13 	.globl _lineCodingChanged
                             14 	.globl _radioToUart1Service
                             15 	.globl _updateLeds
                             16 	.globl _uart1TxSendByte
                             17 	.globl _uart1TxAvailable
                             18 	.globl _uart1SetStopBits
                             19 	.globl _uart1SetParity
                             20 	.globl _uart1SetBaudRate
                             21 	.globl _uart1Init
                             22 	.globl _printf
                             23 	.globl _radioQueueRxDoneWithPacket
                             24 	.globl _radioQueueRxCurrentPacket
                             25 	.globl _radioQueueInit
                             26 	.globl _usbComService
                             27 	.globl _getMs
                             28 	.globl _boardService
                             29 	.globl _systemInit
                             30 	.globl _putchar
                             31 ;--------------------------------------------------------
                             32 ; special function registers
                             33 ;--------------------------------------------------------
                             34 	.area RSEG    (ABS,DATA)
   0000                      35 	.org 0x0000
                    0080     36 Fbambam_remote_rx$P0$0$0 == 0x0080
                    0080     37 _P0	=	0x0080
                    0081     38 Fbambam_remote_rx$SP$0$0 == 0x0081
                    0081     39 _SP	=	0x0081
                    0082     40 Fbambam_remote_rx$DPL0$0$0 == 0x0082
                    0082     41 _DPL0	=	0x0082
                    0083     42 Fbambam_remote_rx$DPH0$0$0 == 0x0083
                    0083     43 _DPH0	=	0x0083
                    0084     44 Fbambam_remote_rx$DPL1$0$0 == 0x0084
                    0084     45 _DPL1	=	0x0084
                    0085     46 Fbambam_remote_rx$DPH1$0$0 == 0x0085
                    0085     47 _DPH1	=	0x0085
                    0086     48 Fbambam_remote_rx$U0CSR$0$0 == 0x0086
                    0086     49 _U0CSR	=	0x0086
                    0087     50 Fbambam_remote_rx$PCON$0$0 == 0x0087
                    0087     51 _PCON	=	0x0087
                    0088     52 Fbambam_remote_rx$TCON$0$0 == 0x0088
                    0088     53 _TCON	=	0x0088
                    0089     54 Fbambam_remote_rx$P0IFG$0$0 == 0x0089
                    0089     55 _P0IFG	=	0x0089
                    008A     56 Fbambam_remote_rx$P1IFG$0$0 == 0x008a
                    008A     57 _P1IFG	=	0x008a
                    008B     58 Fbambam_remote_rx$P2IFG$0$0 == 0x008b
                    008B     59 _P2IFG	=	0x008b
                    008C     60 Fbambam_remote_rx$PICTL$0$0 == 0x008c
                    008C     61 _PICTL	=	0x008c
                    008D     62 Fbambam_remote_rx$P1IEN$0$0 == 0x008d
                    008D     63 _P1IEN	=	0x008d
                    008F     64 Fbambam_remote_rx$P0INP$0$0 == 0x008f
                    008F     65 _P0INP	=	0x008f
                    0090     66 Fbambam_remote_rx$P1$0$0 == 0x0090
                    0090     67 _P1	=	0x0090
                    0091     68 Fbambam_remote_rx$RFIM$0$0 == 0x0091
                    0091     69 _RFIM	=	0x0091
                    0092     70 Fbambam_remote_rx$DPS$0$0 == 0x0092
                    0092     71 _DPS	=	0x0092
                    0093     72 Fbambam_remote_rx$MPAGE$0$0 == 0x0093
                    0093     73 _MPAGE	=	0x0093
                    0095     74 Fbambam_remote_rx$ENDIAN$0$0 == 0x0095
                    0095     75 _ENDIAN	=	0x0095
                    0098     76 Fbambam_remote_rx$S0CON$0$0 == 0x0098
                    0098     77 _S0CON	=	0x0098
                    009A     78 Fbambam_remote_rx$IEN2$0$0 == 0x009a
                    009A     79 _IEN2	=	0x009a
                    009B     80 Fbambam_remote_rx$S1CON$0$0 == 0x009b
                    009B     81 _S1CON	=	0x009b
                    009C     82 Fbambam_remote_rx$T2CT$0$0 == 0x009c
                    009C     83 _T2CT	=	0x009c
                    009D     84 Fbambam_remote_rx$T2PR$0$0 == 0x009d
                    009D     85 _T2PR	=	0x009d
                    009E     86 Fbambam_remote_rx$T2CTL$0$0 == 0x009e
                    009E     87 _T2CTL	=	0x009e
                    00A0     88 Fbambam_remote_rx$P2$0$0 == 0x00a0
                    00A0     89 _P2	=	0x00a0
                    00A1     90 Fbambam_remote_rx$WORIRQ$0$0 == 0x00a1
                    00A1     91 _WORIRQ	=	0x00a1
                    00A2     92 Fbambam_remote_rx$WORCTRL$0$0 == 0x00a2
                    00A2     93 _WORCTRL	=	0x00a2
                    00A3     94 Fbambam_remote_rx$WOREVT0$0$0 == 0x00a3
                    00A3     95 _WOREVT0	=	0x00a3
                    00A4     96 Fbambam_remote_rx$WOREVT1$0$0 == 0x00a4
                    00A4     97 _WOREVT1	=	0x00a4
                    00A5     98 Fbambam_remote_rx$WORTIME0$0$0 == 0x00a5
                    00A5     99 _WORTIME0	=	0x00a5
                    00A6    100 Fbambam_remote_rx$WORTIME1$0$0 == 0x00a6
                    00A6    101 _WORTIME1	=	0x00a6
                    00A8    102 Fbambam_remote_rx$IEN0$0$0 == 0x00a8
                    00A8    103 _IEN0	=	0x00a8
                    00A9    104 Fbambam_remote_rx$IP0$0$0 == 0x00a9
                    00A9    105 _IP0	=	0x00a9
                    00AB    106 Fbambam_remote_rx$FWT$0$0 == 0x00ab
                    00AB    107 _FWT	=	0x00ab
                    00AC    108 Fbambam_remote_rx$FADDRL$0$0 == 0x00ac
                    00AC    109 _FADDRL	=	0x00ac
                    00AD    110 Fbambam_remote_rx$FADDRH$0$0 == 0x00ad
                    00AD    111 _FADDRH	=	0x00ad
                    00AE    112 Fbambam_remote_rx$FCTL$0$0 == 0x00ae
                    00AE    113 _FCTL	=	0x00ae
                    00AF    114 Fbambam_remote_rx$FWDATA$0$0 == 0x00af
                    00AF    115 _FWDATA	=	0x00af
                    00B1    116 Fbambam_remote_rx$ENCDI$0$0 == 0x00b1
                    00B1    117 _ENCDI	=	0x00b1
                    00B2    118 Fbambam_remote_rx$ENCDO$0$0 == 0x00b2
                    00B2    119 _ENCDO	=	0x00b2
                    00B3    120 Fbambam_remote_rx$ENCCS$0$0 == 0x00b3
                    00B3    121 _ENCCS	=	0x00b3
                    00B4    122 Fbambam_remote_rx$ADCCON1$0$0 == 0x00b4
                    00B4    123 _ADCCON1	=	0x00b4
                    00B5    124 Fbambam_remote_rx$ADCCON2$0$0 == 0x00b5
                    00B5    125 _ADCCON2	=	0x00b5
                    00B6    126 Fbambam_remote_rx$ADCCON3$0$0 == 0x00b6
                    00B6    127 _ADCCON3	=	0x00b6
                    00B8    128 Fbambam_remote_rx$IEN1$0$0 == 0x00b8
                    00B8    129 _IEN1	=	0x00b8
                    00B9    130 Fbambam_remote_rx$IP1$0$0 == 0x00b9
                    00B9    131 _IP1	=	0x00b9
                    00BA    132 Fbambam_remote_rx$ADCL$0$0 == 0x00ba
                    00BA    133 _ADCL	=	0x00ba
                    00BB    134 Fbambam_remote_rx$ADCH$0$0 == 0x00bb
                    00BB    135 _ADCH	=	0x00bb
                    00BC    136 Fbambam_remote_rx$RNDL$0$0 == 0x00bc
                    00BC    137 _RNDL	=	0x00bc
                    00BD    138 Fbambam_remote_rx$RNDH$0$0 == 0x00bd
                    00BD    139 _RNDH	=	0x00bd
                    00BE    140 Fbambam_remote_rx$SLEEP$0$0 == 0x00be
                    00BE    141 _SLEEP	=	0x00be
                    00C0    142 Fbambam_remote_rx$IRCON$0$0 == 0x00c0
                    00C0    143 _IRCON	=	0x00c0
                    00C1    144 Fbambam_remote_rx$U0DBUF$0$0 == 0x00c1
                    00C1    145 _U0DBUF	=	0x00c1
                    00C2    146 Fbambam_remote_rx$U0BAUD$0$0 == 0x00c2
                    00C2    147 _U0BAUD	=	0x00c2
                    00C4    148 Fbambam_remote_rx$U0UCR$0$0 == 0x00c4
                    00C4    149 _U0UCR	=	0x00c4
                    00C5    150 Fbambam_remote_rx$U0GCR$0$0 == 0x00c5
                    00C5    151 _U0GCR	=	0x00c5
                    00C6    152 Fbambam_remote_rx$CLKCON$0$0 == 0x00c6
                    00C6    153 _CLKCON	=	0x00c6
                    00C7    154 Fbambam_remote_rx$MEMCTR$0$0 == 0x00c7
                    00C7    155 _MEMCTR	=	0x00c7
                    00C9    156 Fbambam_remote_rx$WDCTL$0$0 == 0x00c9
                    00C9    157 _WDCTL	=	0x00c9
                    00CA    158 Fbambam_remote_rx$T3CNT$0$0 == 0x00ca
                    00CA    159 _T3CNT	=	0x00ca
                    00CB    160 Fbambam_remote_rx$T3CTL$0$0 == 0x00cb
                    00CB    161 _T3CTL	=	0x00cb
                    00CC    162 Fbambam_remote_rx$T3CCTL0$0$0 == 0x00cc
                    00CC    163 _T3CCTL0	=	0x00cc
                    00CD    164 Fbambam_remote_rx$T3CC0$0$0 == 0x00cd
                    00CD    165 _T3CC0	=	0x00cd
                    00CE    166 Fbambam_remote_rx$T3CCTL1$0$0 == 0x00ce
                    00CE    167 _T3CCTL1	=	0x00ce
                    00CF    168 Fbambam_remote_rx$T3CC1$0$0 == 0x00cf
                    00CF    169 _T3CC1	=	0x00cf
                    00D0    170 Fbambam_remote_rx$PSW$0$0 == 0x00d0
                    00D0    171 _PSW	=	0x00d0
                    00D1    172 Fbambam_remote_rx$DMAIRQ$0$0 == 0x00d1
                    00D1    173 _DMAIRQ	=	0x00d1
                    00D2    174 Fbambam_remote_rx$DMA1CFGL$0$0 == 0x00d2
                    00D2    175 _DMA1CFGL	=	0x00d2
                    00D3    176 Fbambam_remote_rx$DMA1CFGH$0$0 == 0x00d3
                    00D3    177 _DMA1CFGH	=	0x00d3
                    00D4    178 Fbambam_remote_rx$DMA0CFGL$0$0 == 0x00d4
                    00D4    179 _DMA0CFGL	=	0x00d4
                    00D5    180 Fbambam_remote_rx$DMA0CFGH$0$0 == 0x00d5
                    00D5    181 _DMA0CFGH	=	0x00d5
                    00D6    182 Fbambam_remote_rx$DMAARM$0$0 == 0x00d6
                    00D6    183 _DMAARM	=	0x00d6
                    00D7    184 Fbambam_remote_rx$DMAREQ$0$0 == 0x00d7
                    00D7    185 _DMAREQ	=	0x00d7
                    00D8    186 Fbambam_remote_rx$TIMIF$0$0 == 0x00d8
                    00D8    187 _TIMIF	=	0x00d8
                    00D9    188 Fbambam_remote_rx$RFD$0$0 == 0x00d9
                    00D9    189 _RFD	=	0x00d9
                    00DA    190 Fbambam_remote_rx$T1CC0L$0$0 == 0x00da
                    00DA    191 _T1CC0L	=	0x00da
                    00DB    192 Fbambam_remote_rx$T1CC0H$0$0 == 0x00db
                    00DB    193 _T1CC0H	=	0x00db
                    00DC    194 Fbambam_remote_rx$T1CC1L$0$0 == 0x00dc
                    00DC    195 _T1CC1L	=	0x00dc
                    00DD    196 Fbambam_remote_rx$T1CC1H$0$0 == 0x00dd
                    00DD    197 _T1CC1H	=	0x00dd
                    00DE    198 Fbambam_remote_rx$T1CC2L$0$0 == 0x00de
                    00DE    199 _T1CC2L	=	0x00de
                    00DF    200 Fbambam_remote_rx$T1CC2H$0$0 == 0x00df
                    00DF    201 _T1CC2H	=	0x00df
                    00E0    202 Fbambam_remote_rx$ACC$0$0 == 0x00e0
                    00E0    203 _ACC	=	0x00e0
                    00E1    204 Fbambam_remote_rx$RFST$0$0 == 0x00e1
                    00E1    205 _RFST	=	0x00e1
                    00E2    206 Fbambam_remote_rx$T1CNTL$0$0 == 0x00e2
                    00E2    207 _T1CNTL	=	0x00e2
                    00E3    208 Fbambam_remote_rx$T1CNTH$0$0 == 0x00e3
                    00E3    209 _T1CNTH	=	0x00e3
                    00E4    210 Fbambam_remote_rx$T1CTL$0$0 == 0x00e4
                    00E4    211 _T1CTL	=	0x00e4
                    00E5    212 Fbambam_remote_rx$T1CCTL0$0$0 == 0x00e5
                    00E5    213 _T1CCTL0	=	0x00e5
                    00E6    214 Fbambam_remote_rx$T1CCTL1$0$0 == 0x00e6
                    00E6    215 _T1CCTL1	=	0x00e6
                    00E7    216 Fbambam_remote_rx$T1CCTL2$0$0 == 0x00e7
                    00E7    217 _T1CCTL2	=	0x00e7
                    00E8    218 Fbambam_remote_rx$IRCON2$0$0 == 0x00e8
                    00E8    219 _IRCON2	=	0x00e8
                    00E9    220 Fbambam_remote_rx$RFIF$0$0 == 0x00e9
                    00E9    221 _RFIF	=	0x00e9
                    00EA    222 Fbambam_remote_rx$T4CNT$0$0 == 0x00ea
                    00EA    223 _T4CNT	=	0x00ea
                    00EB    224 Fbambam_remote_rx$T4CTL$0$0 == 0x00eb
                    00EB    225 _T4CTL	=	0x00eb
                    00EC    226 Fbambam_remote_rx$T4CCTL0$0$0 == 0x00ec
                    00EC    227 _T4CCTL0	=	0x00ec
                    00ED    228 Fbambam_remote_rx$T4CC0$0$0 == 0x00ed
                    00ED    229 _T4CC0	=	0x00ed
                    00EE    230 Fbambam_remote_rx$T4CCTL1$0$0 == 0x00ee
                    00EE    231 _T4CCTL1	=	0x00ee
                    00EF    232 Fbambam_remote_rx$T4CC1$0$0 == 0x00ef
                    00EF    233 _T4CC1	=	0x00ef
                    00F0    234 Fbambam_remote_rx$B$0$0 == 0x00f0
                    00F0    235 _B	=	0x00f0
                    00F1    236 Fbambam_remote_rx$PERCFG$0$0 == 0x00f1
                    00F1    237 _PERCFG	=	0x00f1
                    00F2    238 Fbambam_remote_rx$ADCCFG$0$0 == 0x00f2
                    00F2    239 _ADCCFG	=	0x00f2
                    00F3    240 Fbambam_remote_rx$P0SEL$0$0 == 0x00f3
                    00F3    241 _P0SEL	=	0x00f3
                    00F4    242 Fbambam_remote_rx$P1SEL$0$0 == 0x00f4
                    00F4    243 _P1SEL	=	0x00f4
                    00F5    244 Fbambam_remote_rx$P2SEL$0$0 == 0x00f5
                    00F5    245 _P2SEL	=	0x00f5
                    00F6    246 Fbambam_remote_rx$P1INP$0$0 == 0x00f6
                    00F6    247 _P1INP	=	0x00f6
                    00F7    248 Fbambam_remote_rx$P2INP$0$0 == 0x00f7
                    00F7    249 _P2INP	=	0x00f7
                    00F8    250 Fbambam_remote_rx$U1CSR$0$0 == 0x00f8
                    00F8    251 _U1CSR	=	0x00f8
                    00F9    252 Fbambam_remote_rx$U1DBUF$0$0 == 0x00f9
                    00F9    253 _U1DBUF	=	0x00f9
                    00FA    254 Fbambam_remote_rx$U1BAUD$0$0 == 0x00fa
                    00FA    255 _U1BAUD	=	0x00fa
                    00FB    256 Fbambam_remote_rx$U1UCR$0$0 == 0x00fb
                    00FB    257 _U1UCR	=	0x00fb
                    00FC    258 Fbambam_remote_rx$U1GCR$0$0 == 0x00fc
                    00FC    259 _U1GCR	=	0x00fc
                    00FD    260 Fbambam_remote_rx$P0DIR$0$0 == 0x00fd
                    00FD    261 _P0DIR	=	0x00fd
                    00FE    262 Fbambam_remote_rx$P1DIR$0$0 == 0x00fe
                    00FE    263 _P1DIR	=	0x00fe
                    00FF    264 Fbambam_remote_rx$P2DIR$0$0 == 0x00ff
                    00FF    265 _P2DIR	=	0x00ff
                    FFFFD5D4    266 Fbambam_remote_rx$DMA0CFG$0$0 == 0xffffd5d4
                    FFFFD5D4    267 _DMA0CFG	=	0xffffd5d4
                    FFFFD3D2    268 Fbambam_remote_rx$DMA1CFG$0$0 == 0xffffd3d2
                    FFFFD3D2    269 _DMA1CFG	=	0xffffd3d2
                    FFFFADAC    270 Fbambam_remote_rx$FADDR$0$0 == 0xffffadac
                    FFFFADAC    271 _FADDR	=	0xffffadac
                    FFFFBBBA    272 Fbambam_remote_rx$ADC$0$0 == 0xffffbbba
                    FFFFBBBA    273 _ADC	=	0xffffbbba
                    FFFFDBDA    274 Fbambam_remote_rx$T1CC0$0$0 == 0xffffdbda
                    FFFFDBDA    275 _T1CC0	=	0xffffdbda
                    FFFFDDDC    276 Fbambam_remote_rx$T1CC1$0$0 == 0xffffdddc
                    FFFFDDDC    277 _T1CC1	=	0xffffdddc
                    FFFFDFDE    278 Fbambam_remote_rx$T1CC2$0$0 == 0xffffdfde
                    FFFFDFDE    279 _T1CC2	=	0xffffdfde
                            280 ;--------------------------------------------------------
                            281 ; special function bits
                            282 ;--------------------------------------------------------
                            283 	.area RSEG    (ABS,DATA)
   0000                     284 	.org 0x0000
                    0080    285 Fbambam_remote_rx$P0_0$0$0 == 0x0080
                    0080    286 _P0_0	=	0x0080
                    0081    287 Fbambam_remote_rx$P0_1$0$0 == 0x0081
                    0081    288 _P0_1	=	0x0081
                    0082    289 Fbambam_remote_rx$P0_2$0$0 == 0x0082
                    0082    290 _P0_2	=	0x0082
                    0083    291 Fbambam_remote_rx$P0_3$0$0 == 0x0083
                    0083    292 _P0_3	=	0x0083
                    0084    293 Fbambam_remote_rx$P0_4$0$0 == 0x0084
                    0084    294 _P0_4	=	0x0084
                    0085    295 Fbambam_remote_rx$P0_5$0$0 == 0x0085
                    0085    296 _P0_5	=	0x0085
                    0086    297 Fbambam_remote_rx$P0_6$0$0 == 0x0086
                    0086    298 _P0_6	=	0x0086
                    0087    299 Fbambam_remote_rx$P0_7$0$0 == 0x0087
                    0087    300 _P0_7	=	0x0087
                    0088    301 Fbambam_remote_rx$_TCON_0$0$0 == 0x0088
                    0088    302 __TCON_0	=	0x0088
                    0089    303 Fbambam_remote_rx$RFTXRXIF$0$0 == 0x0089
                    0089    304 _RFTXRXIF	=	0x0089
                    008A    305 Fbambam_remote_rx$_TCON_2$0$0 == 0x008a
                    008A    306 __TCON_2	=	0x008a
                    008B    307 Fbambam_remote_rx$URX0IF$0$0 == 0x008b
                    008B    308 _URX0IF	=	0x008b
                    008C    309 Fbambam_remote_rx$_TCON_4$0$0 == 0x008c
                    008C    310 __TCON_4	=	0x008c
                    008D    311 Fbambam_remote_rx$ADCIF$0$0 == 0x008d
                    008D    312 _ADCIF	=	0x008d
                    008E    313 Fbambam_remote_rx$_TCON_6$0$0 == 0x008e
                    008E    314 __TCON_6	=	0x008e
                    008F    315 Fbambam_remote_rx$URX1IF$0$0 == 0x008f
                    008F    316 _URX1IF	=	0x008f
                    0090    317 Fbambam_remote_rx$P1_0$0$0 == 0x0090
                    0090    318 _P1_0	=	0x0090
                    0091    319 Fbambam_remote_rx$P1_1$0$0 == 0x0091
                    0091    320 _P1_1	=	0x0091
                    0092    321 Fbambam_remote_rx$P1_2$0$0 == 0x0092
                    0092    322 _P1_2	=	0x0092
                    0093    323 Fbambam_remote_rx$P1_3$0$0 == 0x0093
                    0093    324 _P1_3	=	0x0093
                    0094    325 Fbambam_remote_rx$P1_4$0$0 == 0x0094
                    0094    326 _P1_4	=	0x0094
                    0095    327 Fbambam_remote_rx$P1_5$0$0 == 0x0095
                    0095    328 _P1_5	=	0x0095
                    0096    329 Fbambam_remote_rx$P1_6$0$0 == 0x0096
                    0096    330 _P1_6	=	0x0096
                    0097    331 Fbambam_remote_rx$P1_7$0$0 == 0x0097
                    0097    332 _P1_7	=	0x0097
                    0098    333 Fbambam_remote_rx$ENCIF_0$0$0 == 0x0098
                    0098    334 _ENCIF_0	=	0x0098
                    0099    335 Fbambam_remote_rx$ENCIF_1$0$0 == 0x0099
                    0099    336 _ENCIF_1	=	0x0099
                    009A    337 Fbambam_remote_rx$_SOCON2$0$0 == 0x009a
                    009A    338 __SOCON2	=	0x009a
                    009B    339 Fbambam_remote_rx$_SOCON3$0$0 == 0x009b
                    009B    340 __SOCON3	=	0x009b
                    009C    341 Fbambam_remote_rx$_SOCON4$0$0 == 0x009c
                    009C    342 __SOCON4	=	0x009c
                    009D    343 Fbambam_remote_rx$_SOCON5$0$0 == 0x009d
                    009D    344 __SOCON5	=	0x009d
                    009E    345 Fbambam_remote_rx$_SOCON6$0$0 == 0x009e
                    009E    346 __SOCON6	=	0x009e
                    009F    347 Fbambam_remote_rx$_SOCON7$0$0 == 0x009f
                    009F    348 __SOCON7	=	0x009f
                    00A0    349 Fbambam_remote_rx$P2_0$0$0 == 0x00a0
                    00A0    350 _P2_0	=	0x00a0
                    00A1    351 Fbambam_remote_rx$P2_1$0$0 == 0x00a1
                    00A1    352 _P2_1	=	0x00a1
                    00A2    353 Fbambam_remote_rx$P2_2$0$0 == 0x00a2
                    00A2    354 _P2_2	=	0x00a2
                    00A3    355 Fbambam_remote_rx$P2_3$0$0 == 0x00a3
                    00A3    356 _P2_3	=	0x00a3
                    00A4    357 Fbambam_remote_rx$P2_4$0$0 == 0x00a4
                    00A4    358 _P2_4	=	0x00a4
                    00A5    359 Fbambam_remote_rx$P2_5$0$0 == 0x00a5
                    00A5    360 _P2_5	=	0x00a5
                    00A6    361 Fbambam_remote_rx$P2_6$0$0 == 0x00a6
                    00A6    362 _P2_6	=	0x00a6
                    00A7    363 Fbambam_remote_rx$P2_7$0$0 == 0x00a7
                    00A7    364 _P2_7	=	0x00a7
                    00A8    365 Fbambam_remote_rx$RFTXRXIE$0$0 == 0x00a8
                    00A8    366 _RFTXRXIE	=	0x00a8
                    00A9    367 Fbambam_remote_rx$ADCIE$0$0 == 0x00a9
                    00A9    368 _ADCIE	=	0x00a9
                    00AA    369 Fbambam_remote_rx$URX0IE$0$0 == 0x00aa
                    00AA    370 _URX0IE	=	0x00aa
                    00AB    371 Fbambam_remote_rx$URX1IE$0$0 == 0x00ab
                    00AB    372 _URX1IE	=	0x00ab
                    00AC    373 Fbambam_remote_rx$ENCIE$0$0 == 0x00ac
                    00AC    374 _ENCIE	=	0x00ac
                    00AD    375 Fbambam_remote_rx$STIE$0$0 == 0x00ad
                    00AD    376 _STIE	=	0x00ad
                    00AE    377 Fbambam_remote_rx$_IEN06$0$0 == 0x00ae
                    00AE    378 __IEN06	=	0x00ae
                    00AF    379 Fbambam_remote_rx$EA$0$0 == 0x00af
                    00AF    380 _EA	=	0x00af
                    00B8    381 Fbambam_remote_rx$DMAIE$0$0 == 0x00b8
                    00B8    382 _DMAIE	=	0x00b8
                    00B9    383 Fbambam_remote_rx$T1IE$0$0 == 0x00b9
                    00B9    384 _T1IE	=	0x00b9
                    00BA    385 Fbambam_remote_rx$T2IE$0$0 == 0x00ba
                    00BA    386 _T2IE	=	0x00ba
                    00BB    387 Fbambam_remote_rx$T3IE$0$0 == 0x00bb
                    00BB    388 _T3IE	=	0x00bb
                    00BC    389 Fbambam_remote_rx$T4IE$0$0 == 0x00bc
                    00BC    390 _T4IE	=	0x00bc
                    00BD    391 Fbambam_remote_rx$P0IE$0$0 == 0x00bd
                    00BD    392 _P0IE	=	0x00bd
                    00BE    393 Fbambam_remote_rx$_IEN16$0$0 == 0x00be
                    00BE    394 __IEN16	=	0x00be
                    00BF    395 Fbambam_remote_rx$_IEN17$0$0 == 0x00bf
                    00BF    396 __IEN17	=	0x00bf
                    00C0    397 Fbambam_remote_rx$DMAIF$0$0 == 0x00c0
                    00C0    398 _DMAIF	=	0x00c0
                    00C1    399 Fbambam_remote_rx$T1IF$0$0 == 0x00c1
                    00C1    400 _T1IF	=	0x00c1
                    00C2    401 Fbambam_remote_rx$T2IF$0$0 == 0x00c2
                    00C2    402 _T2IF	=	0x00c2
                    00C3    403 Fbambam_remote_rx$T3IF$0$0 == 0x00c3
                    00C3    404 _T3IF	=	0x00c3
                    00C4    405 Fbambam_remote_rx$T4IF$0$0 == 0x00c4
                    00C4    406 _T4IF	=	0x00c4
                    00C5    407 Fbambam_remote_rx$P0IF$0$0 == 0x00c5
                    00C5    408 _P0IF	=	0x00c5
                    00C6    409 Fbambam_remote_rx$_IRCON6$0$0 == 0x00c6
                    00C6    410 __IRCON6	=	0x00c6
                    00C7    411 Fbambam_remote_rx$STIF$0$0 == 0x00c7
                    00C7    412 _STIF	=	0x00c7
                    00D0    413 Fbambam_remote_rx$P$0$0 == 0x00d0
                    00D0    414 _P	=	0x00d0
                    00D1    415 Fbambam_remote_rx$F1$0$0 == 0x00d1
                    00D1    416 _F1	=	0x00d1
                    00D2    417 Fbambam_remote_rx$OV$0$0 == 0x00d2
                    00D2    418 _OV	=	0x00d2
                    00D3    419 Fbambam_remote_rx$RS0$0$0 == 0x00d3
                    00D3    420 _RS0	=	0x00d3
                    00D4    421 Fbambam_remote_rx$RS1$0$0 == 0x00d4
                    00D4    422 _RS1	=	0x00d4
                    00D5    423 Fbambam_remote_rx$F0$0$0 == 0x00d5
                    00D5    424 _F0	=	0x00d5
                    00D6    425 Fbambam_remote_rx$AC$0$0 == 0x00d6
                    00D6    426 _AC	=	0x00d6
                    00D7    427 Fbambam_remote_rx$CY$0$0 == 0x00d7
                    00D7    428 _CY	=	0x00d7
                    00D8    429 Fbambam_remote_rx$T3OVFIF$0$0 == 0x00d8
                    00D8    430 _T3OVFIF	=	0x00d8
                    00D9    431 Fbambam_remote_rx$T3CH0IF$0$0 == 0x00d9
                    00D9    432 _T3CH0IF	=	0x00d9
                    00DA    433 Fbambam_remote_rx$T3CH1IF$0$0 == 0x00da
                    00DA    434 _T3CH1IF	=	0x00da
                    00DB    435 Fbambam_remote_rx$T4OVFIF$0$0 == 0x00db
                    00DB    436 _T4OVFIF	=	0x00db
                    00DC    437 Fbambam_remote_rx$T4CH0IF$0$0 == 0x00dc
                    00DC    438 _T4CH0IF	=	0x00dc
                    00DD    439 Fbambam_remote_rx$T4CH1IF$0$0 == 0x00dd
                    00DD    440 _T4CH1IF	=	0x00dd
                    00DE    441 Fbambam_remote_rx$OVFIM$0$0 == 0x00de
                    00DE    442 _OVFIM	=	0x00de
                    00DF    443 Fbambam_remote_rx$_TIMIF7$0$0 == 0x00df
                    00DF    444 __TIMIF7	=	0x00df
                    00E0    445 Fbambam_remote_rx$ACC_0$0$0 == 0x00e0
                    00E0    446 _ACC_0	=	0x00e0
                    00E1    447 Fbambam_remote_rx$ACC_1$0$0 == 0x00e1
                    00E1    448 _ACC_1	=	0x00e1
                    00E2    449 Fbambam_remote_rx$ACC_2$0$0 == 0x00e2
                    00E2    450 _ACC_2	=	0x00e2
                    00E3    451 Fbambam_remote_rx$ACC_3$0$0 == 0x00e3
                    00E3    452 _ACC_3	=	0x00e3
                    00E4    453 Fbambam_remote_rx$ACC_4$0$0 == 0x00e4
                    00E4    454 _ACC_4	=	0x00e4
                    00E5    455 Fbambam_remote_rx$ACC_5$0$0 == 0x00e5
                    00E5    456 _ACC_5	=	0x00e5
                    00E6    457 Fbambam_remote_rx$ACC_6$0$0 == 0x00e6
                    00E6    458 _ACC_6	=	0x00e6
                    00E7    459 Fbambam_remote_rx$ACC_7$0$0 == 0x00e7
                    00E7    460 _ACC_7	=	0x00e7
                    00E8    461 Fbambam_remote_rx$P2IF$0$0 == 0x00e8
                    00E8    462 _P2IF	=	0x00e8
                    00E9    463 Fbambam_remote_rx$UTX0IF$0$0 == 0x00e9
                    00E9    464 _UTX0IF	=	0x00e9
                    00EA    465 Fbambam_remote_rx$UTX1IF$0$0 == 0x00ea
                    00EA    466 _UTX1IF	=	0x00ea
                    00EB    467 Fbambam_remote_rx$P1IF$0$0 == 0x00eb
                    00EB    468 _P1IF	=	0x00eb
                    00EC    469 Fbambam_remote_rx$WDTIF$0$0 == 0x00ec
                    00EC    470 _WDTIF	=	0x00ec
                    00ED    471 Fbambam_remote_rx$_IRCON25$0$0 == 0x00ed
                    00ED    472 __IRCON25	=	0x00ed
                    00EE    473 Fbambam_remote_rx$_IRCON26$0$0 == 0x00ee
                    00EE    474 __IRCON26	=	0x00ee
                    00EF    475 Fbambam_remote_rx$_IRCON27$0$0 == 0x00ef
                    00EF    476 __IRCON27	=	0x00ef
                    00F0    477 Fbambam_remote_rx$B_0$0$0 == 0x00f0
                    00F0    478 _B_0	=	0x00f0
                    00F1    479 Fbambam_remote_rx$B_1$0$0 == 0x00f1
                    00F1    480 _B_1	=	0x00f1
                    00F2    481 Fbambam_remote_rx$B_2$0$0 == 0x00f2
                    00F2    482 _B_2	=	0x00f2
                    00F3    483 Fbambam_remote_rx$B_3$0$0 == 0x00f3
                    00F3    484 _B_3	=	0x00f3
                    00F4    485 Fbambam_remote_rx$B_4$0$0 == 0x00f4
                    00F4    486 _B_4	=	0x00f4
                    00F5    487 Fbambam_remote_rx$B_5$0$0 == 0x00f5
                    00F5    488 _B_5	=	0x00f5
                    00F6    489 Fbambam_remote_rx$B_6$0$0 == 0x00f6
                    00F6    490 _B_6	=	0x00f6
                    00F7    491 Fbambam_remote_rx$B_7$0$0 == 0x00f7
                    00F7    492 _B_7	=	0x00f7
                    00F8    493 Fbambam_remote_rx$U1ACTIVE$0$0 == 0x00f8
                    00F8    494 _U1ACTIVE	=	0x00f8
                    00F9    495 Fbambam_remote_rx$U1TX_BYTE$0$0 == 0x00f9
                    00F9    496 _U1TX_BYTE	=	0x00f9
                    00FA    497 Fbambam_remote_rx$U1RX_BYTE$0$0 == 0x00fa
                    00FA    498 _U1RX_BYTE	=	0x00fa
                    00FB    499 Fbambam_remote_rx$U1ERR$0$0 == 0x00fb
                    00FB    500 _U1ERR	=	0x00fb
                    00FC    501 Fbambam_remote_rx$U1FE$0$0 == 0x00fc
                    00FC    502 _U1FE	=	0x00fc
                    00FD    503 Fbambam_remote_rx$U1SLAVE$0$0 == 0x00fd
                    00FD    504 _U1SLAVE	=	0x00fd
                    00FE    505 Fbambam_remote_rx$U1RE$0$0 == 0x00fe
                    00FE    506 _U1RE	=	0x00fe
                    00FF    507 Fbambam_remote_rx$U1MODE$0$0 == 0x00ff
                    00FF    508 _U1MODE	=	0x00ff
                            509 ;--------------------------------------------------------
                            510 ; overlayable register banks
                            511 ;--------------------------------------------------------
                            512 	.area REG_BANK_0	(REL,OVR,DATA)
   0000                     513 	.ds 8
                            514 ;--------------------------------------------------------
                            515 ; internal ram data
                            516 ;--------------------------------------------------------
                            517 	.area DSEG    (DATA)
                    0000    518 Lbambam_remote_rx.radioToUart1Service$sloc0$1$0==.
   0008                     519 _radioToUart1Service_sloc0_1_0:
   0008                     520 	.ds 1
                    0001    521 Lbambam_remote_rx.radioToUart1Service$sloc1$1$0==.
   0009                     522 _radioToUart1Service_sloc1_1_0:
   0009                     523 	.ds 2
                    0003    524 Lbambam_remote_rx.radioToUart1Service$sloc2$1$0==.
   000B                     525 _radioToUart1Service_sloc2_1_0:
   000B                     526 	.ds 2
                    0005    527 Lbambam_remote_rx.radioToUart1Service$sloc3$1$0==.
   000D                     528 _radioToUart1Service_sloc3_1_0:
   000D                     529 	.ds 2
                    0007    530 Lbambam_remote_rx.radioToUart1Service$sloc4$1$0==.
   000F                     531 _radioToUart1Service_sloc4_1_0:
   000F                     532 	.ds 4
                    000B    533 Lbambam_remote_rx.radioToUart1Service$sloc5$1$0==.
   0013                     534 _radioToUart1Service_sloc5_1_0:
   0013                     535 	.ds 2
                    000D    536 Lbambam_remote_rx.radioToUart1Service$sloc6$1$0==.
   0015                     537 _radioToUart1Service_sloc6_1_0:
   0015                     538 	.ds 2
                            539 ;--------------------------------------------------------
                            540 ; overlayable items in internal ram 
                            541 ;--------------------------------------------------------
                            542 	.area OSEG    (OVR,DATA)
                            543 ;--------------------------------------------------------
                            544 ; Stack segment in internal ram 
                            545 ;--------------------------------------------------------
                            546 	.area	SSEG	(DATA)
   0034                     547 __start__stack:
   0034                     548 	.ds	1
                            549 
                            550 ;--------------------------------------------------------
                            551 ; indirectly addressable internal ram data
                            552 ;--------------------------------------------------------
                            553 	.area ISEG    (DATA)
                            554 ;--------------------------------------------------------
                            555 ; absolute internal ram data
                            556 ;--------------------------------------------------------
                            557 	.area IABS    (ABS,DATA)
                            558 	.area IABS    (ABS,DATA)
                            559 ;--------------------------------------------------------
                            560 ; bit data
                            561 ;--------------------------------------------------------
                            562 	.area BSEG    (BIT)
                            563 ;--------------------------------------------------------
                            564 ; paged external ram data
                            565 ;--------------------------------------------------------
                            566 	.area PSEG    (PAG,XDATA)
                    0000    567 Lbambam_remote_rx.radioToUart1Service$rxPacket$1$1==.
   F000                     568 _radioToUart1Service_rxPacket_1_1:
   F000                     569 	.ds 2
                            570 ;--------------------------------------------------------
                            571 ; external ram data
                            572 ;--------------------------------------------------------
                            573 	.area XSEG    (XDATA)
                    DF00    574 Fbambam_remote_rx$SYNC1$0$0 == 0xdf00
                    DF00    575 _SYNC1	=	0xdf00
                    DF01    576 Fbambam_remote_rx$SYNC0$0$0 == 0xdf01
                    DF01    577 _SYNC0	=	0xdf01
                    DF02    578 Fbambam_remote_rx$PKTLEN$0$0 == 0xdf02
                    DF02    579 _PKTLEN	=	0xdf02
                    DF03    580 Fbambam_remote_rx$PKTCTRL1$0$0 == 0xdf03
                    DF03    581 _PKTCTRL1	=	0xdf03
                    DF04    582 Fbambam_remote_rx$PKTCTRL0$0$0 == 0xdf04
                    DF04    583 _PKTCTRL0	=	0xdf04
                    DF05    584 Fbambam_remote_rx$ADDR$0$0 == 0xdf05
                    DF05    585 _ADDR	=	0xdf05
                    DF06    586 Fbambam_remote_rx$CHANNR$0$0 == 0xdf06
                    DF06    587 _CHANNR	=	0xdf06
                    DF07    588 Fbambam_remote_rx$FSCTRL1$0$0 == 0xdf07
                    DF07    589 _FSCTRL1	=	0xdf07
                    DF08    590 Fbambam_remote_rx$FSCTRL0$0$0 == 0xdf08
                    DF08    591 _FSCTRL0	=	0xdf08
                    DF09    592 Fbambam_remote_rx$FREQ2$0$0 == 0xdf09
                    DF09    593 _FREQ2	=	0xdf09
                    DF0A    594 Fbambam_remote_rx$FREQ1$0$0 == 0xdf0a
                    DF0A    595 _FREQ1	=	0xdf0a
                    DF0B    596 Fbambam_remote_rx$FREQ0$0$0 == 0xdf0b
                    DF0B    597 _FREQ0	=	0xdf0b
                    DF0C    598 Fbambam_remote_rx$MDMCFG4$0$0 == 0xdf0c
                    DF0C    599 _MDMCFG4	=	0xdf0c
                    DF0D    600 Fbambam_remote_rx$MDMCFG3$0$0 == 0xdf0d
                    DF0D    601 _MDMCFG3	=	0xdf0d
                    DF0E    602 Fbambam_remote_rx$MDMCFG2$0$0 == 0xdf0e
                    DF0E    603 _MDMCFG2	=	0xdf0e
                    DF0F    604 Fbambam_remote_rx$MDMCFG1$0$0 == 0xdf0f
                    DF0F    605 _MDMCFG1	=	0xdf0f
                    DF10    606 Fbambam_remote_rx$MDMCFG0$0$0 == 0xdf10
                    DF10    607 _MDMCFG0	=	0xdf10
                    DF11    608 Fbambam_remote_rx$DEVIATN$0$0 == 0xdf11
                    DF11    609 _DEVIATN	=	0xdf11
                    DF12    610 Fbambam_remote_rx$MCSM2$0$0 == 0xdf12
                    DF12    611 _MCSM2	=	0xdf12
                    DF13    612 Fbambam_remote_rx$MCSM1$0$0 == 0xdf13
                    DF13    613 _MCSM1	=	0xdf13
                    DF14    614 Fbambam_remote_rx$MCSM0$0$0 == 0xdf14
                    DF14    615 _MCSM0	=	0xdf14
                    DF15    616 Fbambam_remote_rx$FOCCFG$0$0 == 0xdf15
                    DF15    617 _FOCCFG	=	0xdf15
                    DF16    618 Fbambam_remote_rx$BSCFG$0$0 == 0xdf16
                    DF16    619 _BSCFG	=	0xdf16
                    DF17    620 Fbambam_remote_rx$AGCCTRL2$0$0 == 0xdf17
                    DF17    621 _AGCCTRL2	=	0xdf17
                    DF18    622 Fbambam_remote_rx$AGCCTRL1$0$0 == 0xdf18
                    DF18    623 _AGCCTRL1	=	0xdf18
                    DF19    624 Fbambam_remote_rx$AGCCTRL0$0$0 == 0xdf19
                    DF19    625 _AGCCTRL0	=	0xdf19
                    DF1A    626 Fbambam_remote_rx$FREND1$0$0 == 0xdf1a
                    DF1A    627 _FREND1	=	0xdf1a
                    DF1B    628 Fbambam_remote_rx$FREND0$0$0 == 0xdf1b
                    DF1B    629 _FREND0	=	0xdf1b
                    DF1C    630 Fbambam_remote_rx$FSCAL3$0$0 == 0xdf1c
                    DF1C    631 _FSCAL3	=	0xdf1c
                    DF1D    632 Fbambam_remote_rx$FSCAL2$0$0 == 0xdf1d
                    DF1D    633 _FSCAL2	=	0xdf1d
                    DF1E    634 Fbambam_remote_rx$FSCAL1$0$0 == 0xdf1e
                    DF1E    635 _FSCAL1	=	0xdf1e
                    DF1F    636 Fbambam_remote_rx$FSCAL0$0$0 == 0xdf1f
                    DF1F    637 _FSCAL0	=	0xdf1f
                    DF23    638 Fbambam_remote_rx$TEST2$0$0 == 0xdf23
                    DF23    639 _TEST2	=	0xdf23
                    DF24    640 Fbambam_remote_rx$TEST1$0$0 == 0xdf24
                    DF24    641 _TEST1	=	0xdf24
                    DF25    642 Fbambam_remote_rx$TEST0$0$0 == 0xdf25
                    DF25    643 _TEST0	=	0xdf25
                    DF2E    644 Fbambam_remote_rx$PA_TABLE0$0$0 == 0xdf2e
                    DF2E    645 _PA_TABLE0	=	0xdf2e
                    DF2F    646 Fbambam_remote_rx$IOCFG2$0$0 == 0xdf2f
                    DF2F    647 _IOCFG2	=	0xdf2f
                    DF30    648 Fbambam_remote_rx$IOCFG1$0$0 == 0xdf30
                    DF30    649 _IOCFG1	=	0xdf30
                    DF31    650 Fbambam_remote_rx$IOCFG0$0$0 == 0xdf31
                    DF31    651 _IOCFG0	=	0xdf31
                    DF36    652 Fbambam_remote_rx$PARTNUM$0$0 == 0xdf36
                    DF36    653 _PARTNUM	=	0xdf36
                    DF37    654 Fbambam_remote_rx$VERSION$0$0 == 0xdf37
                    DF37    655 _VERSION	=	0xdf37
                    DF38    656 Fbambam_remote_rx$FREQEST$0$0 == 0xdf38
                    DF38    657 _FREQEST	=	0xdf38
                    DF39    658 Fbambam_remote_rx$LQI$0$0 == 0xdf39
                    DF39    659 _LQI	=	0xdf39
                    DF3A    660 Fbambam_remote_rx$RSSI$0$0 == 0xdf3a
                    DF3A    661 _RSSI	=	0xdf3a
                    DF3B    662 Fbambam_remote_rx$MARCSTATE$0$0 == 0xdf3b
                    DF3B    663 _MARCSTATE	=	0xdf3b
                    DF3C    664 Fbambam_remote_rx$PKTSTATUS$0$0 == 0xdf3c
                    DF3C    665 _PKTSTATUS	=	0xdf3c
                    DF3D    666 Fbambam_remote_rx$VCO_VC_DAC$0$0 == 0xdf3d
                    DF3D    667 _VCO_VC_DAC	=	0xdf3d
                    DF40    668 Fbambam_remote_rx$I2SCFG0$0$0 == 0xdf40
                    DF40    669 _I2SCFG0	=	0xdf40
                    DF41    670 Fbambam_remote_rx$I2SCFG1$0$0 == 0xdf41
                    DF41    671 _I2SCFG1	=	0xdf41
                    DF42    672 Fbambam_remote_rx$I2SDATL$0$0 == 0xdf42
                    DF42    673 _I2SDATL	=	0xdf42
                    DF43    674 Fbambam_remote_rx$I2SDATH$0$0 == 0xdf43
                    DF43    675 _I2SDATH	=	0xdf43
                    DF44    676 Fbambam_remote_rx$I2SWCNT$0$0 == 0xdf44
                    DF44    677 _I2SWCNT	=	0xdf44
                    DF45    678 Fbambam_remote_rx$I2SSTAT$0$0 == 0xdf45
                    DF45    679 _I2SSTAT	=	0xdf45
                    DF46    680 Fbambam_remote_rx$I2SCLKF0$0$0 == 0xdf46
                    DF46    681 _I2SCLKF0	=	0xdf46
                    DF47    682 Fbambam_remote_rx$I2SCLKF1$0$0 == 0xdf47
                    DF47    683 _I2SCLKF1	=	0xdf47
                    DF48    684 Fbambam_remote_rx$I2SCLKF2$0$0 == 0xdf48
                    DF48    685 _I2SCLKF2	=	0xdf48
                    DE00    686 Fbambam_remote_rx$USBADDR$0$0 == 0xde00
                    DE00    687 _USBADDR	=	0xde00
                    DE01    688 Fbambam_remote_rx$USBPOW$0$0 == 0xde01
                    DE01    689 _USBPOW	=	0xde01
                    DE02    690 Fbambam_remote_rx$USBIIF$0$0 == 0xde02
                    DE02    691 _USBIIF	=	0xde02
                    DE04    692 Fbambam_remote_rx$USBOIF$0$0 == 0xde04
                    DE04    693 _USBOIF	=	0xde04
                    DE06    694 Fbambam_remote_rx$USBCIF$0$0 == 0xde06
                    DE06    695 _USBCIF	=	0xde06
                    DE07    696 Fbambam_remote_rx$USBIIE$0$0 == 0xde07
                    DE07    697 _USBIIE	=	0xde07
                    DE09    698 Fbambam_remote_rx$USBOIE$0$0 == 0xde09
                    DE09    699 _USBOIE	=	0xde09
                    DE0B    700 Fbambam_remote_rx$USBCIE$0$0 == 0xde0b
                    DE0B    701 _USBCIE	=	0xde0b
                    DE0C    702 Fbambam_remote_rx$USBFRML$0$0 == 0xde0c
                    DE0C    703 _USBFRML	=	0xde0c
                    DE0D    704 Fbambam_remote_rx$USBFRMH$0$0 == 0xde0d
                    DE0D    705 _USBFRMH	=	0xde0d
                    DE0E    706 Fbambam_remote_rx$USBINDEX$0$0 == 0xde0e
                    DE0E    707 _USBINDEX	=	0xde0e
                    DE10    708 Fbambam_remote_rx$USBMAXI$0$0 == 0xde10
                    DE10    709 _USBMAXI	=	0xde10
                    DE11    710 Fbambam_remote_rx$USBCSIL$0$0 == 0xde11
                    DE11    711 _USBCSIL	=	0xde11
                    DE12    712 Fbambam_remote_rx$USBCSIH$0$0 == 0xde12
                    DE12    713 _USBCSIH	=	0xde12
                    DE13    714 Fbambam_remote_rx$USBMAXO$0$0 == 0xde13
                    DE13    715 _USBMAXO	=	0xde13
                    DE14    716 Fbambam_remote_rx$USBCSOL$0$0 == 0xde14
                    DE14    717 _USBCSOL	=	0xde14
                    DE15    718 Fbambam_remote_rx$USBCSOH$0$0 == 0xde15
                    DE15    719 _USBCSOH	=	0xde15
                    DE16    720 Fbambam_remote_rx$USBCNTL$0$0 == 0xde16
                    DE16    721 _USBCNTL	=	0xde16
                    DE17    722 Fbambam_remote_rx$USBCNTH$0$0 == 0xde17
                    DE17    723 _USBCNTH	=	0xde17
                    DE20    724 Fbambam_remote_rx$USBF0$0$0 == 0xde20
                    DE20    725 _USBF0	=	0xde20
                    DE22    726 Fbambam_remote_rx$USBF1$0$0 == 0xde22
                    DE22    727 _USBF1	=	0xde22
                    DE24    728 Fbambam_remote_rx$USBF2$0$0 == 0xde24
                    DE24    729 _USBF2	=	0xde24
                    DE26    730 Fbambam_remote_rx$USBF3$0$0 == 0xde26
                    DE26    731 _USBF3	=	0xde26
                    DE28    732 Fbambam_remote_rx$USBF4$0$0 == 0xde28
                    DE28    733 _USBF4	=	0xde28
                    DE2A    734 Fbambam_remote_rx$USBF5$0$0 == 0xde2a
                    DE2A    735 _USBF5	=	0xde2a
                            736 ;--------------------------------------------------------
                            737 ; absolute external ram data
                            738 ;--------------------------------------------------------
                            739 	.area XABS    (ABS,XDATA)
                            740 ;--------------------------------------------------------
                            741 ; external initialized ram data
                            742 ;--------------------------------------------------------
                            743 	.area XISEG   (XDATA)
                            744 	.area HOME    (CODE)
                            745 	.area GSINIT0 (CODE)
                            746 	.area GSINIT1 (CODE)
                            747 	.area GSINIT2 (CODE)
                            748 	.area GSINIT3 (CODE)
                            749 	.area GSINIT4 (CODE)
                            750 	.area GSINIT5 (CODE)
                            751 	.area GSINIT  (CODE)
                            752 	.area GSFINAL (CODE)
                            753 	.area CSEG    (CODE)
                            754 ;--------------------------------------------------------
                            755 ; interrupt vector 
                            756 ;--------------------------------------------------------
                            757 	.area HOME    (CODE)
   0400                     758 __interrupt_vect:
   0400 02 04 8D            759 	ljmp	__sdcc_gsinit_startup
   0403 32                  760 	reti
   0404                     761 	.ds	7
   040B 32                  762 	reti
   040C                     763 	.ds	7
   0413 32                  764 	reti
   0414                     765 	.ds	7
   041B 02 09 05            766 	ljmp	_ISR_URX1
   041E                     767 	.ds	5
   0423 32                  768 	reti
   0424                     769 	.ds	7
   042B 32                  770 	reti
   042C                     771 	.ds	7
   0433 32                  772 	reti
   0434                     773 	.ds	7
   043B 32                  774 	reti
   043C                     775 	.ds	7
   0443 32                  776 	reti
   0444                     777 	.ds	7
   044B 32                  778 	reti
   044C                     779 	.ds	7
   0453 32                  780 	reti
   0454                     781 	.ds	7
   045B 32                  782 	reti
   045C                     783 	.ds	7
   0463 02 12 CD            784 	ljmp	_ISR_T4
   0466                     785 	.ds	5
   046B 32                  786 	reti
   046C                     787 	.ds	7
   0473 02 08 C7            788 	ljmp	_ISR_UTX1
   0476                     789 	.ds	5
   047B 32                  790 	reti
   047C                     791 	.ds	7
   0483 02 09 75            792 	ljmp	_ISR_RF
                            793 ;--------------------------------------------------------
                            794 ; global & static initialisations
                            795 ;--------------------------------------------------------
                            796 	.area HOME    (CODE)
                            797 	.area GSINIT  (CODE)
                            798 	.area GSFINAL (CODE)
                            799 	.area GSINIT  (CODE)
                            800 	.globl __sdcc_gsinit_startup
                            801 	.globl __sdcc_program_startup
                            802 	.globl __start__stack
                            803 	.globl __mcs51_genXINIT
                            804 	.globl __mcs51_genXRAMCLEAR
                            805 	.globl __mcs51_genRAMCLEAR
                            806 	.area GSFINAL (CODE)
   0525 02 04 86            807 	ljmp	__sdcc_program_startup
                            808 ;--------------------------------------------------------
                            809 ; Home
                            810 ;--------------------------------------------------------
                            811 	.area HOME    (CODE)
                            812 	.area HOME    (CODE)
   0486                     813 __sdcc_program_startup:
   0486 12 06 D9            814 	lcall	_main
                            815 ;	return from main will lock up
   0489 80 FE               816 	sjmp .
                            817 ;--------------------------------------------------------
                            818 ; code
                            819 ;--------------------------------------------------------
                            820 	.area CSEG    (CODE)
                            821 ;------------------------------------------------------------
                            822 ;Allocation info for local variables in function 'updateLeds'
                            823 ;------------------------------------------------------------
                    0000    824 	G$updateLeds$0$0 ==.
                    0000    825 	C$bambam_remote_rx.c$42$0$0 ==.
                            826 ;	apps/bambam_remote_rx/bambam_remote_rx.c:42: void updateLeds()
                            827 ;	-----------------------------------------
                            828 ;	 function updateLeds
                            829 ;	-----------------------------------------
   0528                     830 _updateLeds:
                    0007    831 	ar7 = 0x07
                    0006    832 	ar6 = 0x06
                    0005    833 	ar5 = 0x05
                    0004    834 	ar4 = 0x04
                    0003    835 	ar3 = 0x03
                    0002    836 	ar2 = 0x02
                    0001    837 	ar1 = 0x01
                    0000    838 	ar0 = 0x00
                    0000    839 	C$bambam_remote_rx.c$44$2$2 ==.
                            840 ;	apps/bambam_remote_rx/bambam_remote_rx.c:44: LED_GREEN_TOGGLE();					//Die gruene LED blinkt bei Daten
   0528 63 FF 10            841 	xrl	_P2DIR,#0x10
                    0003    842 	C$bambam_remote_rx.c$45$2$3 ==.
                            843 ;	apps/bambam_remote_rx/bambam_remote_rx.c:45: LED_YELLOW(ACM_CONTROL_LINE_DTR);	//Funktioniert nicht so wie gedacht
   052B 43 FF 04            844 	orl	_P2DIR,#0x04
                    0006    845 	C$bambam_remote_rx.c$46$2$4 ==.
                            846 ;	apps/bambam_remote_rx/bambam_remote_rx.c:46: LED_RED(0);							//Ist einfach aus
   052E AF FF               847 	mov	r7,_P2DIR
   0530 53 07 FD            848 	anl	ar7,#0xFD
   0533 8F FF               849 	mov	_P2DIR,r7
                    000D    850 	C$bambam_remote_rx.c$47$2$4 ==.
                    000D    851 	XG$updateLeds$0$0 ==.
   0535 22                  852 	ret
                            853 ;------------------------------------------------------------
                            854 ;Allocation info for local variables in function 'putchar'
                            855 ;------------------------------------------------------------
                    000E    856 	G$putchar$0$0 ==.
                    000E    857 	C$bambam_remote_rx.c$49$2$4 ==.
                            858 ;	apps/bambam_remote_rx/bambam_remote_rx.c:49: void putchar(char c)
                            859 ;	-----------------------------------------
                            860 ;	 function putchar
                            861 ;	-----------------------------------------
   0536                     862 _putchar:
                    000E    863 	C$bambam_remote_rx.c$51$1$1 ==.
                            864 ;	apps/bambam_remote_rx/bambam_remote_rx.c:51: uart1TxSendByte(c);					//Routine für die Ausgabe einzelner char
   0536 12 08 90            865 	lcall	_uart1TxSendByte
                    0011    866 	C$bambam_remote_rx.c$52$1$1 ==.
                    0011    867 	XG$putchar$0$0 ==.
   0539 22                  868 	ret
                            869 ;------------------------------------------------------------
                            870 ;Allocation info for local variables in function 'radioToUart1Service'
                            871 ;------------------------------------------------------------
                            872 ;sloc0                     Allocated with name '_radioToUart1Service_sloc0_1_0'
                            873 ;sloc1                     Allocated with name '_radioToUart1Service_sloc1_1_0'
                            874 ;sloc2                     Allocated with name '_radioToUart1Service_sloc2_1_0'
                            875 ;sloc3                     Allocated with name '_radioToUart1Service_sloc3_1_0'
                            876 ;sloc4                     Allocated with name '_radioToUart1Service_sloc4_1_0'
                            877 ;sloc5                     Allocated with name '_radioToUart1Service_sloc5_1_0'
                            878 ;sloc6                     Allocated with name '_radioToUart1Service_sloc6_1_0'
                            879 ;------------------------------------------------------------
                    0012    880 	G$radioToUart1Service$0$0 ==.
                    0012    881 	C$bambam_remote_rx.c$54$1$1 ==.
                            882 ;	apps/bambam_remote_rx/bambam_remote_rx.c:54: void radioToUart1Service()
                            883 ;	-----------------------------------------
                            884 ;	 function radioToUart1Service
                            885 ;	-----------------------------------------
   053A                     886 _radioToUart1Service:
                    0012    887 	C$bambam_remote_rx.c$60$1$1 ==.
                            888 ;	apps/bambam_remote_rx/bambam_remote_rx.c:60: if ((rxPacket = (adcReport XDATA *)radioQueueRxCurrentPacket()) && uart1TxAvailable() >= 64)
   053A 12 0C 70            889 	lcall	_radioQueueRxCurrentPacket
   053D AE 82               890 	mov	r6,dpl
   053F AF 83               891 	mov	r7,dph
   0541 78 00               892 	mov	r0,#_radioToUart1Service_rxPacket_1_1
   0543 EE                  893 	mov	a,r6
   0544 F2                  894 	movx	@r0,a
   0545 08                  895 	inc	r0
   0546 EF                  896 	mov	a,r7
   0547 F2                  897 	movx	@r0,a
   0548 EE                  898 	mov	a,r6
   0549 4F                  899 	orl	a,r7
   054A 70 03               900 	jnz	00118$
   054C 02 06 C1            901 	ljmp	00108$
   054F                     902 00118$:
   054F 12 08 55            903 	lcall	_uart1TxAvailable
   0552 AF 82               904 	mov	r7,dpl
   0554 BF 40 00            905 	cjne	r7,#0x40,00119$
   0557                     906 00119$:
   0557 50 03               907 	jnc	00120$
   0559 02 06 C1            908 	ljmp	00108$
   055C                     909 00120$:
                    0034    910 	C$bambam_remote_rx.c$76$2$2 ==.
                            911 ;	apps/bambam_remote_rx/bambam_remote_rx.c:76: rxPacket->quality & 0x7F 	// LQI Bitfehlerrate
   055C 78 00               912 	mov	r0,#_radioToUart1Service_rxPacket_1_1
   055E E2                  913 	movx	a,@r0
   055F 24 12               914 	add	a,#0x12
   0561 FE                  915 	mov	r6,a
   0562 08                  916 	inc	r0
   0563 E2                  917 	movx	a,@r0
   0564 34 00               918 	addc	a,#0x00
   0566 FF                  919 	mov	r7,a
   0567 8E 82               920 	mov	dpl,r6
   0569 8F 83               921 	mov	dph,r7
   056B E0                  922 	movx	a,@dptr
   056C FB                  923 	mov	r3,a
   056D 53 03 7F            924 	anl	ar3,#0x7F
   0570 8B 0D               925 	mov	_radioToUart1Service_sloc3_1_0,r3
   0572 75 0E 00            926 	mov	(_radioToUart1Service_sloc3_1_0 + 1),#0x00
                    004D    927 	C$bambam_remote_rx.c$75$2$2 ==.
                            928 ;	apps/bambam_remote_rx/bambam_remote_rx.c:75: rxPacket->rssi/2 - 71,   	// RSSI dBm
   0575 78 00               929 	mov	r0,#_radioToUart1Service_rxPacket_1_1
   0577 E2                  930 	movx	a,@r0
   0578 24 11               931 	add	a,#0x11
   057A F5 82               932 	mov	dpl,a
   057C 08                  933 	inc	r0
   057D E2                  934 	movx	a,@r0
   057E 34 00               935 	addc	a,#0x00
   0580 F5 83               936 	mov	dph,a
   0582 E0                  937 	movx	a,@dptr
   0583 F5 08               938 	mov	_radioToUart1Service_sloc0_1_0,a
   0585 C2 D5               939 	clr	F0
   0587 75 F0 02            940 	mov	b,#0x02
   058A E5 08               941 	mov	a,_radioToUart1Service_sloc0_1_0
   058C 30 E7 04            942 	jnb	acc.7,00121$
   058F B2 D5               943 	cpl	F0
   0591 F4                  944 	cpl	a
   0592 04                  945 	inc	a
   0593                     946 00121$:
   0593 84                  947 	div	ab
   0594 30 D5 02            948 	jnb	F0,00122$
   0597 F4                  949 	cpl	a
   0598 04                  950 	inc	a
   0599                     951 00122$:
   0599 C0 E0               952 	push	acc
   059B A2 D5               953 	mov	c,F0
   059D 95 E0               954 	subb	a,acc
   059F F5 F0               955 	mov	b,a
   05A1 D0 E0               956 	pop	acc
   05A3 24 B9               957 	add	a,#0xB9
   05A5 F5 09               958 	mov	_radioToUart1Service_sloc1_1_0,a
   05A7 E5 F0               959 	mov	a,b
   05A9 34 FF               960 	addc	a,#0xFF
   05AB F5 0A               961 	mov	(_radioToUart1Service_sloc1_1_0 + 1),a
                    0085    962 	C$bambam_remote_rx.c$74$2$2 ==.
                            963 ;	apps/bambam_remote_rx/bambam_remote_rx.c:74: rxPacket->length,			// Wie viele Pakete wurden empfangen
   05AD 78 00               964 	mov	r0,#_radioToUart1Service_rxPacket_1_1
   05AF E2                  965 	movx	a,@r0
   05B0 F5 82               966 	mov	dpl,a
   05B2 08                  967 	inc	r0
   05B3 E2                  968 	movx	a,@r0
   05B4 F5 83               969 	mov	dph,a
   05B6 E0                  970 	movx	a,@dptr
   05B7 FD                  971 	mov	r5,a
   05B8 8D 0B               972 	mov	_radioToUart1Service_sloc2_1_0,r5
   05BA 75 0C 00            973 	mov	(_radioToUart1Service_sloc2_1_0 + 1),#0x00
                    0095    974 	C$bambam_remote_rx.c$73$2$2 ==.
                            975 ;	apps/bambam_remote_rx/bambam_remote_rx.c:73: getMs(),						// Millisekunden 32bit
   05BD C0 07               976 	push	ar7
   05BF C0 06               977 	push	ar6
   05C1 12 12 F2            978 	lcall	_getMs
   05C4 85 82 0F            979 	mov	_radioToUart1Service_sloc4_1_0,dpl
   05C7 85 83 10            980 	mov	(_radioToUart1Service_sloc4_1_0 + 1),dph
   05CA 85 F0 11            981 	mov	(_radioToUart1Service_sloc4_1_0 + 2),b
   05CD F5 12               982 	mov	(_radioToUart1Service_sloc4_1_0 + 3),a
                    00A7    983 	C$bambam_remote_rx.c$72$2$2 ==.
                            984 ;	apps/bambam_remote_rx/bambam_remote_rx.c:72: rxPacket->serialNumber[0],
   05CF 78 00               985 	mov	r0,#_radioToUart1Service_rxPacket_1_1
   05D1 E2                  986 	movx	a,@r0
   05D2 24 01               987 	add	a,#0x01
   05D4 F5 82               988 	mov	dpl,a
   05D6 08                  989 	inc	r0
   05D7 E2                  990 	movx	a,@r0
   05D8 34 00               991 	addc	a,#0x00
   05DA F5 83               992 	mov	dph,a
   05DC E0                  993 	movx	a,@dptr
   05DD FD                  994 	mov	r5,a
   05DE 7C 00               995 	mov	r4,#0x00
                    00B8    996 	C$bambam_remote_rx.c$71$2$2 ==.
                            997 ;	apps/bambam_remote_rx/bambam_remote_rx.c:71: rxPacket->serialNumber[1],
   05E0 78 00               998 	mov	r0,#_radioToUart1Service_rxPacket_1_1
   05E2 E2                  999 	movx	a,@r0
   05E3 24 02              1000 	add	a,#0x02
   05E5 F5 82              1001 	mov	dpl,a
   05E7 08                 1002 	inc	r0
   05E8 E2                 1003 	movx	a,@r0
   05E9 34 00              1004 	addc	a,#0x00
   05EB F5 83              1005 	mov	dph,a
   05ED E0                 1006 	movx	a,@dptr
   05EE FB                 1007 	mov	r3,a
   05EF 8B 13              1008 	mov	_radioToUart1Service_sloc5_1_0,r3
   05F1 75 14 00           1009 	mov	(_radioToUart1Service_sloc5_1_0 + 1),#0x00
                    00CC   1010 	C$bambam_remote_rx.c$70$2$2 ==.
                           1011 ;	apps/bambam_remote_rx/bambam_remote_rx.c:70: rxPacket->serialNumber[2],
   05F4 78 00              1012 	mov	r0,#_radioToUart1Service_rxPacket_1_1
   05F6 E2                 1013 	movx	a,@r0
   05F7 24 03              1014 	add	a,#0x03
   05F9 F5 82              1015 	mov	dpl,a
   05FB 08                 1016 	inc	r0
   05FC E2                 1017 	movx	a,@r0
   05FD 34 00              1018 	addc	a,#0x00
   05FF F5 83              1019 	mov	dph,a
   0601 E0                 1020 	movx	a,@dptr
   0602 FB                 1021 	mov	r3,a
   0603 8B 15              1022 	mov	_radioToUart1Service_sloc6_1_0,r3
   0605 75 16 00           1023 	mov	(_radioToUart1Service_sloc6_1_0 + 1),#0x00
                    00E0   1024 	C$bambam_remote_rx.c$69$2$2 ==.
                           1025 ;	apps/bambam_remote_rx/bambam_remote_rx.c:69: rxPacket->serialNumber[3],	//Ausgabe der Sender Seriennummer
   0608 78 00              1026 	mov	r0,#_radioToUart1Service_rxPacket_1_1
   060A E2                 1027 	movx	a,@r0
   060B 24 04              1028 	add	a,#0x04
   060D F5 82              1029 	mov	dpl,a
   060F 08                 1030 	inc	r0
   0610 E2                 1031 	movx	a,@r0
   0611 34 00              1032 	addc	a,#0x00
   0613 F5 83              1033 	mov	dph,a
   0615 E0                 1034 	movx	a,@dptr
   0616 FB                 1035 	mov	r3,a
   0617 7A 00              1036 	mov	r2,#0x00
                    00F1   1037 	C$bambam_remote_rx.c$68$2$2 ==.
                           1038 ;	apps/bambam_remote_rx/bambam_remote_rx.c:68: printf("%02X-%02X-%02X-%02X,%12lu,%4d,%4d,%4d, ",
   0619 C0 0D              1039 	push	_radioToUart1Service_sloc3_1_0
   061B C0 0E              1040 	push	(_radioToUart1Service_sloc3_1_0 + 1)
   061D C0 09              1041 	push	_radioToUart1Service_sloc1_1_0
   061F C0 0A              1042 	push	(_radioToUart1Service_sloc1_1_0 + 1)
   0621 C0 0B              1043 	push	_radioToUart1Service_sloc2_1_0
   0623 C0 0C              1044 	push	(_radioToUart1Service_sloc2_1_0 + 1)
   0625 C0 0F              1045 	push	_radioToUart1Service_sloc4_1_0
   0627 C0 10              1046 	push	(_radioToUart1Service_sloc4_1_0 + 1)
   0629 C0 11              1047 	push	(_radioToUart1Service_sloc4_1_0 + 2)
   062B C0 12              1048 	push	(_radioToUart1Service_sloc4_1_0 + 3)
   062D C0 05              1049 	push	ar5
   062F C0 04              1050 	push	ar4
   0631 C0 13              1051 	push	_radioToUart1Service_sloc5_1_0
   0633 C0 14              1052 	push	(_radioToUart1Service_sloc5_1_0 + 1)
   0635 C0 15              1053 	push	_radioToUart1Service_sloc6_1_0
   0637 C0 16              1054 	push	(_radioToUart1Service_sloc6_1_0 + 1)
   0639 C0 03              1055 	push	ar3
   063B C0 02              1056 	push	ar2
   063D 74 61              1057 	mov	a,#__str_0
   063F C0 E0              1058 	push	acc
   0641 74 22              1059 	mov	a,#(__str_0 >> 8)
   0643 C0 E0              1060 	push	acc
   0645 74 80              1061 	mov	a,#0x80
   0647 C0 E0              1062 	push	acc
   0649 12 1A BF           1063 	lcall	_printf
   064C E5 81              1064 	mov	a,sp
   064E 24 EB              1065 	add	a,#0xeb
   0650 F5 81              1066 	mov	sp,a
   0652 D0 06              1067 	pop	ar6
   0654 D0 07              1068 	pop	ar7
                    012E   1069 	C$bambam_remote_rx.c$81$2$2 ==.
                           1070 ;	apps/bambam_remote_rx/bambam_remote_rx.c:81: putchar((rxPacket->quality & 0x80) ? '1' : '0');
   0656 8E 82              1071 	mov	dpl,r6
   0658 8F 83              1072 	mov	dph,r7
   065A E0                 1073 	movx	a,@dptr
   065B FE                 1074 	mov	r6,a
   065C 30 E7 04           1075 	jnb	acc.7,00110$
   065F 7F 31              1076 	mov	r7,#0x31
   0661 80 02              1077 	sjmp	00111$
   0663                    1078 00110$:
   0663 7F 30              1079 	mov	r7,#0x30
   0665                    1080 00111$:
   0665 8F 82              1081 	mov	dpl,r7
   0667 12 05 36           1082 	lcall	_putchar
                    0142   1083 	C$bambam_remote_rx.c$84$3$3 ==.
                           1084 ;	apps/bambam_remote_rx/bambam_remote_rx.c:84: for(i = 0; i < 6; i++)
   066A 78 00              1085 	mov	r0,#_radioToUart1Service_rxPacket_1_1
   066C E2                 1086 	movx	a,@r0
   066D 24 05              1087 	add	a,#0x05
   066F FE                 1088 	mov	r6,a
   0670 08                 1089 	inc	r0
   0671 E2                 1090 	movx	a,@r0
   0672 34 00              1091 	addc	a,#0x00
   0674 FF                 1092 	mov	r7,a
   0675 7D 00              1093 	mov	r5,#0x00
   0677                    1094 00104$:
   0677 BD 06 00           1095 	cjne	r5,#0x06,00124$
   067A                    1096 00124$:
   067A 50 36              1097 	jnc	00107$
                    0154   1098 	C$bambam_remote_rx.c$86$3$3 ==.
                           1099 ;	apps/bambam_remote_rx/bambam_remote_rx.c:86: printf(",%5u", rxPacket->readings[i]);
   067C ED                 1100 	mov	a,r5
   067D 2D                 1101 	add	a,r5
   067E 2E                 1102 	add	a,r6
   067F F5 82              1103 	mov	dpl,a
   0681 E4                 1104 	clr	a
   0682 3F                 1105 	addc	a,r7
   0683 F5 83              1106 	mov	dph,a
   0685 E0                 1107 	movx	a,@dptr
   0686 FB                 1108 	mov	r3,a
   0687 A3                 1109 	inc	dptr
   0688 E0                 1110 	movx	a,@dptr
   0689 FC                 1111 	mov	r4,a
   068A C0 07              1112 	push	ar7
   068C C0 06              1113 	push	ar6
   068E C0 05              1114 	push	ar5
   0690 C0 03              1115 	push	ar3
   0692 C0 04              1116 	push	ar4
   0694 74 89              1117 	mov	a,#__str_1
   0696 C0 E0              1118 	push	acc
   0698 74 22              1119 	mov	a,#(__str_1 >> 8)
   069A C0 E0              1120 	push	acc
   069C 74 80              1121 	mov	a,#0x80
   069E C0 E0              1122 	push	acc
   06A0 12 1A BF           1123 	lcall	_printf
   06A3 E5 81              1124 	mov	a,sp
   06A5 24 FB              1125 	add	a,#0xfb
   06A7 F5 81              1126 	mov	sp,a
   06A9 D0 05              1127 	pop	ar5
   06AB D0 06              1128 	pop	ar6
   06AD D0 07              1129 	pop	ar7
                    0187   1130 	C$bambam_remote_rx.c$84$2$2 ==.
                           1131 ;	apps/bambam_remote_rx/bambam_remote_rx.c:84: for(i = 0; i < 6; i++)
   06AF 0D                 1132 	inc	r5
   06B0 80 C5              1133 	sjmp	00104$
   06B2                    1134 00107$:
                    018A   1135 	C$bambam_remote_rx.c$90$2$2 ==.
                           1136 ;	apps/bambam_remote_rx/bambam_remote_rx.c:90: putchar('\r');
   06B2 75 82 0D           1137 	mov	dpl,#0x0D
   06B5 12 05 36           1138 	lcall	_putchar
                    0190   1139 	C$bambam_remote_rx.c$91$2$2 ==.
                           1140 ;	apps/bambam_remote_rx/bambam_remote_rx.c:91: putchar('\n');
   06B8 75 82 0A           1141 	mov	dpl,#0x0A
   06BB 12 05 36           1142 	lcall	_putchar
                    0196   1143 	C$bambam_remote_rx.c$93$2$2 ==.
                           1144 ;	apps/bambam_remote_rx/bambam_remote_rx.c:93: radioQueueRxDoneWithPacket();
   06BE 12 0C 8B           1145 	lcall	_radioQueueRxDoneWithPacket
   06C1                    1146 00108$:
                    0199   1147 	C$bambam_remote_rx.c$95$2$1 ==.
                    0199   1148 	XG$radioToUart1Service$0$0 ==.
   06C1 22                 1149 	ret
                           1150 ;------------------------------------------------------------
                           1151 ;Allocation info for local variables in function 'lineCodingChanged'
                           1152 ;------------------------------------------------------------
                    019A   1153 	G$lineCodingChanged$0$0 ==.
                    019A   1154 	C$bambam_remote_rx.c$97$2$1 ==.
                           1155 ;	apps/bambam_remote_rx/bambam_remote_rx.c:97: void lineCodingChanged()
                           1156 ;	-----------------------------------------
                           1157 ;	 function lineCodingChanged
                           1158 ;	-----------------------------------------
   06C2                    1159 _lineCodingChanged:
                    019A   1160 	C$bambam_remote_rx.c$99$1$1 ==.
                           1161 ;	apps/bambam_remote_rx/bambam_remote_rx.c:99: uart1SetBaudRate(230400); 	//Baudrate setzen
   06C2 90 84 00           1162 	mov	dptr,#0x8400
   06C5 75 F0 03           1163 	mov	b,#0x03
   06C8 E4                 1164 	clr	a
   06C9 12 07 2A           1165 	lcall	_uart1SetBaudRate
                    01A4   1166 	C$bambam_remote_rx.c$100$1$1 ==.
                           1167 ;	apps/bambam_remote_rx/bambam_remote_rx.c:100: uart1SetParity(0);			//kein Parity
   06CC 75 82 00           1168 	mov	dpl,#0x00
   06CF 12 08 15           1169 	lcall	_uart1SetParity
                    01AA   1170 	C$bambam_remote_rx.c$101$1$1 ==.
                           1171 ;	apps/bambam_remote_rx/bambam_remote_rx.c:101: uart1SetStopBits(0);		//keine Stopbits
   06D2 75 82 00           1172 	mov	dpl,#0x00
   06D5 12 08 43           1173 	lcall	_uart1SetStopBits
                    01B0   1174 	C$bambam_remote_rx.c$102$1$1 ==.
                    01B0   1175 	XG$lineCodingChanged$0$0 ==.
   06D8 22                 1176 	ret
                           1177 ;------------------------------------------------------------
                           1178 ;Allocation info for local variables in function 'main'
                           1179 ;------------------------------------------------------------
                    01B1   1180 	G$main$0$0 ==.
                    01B1   1181 	C$bambam_remote_rx.c$104$1$1 ==.
                           1182 ;	apps/bambam_remote_rx/bambam_remote_rx.c:104: void main(void)
                           1183 ;	-----------------------------------------
                           1184 ;	 function main
                           1185 ;	-----------------------------------------
   06D9                    1186 _main:
                    01B1   1187 	C$bambam_remote_rx.c$106$1$1 ==.
                           1188 ;	apps/bambam_remote_rx/bambam_remote_rx.c:106: systemInit();
   06D9 12 0D BF           1189 	lcall	_systemInit
                    01B4   1190 	C$bambam_remote_rx.c$108$1$1 ==.
                           1191 ;	apps/bambam_remote_rx/bambam_remote_rx.c:108: radioQueueInit();				//Empfaenger initialisieren
   06DC 12 0B FE           1192 	lcall	_radioQueueInit
                    01B7   1193 	C$bambam_remote_rx.c$109$1$1 ==.
                           1194 ;	apps/bambam_remote_rx/bambam_remote_rx.c:109: radioQueueAllowCrcErrors = 1;	//Fehlerhafte Pakete zulassen
   06DF D2 07              1195 	setb	_radioQueueAllowCrcErrors
                    01B9   1196 	C$bambam_remote_rx.c$111$1$1 ==.
                           1197 ;	apps/bambam_remote_rx/bambam_remote_rx.c:111: uart1Init();					//Serielle Schnittstelle initialisieren
   06E1 12 06 F6           1198 	lcall	_uart1Init
                    01BC   1199 	C$bambam_remote_rx.c$112$1$1 ==.
                           1200 ;	apps/bambam_remote_rx/bambam_remote_rx.c:112: lineCodingChanged();			//Einstellen der Schnittstellen Eigenschaft
   06E4 12 06 C2           1201 	lcall	_lineCodingChanged
                    01BF   1202 	C$bambam_remote_rx.c$114$1$1 ==.
                           1203 ;	apps/bambam_remote_rx/bambam_remote_rx.c:114: while(1)
   06E7                    1204 00102$:
                    01BF   1205 	C$bambam_remote_rx.c$116$2$2 ==.
                           1206 ;	apps/bambam_remote_rx/bambam_remote_rx.c:116: updateLeds();				//Status der LEDs veraendern
   06E7 12 05 28           1207 	lcall	_updateLeds
                    01C2   1208 	C$bambam_remote_rx.c$117$2$2 ==.
                           1209 ;	apps/bambam_remote_rx/bambam_remote_rx.c:117: boardService();
   06EA 12 0D CC           1210 	lcall	_boardService
                    01C5   1211 	C$bambam_remote_rx.c$118$2$2 ==.
                           1212 ;	apps/bambam_remote_rx/bambam_remote_rx.c:118: usbComService();
   06ED 12 0F F0           1213 	lcall	_usbComService
                    01C8   1214 	C$bambam_remote_rx.c$119$2$2 ==.
                           1215 ;	apps/bambam_remote_rx/bambam_remote_rx.c:119: radioToUart1Service();		//Empfangen der Daten
   06F0 12 05 3A           1216 	lcall	_radioToUart1Service
   06F3 80 F2              1217 	sjmp	00102$
                    01CD   1218 	C$bambam_remote_rx.c$121$1$1 ==.
                    01CD   1219 	XG$main$0$0 ==.
   06F5 22                 1220 	ret
                           1221 	.area CSEG    (CODE)
                           1222 	.area CONST   (CODE)
                    0000   1223 Fbambam_remote_rx$_str_0$0$0 == .
   2261                    1224 __str_0:
   2261 25 30 32 58 2D 25  1225 	.ascii "%02X-%02X-%02X-%02X,%12lu,%4d,%4d,%4d, "
        30 32 58 2D 25 30
        32 58 2D 25 30 32
        58 2C 25 31 32 6C
        75 2C 25 34 64 2C
        25 34 64 2C 25 34
        64 2C 20
   2288 00                 1226 	.db 0x00
                    0028   1227 Fbambam_remote_rx$_str_1$0$0 == .
   2289                    1228 __str_1:
   2289 2C 25 35 75        1229 	.ascii ",%5u"
   228D 00                 1230 	.db 0x00
                           1231 	.area XINIT   (CODE)
                           1232 	.area CABS    (ABS,CODE)
