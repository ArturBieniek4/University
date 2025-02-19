extern unsigned long long g_405008;

long long sub_401020()
{
    unsigned long v0;  // [bp-0x8]

    v0 = g_405008;
    goto *((long long *)4214800);
}

long long _start()
{
    char v0;  // [bp+0x0], Other Possible Types: unsigned long
    unsigned long v1;  // [bp+0x8]
    unsigned long long v2;  // rsi
    unsigned long v3;  // rax
    unsigned long long v4;  // rdx

    v2 = *((long long *)&v0);
    v0 = v3;
    __libc_start_main(main, v2, &v1, __libc_csu_init, __libc_csu_fini, v4); /* do not return */
}

// No decompilation output for function sub_40120a

extern char __TMC_END__;
extern unsigned long long g_404fd8;

void deregister_tm_clones()
{
    if (true)
        return;
    if (!g_404fd8)
        return;
    goto g_404fd8;
}

extern unsigned long long g_404ff0;

long long register_tm_clones()
{
    if (true)
        return 0;
    if (!g_404ff0)
        return g_404ff0;
    goto g_404ff0;
}

extern char completed.0;
extern unsigned long long g_404ff8;

long long __do_global_dtors_aux()
{
    unsigned long v0;  // [bp-0x8]
    unsigned long v2;  // rax

    if (completed.0)
        return v2;
    *((int *)&v0) = rbp<8>;
    if (!g_404ff8)
    {
        completed.0 = 1;
        return (unsigned long long)deregister_tm_clones();
    }
    __cxa_finalize();
}

long long frame_dummy()
{
    return register_tm_clones();
}

typedef struct struct_0 {
    unsigned long long field_0;
    char *field_8;
} struct_0;

extern unsigned long long infile;
extern unsigned long long stdin@GLIBC_2.2.5;

int main(unsigned long a0, struct_0 *a1)
{
    if ((unsigned int)a0 == 1)
    {
        infile = stdin@GLIBC_2.2.5;
    }
    else if ((unsigned int)a0 != 2)
    {
        printf("Usage: %s [<input_file>]\n", (unsigned int)a1->field_0);
        exit(8); /* do not return */
    }
    else
    {
        infile = fopen(a1->field_8, "r");
        if (!infile)
        {
            printf("%s: Error: Couldn't open %s\n", (unsigned int)a1->field_0, (unsigned int)a1->field_8);
            exit(8); /* do not return */
        }
    }
    initialize_bomb();
    puts("Welcome to my fiendish little bomb. You have 6 phases with");
    puts("which to blow yourself up. Have a nice day!");
    phase_1(read_line());
    phase_defused();
    puts("Phase 1 defused. How about the next one?");
    phase_2(read_line());
    phase_defused();
    puts("That's number 2.  Keep going!");
    phase_3(read_line());
    phase_defused();
    puts("Halfway there!");
    phase_4(read_line());
    phase_defused();
    puts("So you got that one.  Try this one.");
    phase_5(read_line());
    phase_defused();
    puts("Good work!  On to the next...");
    phase_6(read_line());
    phase_defused();
    return 0;
}

void phase_1(unsigned long long a0)
{
    if (strings_not_equal(a0, "Crikey! I have lost my mojo!"))
        explode_bomb(); /* do not return */
    return;
}

long long sub_401433()
{
}

typedef struct struct_0 {
    char field_0;
    char padding_1[3];
    unsigned int field_4;
} struct_0;

typedef struct struct_1 {
    char field_0;
} struct_1;

void phase_2(unsigned long long a0)
{
    char v0;  // [bp-0x38]
    unsigned int v1;  // [bp-0x34]
    char v2;  // [bp-0x24]
    struct_0 *v4;  // rbx, Other Possible Types: unsigned long
    struct_1 *v5;  // rbp

    read_six_numbers(a0, &v0);
    if (*((int *)&v0) != 1)
        explode_bomb(); /* do not return */
    v4 = &v0;
    v5 = &v2;
    while (true)
    {
        if (*((int *)(v4 + 4)) != *((int *)v4) << 1)
            explode_bomb(); /* do not return */
        v4 = &v1;
        if (v4 == &v2)
            return;
    }
}

