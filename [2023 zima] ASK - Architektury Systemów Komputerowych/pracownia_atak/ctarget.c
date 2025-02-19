extern struct_0 *g_404ff8;

void _init()
{
    if (g_404ff8)
        g_404ff8();
    return;
}

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

// No decompilation output for function sub_40126a

long long _dl_relocate_static_pie()
{
    unsigned long v1;  // rax

    return v1;
}

extern char __TMC_END__;

void deregister_tm_clones()
{
    if (true)
    {
        return;
    }
    else if (!(false))
    {
        return;
    }
}

long long register_tm_clones()
{
    if (true)
    {
        return 0;
    }
    else if (!(false))
    {
        return 0;
    }
}

extern char completed.0;

long long __do_global_dtors_aux()
{
    unsigned long v0;  // [bp-0x8]
    unsigned long v2;  // rax

    if (!completed.0)
    {
        *((int *)&v0) = rbp<8>;
        completed.0 = 1;
        return (unsigned long long)deregister_tm_clones();
    }
    return v2;
}

long long frame_dummy()
{
    return register_tm_clones();
}

extern unsigned int is_checker;

void usage(unsigned long a0)
{
    if (!is_checker)
    {
        printf("Usage: [-hq] %s -i <infile> \n", (unsigned int)a0);
        puts("  -h          Print help information");
        puts("  -q          Don't submit result to server");
        puts("  -i <infile> Input file");
    }
    else
    {
        printf("Usage: [-h] %s -i <infile> -a <authkey> -l <level>\n", (unsigned int)a0);
        puts("  -h           Print help information");
        puts("  -i <infile>  Input file");
        puts("  -a <authkey> Authentication key");
        puts("  -l <level>   Attack level");
    }
    exit(0); /* do not return */
}

extern unsigned int authkey;
extern unsigned long long buf_offset;
extern char check_level;
extern unsigned int cookie;
extern char host_table;
extern unsigned int is_checker;
extern unsigned int notify;
extern unsigned int target_id;
extern char target_prefix;

void initialize_target(unsigned long a0, unsigned long a1)
{
    char v0;  // [bp-0x2118]
    char v1;  // [bp-0x2018]
    unsigned long long v3;  // rbp
    void* v5;  // rax, Other Possible Types: unsigned long
    unsigned long long *v6;  // rax
    char *v7;  // rdi
    unsigned long long *v8;  // rbx, Other Possible Types: unsigned long
    unsigned long long *v9;  // rbp, Other Possible Types: unsigned long

    v3 = a1;
    *((unsigned int *)&check_level) = a0;
    cookie = gencookie(target_id);
    authkey = gencookie(cookie);
    srandom(target_id + 1);
    if (!(unsigned int)a1)
    {
        v5 = 0;
    }
    else
    {
        srandom(time(NULL));
        v5 = random();
    }
    buf_offset = (v5 + scramble(random())) * 8 + 0x100;
    target_prefix = 99;
    if (!notify)
    {
        return;
    }
    else if (is_checker)
    {
        return;
    }
    else
    {
        (unsigned int)v6 = gethostname(&v0, 0x100);
        v9 = v6;
        if ((unsigned int)v6)
        {
            puts("FAILED: Initialization error: Running on unknown host");
            exit(8); /* do not return */
        }
        v8 = v6;
        while (true)
        {
            v7 = *((long long *)&(&host_table)[8 * v8]);
            if (!v7)
                break;
            if (strcasecmp(v7, &v0))
            {
                v8 = (unsigned int)v8 + 1;
            }
            else
            {
                v9 = 1;
                break;
            }
        }
        if (!(unsigned int)v9)
        {
            printf("FAILED: Initialization error: Running on an illegal host [%s]\n", (unsigned int)&v0);
            exit(8); /* do not return */
        }
        else if (init_driver(&v1) >= 0)
        {
            return;
        }
        else
        {
            printf("FAILED: Initialization error:\n%s\n", (unsigned int)&v1);
            exit(8); /* do not return */
        }
    }
}

extern unsigned int authkey;
extern unsigned long long buf_offset;
extern unsigned int cookie;
extern unsigned long long infile;
extern unsigned int is_checker;
extern unsigned int notify;
extern char *optarg@GLIBC_2.2.5;
extern FILE_t *stderr@GLIBC_2.2.5;
extern unsigned long long stdin@GLIBC_2.2.5;

