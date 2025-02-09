/* See LICENSE file for copyright and license details. */
#include <sys/types.h>

#include <errno.h>
#include <grp.h>
#include <pwd.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#include "passwd.h"
#include "util.h"

extern char **environ;

static int lflag = 0;
static int pflag = 0;

static void
usage(void)
{
	eprintf("usage: %s [-lp] [username]\n", argv0);
}

int
main(int argc, char *argv[])
{
	char *usr, *pass;
	char *shell, *envshell, *term;
	struct passwd *pw;
	char *newargv[3];
	uid_t uid;

	ARGBEGIN {
	case 'l':
		lflag = 1;
		break;
	case 'p':
		pflag = 1;
		break;
	default:
		usage();
	} ARGEND;

	if (argc > 1)
		usage();
	usr = argc > 0 ? argv[0] : "root";

	errno = 0;
	pw = getpwnam(usr); // dane usera
	if (!pw) {
		if (errno)
			eprintf("getpwnam: %s:", usr);
		else
			eprintf("who are you?\n");
	}

	uid = getuid();
	if (uid) {
		pass = getpass("Password: "); // wyłącza echo i pobiera hasło, obsolete funkcja
		if (!pass)
			eprintf("getpass:");
		if (pw_check(pw, pass) <= 0) // sprawdza hasło
			exit(1);
	}
	//ustawia użytkownikowi uid, gid i grupy
	if (initgroups(usr, pw->pw_gid) < 0)
		eprintf("initgroups:");
	if (setgid(pw->pw_gid) < 0)
		eprintf("setgid:");
	if (setuid(pw->pw_uid) < 0)
		eprintf("setuid:");
	//uruchamia shella
	shell = pw->pw_shell[0] == '\0' ? "/bin/sh" : pw->pw_shell;
	if (lflag) {
		//environment
		term = getenv("TERM");
		clearenv();
		setenv("HOME", pw->pw_dir, 1);
		setenv("SHELL", shell, 1);
		setenv("USER", pw->pw_name, 1);
		setenv("LOGNAME", pw->pw_name, 1);
		setenv("TERM", term ? term : "linux", 1);
		if (chdir(pw->pw_dir) < 0)
			eprintf("chdir %s:", pw->pw_dir);
		newargv[0] = shell;
		newargv[1] = "-l";
		newargv[2] = NULL;
	} else {
		// nie zmienia env
		if (pflag) {
			envshell = getenv("SHELL");
			if (envshell && envshell[0] != '\0')
				shell = envshell;
		} else {
			setenv("HOME", pw->pw_dir, 1);
			setenv("SHELL", shell, 1);
			if (strcmp(pw->pw_name, "root") != 0) {
				setenv("USER", pw->pw_name, 1);
				setenv("LOGNAME", pw->pw_name, 1);
			}
		}
		newargv[0] = shell;
		newargv[1] = NULL;
	}
	execve(shell, newargv, environ);
	weprintf("execve %s:", shell);
	return (errno == ENOENT) ? 127 : 126;
}