long long sub_401458()
{
}

long long sub_401471()
{
}

void phase_3(char *a0)
{
    char v0;  // [bp-0x11]
    char v1;  // [bp-0x10]
    char v2;  // [bp-0xc]
    char v4;  // al

    if (__isoc99_sscanf(a0, "%d %c %d", (unsigned int)&v2, (unsigned int)&v0, (unsigned int)&v1) <= 2)
        explode_bomb(); /* do not return */
    switch (*((int *)&v2))
    {
    case 0:
        v4 = 117;
        if (*((int *)&v1) != 312)
            explode_bomb(); /* do not return */
    case 1:
        v4 = 108;
        if (*((int *)&v1) != 349)
            explode_bomb(); /* do not return */
    case 2:
        v4 = 105;
        if (*((int *)&v1) != 138)
            explode_bomb(); /* do not return */
    case 3:
        v4 = 118;
        if (*((int *)&v1) != 807)
            explode_bomb(); /* do not return */
    case 4:
        v4 = 108;
        if (*((int *)&v1) != 725)
            explode_bomb(); /* do not return */
    case 5:
        v4 = 117;
        if (*((int *)&v1) != 773)
            explode_bomb(); /* do not return */
    case 6:
        v4 = 111;
        if (*((int *)&v1) != 199)
            explode_bomb(); /* do not return */
    case 7:
        v4 = 117;
        if (*((int *)&v1) != 697)
            explode_bomb(); /* do not return */
    default:
        explode_bomb(); /* do not return */
    }
    if (v0 != v4)
        explode_bomb(); /* do not return */
    return;
}

long long sub_4014c7()
{
}

long long sub_4014e1()
{
}

long long sub_401503()
{
}

long long sub_401525()
{
}

long long sub_401547()
{
}

long long sub_401562()
{
}

long long sub_40157d()
{
}

long long sub_401598()
{
}

long long sub_4015b3()
{
}

long long sub_4015bf()
{
}

long long sub_4015d4()
{
}

int func4(unsigned long long a0, unsigned long long a1, unsigned long long a2)
{
    unsigned long v1;  // rbx, Other Possible Types: unsigned int

    v1 = ((a2 - a1 >> 31) + a2 - a1 >> 1) + a1;
    if ((unsigned int)v1 > (unsigned int)a0)
    {
        v1 += func4(a0, a1, v1 - 1);
        return v1;
    }
    else if ((unsigned int)v1 >= (unsigned int)a0)
    {
        return ((a2 - a1 >> 31) + a2 - a1 >> 1) + a1;
    }
    else
    {
        v1 = (unsigned int)v1 + func4(a0, v1 + 1, a2);
        return v1;
    }
}

void phase_4(char *a0)
{
    char v0;  // [bp-0x10]
    char v1;  // [bp-0xc]

    if (__isoc99_sscanf(a0, "%d %d", (unsigned int)&v1, (unsigned int)&v0) == 2 && *((int *)&v1) <= 14)
    {
        if (!(func4(*((int *)&v1), 0, 14) == 7 && *((int *)&v0) == 7))
            explode_bomb(); /* do not return */
        return;
    }
    explode_bomb(); /* do not return */
}

void phase_5(char *a0)
{
    char v0;  // [bp-0x10]
    unsigned int v1;  // [bp-0xc], Other Possible Types: char
    unsigned int *v3;  // rax, Other Possible Types: unsigned long
    void* v4;  // rcx, Other Possible Types: unsigned long

    if (__isoc99_sscanf(a0, "%d %d", (unsigned int)&v1, (unsigned int)&v0) <= 1)
        explode_bomb(); /* do not return */
    v3 = *((int *)&v1) & 15;
    v1 = (unsigned int)v3;
    if ((unsigned int)v3 == 15)
        explode_bomb(); /* do not return */
    v4 = 0;
    do
    {
        v3 = *((int *)(4207008 + 4 * v3));
        v4 += v3;
    } while ((unsigned int)v3 != 15);
    v1 = 15;
    if (false && *((int *)&v0) == (unsigned int)v4)
        return;
}