int main(unsigned long a0, char **a1)
{
    char *v1;  // r12, Other Possible Types: unsigned long
    unsigned long long v2;  // rax
    void* v4;  // r13, Other Possible Types: unsigned long
    unsigned int v5;  // r14d

    signal(11, seghandler);
    signal(7, bushandler);
    signal(4, illegalhandler);
    if (!is_checker)
    {
        v1 = "hqi:";
    }
    else
    {
        signal(14, sigalrmhandler);
        alarm(5);
        v1 = "hi:a:l:";
    }
    infile = stdin@GLIBC_2.2.5;
    v4 = 0;
    v5 = 0;
    while (true)
    {
        (unsigned int)v2 = getopt(a0, a1, v1);
        if ((char)v2 == 255)
            break;
        a1 = (char)v2;
        switch (v2)
        {
        case 97:
            v5 = (unsigned int)strtoul(optarg@GLIBC_2.2.5, NULL, 0x10);
            break;
        case 104:
            usage(*((long long *)a1)); /* do not return */
        case 105:
            infile = fopen(optarg@GLIBC_2.2.5, "r");
            if (!infile)
            {
                fprintf(stderr@GLIBC_2.2.5, "Cannot open input file '%s'\n", (unsigned int)optarg@GLIBC_2.2.5);
                return 1;
            }
            break;
        case 108:
            v4 = strtol(optarg@GLIBC_2.2.5, NULL, 10);
            break;
        case 113:
            notify = 0;
            break;
        default:
            printf("Unknown flag '%c'\n", a1);
            usage(*((long long *)a1)); /* do not return */
        }
    }
    initialize_target(v4, 0);
    if (is_checker && authkey != v5)
    {
        printf("Supplied authentication key 0x%x != target key\n", v5);
        check_fail(); /* do not return */
    }
    printf("Cookie: 0x%x\n", cookie);
    stable_launch(buf_offset);
    return 0;
}

long long sub_4016db()
{
}

typedef struct struct_0 {
    char field_0;
} struct_0;

int scramble(unsigned long a0)
{
    int <0x4016dd[is_1]|Stack bp-0x30, 1 B>;  // [bp-0x30]
    unsigned int v0;  // [bp-0x30]
    unsigned int v1;  // [bp-0x2c], Other Possible Types: char
    unsigned int v2;  // [bp-0x28], Other Possible Types: char
    unsigned int v3;  // [bp-0x24], Other Possible Types: char
    unsigned int v4;  // [bp-0x20], Other Possible Types: char
    unsigned int v5;  // [bp-0x1c], Other Possible Types: char
    unsigned int v6;  // [bp-0x18], Other Possible Types: char
    unsigned int v7;  // [bp-0x14], Other Possible Types: char
    unsigned int v8;  // [bp-0x10], Other Possible Types: char
    unsigned int v9;  // [bp-0xc], Other Possible Types: char
    struct_0 *v11;  // rax, Other Possible Types: unsigned long
    unsigned long v12;  // rax
    void* v13;  // rdx, Other Possible Types: unsigned long

    for (v11 = 0; (unsigned int)v11 <= 9; v11 = (unsigned int)v11 + 1)
    {
        *((unsigned int *)((char *)&<0x4016dd[is_1]|Stack bp-0x30, 1 B> + 4 * v11)) = (unsigned int)v11 * 50125 + (unsigned int)a0;
    }
    v4 = *((int *)&v4) * 48763;
    v7 = *((int *)&v7) * 14221;
    v3 = *((int *)&v3) * 1383;
    v2 = *((int *)&v2) * 62438;
    v4 *= 23267;
    v4 *= 51924;
    v7 *= 51876;
    v0 *= 24505;
    v1 = *((int *)&v1) * 41352;
    v5 = *((int *)&v5) * 27485;
    v0 *= 22754;
    v7 *= 2401;
    v7 *= 60855;
    v5 *= 23874;
    v2 *= 11102;
    v5 *= 34205;
    v6 = *((int *)&v6) * 20250;
    v3 *= 41096;
    v8 = *((int *)&v8) * 42723;
    v6 *= 19197;
    v6 *= 52535;
    v1 *= 20199;
    v6 *= 40351;
    v3 *= 60175;
    v7 *= 38177;
    v6 *= 61990;
    v7 *= 13843;
    v2 *= 14615;
    v5 *= 11959;
    v3 *= 58778;
    v9 = *((int *)&v9) * 60995;
    v5 *= 17390;
    v2 *= 10337;
    v8 *= 37342;
    v6 *= 30948;
    v5 *= 53514;
    v9 *= 62126;
    v5 *= 56823;
    v4 *= 52881;
    v7 *= 53108;
    v0 *= 8051;
    v2 *= 20919;
    v0 *= 48418;
    v3 *= 31057;
    v5 *= 8488;
    v5 *= 17902;
    v8 *= 51746;
    v1 *= 19657;
    v9 *= 28242;
    v4 *= 49607;
    v7 *= 48003;
    v9 *= 11602;
    v1 *= 45763;
    v6 *= 15998;
    v6 *= 54351;
    v9 *= 58631;
    v8 *= 53133;
    v5 *= 18761;
    v8 *= 49549;
    v7 *= 30856;
    v8 *= 8581;
    v7 *= 61984;
    v5 *= 18514;
    v8 *= 56874;
    v3 *= 7569;
    v4 *= 40410;
    v4 *= 12995;
    v0 *= 34630;
    v0 *= 54901;
    v1 *= 26330;
    v0 *= 54199;
    v6 *= 40584;
    v3 *= 33440;
    v12 = 0;
    for (v13 = 0; (unsigned int)v12 <= 9; v12 = (unsigned int)v12 + 1)
    {
        v13 += *((int *)((char *)&<0x4016dd[is_1]|Stack bp-0x30, 1 B> + 4 * v12));
    }
    return v13;
}

