<!--
 * @Author: 刘永铿 陈科杰
 * @Date: 2023-11-22 16:51:57
 * @LastEditTime: 2023-11-22 17:24:14
 * @LastEditors: Please set LastEditors
 * @Description: 
 * @FilePath: \undefinede:\work\B+\Protocol\android_use_clib\README.MD
 * @Hostory: 
 * ...
-->
# 使用说明
    安卓调用C库的工作流程如下：
1. 使用安卓的ndk编译工具编译c代码。ndk工具获取途径有两个，①是从android studio中安装（推荐），②是自行百度下载。ndk编译主要是需要编写android.mk，android.mk类似CMAKE。编译完成后会生成多种处理器架构的库，有arm、x86等。
    百度关键字（NDK编译C库） 
    参考教程：https://blog.csdn.net/danielxinhj/article/details/133073755
***

1. 新建android studio工程，android调用c代码常规方式是JNI，我采用的是JNA，JNA是基于JNI封装后的一个框架，使用jna需要引入jar包. 下载地址:https://github.com/java-native-access/jna。 重点来了，将jna的jna-min.jar、jna-platform.jar这两个包放到安卓工程目录下的libs里，并且**引用作为库**，在src\main下面新建文件夹jniLibs，**并把上面ndk编译出来的库放到jniLibs，参考结构jniLibs\armeabi-v7a               jniLibs\arm64-v8a** 
***

1. 编辑app的buid.gradle文件，添加下面2个内容
```JAVA
    sourceSets {
        main {
            //jni.srcDirs = ["src/main/cpp"] //指定c/c++源码位置
            jniLibs.srcDirs = ['src/main/jniLibs']
            //jniLibs.srcDirs = ['libs']
        }
    }
```

```JAVA
packagingOptions {
        //排除法
        //exclude '指定好上面path后的路径'
        exclude 'META-INF/*.*'
        //指定法
        ///pickFirst '指定你想用的那个路径'
    }
```
***
4. 最后一步就是将jna里面的android-aarch64.jar、android-arm.jar、android-armv7.jar、android-mips.jar、android-mips64.jar、android-x86.jar、android-x86-64.jar文件解压，每个文件夹里面的libjnidispath.so复制到对应的src\main\jniLibs文件夹里面，比如android-x86.jar里面的libjnidispath.so就移动到x86，android-x86-64.jar里面的libjnidispath.so就移动到x86-64.
***
5. 写调用代码，运行
***

#参考教程:
https://www.cnblogs.com/blogs-of-lxl/p/11013139.html
https://www.jianshu.com/p/88cf79b70402