long long sub_4016d7()
{
}

typedef struct struct_1 {
    unsigned int field_0;
    char padding_4[4];
    struct struct_1 *field_8;
} struct_1;

typedef struct struct_0 {
    char padding_0[8];
    unsigned long long field_8;
} struct_0;

extern struct_1 node1;

void phase_6(unsigned long long a0)
{
    struct_1 *v0;  // [bp-0x78]
    char v1;  // [bp-0x70]
    char v2;  // [bp-0x68]
    char v3;  // [bp-0x60]
    char v4;  // [bp-0x58]
    char v5;  // [bp-0x50]
    struct_1 *v6;  // [bp-0x48]
    unsigned int v7;  // [bp-0x44]
    struct struct_1 **v9;  // r13, Other Possible Types: unsigned long
    unsigned long v10;  // r14, Other Possible Types: unsigned long long
    unsigned long v11;  // rbx, Other Possible Types: unsigned long long
    unsigned int v12;  // ecx
    unsigned int v13;  // eax
    struct_1 *v14;  // rdx, Other Possible Types: unsigned long
    struct_1 *v16;  // rbx, Other Possible Types: unsigned long
    struct_0 *v17;  // rax
    struct_0 *v18;  // rdx
    struct_0 *v19;  // rax
    struct_0 *v20;  // rdx
    struct_0 *v21;  // rax
    unsigned long v22;  // ebp, Other Possible Types: unsigned int

    v9 = &v6;
    read_six_numbers(a0, &v6);
    v10 = 1;
    while (true)
    {
        if (*((int *)v9) - 1 > 5)
        {
            explode_bomb(); /* do not return */
        }
        else if ((unsigned int)v10 <= 5)
        {
            v11 = v10;
            do
            {
                if ((int)v6 == *((int *)((char *)&v6 + 4 * v11)))
                    explode_bomb(); /* do not return */
            } while ((v11 += 1, (unsigned int)v11 <= 5));
            v10 += 1;
            v9 = &v7;
        }
        else
        {
            do
            {
                v12 = (int)v6;
                v13 = 1;
                v14 = &node1.field_0;
                if (v12 > 1)
                {
                    do
                    {
                        v14 = *((long long *)(v14 + 8));
                        v13 += 1;
                    } while (v13 != v12);
                }
            } while ((v11 += 1, (unsigned int)v11 <= 5));
            v16 = v0;
            v17 = *((long long *)&v1);
            v16->field_8 = &v17->padding_0;
            v18 = *((long long *)&v2);
            v17->field_8 = v18;
            v19 = *((long long *)&v3);
            v18->field_8 = v19;
            v20 = *((long long *)&v4);
            v19->field_8 = v20;
            v21 = *((long long *)&v5);
            v20->field_8 = v21;
            v21->field_8 = 0;
            v22 = 5;
            while (true)
            {
                if (*((int *)v16) < *((int *)*((long long *)(v16 + 8))))
                    explode_bomb(); /* do not return */
                v16 = *((long long *)(v16 + 8));
                v22 = (unsigned int)v22 - 1;
                if (false)
                    return;
            }
        }
    }
}

long long sub_401702()
{
}

long long sub_40171b()
{
}

long long sub_4017ca()
{
}

typedef struct struct_0 {
    unsigned int field_0;
    char padding_4[4];
    unsigned long long field_8;
    unsigned long long field_10;
} struct_0;

int fun7(struct_0 *a0, unsigned long long a1)
{
    unsigned int v1;  // edx
    unsigned int v2;  // eax

    if (!a0)
        return -1;
    v1 = a0->field_0;
    if (v1 > (unsigned int)a1)
    {
        v2 = fun7(a0->field_8, a1) * 2;
        return v2;
    }
    else if (v1 == (unsigned int)a1)
    {
        return 0;
    }
    else
    {
        v2 = fun7(a0->field_10, a1) * 2 + 1;
        return v2;
    }
}