int getbuf()
{
    char v0;  // [bp-0x28]

    Gets(&v0);
    return 1;
}

extern unsigned int vlevel;

long long touch1()
{
    vlevel = 1;
    puts("Touch1!: You called touch1()");
    validate(1);
    exit(0); /* do not return */
}

extern unsigned int cookie;
extern unsigned int vlevel;

long long touch2(unsigned long a0)
{
    vlevel = 2;
    if (cookie == (unsigned int)a0)
    {
        printf("Touch2!: You called touch2(0x%.8x)\n", (unsigned int)a0);
        validate(2);
    }
    else
    {
        printf("Misfire: You called touch2(0x%.8x)\n", (unsigned int)a0);
        fail(2);
    }
    exit(0); /* do not return */
}

int hexmatch(unsigned long a0, char *a1)
{
    char v0;  // [bp-0x88]
    unsigned long long v2;  // rax
    unsigned long long v3;  // rcx
    unsigned long long v4;  // rax

    v2 = random();
    v3 = v2;
    v4 = (((v2 * 11805916207174113035 >> 64) + v2 >> 6) - (v2 >> 63)) * 5;
    sprintf(&(&v0)[v3 + -20 * v4], "%.8x", (unsigned int)a0);
    return !strncmp(a1, &(&v0)[v3 + -20 * v4], 9);
}

extern unsigned int cookie;
extern unsigned int vlevel;

long long touch3(char *a0)
{
    unsigned long v0;  // [bp-0x8]
    unsigned long v2;  // rbx
    unsigned int v3;  // ebx

    v0 = v2;
    v3 = (unsigned int)a0;
    vlevel = 3;
    if (!hexmatch(cookie, a0))
    {
        printf("Misfire: You called touch3(\"%s\")\n", v3);
        fail(3);
    }
    else
    {
        printf("Touch3!: You called touch3(\"%s\")\n", v3);
        validate(3);
    }
    exit(0); /* do not return */
}

void test()
{
    printf("No exploit.  Getbuf returned 0x%x\n", getbuf());
    return;
}

extern char gets_buf;
extern unsigned int gets_cnt;

void save_char(unsigned long a0)
{
    unsigned long long v1;  // rcx
    char *v2;  // rdx
    char *v3;  // rcx

    if (gets_cnt <= 1023)
    {
        v1 = a0;
        *((char *)&v1) = (char)v1 >> 4;
        v2 = gets_cnt * 3;
        v3 = (unsigned int)v1 & 15;
        *((char *)(&gets_buf + v2)) = *((char *)("0123456789ABCDEFProgram timed out after %d seconds\n" + v3));
        *((char *)(&gets_buf + v2 + 1)) = *((char *)(4208176 + ((unsigned int)a0 & 15)));
        *((char *)(2 + &gets_buf + v2)) = 32;
        gets_cnt = gets_cnt + 1;
    }
    return;
}

