#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include <avr/interrupt.h>
#include <util/delay.h>
#include "LibSpikCU_slave.h"
#include "CU_GEN_Reg.h"
#include "drv_MAX186.h"

uint16_t Last_exe = 0;
uint16_t temp_val = 0;
uint8_t* ptrRAW1;

int main(void)
{
    initSpikCU();      // Initialisation de la lib SPI
    sei();             // Activation des interruptions
    init_ADC();        // Initialisation ADC MAX186
    ADC_SetCS(ADC_SS_1);  //chip select de l'ADC

    while (1)
    {
        _delay_us(10); 

        // Déclenchement toutes les minutes CCSDS
        if (read_param(TIME_CCSDS_MIN) > Last_exe)
        {
            Last_exe = read_param(TIME_CCSDS_MIN);

            // Lire la température (ex: canal 0)
            temp_val = ADC_readSingleChannel(0);

            // Mettre la valeur dans RAW1 (sur 2 octets)
            ptrRAW1 = get_RAW1_ptr();
            *ptrRAW1++ = (uint8_t)(temp_val >> 8);     // MSB
            *ptrRAW1++ = (uint8_t)(temp_val & 0xFF);   // LSB
            update_raw1_size(2); // 2 octets de données

            write_param(TEST1, temp_val);
        }
    }
}


void shotHK(void)
{
    ;
}