extern void n1;

void secret_phase()
{
    unsigned long long v1;  // rax

    v1 = strtol(read_line(), NULL, 10);
    if ((unsigned int)(v1 - 1) > 1000)
    {
        explode_bomb(); /* do not return */
    }
    else if (fun7("$", v1) != 1)
    {
        explode_bomb(); /* do not return */
    }
    else
    {
        puts("Wow! You've defused the secret stage!");
        phase_defused();
        return;
    }
}

long long sub_401866()
{
}

long long sub_40186d()
{
}

extern FILE_t *stdout@GLIBC_2.2.5;

long long sig_handler()
{
    puts("So you think you can stop the bomb with ctrl-c, do you?");
    sleep(3);
    printf("Well...");
    fflush(stdout@GLIBC_2.2.5);
    sleep(1);
    puts("OK. :-)");
    exit(16); /* do not return */
}

long long invalid_phase()
{
    unsigned int v1;  // edi

    printf("Invalid phase%s\n", v1);
    exit(8); /* do not return */
}

int string_length(char *a0)
{
    unsigned int v1;  // eax

    if (!*(a0))
        return 0;
    v1 = 0;
    do
    {
        a0 += 1;
        v1 += 1;
    } while (*((char *)a0));
    return v1;
}

int strings_not_equal(char a0[2], unsigned long a1)
{
    char v2;  // dl
    unsigned long v3;  // rax

    if (string_length(a0) != string_length(a1))
        return 1;
    v2 = a0[0];
    if (!v2)
        return 0;
    v3 = 0;
    while (true)
    {
        if (*((char *)(a1 + v3)) == v2)
        {
            v3 += 1;
            v2 = a0[v3];
            if (!v2)
                return 0;
        }
        else
        {
            return 1;
        }
    }
}

void initialize_bomb()
{
    signal(2, sig_handler);
    return;
}

long long initialize_bomb_solve()
{
    unsigned long v1;  // rax

    return v1;
}

int blank_line(char *a0)
{
    char *v1;  // rbp, Other Possible Types: unsigned long
    unsigned long long v2;  // rbx

    v1 = a0;
    while (true)
    {
        v2 = *((char *)v1);
        if (!(char)v2)
            return 1;
        v1 += 1;
        if (!(*((char *)(*((long long *)&__ctype_b_loc()) + ((char)v2 << 1) + 1)) & 32))
            return 0;
    }
}

extern FILE_t *infile;
extern char input_strings;
extern unsigned int num_input_strings;

int skip()
{
    char *v1;  // rax

    while (v1)
    {
        v1 = fgets(&(&input_strings)[80 * num_input_strings], 80, infile);
        if (!blank_line(v1))
            return (unsigned int)v1;
    }
    return (unsigned int)v1;
}

void explode_bomb()
{
    puts("\nBOOM!!!");
    puts("The bomb has blown up.");
    exit(8); /* do not return */
}

void read_six_numbers(char *a0, unsigned long a1)
{
    unsigned long v0;  // [bp-0x18]
    unsigned long v1;  // [bp-0x10]

    v1 = a1 + 20;
    v0 = a1 + 16;
    if (__isoc99_sscanf(a0, "%d %d %d %d %d %d", (unsigned int)a1, (unsigned int)(a1 + 4), (unsigned int)(a1 + 8), (unsigned int)(a1 + 12), (int)v0, (int)v1) <= 5)
        explode_bomb(); /* do not return */
    return;
}

extern unsigned long long infile;
extern char input_strings;
extern unsigned int num_input_strings;
extern unsigned long long stdin@GLIBC_2.2.5;