extern char gets_buf;
extern unsigned int gets_cnt;

void save_term()
{
    (&gets_buf)[3 * gets_cnt] = 0;
    return;
}

extern unsigned int check_level;
extern char gets_buf;
extern char target_prefix;

void check_fail()
{
    printf("\nFAIL\t%ctarget\t%d\t%s\n", target_prefix, check_level, &gets_buf);
    exit(1); /* do not return */
}

extern unsigned int gets_cnt;
extern FILE_t *infile;

void Gets(char *a0)
{
    char *v1;  // rbx, Other Possible Types: unsigned long
    unsigned long long v2;  // rax
    char *v3;  // rbp

    gets_cnt = 0;
    v1 = a0;
    while (true)
    {
        (unsigned int)v2 = getc(infile);
        if (!((unsigned int)v2 != -1) || !((unsigned int)v2 != 10))
            break;
        v3 = v1 + 1;
        *((char *)v1) = v2;
        save_char((char)v2);
        v1 = v3;
    }
    *((char *)v1) = 0;
    save_term();
    return;
}

extern unsigned int authkey;
extern char gets_buf;
extern unsigned int gets_cnt;
extern unsigned int is_checker;
extern unsigned int notify;
extern unsigned int target_id;
extern char target_prefix;

void notify_server(unsigned long a0, unsigned long a1)
{
    char v0;  // [bp-0x2008]
    unsigned long v1;  // [bp-0x8]
    unsigned long v3;  // rbx
    char *v5;  // rbx
    unsigned long long v6;  // rbx

    if (is_checker)
        return;
    v1 = v3;
    if (gets_cnt <= 8092)
    {
        v5 = (!(unsigned int)a0 ? "PASS" : "FAIL");
        sprintf(&v0, "%d:%s:0x%.8x:%ctarget:%d:%s", target_id, (unsigned int)v5, (!notify ? authkey : -1), target_prefix, (unsigned int)a1, &gets_buf);
        puts(v5);
        v6 = v1;
        return;
    }
    printf("Internal Error: Input string is too large.");
    exit(1); /* do not return */
}

extern unsigned int check_level;
extern char gets_buf;
extern unsigned int is_checker;
extern char target_prefix;
extern unsigned int vlevel;

void validate(unsigned int a0)
{
    if (is_checker)
    {
        if (vlevel != a0)
        {
            puts("\nMismatched validation levels");
            check_fail(); /* do not return */
        }
        else if (check_level != a0)
        {
            printf("\nCheck level %d != attack level %d\n", check_level, a0);
            check_fail(); /* do not return */
        }
        else
        {
            printf("PASS\t%ctarget\t%d\t%s\n", target_prefix, a0, &gets_buf);
            return;
        }
    }
    else
    {
        if (vlevel != a0)
        {
            puts("\nMismatched validation levels");
            notify_server(0, a0);
            return;
        }
        printf("Valid solution for level %d with target %ctarget\n", a0, target_prefix);
        notify_server(1, a0);
        return;
    }
}

extern unsigned int is_checker;

void fail(unsigned int a0)
{
    if (!is_checker)
    {
        notify_server(0, a0);
        return;
    }
    check_fail(); /* do not return */
}

extern unsigned int is_checker;

long long bushandler()
{
    if (!is_checker)
    {
        puts("Crash!: You caused a bus error!");
        puts("Better luck next time");
        notify_server(0, 0);
        exit(1); /* do not return */
    }
    puts("Bus error");
    check_fail(); /* do not return */
}

extern unsigned int is_checker;

long long seghandler()
{
    if (!is_checker)
    {
        puts("Ouch!: You caused a segmentation fault!");
        puts("Better luck next time");
        notify_server(0, 0);
        exit(1); /* do not return */
    }
    puts("Segmentation Fault");
    check_fail(); /* do not return */
}

extern unsigned int is_checker;

long long illegalhandler()
{
    if (!is_checker)
    {
        puts("Oops!: You executed an illegal instruction");
        puts("Better luck next time");
        notify_server(0, 0);
        exit(1); /* do not return */
    }
    puts("Illegal instruction");
    check_fail(); /* do not return */
}

extern unsigned int is_checker;

long long sigalrmhandler()
{
    if (!is_checker)
    {
        printf("\nTimeout!: Your attack takes more than %d seconds\n", 5);
        notify_server(0, 0);
        exit(1); /* do not return */
    }
    puts("Timeout");
    check_fail(); /* do not return */
}

