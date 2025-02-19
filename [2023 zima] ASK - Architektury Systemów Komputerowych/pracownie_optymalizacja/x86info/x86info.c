/*
 * x86info main.
 *  Licensed under the terms of the GNU GPL License version 2.
 */

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>

#include <x86info.h>
#include "mptable.h"

#include <intel.h>
#include <amd.h>

unsigned int user_is_root = 0;

unsigned int nrCPUs = 1;
static unsigned int nrSMPCPUs;

struct cpudata *firstcpu;


static void separator(void)
{
	int j;

	for (j = 0; j < 74; j++)
		printf("-");
	printf("\n");
}


static void display_detailed_info(struct cpudata *cpu)
{
	bind_cpu(cpu->number);	/* FIXME: Eventually remove once 'gather' has all the per-cpu stuff */
	show_info(cpu);

	if (show_cpuid) {
		dump_raw_cpuid(cpu->number, 0, cpu->cpuid_level);
		if (cpu->maxei >=0x80000000)
			dump_raw_cpuid(cpu->number, 0x80000000, cpu->maxei);

		if (cpu->maxei2 >=0xC0000000)
			dump_raw_cpuid(cpu->number, 0xC0000000, cpu->maxei2);
	}

	if (show_cacheinfo) {
		switch (cpu->vendor) {
		case VENDOR_INTEL:
			decode_intel_caches(cpu, 1);
			break;
		case VENDOR_AMD:
			decode_amd_cacheinfo(cpu);
			break;

		case VENDOR_CENTAUR:
		case VENDOR_CYRIX:
		case VENDOR_NATSEMI:
		case VENDOR_RISE:
		case VENDOR_SIS:
		case VENDOR_TRANSMETA:
		case VENDOR_UNKNOWN:
		default:
			break;
		}
	}

	if (show_feature_flags)
		display_feature_flags(cpu);

	if (show_connector)
		decode_connector(cpu->connector);

	/* Info that requires root access (eg, reading MSRs etc) */
	if (user_is_root) {
		if (show_mtrr)
			dump_mtrrs(cpu);

		if (show_apic)
			dump_apics(cpu);
	}

	if (show_addr_sizes)
		printf("Address sizes : %u bits physical, %u bits virtual\n",
			cpu->phyaddr_bits, cpu->viraddr_bits);

	if (show_MHz) {
		display_MHz(cpu);
		printf(" processor (estimate).\n\n");
	}
}

/*
 * check to see if all CPUs are the same.
 * returns 1 if all cpus are the same, 0 if something is different
 */
static int check_cpu_similarity(void)
{
	struct cpudata *cpu;
	unsigned int i;

	/* force to display all cpus if the user requested it. */
	if (all_cpus)
		return 0;

	if (nrCPUs == 1)
		return 1;

	cpu = firstcpu;
	for (i = 0; i < nrCPUs; i++) {
		cpu = cpu->next;
		if (!cpu)
			return 1;

		if (cpu->efamily != firstcpu->efamily)
			return 0;
		if (cpu->emodel != firstcpu->emodel)
			return 0;
		if (cpu->family != firstcpu->family)
			return 0;
		if (model(cpu) != model(firstcpu))
			return 0;
		if (cpu->stepping != firstcpu->stepping)
			return 0;
	}

	return 1;
}

static struct cpudata *alloc_cpu(void)
{
	struct cpudata *newcpu;

	newcpu = malloc (sizeof (struct cpudata));
	if (!newcpu) {
		printf("Out of memory\n");
		exit(EXIT_FAILURE);
	}
	memset(newcpu, 0, sizeof(struct cpudata));

	return newcpu;
}

static void fill_in_cpu_info(struct cpudata *cpu)
{
	bind_cpu(cpu->number);
	estimate_MHz(cpu);
	get_cpu_info_basics(cpu);	/* get vendor,family,model,stepping */
	get_feature_flags(cpu);
	identify(cpu);
	get_topology(cpu);
}


int main(int argc, char **argv)
{
	struct cpudata *cpu=NULL, *tmp;
	unsigned int i;
	unsigned int display_one_cpu = 1;

	if (getuid() == 0)
		user_is_root = 1;

	parse_command_line(argc, argv);

	printf("x86info " __stringify(VERSION) "\n");

	if ((HaveCPUID()) == 0) {
		printf("No CPUID instruction available.\n");
		printf("No further information available for this CPU.\n");
		exit(EXIT_SUCCESS);
	}

	if (need_root && !user_is_root) {
		printf("Need to be root to use specified options.\n");
		exit(EXIT_FAILURE);
	}

	nrCPUs = sysconf(_SC_NPROCESSORS_ONLN);

	/* can't have more than 65535 CPUs (some arbitrary large number) */
	if (nrCPUs > 65535) {
		printf("CPU count is bogus: defaulting to 1 CPU.\n");
		nrCPUs = 1;
	}

	/* Allocate a cpu for boot cpu. */
	cpu = firstcpu = alloc_cpu();
	fill_in_cpu_info(cpu);

	/* Allocate structs for non-boot CPUs if present */
	if (nrCPUs > 1) {
		for (i = 1; i < nrCPUs; i++) {
			cpu->next = alloc_cpu();
			cpu = cpu->next;
			cpu->number = i;

			fill_in_cpu_info(cpu);
		}
	}

	display_one_cpu = check_cpu_similarity();

	if (show_mptable && user_is_root)
		display_mptable();

	/* Now we display the info we gathered */
	cpu = firstcpu;

	if (display_one_cpu) {
		if (nrCPUs >= 2)
			printf("Found %u identical CPUs", nrCPUs);

		/* Check mptable if present. This way we get number of CPUs
		   on SMP systems that have booted UP kernels. */
		if (user_is_root) {
			nrSMPCPUs = enumerate_cpus();
			if (nrSMPCPUs > 0)
				if (nrSMPCPUs > nrCPUs)
					printf(" (but found %u CPUs in MPTable!)", nrSMPCPUs);
		}
		if (nrCPUs >= 2)
			printf("\n");

		display_detailed_info(cpu);
	} else {
		printf("Found %u CPUs.\n", nrCPUs);
		for (i = 0; i < nrCPUs; i++) {
			printf("CPU #%u:\n", i+1);

			display_detailed_info(cpu);

			if (nrCPUs > 1)
				separator();
			cpu = cpu->next;
		}
	}

	display_topology(firstcpu);

	printf(" running at an estimated ");
	display_MHz(firstcpu);
	printf("\n");


	/* Tear down the linked list. */
	cpu = firstcpu;
	for (i = 0; i < nrCPUs; i++) {
		tmp = cpu->next;
		free(cpu);
		cpu = tmp;
	}

	exit(EXIT_SUCCESS);
}
