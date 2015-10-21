/***********************************************************************************************************************
 * DISCLAIMER
 * This software is supplied by Renesas Electronics Corporation and is only
 * intended for use with Renesas products. No other uses are authorized. This
 * software is owned by Renesas Electronics Corporation and is protected under
 * all applicable laws, including copyright laws.
 * THIS SOFTWARE IS PROVIDED "AS IS" AND RENESAS MAKES NO WARRANTIES REGARDING
 * THIS SOFTWARE, WHETHER EXPRESS, IMPLIED OR STATUTORY, INCLUDING BUT NOT
 * LIMITED TO WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE
 * AND NON-INFRINGEMENT.  ALL SUCH WARRANTIES ARE EXPRESSLY DISCLAIMED.
 * TO THE MAXIMUM EXTENT PERMITTED NOT PROHIBITED BY LAW, NEITHER RENESAS
 * ELECTRONICS CORPORATION NOR ANY OF ITS AFFILIATED COMPANIES SHALL BE LIABLE
 * FOR ANY DIRECT, INDIRECT, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES FOR
 * ANY REASON RELATED TO THIS SOFTWARE, EVEN IF RENESAS OR ITS AFFILIATES HAVE
 * BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.
 * Renesas reserves the right, without notice, to make changes to this software
 * and to discontinue the availability of this software.  By using this software,
 * you agree to the additional terms and conditions found by accessing the
 * following link:
 * http://www.renesas.com/disclaimer
 *
 * Copyright (C) 2011, 2014 Renesas Electronics Corporation. All rights reserved.
 ***********************************************************************************************************************/

/***********************************************************************************************************************
 * File Name    : r_main.c
 * Version      : CodeGenerator for RL78/G13 V2.02.00.02 [11 Feb 2014]
 * Device(s)    : R5F100LE
 * Tool-Chain   : GCCRL78
 * Description  : This file implements main function.
 * Creation Date: 2014/10/03
 ***********************************************************************************************************************/

/***********************************************************************************************************************
Includes
 ***********************************************************************************************************************/
#include "r_cg_macrodriver.h"
#include "r_cg_cgc.h"
#include "r_cg_port.h"
#include "r_cg_serial.h"
/* Start user code for include. Do not edit comment generated here */
/* End user code. Do not edit comment generated here */
#include "r_cg_userdefine.h"

/***********************************************************************************************************************
Global variables and functions
 ***********************************************************************************************************************/
/* Start user code for global. Do not edit comment generated here */

uint8_t uart2RxBuf[RX_BUF_LEN];
uint16_t uart2RxCnt;
uint8_t uart2RxFlag;
uint8_t uart2TxBuf[TX_BUF_LEN];
uint16_t uart2TxCnt;
uint8_t uart2TxFlag;
uint8_t	uart2RxErrFlag;	// UART2 Receive Error Flag
uint8_t uart2RxOvrFlag;	// UART2 Receive Overrun Flag
MD_STATUS uart2Status;

/* End user code. Do not edit comment generated here */
void R_MAIN_UserInit(void);
void sendHello();

static int sendHelloFlag = 0;
void sendHello()
{
	uart2TxBuf[0] = 'H';
	uart2TxBuf[1] = 'e';
	uart2TxBuf[2] = 'l';
	uart2TxBuf[3] = 'l';
	uart2TxBuf[4] = 'o';

	return;
}
/***********************************************************************************************************************
 * Function Name: main
 * Description  : This function implements main function.
 * Arguments    : None
 * Return Value : None
 ***********************************************************************************************************************/
void main(void)
{
	R_MAIN_UserInit();
	/* Start user code. Do not edit comment generated here */

	//Create and initialize the UART
	R_UART2_Create();
	R_UART2_Start();
	uart2Status = R_UART2_Receive(&uart2RxBuf[0],1);	// Prime UART2 Rx

	while (1U)
	{
		sendHelloFlag = 0;

		//Check if byte received on UART
		if (uart2RxFlag)
		{
			// clear rx flag
			uart2RxFlag = 0U;

			if(uart2RxBuf[0] == 'l')
				P7=(P7^0b10000000);
			else if(uart2RxBuf[0] == 'h')
			{
				sendHello();
				sendHelloFlag = 1;
			}

			if(!sendHelloFlag)
			{
				//Echo back one higher character
				uart2TxBuf[0] = uart2RxBuf[0]+1;
			}
			//Send TX buffer, and specify how many characters to write
			uart2Status = R_UART2_Send(uart2TxBuf, ((sendHelloFlag) ? 5 : 1));

			// Prime UART2 Rx
			uart2Status = R_UART2_Receive(uart2RxBuf, 1);
		}


		//If a character has been transmitted
		if (uart2TxFlag)
		{
			// End of UART2 transmit
			uart2TxFlag = 0U;   // clear tx flag
		}
	}
	/* End user code. Do not edit comment generated here */
}


/***********************************************************************************************************************
 * Function Name: R_MAIN_UserInit
 * Description  : This function adds user code before implementing main function.
 * Arguments    : None
 * Return Value : None
 ***********************************************************************************************************************/
void R_MAIN_UserInit(void)
{
	/* Start user code. Do not edit comment generated here */
	EI();
	//TODO: Initialize LED outputs here

	/* End user code. Do not edit comment generated here */
}

/* Start user code for adding. Do not edit comment generated here */
// TODO: Write your toggle_led() function here
/* End user code. Do not edit comment generated here */
