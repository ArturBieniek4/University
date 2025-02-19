/*
 *  Licensed under the terms of the GNU GPL License version 2.
 *
 *  AMD-Athlon specific MSR information
 */

#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>
#include <x86info.h>
#include <amd.h>

void dump_athlon_MSR(struct cpudata *cpu)
{
	if (!user_is_root)
		return;

	dumpmsr(cpu->number, 0x2A, 32);
	dumpmsr(cpu->number, 0xC0000080, 32);
	dumpmsr(cpu->number, 0xC0010010, 32);
	dumpmsr(cpu->number, 0xC0010015, 32);
	dumpmsr(cpu->number, MSR_CLKCTL, 32);
	printf("\n");
}