extern char g_4020b5;
extern unsigned long long infile;
extern unsigned int is_checker;
extern unsigned long long stdin@GLIBC_2.2.5;
extern unsigned int vlevel;

void launch(unsigned int a0)
{
    char v0;  // [bp-0x10]
    char v1;  // [bp+0x7]
    unsigned long long v3;  // rax

    v3 = a0 + 23 & -0x10;
    *((char **)&(&v0)[-1 * v3]) = &g_4020b5;
    memset(&(&v1)[-1 * v3] & -0x10, 244, a0);
    if (infile == stdin@GLIBC_2.2.5)
        printf("Type string:");
    vlevel = 0;
    test();
    if (is_checker)
    {
        puts("No exploit");
        check_fail(); /* do not return */
    }
    puts("Normal return");
    return;
}

extern char g_40217b;
extern char g_402192;
extern unsigned long long global_offset;
extern struct_1 *global_save_stack;
extern struct_0 *stack_top;
extern FILE_t *stderr@GLIBC_2.2.5;

void stable_launch(unsigned long a0)
{
    unsigned long v0;  // [bp-0x8]
    char v1;  // [bp+0x0]
    unsigned long v3;  // rbx
    void* v4;  // rax
    unsigned long long v5;  // rbx

    v0 = v3;
    global_offset = a0;
    v4 = mmap(0x55586000, 0x100000, 7, 306, 0, 0);
    if (v4 != 0x55586000)
    {
        munmap(v4, 0x100000);
        fprintf(stderr@GLIBC_2.2.5, "Couldn't map stack to segment at 0x%lx\n", 0x55586000);
        exit(1); /* do not return */
    }
    stack_top = &v4[1048568];
    global_save_stack = &v0;
    stack_top[1].field_-8 = &g_40217b;
    launch(global_offset);
    *((char **)&global_save_stack->field_0) = &g_402192;
    munmap(v4, 0x100000);
    v5 = *((long long *)&v1);
    return;
}

typedef struct struct_0 {
    unsigned int field_0;
    unsigned int field_4;
    unsigned long long field_8;
} struct_0;

void rio_readinitb(struct_0 *a0, unsigned long a1)
{
    a0->field_0 = a1;
    a0->field_4 = 0;
    a0->field_8 = a0 + 1;
    return;
}

extern FILE_t *stderr@GLIBC_2.2.5;

long long sigalrm_handler()
{
    fprintf(stderr@GLIBC_2.2.5, "Program timed out after %d seconds\n", 0);
    exit(1); /* do not return */
}

int urlencode(char *a0, char a1[3])
{
    char v0;  // [bp-0x20]
    char v1;  // [bp-0x1f]
    char v2;  // [bp-0x1e]
    char *v4;  // rbx, Other Possible Types: unsigned long
    char v5[3];  // rbp, Other Possible Types: unsigned long long, unsigned long
    unsigned long long v6;  // rdx
    unsigned long v7;  // rax, Other Possible Types: unsigned int

    v4 = a0;
    v5 = a1;
    v7 = strlen(a0);
    for (; (unsigned int)v7; v7 -= 1)
    {
        v6 = *((char *)v4);
        if ((char)v6 == 42 || (char)v6 == 45 || (char)v6 == 46 || (char)v6 == 95 || v6 - 48 <= 9 || v6 - 65 <= 25 || v6 - 97 <= 25)
        {
            *((char *)v5) = v6;
            v5 += 1;
        }
        else if ((char)v6 == 32)
        {
            *((char *)v5) = 43;
            v5 += 1;
        }
        else if (!(v6 - 32 > 95) || !((char)v6 != 9))
        {
            sprintf(&v0, "%%%02X", (unsigned int)v6);
            *((char *)v5) = v0;
            *((char *)(v5 + 1)) = v1;
            *((char *)(v5 + 2)) = v2;
            v5 += 3;
        }
        else
        {
            return -1;
        }
        v4 += 1;
    }
    return v7;
}

int rio_writen(unsigned long a0, unsigned long a1, unsigned long a2)
{
    unsigned long v1;  // rbp, Other Possible Types: unsigned long long
    unsigned long v2;  // rbx, Other Possible Types: unsigned long long
    void* v3;  // rsi
    void* v4;  // rax, Other Possible Types: unsigned long

    v1 = a1;
    v2 = a2;
    while (true)
    {
        if (v2)
        {
            a2 = v2;
            v3 = v1;
            v4 = write(a0, v3, a2);
            if (v4 <= 0)
            {
                if (*(__errno_location()) == 4)
                    v4 = 0;
                else
                    return -1;
            }
            v2 -= v4;
            v1 += v4;
        }
        else
        {
            return a2;
        }
    }
}

