/*
 *  Licensed under the terms of the GNU GPL License version 2.
 *
 *  MTRR register dumping.
 *  TODO : decode the registers too.
 */

#include <stdio.h>
#ifdef __linux__
#include <asm/mtrr.h>
#endif
#include <x86info.h>

#define IA32_MTRRCAP_WC   (1 << 10)
#define IA32_MTRRCAP_FIX  (1 << 8)
#define IA32_MTRRCAP_VCNT 0xFF

#define IA32_MTRR_DEFTYPE_E    0x800
#define IA32_MTRR_DEFTYPE_FE   0x400
#define IA32_MTRR_DEFTYPE_TYPE 0xFF

#define IA32_PHYBASE_TYPE   0XFF
#define IA32_PHYMASK_VALID  (1 << 11)

static unsigned int max_phy_addr = 0;

#ifndef MTRR_NUM_TYPES
#define MTRR_NUM_TYPES 8
#endif

static const char * mtrr_types[MTRR_NUM_TYPES] =
{
	"uncacheable",
	"write-combining",
	"?",
	"?",
	"write-through",
	"write-protect",
	"write-back",
};

static void decode_address(unsigned long long val)
{
	switch (max_phy_addr) {
	case 40:
		printf("0x%07x ", (unsigned int) ((val >> 12) & 0xFFFFFFF));
		break;
	case 36:
	default:
		printf("0x%06x ", (unsigned int) ((val >> 12) & 0xFFFFFF));
		break;
	}
}

static void set_max_phy_addr(struct cpudata *cpu)
{
	unsigned int value;

	if (!max_phy_addr) {
		cpuid(cpu->number, 0x80000008, &value, NULL, NULL, NULL);
		max_phy_addr = value & 0xFF;
	}
}

static int mtrr_value(int cpu, int msr, unsigned long long *val)
{
	if (read_msr(cpu, msr, val) == 1)
		return 1;
	else
		return 0;
}

static void dump_mtrr(int cpu, int msr)
{
	unsigned long long val = 0;

	if (read_msr(cpu, msr, &val) == 1)
		printf("0x%016llx\n", val);
}

static void decode_mtrrcap(int cpu, int msr)
{
	unsigned long long val;
	int ret;

	ret = mtrr_value(cpu, msr, &val);
	if (ret) {
		printf("0x%016llx ", val);
		printf("wc:%d ",
			!! ((unsigned int) val & IA32_MTRRCAP_WC));
		printf("fix:%d ",
			!! ((unsigned int) val & IA32_MTRRCAP_FIX));
		printf("vcnt:%d\n",
			(unsigned int) val & IA32_MTRRCAP_VCNT);
	}
}

static void decode_mtrr_deftype(int cpu, int msr)
{
	unsigned long long val;
	int ret;
	u8 type;

	ret = mtrr_value(cpu,msr,&val);
	if (ret) {
		printf("0x%016llx ", val);

		printf("(fixed-range flag:%d ",
			!! ((unsigned int) val & (1 << 10)));

		printf("enable flag:%d ",
			!! ((unsigned int) val & (1 << 11)));

		type = val & IA32_MTRR_DEFTYPE_TYPE;
		printf("default type:0x%02x (%s))\n", type, mtrr_types[type]);
	}
}

static void decode_mtrr_physbase(int cpu, int msr)
{
	unsigned long long val;
	int ret;
	u8 type;

	ret = mtrr_value(cpu, msr, &val);
	if (ret) {
		printf("0x%016llx ", val);

		printf("(physbase:");
		decode_address(val);

		type = (unsigned int) val & IA32_PHYBASE_TYPE;
		printf("type: 0x%02x (%s))\n", type, mtrr_types[type]);
	}
}

static void decode_mtrr_physmask(int cpu, int msr)
{
	unsigned long long val;
	int ret;

	ret = mtrr_value(cpu,msr,&val);
	if (ret) {
		printf("0x%016llx ", val);

		printf("(physmask:");
		decode_address(val);

		printf("valid:%d)\n",
			!! ((int) val & IA32_PHYMASK_VALID));
	}
}


void dump_mtrrs(struct cpudata *cpu)
{
	unsigned long long val = 0;
	unsigned int i;

	if (!(cpu->flags_edx & (X86_FEATURE_MTRR)))
		return;

	/*
	 * If MTRR registers are not accessible like in some
	 * virtualization systems then return
	 */
	if (!read_msr(cpu->number, 0xfe, &val))
		return;

	printf("MTRR registers:\n");

	printf("MTRRcap (0xfe): ");
	decode_mtrrcap(cpu->number, 0xfe);

	set_max_phy_addr(cpu);

	for (i = 0; i < 16; i+=2) {
		printf("MTRRphysBase%u (0x%x): ", i / 2, (unsigned int) 0x200 + i);
		decode_mtrr_physbase(cpu->number, 0x200 + i);
		printf("MTRRphysMask%u (0x%x): ", i/2, (unsigned int) 0x201 + i);
		decode_mtrr_physmask(cpu->number, 0x201 + i);
	}

	printf("MTRRfix64K_00000 (0x250): ");
	dump_mtrr (cpu->number, 0x250);
	printf("MTRRfix16K_80000 (0x258): ");
	dump_mtrr (cpu->number, 0x258);
	printf("MTRRfix16K_A0000 (0x259): ");
	dump_mtrr (cpu->number, 0x259);

	printf("MTRRfix4K_C8000 (0x269): ");
	dump_mtrr (cpu->number, 0x269);
	printf("MTRRfix4K_D0000 0x26a: ");
	dump_mtrr (cpu->number, 0x26a);
	printf("MTRRfix4K_D8000 0x26b: ");
	dump_mtrr (cpu->number, 0x26b);
	printf("MTRRfix4K_E0000 0x26c: ");
	dump_mtrr (cpu->number, 0x26c);
	printf("MTRRfix4K_E8000 0x26d: ");
	dump_mtrr (cpu->number, 0x26d);
	printf("MTRRfix4K_F0000 0x26e: ");
	dump_mtrr (cpu->number, 0x26e);
	printf("MTRRfix4K_F8000 0x26f: ");
	dump_mtrr (cpu->number, 0x26f);

	printf("MTRRdefType (0x2ff): ");
	decode_mtrr_deftype(cpu->number, 0x2ff);

	printf("\n");
}