int read_line()
{
    unsigned long long v1;  // rbp
    unsigned long long v2;  // rax
    unsigned long long v3;  // rax

    if (!skip())
    {
        if (infile == stdin@GLIBC_2.2.5)
        {
            puts("Error: Premature EOF on stdin");
            exit(8); /* do not return */
        }
        else if (getenv("GRADE_BOMB"))
        {
            exit(0); /* do not return */
        }
        else
        {
            infile = stdin@GLIBC_2.2.5;
            if (!skip())
            {
                puts("Error: Premature EOF on stdin");
                exit(0); /* do not return */
            }
        }
    }
    v1 = num_input_strings;
    (unsigned int)v2 = strlen(&(&input_strings)[80 * num_input_strings]);
    if ((unsigned int)v2 > 78)
    {
        puts("Error: Input line too long");
        v3 = num_input_strings;
        num_input_strings = num_input_strings + 1;
        strncpy(&(&input_strings)[80 * v3], "***truncated***", 15);
        explode_bomb(); /* do not return */
    }
    (&input_strings)[1 + 80 * num_input_strings + v2] = 0;
    num_input_strings = num_input_strings + 1;
    return (unsigned int)&(&input_strings)[80 * v1];
}

extern char g_4054f0;
extern unsigned int num_input_strings;

void phase_defused()
{
    char v0;  // [bp-0x60]
    char v1;  // [bp-0x5c]
    char v2[2];  // [bp-0x58]

    if (num_input_strings != 6)
        return;
    if (!(__isoc99_sscanf(&g_4054f0, "%d %d %s", (unsigned int)&v1, (unsigned int)&v0, (unsigned int)v2) == 3 && !strings_not_equal(v2, "DrEvil")))
    {
        puts("Congratulations! You've defused the bomb!");
        return;
    }
    puts("Curses, you've found the secret phase!");
    puts("But finding it and solving it are quite different...");
    secret_phase();
}

extern FILE_t *stderr@GLIBC_2.2.5;

long long sigalrm_handler()
{
    fprintf(stderr@GLIBC_2.2.5, "Program timed out after %d seconds\n", 0);
    exit(1); /* do not return */
}

typedef struct struct_0 {
    unsigned int field_0;
    unsigned int field_4;
    struct struct_1 *field_8;
} struct_0;

typedef struct struct_1 {
    char field_0;
} struct_1;

int rio_readlineb(struct_0 *a0, char a1[1], unsigned long a2)
{
    char v1[1];  // r12, Other Possible Types: unsigned long
    char v2[1];  // r14
    void* v3;  // rbp
    unsigned int v4;  // edx
    char *v5;  // rax
    char v6;  // cl
    unsigned int v7;  // r13d
    unsigned int v8;  // eax

    v1 = a1;
    if (a2 <= 1)
    {
        v7 = 1;
    }
    else
    {
        v2 = &a1[a2 + 1];
        v7 = 1;
        v3 = a0 + 1;
        do
        {
            v4 = a0->field_4;
            if (v4 <= 0)
            {
                do
                {
                    v4 = read(a0->field_0, v3, 0x2000);
                    a0->field_4 = v4;
                    if (v4 >= 0)
                    {
                        if (!v4)
                        {
                            v8 = 0;
                            goto LABEL_401ce8;
                        }
                        else
                        {
                            a0->field_8 = v3;
                            goto LABEL_401ca5;
                        }
                    }
                } while (*(__errno_location()) == 4);
                v8 = -1;
LABEL_401ce8:
                if (v8)
                {
                    return -1;
                }
                else if (v7 == 1)
                {
                    return 0;
                }
                else
                {
                    *((char *)v1) = 0;
                    return v7;
                }
            }
LABEL_401ca5:
            v5 = a0->field_8;
            v6 = *(v5);
            a0->field_8 = &v5[1];
            a0->field_4 = v4 - 1;
            v1 += 1;
            *((char *)(v1 - 1)) = v6;
            if (v6 == 10)
            {
                *((char *)v1) = 0;
                return v7;
            }
            v7 += 1;
        } while (v1 != v2);
        v1 = v2;
    }
    *((char *)v1) = 0;
    return v7;
}

typedef struct struct_1 {
    char padding_0[20];
    unsigned int field_14;
    struct struct_2 *field_18;
} struct_1;

typedef struct sockaddr {
    unsigned short sin_family;
    char sa_data[14];
} sockaddr;

typedef struct struct_0 {
    char field_0;
} struct_0;