typedef struct struct_0 {
    unsigned int field_0;
    unsigned int field_4;
    void* field_8;
} struct_0;

int rio_read(struct_0 *a0, void* a1, unsigned long a2)
{
    unsigned long v1;  // rbp
    void* v2;  // rbp
    unsigned long long v3;  // rax
    unsigned int v4;  // eax

    while (true)
    {
        v1 = a0->field_4;
        if ((unsigned int)v1 > 0)
            break;
        v2 = a0 + 1;
        (unsigned int)v3 = read(a0->field_0, v2, 0x2000);
        a0->field_4 = v3;
        if ((unsigned int)v3 < 0)
        {
            if (*(__errno_location()) != 4)
                return -1;
        }
        else
        {
            if ((unsigned int)v3)
                a0->field_8 = v2;
            else
                return 0;
        }
    }
    if (v1 >= a2)
        v1 = a2;
    memcpy(a1, a0->field_8, v1);
    a0->field_8 = a0->field_8 + v1;
    a0->field_4 = a0->field_4 - (unsigned int)v1;
    v4 = v1;
    return v4;
}

int rio_readlineb(void* a0, char *a1, unsigned long a2)
{
    char v0;  // [bp-0x29]
    char *v2;  // rbp, Other Possible Types: unsigned long
    unsigned long long v4;  // rax
    char *v5;  // rdx
    char v6;  // al
    unsigned long v8;  // rbx, Other Possible Types: unsigned long long

    v2 = a1;
    for (v8 = 1; v8 < a2; v2 = v5)
    {
        (unsigned int)v4 = rio_read(a0, &v0, 1);
        if ((unsigned int)v4 != 1)
        {
            if ((unsigned int)v4)
            {
                return -1;
            }
            else if (v8 == 1)
            {
                return 0;
            }
            break;
        }
        v5 = v2 + 1;
        v6 = v0;
        *((char *)v2) = v6;
        if (v6 == 10)
        {
            v2 = v5;
            break;
        }
        else
        {
            v8 += 1;
        }
    }
    *((char *)v2) = 0;
    return v8;
}

typedef struct struct_1 {
    char padding_0[20];
    unsigned int field_14;
    struct struct_2 *field_18;
} struct_1;

typedef struct struct_0 {
    char field_0;
} struct_0;

typedef struct struct_2 {
    void* field_0;
} struct_2;

