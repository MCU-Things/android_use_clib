
# 简介
* ndk工具链版本:android-ndk-r16b-windows-x86_64 
  
* **编译教程**
1. 如需自行编译.so文件的话，请从<a href="https://gitlab.sihoodev.com/mcu/bplus/protocol/ui_protocol/protocol" target="_blank">git主分支</a>下载最新C源代码
2. 进入源代码目录，编辑protocol_cfg.h文件，将#define PLATFORM  括号内的数字填0，将#define OS_TYPE  括号内的数字填0。
3. 解压ndk目录下的android-ndk-r16b-windows-x86_64文件，并将E:\work\B+\Protocol\ui_protocol\android_protocol_lib\ndk\android-ndk-r16b\build设置环境变量，注意路径根据解压的路径设置.如果ndk目录没有ndk，到https://developer.android.google.cn/ndk/downloads?hl=zh-cn下载，建议使用同一版本。
4. 打开命令行在README.md目录下输入ndk-build并回车
***   
# 文件目录介绍

|目录名|备注|
|:---|:---:|
|jni|C源代码|
|libs|生成的.so文件|
|ndk|编译工具链|
***
# 使用说明
    自行根据处理器架构在libs目录选择合适版本
   

