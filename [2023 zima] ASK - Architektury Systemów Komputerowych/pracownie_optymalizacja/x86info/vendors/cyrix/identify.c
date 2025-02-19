/*
 *  Licensed under the terms of the GNU GPL License version 2.
 *
 *  Cyrix specific information.
 */

#include <stdio.h>
#include <x86info.h>
#include "cyrix.h"

static char *cyrix_nameptr;
#define add_to_cpuname(x)   cyrix_nameptr += snprintf(cyrix_nameptr, sizeof(x), "%s", x)

/* Decode TLB and cache info descriptors */
void decode_cyrix_tlb(int x)
{
	switch (x & 0xff) {
	case 0:
		break;
	case 0x70:
		printf("TLB: 32 entries 4-way associative 4KB pages\n");
		break;
	case 0x80:
		printf("L1 Cache: 16KB 4-way associative 16 bytes/line\n");
		break;
	}
}

/* Cyrix-specific information */
void identify_cyrix(struct cpudata *cpu)
{
	unsigned int eax, ebx, ecx, edx;

	cyrix_nameptr = cpu->name;

	switch (tuple(cpu) & 0xff0) {
		case 0x450:	add_to_cpuname("MediaGX");
				break;

		case 0x520:	add_to_cpuname("6x86");
				break;
		case 0x524:	add_to_cpuname("GXm");
				break;

		case 0x600:	add_to_cpuname("6x86/MX");
				break;
		case 0x620:	add_to_cpuname("MII");
				break;
		default:	add_to_cpuname("Unknown CPU");
				break;
	}

	/* Check for presence of extended info */
	if (cpu->maxei < 0x80000000)
		return;

	if (cpu->maxei >= 0x80000001) {
		cpuid (cpu->number, 0x80000001, &eax, &ebx, &ecx, &edx);
		cpu->stepping = eax & 0xf;
		cpu->model = (eax >> 4) & 0xf;
		cpu->family = (eax >> 8) & 0xf;

		switch (cpu->family) {
			case 4:	add_to_cpuname("MediaGX");
					break;
			case 5:	add_to_cpuname("6x86/GXm");
					break;
			case 6:	add_to_cpuname("6x86/MX");
					break;
		}
	}
}

void display_cyrix_info(struct cpudata *cpu)
{
	unsigned int i, ntlb;
	unsigned int eax, ebx, ecx, edx;

	printf("TLB & L1 Cache info\n");
	if (cpu->cpuid_level >= 2 && show_cacheinfo) {
		/* TLB and L1 Cache info */
		ntlb = 255;
		for (i = 0; i < ntlb; i++) {
			cpuid (cpu->number, 2, &eax, &ebx, &ecx, &edx);
			ntlb = eax & 0xff;
			decode_cyrix_tlb(eax >> 8);
			decode_cyrix_tlb(eax >> 16);
			decode_cyrix_tlb(eax >> 24);

			/* ebx and ecx are reserved */
			if ((edx & 0x80000000) == 0) {
				decode_cyrix_tlb(edx);
				decode_cyrix_tlb(edx >> 8);
				decode_cyrix_tlb(edx >> 16);
				decode_cyrix_tlb(edx >> 24);
			}
		}
	}

	printf("TLB & L1 Cache info from extended info\n");
	if (cpu->maxei >= 0x80000005 && show_cacheinfo) {
		/* TLB and L1 Cache info */
		ntlb = 255;
		for (i = 0; i < ntlb; i++) {
			cpuid (cpu->number, 0x80000005, &eax, &ebx, &ecx, &edx);
			ntlb = eax & 0xff;
			decode_cyrix_tlb(ebx >> 8);
			decode_cyrix_tlb(ebx >> 16);
			decode_cyrix_tlb(ebx >> 24);

			/* eax and edx are reserved */
			if ((ecx & 0x80000000) == 0) {
				decode_cyrix_tlb(ecx);
				decode_cyrix_tlb(ecx >> 8);
				decode_cyrix_tlb(ecx >> 16);
				decode_cyrix_tlb(ecx >> 24);
			}
		}
	}
}

