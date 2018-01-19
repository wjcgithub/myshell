1. 查看某段版本之间内某人修改的文件历史（不包括删除的文件），并用树型结构展示

帮助命令: `./svn_log.sh`

Version: 0.0.1
Usage:
    1) 拷贝指定的用户USERNANE在版本REV_FROM到REV_TO之间所修改和添加的文件到指定目录DST_DIR
        svn_log -m REV_FROM REV_TO DST_DIR USERNAME

`./svn_log.sh -m 1233 HEAD tree_dir wangjichao`
- 查看1233版本到当前HEAD之间wangjichao修改的文件，并存入diff目录

![image](https://github.com/wjcgithub/myshell/blob/master/tools/svn/img/diff.png)


2. 将某个目录的文件按照自定义规则展示出来

`python3 find_file_toshow.py path/to/diff`

![image](https://github.com/wjcgithub/myshell/blob/master/tools/svn/img/svn.png)


