LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)
LOCAL_C_INCLUDES:= $(LOCAL_PATH)/include

ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
LOCAL_C_INCLUDES += $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr/include
LOCAL_ADDITIONAL_DEPENDENCIES += $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr
endif

LOCAL_SRC_FILES:= compress.c utils.c
LOCAL_MODULE := libtinycompress
LOCAL_SHARED_LIBRARIES:= libcutils libutils
LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)

LOCAL_C_INCLUDES:= $(LOCAL_PATH)/include
LOCAL_SRC_FILES:= cplay.c
LOCAL_MODULE := cplay
LOCAL_SHARED_LIBRARIES:= libcutils libutils libtinycompress
LOCAL_MODULE_TAGS := optional

include $(BUILD_EXECUTABLE)

