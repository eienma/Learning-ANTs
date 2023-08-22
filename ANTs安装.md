# ANTs 安装

系统：Win10 + WSL2 + Ubuntu20.04

## 配置前置安装环境

### 更新源

`sudo apt-get update`

### 安装开发环境

`sudo apt-get install -y build-essential`

否则会出现如下报错：

```
No CMAKE_CXX_COMPILER could be found.

Tell CMake where to find the compiler by setting either the environment
variable “CXX” or the CMake cache entry CMAKE_CXX_COMPILER to the full path
to the compiler, or to the compiler name if it is in the PATH.
```

### 安装git

`sudo apt-get install git`

### 安装 cmake 与 ccmake

`sudo apt-get install cmake	#安装cmake` 
`sudo apt-get install cmake-curses-gui # 安装ccmake （cmake的一个gui包`

可以查看版本：

`cmake --version`
`ccmake --version`

### 安装zlib

`sudo apt-get -y install zlib1g-dev`

## 安装ANTs

`cd ~`

`git clone https://github.com/ANTsX/ANTs.git`

`mkdir antsbin`

`cd antsbin`

`ccmake ../ANTs`

出现界面后，按'c'，不出现报错的话按'g'，回到命令行。

`make -j 2 2>&1 | tee build.log`

`make`

成功后输出：

```
[100%] Built target ANTS
```

`cd ANTS-build/`

`sudo make install 2>&1 | tee install.log`

此处如果仅`make install 2>&1 | tee install.log`，会出现如下错误：

```
CMake Error at Examples/cmake_install.cmake:41 (file):
  file INSTALL cannot set permissions on "/opt/ANTs/lib/libantsUtilities.a":
  Operation not permitted.
Call Stack (most recent call first):
  cmake_install.cmake:42 (include)


make: *** [Makefile:140: install] Error 1
```

完成后，添加环境变量：

`vi ~/.bashrc`

键盘输入'i'，在文件末尾输入：

`export ANTSPATH=/opt/ANTs/bin`

`export PATH=$ANTSPATH:$PATH`

输入'ESC'，再输入'::wq'保存退出，然后命令行输入：

`source ~/.bashrc`

最后输入：

`antsRegistrationSyN.sh`

会出现如下一系列的ANTs用法说明和：

    --------------------------------------------------------------------------------------
    Get the latest ANTs version at:
    --------------------------------------------------------------------------------------
    https://github.com/ANTsX/ANTs/
    --------------------------------------------------------------------------------------
    Read the ANTS documentation at:
    --------------------------------------------------------------------------------------
    http://stnava.github.io/ANTs/
    --------------------------------------------------------------------------------------
    ANTS was created by:
    --------------------------------------------------------------------------------------
    Brian B. Avants, Nick Tustison and Gang Song
    Penn Image Computing And Science Laboratory
    University of Pennsylvania
    
    Relevent references for this script include:
       * http://www.ncbi.nlm.nih.gov/pubmed/20851191
       * http://www.frontiersin.org/Journal/10.3389/fninf.2013.00039/abstract
    --------------------------------------------------------------------------------------
    script by Nick Tustison
    --------------------------------------------------------------------------------------