typedef struct struct_2 {
    void* field_0;
} struct_2;

void submitr(unsigned long a0, unsigned long a1, unsigned long a2, unsigned long a3, unsigned long a4, char *a5, char *v21, char *a6)
{
    unsigned long long v0;  // [bp-0xa1b8]
    int tmp_8;  // tmp #8
    char *v1;  // [bp-0xa098]
    char *v2;  // [bp-0xa090]
    unsigned long v3;  // [bp-0xa080]
    char v4;  // [bp-0xa070]
    char v5;  // [bp-0xa06f]
    char v6;  // [bp-0xa06e]
    char v7;  // [bp-0xa068]
    unsigned int v8;  // [bp-0x805c]
    char v9;  // [bp-0x8058]
    void* v10;  // [bp-0x6058], Other Possible Types: char
    char v13;  // [bp-0x4058]
    unsigned int v14;  // [bp-0x2058]
    unsigned int v15;  // [bp-0x2054]
    unsigned long v16;  // [bp-0x2050]
    char v17;  // [bp-0x2048]
    sockaddr v18;  // [bp-0x48], Other Possible Types: unsigned short, void*
    unsigned short v19;  // [bp-0x46]
    void* v20;  // [bp-0x40]
    char *v24;  // rbx, Other Possible Types: unsigned long
    char *v25;  // r15
    unsigned int v26;  // edx
    unsigned int v27;  // esi
    unsigned int v28;  // edi
    unsigned long v29;  // rax
    unsigned int v30;  // r12d
    struct_1 *v31;  // rax
    unsigned long long v32;  // rdx
    struct_0 *v33;  // rbp
    unsigned int v34;  // edx
    unsigned int v35;  // edi
    unsigned long long v36;  // rbp
    unsigned long v39;  // rcx, Other Possible Types: unsigned long long
    struct_0 *v40;  // rdi, Other Possible Types: unsigned long
    unsigned long v41;  // d
    unsigned long long v42;  // rax
    unsigned long long v43;  // r13
    struct_0 *v44;  // rbp, Other Possible Types: unsigned long long, unsigned long
    unsigned long long v45;  // rcx
    unsigned int v46;  // r9d
    unsigned long v49;  // rbx
    unsigned int v51;  // edi
    void* v52;  // rax, Other Possible Types: unsigned long
    struct_0 *v53;  // r8
    unsigned int v54;  // edx
    struct_0 *v55;  // rsi, Other Possible Types: unsigned long
    unsigned long v56;  // rcx, Other Possible Types: unsigned long long
    char *v57;  // rdi, Other Possible Types: unsigned long
    char v58;  // cc_dep1
    char v59;  // cc_dep2
    unsigned long v60;  // rcx, Other Possible Types: unsigned long long
    char *v61;  // rdi, Other Possible Types: unsigned long
    char *v62;  // rsi, Other Possible Types: unsigned long
    char v63;  // cc_dep1
    char v64;  // cc_dep2

    v1 = a2;
    v2 = a3;
    v3 = a4;
    v24 = v21;
    v25 = a6;
    v8 = 0;
    v26 = 0;
    v27 = 1;
    v28 = 2;
    (unsigned int)v29 = socket(2, 1, 0);
    if ((unsigned int)v29 < 0)
    {
        strncpy(v25, "Error: Client un", 16);
        v32 = 8295742064141103715;
        strncpy(v25 + 16, "able to create socket", 21);
        return;
    }
    v30 = v29;
    v31 = gethostbyname(a0);
    if (!v31)
    {
        strcpy(v25, "Error: DNS is unable to resolve server address");
        close(v30);
        return;
    }
    v33 = &v18;
    v18 = 0;
    v20 = 0;
    v18 = 2;
    memmove(&v18, v31->field_18->field_0, v31->field_14);
    v19 = __ROL__((unsigned short)a1, 8);
    v34 = 16;
    v35 = v30;
    if (connect(v30, &v18, 16) < 0)
    {
        strcpy(v25, "Error: Unable to connect to the server");
        close(v30);
        return;
    }
    v36 = strlen(v24);
    if (strlen(v1) + strlen(v2) + 128 + strlen(a5) + v36 * 3 > 0x2000)
    {
        strncpy(v25, "Error: Result string too large. Increase SUBMITR_MAXBUF", 55);
        close(v30);
        return;
    }
    v39 = 0x400;
    for (v40 = &v10; v39; v40 += v41 * 8)
    {
        v39 -= 1;
        *((long long *)v40) = 0;
    }
    v42 = strlen(v24);
    if ((unsigned int)v42)
    {
        v43 = &v24[1 + v42 + 1];
        v44 = &v10;
        do
        {
            v45 = *((char *)v24);
            if ((char)(v45 - 42) <= 53 && !((v0 = (unsigned long long)9007199254806489, !((char)((unsigned long long)(char)*((char *)((char *)&v0 + ((v45 - 42 & 63) >> 3))) >> (unsigned long long)(char)(v45 - 42 & 63 & 7)) & 1))) || ((unsigned int)v45 & -33) - 65 <= 25)
            {
                *((char *)v44) = v45;
                v44 = &v10;
            }
            else if ((char)v45 == 32)
            {
                *((char *)v44) = 43;
                v44 = &v10;
            }
            else
            {
                if (v45 - 32 > 95 && (char)v45 != 9)
                {
                    strcpy(v25, "Error: Result string contains an illegal or unprintable character.");
                    close(v30);
                    return;
                }
                snprintf(&v4, 8, "%%%02X", (unsigned int)v45);
                *((char *)v44) = v4;
                *((char *)(v44 + 1)) = v5;
                *((char *)(v44 + 2)) = v6;
                v44 = &v10;
            }
        } while ((v24 += 1, v24 != v43));
    }
    v46 = v3;
    snprintf(&v13, 0x2000, "GET /%s/submitr.pl/?userid=%s&userpwd=%s&lab=%s&result=%s&submit=submit HTTP/1.0\r\n\r\n", (unsigned int)v1, (unsigned int)v2, v46, (unsigned int)a5, (unsigned int)&v10);
    v49 = strlen(&v13);
    if (v49)
    {
        do
        {
            v51 = v30;
            v52 = write(v30, &v13, v49);
            if (v52 <= 0)
            {
                if (*(__errno_location()) == 4)
                {
                    v52 = 0;
                }
                else
                {
                    strncpy(v25, "Error: Client unable to write to the server", 43);
                    close(v30);
                    return;
                }
            }
        } while ((v24 += 1, v24 != v43));
    }
    v14 = v30;
    v15 = 0;
    v16 = &v17;
    if (rio_readlineb(&v29, &v13, 0x2000) <= 0)
    {
        strncpy(v25, "Error: Client unable to read first header from server", 53);
        close(v30);
        return;
    }
    v53 = &v7;
    __isoc99_sscanf(&v13, "%s %d %[a-zA-z ]", (unsigned int)&v9, (unsigned int)&v8);
    v54 = v8;
    if (v54 != 200)
    {
        sprintf(v25, "Error: HTTP request failed with error %d: %s", v54, (unsigned int)&v7);
        close(v30);
        return;
    }
    while (true)
    {
        v55 = &v13;
        v56 = 3;
        v57 = "\r\n";
        while (v56)
        {
            v56 -= 1;
            tmp_8 = *((char *)v55);
            v58 = *((char *)v55);
            v59 = *((char *)v57);
            v57 += v41;
            v55 += v41;
            if ((char)tmp_8 == v59)
                continue;
            break;
        }
        if (!(v58 > v59) - (v58 < v59))
            break;
        if (rio_readlineb(&v29, &v13, 0x2000) <= 0)
        {
            strcpy(v25, "Error: Client unable to read headers from server");
            close(v30);
            return;
        }
    }
    if (rio_readlineb(&v29, &v13, 0x2000) <= 0)
    {
        strncpy(v25, "Error: Client unable to read status message from server", 55);
        close(v30);
        return;
    }
    strcpy(v25, &v13);
    close(v30);
    v60 = 3;
    v61 = "OK";
    v62 = v25;
    while (v60)
    {
        v60 -= 1;
        v63 = *((char *)v62);
        v64 = *((char *)v61);
        v61 += v41;
        v62 += v41;
        if (v63 == v64)
            continue;
        break;
    }
    return;
}

