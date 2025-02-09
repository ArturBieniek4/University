bool my_access(struct stat *sb, int mode)
{
    if(mode==F_OK) return true; // sprawdzenie czy plik istnieje, nie wymaga żadnych uprawnień, skoro dostaliśmy stata na nim to istnieje
    if(geteuid()==0) return true; // root może wszystko
    int uid=sb->st_uid;
    int gid=sb->st_gid;
    mode_t m = sb->st_mode;
    bool r,w,x;
    //user
    if(uid==geteuid())
    {
        r = (m & S_IRUSR);
        w = (m & S_IWUSR);
        x = (m & S_IXUSR);
        r=(!(mode&R_OK)) || r;
        w=(!(mode&W_OK)) || w;
        x=(!(mode&X_OK)) || x;
        return r&&w&&x;
    }

    //trzeba sprawdzić po kolei wszystkie grupy naszego usera
    gid_t *groups = NULL;

    int groups_n;

    *uid_p = getuid();
    *gid_p = getgid();

    groups_n = 0;
    
    int ngroups = getgroups(0, NULL);
    while (ngroups > groups_n) {
      groups=realloc(groups, ngroups);
      groups_n=ngroups;
      ngroups = getgroups(groups_n, groups);
    }

    //group
    for (int i = 0; i < groups_n; ++i)
    {
      if (gid == groups[i])
      {
        r = (m & S_IRGRP);
        w = (m & S_IWGRP);
        x = (m & S_IXGRP);
        r=(!(mode&R_OK)) || r;
        w=(!(mode&W_OK)) || w;
        x=(!(mode&X_OK)) || x;
        return r&&w&&x;
      }
    }

    //others
    else
    {
        r = (m & S_IROTH);
        w = (m & S_IWOTH);
        x = (m & S_IXOTH);
    }
    r=(!(mode&R_OK)) || r;
    w=(!(mode&W_OK)) || w;
    x=(!(mode&X_OK)) || x;
    return r&&w&&x;
}