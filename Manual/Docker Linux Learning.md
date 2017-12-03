# Docker Debian 使用学习

##### 进入

```
docker start ics-vm
```

```
ssh -X -p 20022 Manfred@127.0.0.1
```

##### 退出

```
exit
```

```
docker stop ics-vm
```

##### 拷贝文件

拷入docker：

```
scp -P 20022 name.suffix Manfred@127.0.0.1:/home/Manfred
```

拷出

```
scp -P 20022 Manfred@127.0.0.1:/home/Manfred/name.suffix .
```

##### 安装/卸载软件

```
sudo apt-get install xxx
```

```
sudo apt-get --purge remove xxx
```

##### 搜索字符串

```
grep -r 'xxx'
```

##### 中文显示

```
sudo apt-get install ttf-wqy-microhei	# 获取字体
sudo apt-get install locales			# 安装locales
sudo dpkg-reconfigure locales			# 设置系统的语言，选择zh_CN.UTF-8并设为默认即可
```



### Git使用与Github

1. 初始化：

```
git init 	# 在本地创建
git remote add origin git@github.com:yourName/yourRepo.git

git clone https://github.com/ManfredZhang/Programs.git	# 从Github克隆
```

2. 查看状态与操作记录

```
git status
git log
```

3. Add(ready to be committed) & Commiting 

```
git add hello.c
git add '*.c'
git add .

git commit -m "what have I done"
git commit --allow-empty	
# The --allow-empty option is necessary, because usually the change is already committed by development tracing system. Without this option, git will reject no-change commits. If the commit succeeds, you can see a log labeled with your student ID and name by
```

4. 将本地内容推送到Github

```
git push -u origin master
git push
```

5. 从Github上更新本地内容

```
git pull origin master
git pull
```

6. 查看更改出的不同处

```
git diff
git diff HEAD
git diff --staged  #查看已add未commit的不同处
```

7. Reset：从已add未commit的状态（staged）取消，但保留本地更改

```
git reset staged_file.c
```

8. Checkout/reset：回到某个commit之前的状态

```
git checkout -- octocat.txt		# Go ahead and get rid of all the changes since the last commit for octocat.txt
git reset --hard 0e56174834		# 0e56174834是从git log中找到想要回到的版本
```

9. 创建-查看-进入-(修改后)合并-删除分支

```
git branch clean_up		# 分支名为clean_up
git branch			   	# 查看所有分支
git checkout clean-up	# 进入clean_up分支

git checkout master
git merge clean_up		# 合并到master分支

git branch -d clean_up	# 删除clean_up分支
```







在~目录下新建.bash_profile文件，在其中用cd命令进入指定的目录。

我当前的.bash_profile文件：

eval $(/usr/libexec/path_helper -s)

cd Desktop/Programs/Going

\##

\# Your previous /Users/apple/.bash_profile file was backed up as /Users/apple/.bash_profile.macports-saved_2017-04-08_at_18:48:58

\##

\# MacPorts Installer addition on 2017-04-08_at_18:48:58: adding an appropriate PATH variable for use with MacPorts.

export PATH="/opt/local/bin:/opt/local/sbin:$PATH"

\# Finished adapting your PATH environment variable for use with MacPorts.

​