void submitr(unsigned long a0, unsigned long a1, unsigned long a2, unsigned long a3, unsigned long a4, char *a5, char *v12)
{
    char *v0;  // [bp-0xa080]
    int tmp_8;  // tmp #8
    unsigned long v1;  // [bp-0xa078], Other Possible Types: unsigned int
    char *v2;  // [bp-0xa070]
    char v3;  // [bp-0xa068]
    unsigned int v4;  // [bp-0x805c]
    char v5;  // [bp-0x8058]
    char v6[3];  // [bp-0x6058]
    char v7;  // [bp-0x4058]
    char v8;  // [bp-0x2058]
    void* v9;  // [bp-0x48], Other Possible Types: unsigned short
    unsigned short v10;  // [bp-0x46]
    void* v11;  // [bp-0x40]
    char *v13;  // r12
    char *v14;  // r14
    char *v15;  // rbp
    unsigned int v16;  // edx
    unsigned int v17;  // esi
    unsigned int v18;  // edi
    unsigned long long v19;  // rax
    unsigned long v20;  // rbx
    struct_1 *v21;  // rax
    unsigned long long v22;  // rdx
    unsigned int v23;  // edx
    struct_0 *v27;  // rsi
    unsigned long v28;  // rcx, Other Possible Types: unsigned long long
    struct_0 *v29;  // rdi, Other Possible Types: unsigned long
    unsigned long v30;  // d
    unsigned int v32;  // r8d
    struct_0 *v34;  // r8
    struct_0 *v35;  // rsi, Other Possible Types: unsigned long
    unsigned long v36;  // rcx, Other Possible Types: unsigned long long
    char *v37;  // rdi, Other Possible Types: unsigned long
    char v38;  // cc_dep1
    char v39;  // cc_dep2
    unsigned int v40;  // edx
    unsigned long v41;  // rcx, Other Possible Types: unsigned long long
    char *v42;  // rdi, Other Possible Types: unsigned long
    char *v43;  // rsi, Other Possible Types: unsigned long
    char v44;  // cc_dep1
    char v45;  // cc_dep2
    unsigned long v46;  // rcx, Other Possible Types: unsigned long long
    char *v47;  // rdi, Other Possible Types: unsigned long
    char *v48;  // rsi, Other Possible Types: unsigned long
    char v49;  // cc_dep1
    char v50;  // cc_dep2
    unsigned long v51;  // rcx, Other Possible Types: unsigned long long
    char *v52;  // rdi, Other Possible Types: unsigned long
    char *v53;  // rsi, Other Possible Types: unsigned long
    char v54;  // cc_dep1
    char v55;  // cc_dep2

    v13 = a0;
    v1 = a1;
    v14 = a2;
    v0 = a3;
    v2 = a4;
    v15 = v12;
    v4 = 0;
    v16 = 0;
    v17 = 1;
    v18 = 2;
    (unsigned int)v19 = socket(2, 1, 0);
    if ((unsigned int)v19 < 0)
    {
        strncpy(v15, "Error: Client un", 16);
        v22 = 8295742064141103715;
        strncpy(v15 + 16, "able to create socket", 21);
        return;
    }
    v20 = v19;
    v21 = gethostbyname(v13);
    if (!v21)
    {
        strcpy(v15, "Error: DNS is unable to resolve server address");
        close(v20);
        return;
    }
    v9 = 0;
    v11 = 0;
    v9 = 2;
    memmove(&v9, v21->field_18->field_0, v21->field_14);
    v10 = __ROL__((short)v1, 8);
    v23 = 16;
    if (connect(v20, &v9, 16) < 0)
    {
        strcpy(v15, "Error: Unable to connect to the server");
        close(v20);
        return;
    }
    v1 = strlen(v14);
    v1 = strlen(v0) + v1;
    if (strlen(v2) + v1 + strlen(a5) * 3 + 128 > 0x2000)
    {
        strncpy(v15, "Error: Result string too large. Increase SUBMITR_MAXBUF", 55);
        close(v20);
        return;
    }
    v27 = v6;
    v28 = 0x400;
    for (v29 = v6; v28; v29 += v30 * 8)
    {
        v28 -= 1;
        *((long long *)v29) = 0;
    }
    if (urlencode(a5, v6) < 0)
    {
        strcpy(v15, "Error: Result string contains an illegal or unprintable character.");
        close(v20);
        return;
    }
    v32 = (unsigned int)v6;
    sprintf(&v7, "GET /submit?user=%s&course=%s&result=%s HTTP/1.0\r\nHost: %s\r\n\r\n", (unsigned int)v0, (unsigned int)v14, (unsigned int)v6, (unsigned int)v13);
    if (rio_writen(v20, &v7, strlen(&v7)) < 0)
    {
        strcpy(v15, "Error: Client unable to write to the result server");
        close(v20);
        return;
    }
    rio_readinitb(&v8, v20);
    if (rio_readlineb(&v8, &v7, 0x2000) <= 0)
    {
        strcpy(v15, "Error: Client unable to read first header from result server");
        close(v20);
        return;
    }
    v34 = &v3;
    __isoc99_sscanf(&v7, "%s %d %[a-zA-z ]", (unsigned int)&v5, (unsigned int)&v4);
    while (true)
    {
        v35 = &v7;
        v36 = 3;
        v37 = "\r\n";
        while (v36)
        {
            v36 -= 1;
            tmp_8 = *((char *)v35);
            v38 = *((char *)v35);
            v39 = *((char *)v37);
            v37 += v30;
            v35 += v30;
            if ((char)tmp_8 == v39)
                continue;
            break;
        }
        if (!(v38 > v39) - (v38 < v39))
            break;
        if (rio_readlineb(&v8, &v7, 0x2000) <= 0)
        {
            strncpy(v15, "Error: Client unable to read headers from the result server", 59);
            close(v20);
            return;
        }
    }
    if (rio_readlineb(&v8, &v7, 0x2000) <= 0)
    {
        strcpy(v15, "Error: Client unable to read status message from result server");
        close(v20);
        return;
    }
    v40 = v4;
    if (v40 != 200)
    {
        sprintf(v15, "Error: HTTP request failed with error %d: %s", v40, (unsigned int)&v3);
        close(v20);
        return;
    }
    strcpy(v15, &v7);
    close(v20);
    v41 = 4;
    v42 = "OK\n";
    v43 = v15;
    while (v41)
    {
        v41 -= 1;
        v44 = *((char *)v43);
        v45 = *((char *)v42);
        v42 += v30;
        v43 += v30;
        if (v38 == v39)
            continue;
        break;
    }
    if (!(v38 > v39) - (v38 < v39))
        return;
    v46 = 5;
    v47 = "OK\r\n";
    v48 = v15;
    while (v46)
    {
        v46 -= 1;
        v49 = *((char *)v48);
        v50 = *((char *)v47);
        v47 += v30;
        v48 += v30;
        if (v38 == v39)
            continue;
        break;
    }
    if (!(v38 > v39) - (v38 < v39))
        return;
    v51 = 3;
    v52 = "OK";
    v53 = v15;
    while (v51)
    {
        v51 -= 1;
        v54 = *((char *)v53);
        v55 = *((char *)v52);
        v52 += v30;
        v53 += v30;
        if (v38 == v39)
            continue;
        break;
    }
    return;
}