long long init_timeout(unsigned long a0)
{
    unsigned long v0;  // [bp-0x8]
    unsigned long v2;  // rax
    unsigned long v3;  // rbx

    if (!(unsigned int)a0)
        return v2;
    v0 = v3;
    signal(14, sigalrm_handler);
    if ((char)(a0 >> 31 & 1 ^ 1))
        return alarm(0);
    return alarm(0);
}

typedef struct struct_0 {
    char padding_0[20];
    unsigned int field_14;
    struct struct_1 *field_18;
} struct_0;

typedef struct struct_1 {
    void* field_0;
} struct_1;

long long init_driver(unsigned long a0)
{
    void* v0;  // [bp-0x28], Other Possible Types: unsigned short
    unsigned short v1;  // [bp-0x26]
    void* v2;  // [bp-0x20]
    unsigned int v4;  // edx
    unsigned int v5;  // esi
    unsigned int v6;  // edi
    unsigned long long v7;  // rax
    unsigned int v8;  // ebx
    struct_0 *v9;  // rax
    unsigned long long v10;  // rdx

    signal(13, 1);
    signal(29, 1);
    signal(29, 1);
    v4 = 0;
    v5 = 1;
    v6 = 2;
    (unsigned int)v7 = socket(2, 1, 0);
    if ((unsigned int)v7 < 0)
    {
        strncpy(*((unsigned long long *)&v6), "Error: Client un", 16);
        v10 = 8295742064141103715;
        strncpy(*((unsigned long long *)&v6) + 16, "able to create socket", 21);
        return 4294967295;
    }
    v8 = v7;
    v9 = gethostbyname("changeme.ii.uni.wroc.pl");
    if (!v9)
    {
        strcpy(*((unsigned long long *)&v6), "Error: DNS is unable to resolve server address");
        close(v8);
        return 4294967295;
    }
    v0 = 0;
    v2 = 0;
    v0 = 2;
    memmove(&v0, v9->field_18->field_0, v9->field_14);
    v1 = 28219;
    if (connect(v8, &v0, 16) >= 0)
    {
        close(v8);
        *((short *)*((unsigned long long *)&v6)) = 19279;
        *((char *)(*((unsigned long long *)&v6) + 2)) = 0;
        return 0;
    }
    sprintf(*((unsigned long long *)&v6), "Error: Unable to connect to server %s", &g_40346c);
    close(v8);
    return 4294967295;
}

