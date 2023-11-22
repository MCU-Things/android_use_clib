LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)
PROJECT_PATH = $(LOCAL_PATH)

LOCAL_MODULE := protocol

#添加需要包含的头文件路径，会依次遍历向下所有目录，
MY_HEADER_PATH += $(PROJECT_PATH)

#添加需要包含的头文件路径，不会向下遍历，最后一个不要加\号
LOCAL_C_INCLUDES += $(PROJECT_PATH)/


LOCAL_C_INCLUDES += $(shell find $(MY_HEADER_PATH) -type d)                              
$(warning "$(LOCAL_MODULE): LOCAL_C_INCLUDES =$(LOCAL_C_INCLUDES)")   

# 扫描目录下的所有源文件，会向下依次遍历
MY_FILES_PATH  := $(PROJECT_PATH)
# 添加指定C/CPP文件，只添加某个
#LOCAL_SRC_FILES += test.c

MY_FILES_SUFFIX := %.cpp %.c %.cc
My_All_Files := $(foreach src_path,$(MY_FILES_PATH), $(shell find "$(src_path)" -type f) ) 
My_All_Files := $(My_All_Files:$(MY_CPP_PATH)/./%=$(MY_CPP_PATH)%)
MY_SRC_LIST  := $(filter $(MY_FILES_SUFFIX),$(My_All_Files)) 
MY_SRC_LIST  := $(MY_SRC_LIST:$(LOCAL_PATH)/%=%)
LOCAL_SRC_FILES += $(MY_SRC_LIST)
$(warning "$(LOCAL_MODULE): LOCAL_SRC_FILES =$(LOCAL_SRC_FILES)")   
#指定编译目标，这边编译动态库
include $(BUILD_SHARED_LIBRARY)