long long init_timeout(unsigned long a0)
{
    unsigned long v0;  // [bp-0x8]
    unsigned long v2;  // rbx
    unsigned int v3;  // ebx
    unsigned long v4;  // rax
    unsigned long long v5;  // rax

    if (!(unsigned int)a0)
        return v4;
    v0 = v2;
    v3 = a0;
    if ((unsigned int)a0 >= 0)
    {
        signal(14, sigalrm_handler);
        (unsigned int)v5 = alarm(v3);
        return v5;
    }
    v3 = 0;
}

typedef struct struct_0 {
    char padding_0[20];
    unsigned int field_14;
    struct struct_1 *field_18;
} struct_0;

typedef struct struct_1 {
    void* field_0;
} struct_1;

int init_driver(unsigned long a0)
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
    unsigned int v11;  // edx
    unsigned short *v12;  // edi

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
        return -1;
    }
    v8 = v7;
    v9 = gethostbyname("changeme.yourschool.edu");
    if (!v9)
    {
        strcpy(*((unsigned long long *)&v6), "Error: DNS is unable to resolve server address");
        close(v8);
        return -1;
    }
    v0 = 0;
    v2 = 0;
    v0 = 2;
    memmove(&v0, v9->field_18->field_0, v9->field_14);
    v1 = 39484;
    v11 = 16;
    v12 = v8;
    if (connect(v8, &v0, 16) >= 0)
    {
        close(v8);
        *((short *)*((unsigned long long *)&v6)) = 19279;
        *((char *)(*((unsigned long long *)&v6) + 2)) = 0;
        return 0;
    }
    strncpy(*((unsigned long long *)&v6), "changeme.yourschool.edu", 23);
    strcpy(*((unsigned long long *)&v6), "Error: Unable to connect to server");
    close(v8);
    return -1;
}

typedef struct struct_0 {
    unsigned short field_0;
    char field_2;
} struct_0;

long long driver_post(char *a0, unsigned int a1, unsigned int a2, char *a3, unsigned long a4, struct_0 *a5)
{
    if ((unsigned int)a4)
    {
        printf("\nAUTORESULT_STRING=%s\n", (unsigned int)a3);
        a5->field_0 = 19279;
        a5->field_2 = 0;
        return 0;
    }
    if (a0 && *(a0))
        return (unsigned long long)submitr("changeme.yourschool.edu", 15514, a1, a0, a2, a3, a5);
    a5->field_0 = 19279;
    a5->field_2 = 0;
    return a4;
}

int check(unsigned long a0)
{
    void* v1;  // rcx, Other Possible Types: unsigned long

    if (!(unsigned int)(a0 >> 28))
        return 0;
    for (v1 = 0; (unsigned int)v1 <= 31; v1 = (unsigned int)v1 + 8)
    {
        if ((char)(a0 >> ((char)v1 & 31)) == 10)
            return 0;
    }
    return 1;
}

int gencookie(unsigned long a0)
{
    unsigned long v1;  // rax

    srandom((unsigned int)a0 + 1);
    do
    {
        v1 = random();
    } while (!check(v1));
    return v1;
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