typedef struct struct_0 {
    unsigned short field_0;
    char field_2;
} struct_0;

long long driver_post(char *a0, unsigned int a1, char *a2, unsigned long a3, struct_0 *a4)
{
    if ((unsigned int)a3)
    {
        printf("\nAUTORESULT_STRING=%s\n", (unsigned int)a2);
        a4->field_0 = 19279;
        a4->field_2 = 0;
        return 0;
    }
    if (a0 && *(a0))
        return (unsigned long long)submitr("changeme.ii.uni.wroc.pl", 15214, "csapp", a0, a1, "bomblab", a2, a4);
    a4->field_0 = 19279;
    a4->field_2 = 0;
    return a3;
}

long long __libc_csu_init(unsigned long long a0, unsigned long long a1, unsigned long long a2)
{
    unsigned long v1;  // rax, Other Possible Types: unsigned long long
    struct struct_0 **v2;  // rbx, Other Possible Types: unsigned long

    v1 = _init();
    if (false)
        return v1;
    v2 = 0;
    do
    {
        v1 = *((long long *)&(&__init_array_start)[8 * v2])(a0, a1, a2);
        v2 += 1;
    } while (v2 != 1);
    return v1;
}

long long __libc_csu_fini()
{
    unsigned long v1;  // rax

    return v1;
}

long long _fini()
{
    unsigned long v1;  // rax

    return v1;
}

