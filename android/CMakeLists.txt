cmake_minimum_required(VERSION 3.10.0)

# TODO please change me!
set(OPENCV_BASE_DIR "/Users/tom/Others/OpenCVRelease/OpenCV-android-sdk")

set(OPENCV_INCLUDE_DIR "${OPENCV_BASE_DIR}/sdk/native/jni/include/")
set(OPENCV_STATIC_LIB_DIR "${OPENCV_BASE_DIR}/sdk/native/staticlibs/${ANDROID_ABI}")
set(OPENCV_3RDPARTY_STATIC_LIB_DIR "${OPENCV_BASE_DIR}/sdk/native/3rdparty/libs/${ANDROID_ABI}")

include_directories(${OPENCV_INCLUDE_DIR})

find_library(log-lib log)

add_library(highgui STATIC IMPORTED)
set_target_properties(highgui PROPERTIES IMPORTED_LOCATION ${OPENCV_STATIC_LIB_DIR}/libopencv_highgui.a)

add_library(calib3d STATIC IMPORTED)
set_target_properties(calib3d PROPERTIES IMPORTED_LOCATION ${OPENCV_STATIC_LIB_DIR}/libopencv_calib3d.a)

add_library(core STATIC IMPORTED)
set_target_properties(core PROPERTIES IMPORTED_LOCATION ${OPENCV_STATIC_LIB_DIR}/libopencv_core.a)

add_library(dnn STATIC IMPORTED)
set_target_properties(dnn PROPERTIES IMPORTED_LOCATION ${OPENCV_STATIC_LIB_DIR}/libopencv_dnn.a)

add_library(flann STATIC IMPORTED)
set_target_properties(flann PROPERTIES IMPORTED_LOCATION ${OPENCV_STATIC_LIB_DIR}/libopencv_flann.a)

add_library(imgproc STATIC IMPORTED)
set_target_properties(imgproc PROPERTIES IMPORTED_LOCATION ${OPENCV_STATIC_LIB_DIR}/libopencv_imgproc.a)

add_library(videoio STATIC IMPORTED)
set_target_properties(videoio PROPERTIES IMPORTED_LOCATION ${OPENCV_STATIC_LIB_DIR}/libopencv_videoio.a)

add_library(imgcodecs STATIC IMPORTED)
set_target_properties(imgcodecs PROPERTIES IMPORTED_LOCATION ${OPENCV_STATIC_LIB_DIR}/libopencv_imgcodecs.a)

add_library(features2d STATIC IMPORTED)
set_target_properties(features2d PROPERTIES IMPORTED_LOCATION ${OPENCV_STATIC_LIB_DIR}/libopencv_features2d.a)

add_library(ml STATIC IMPORTED)
set_target_properties(ml PROPERTIES IMPORTED_LOCATION ${OPENCV_STATIC_LIB_DIR}/libopencv_ml.a)

add_library(photo STATIC IMPORTED)
set_target_properties(photo PROPERTIES IMPORTED_LOCATION ${OPENCV_STATIC_LIB_DIR}/libopencv_photo.a)

add_library(shape STATIC IMPORTED)
set_target_properties(shape PROPERTIES IMPORTED_LOCATION ${OPENCV_STATIC_LIB_DIR}/libopencv_shape.a)

add_library(objdetect STATIC IMPORTED)
set_target_properties(objdetect PROPERTIES IMPORTED_LOCATION ${OPENCV_STATIC_LIB_DIR}/libopencv_objdetect.a)

add_library(stitching STATIC IMPORTED)
set_target_properties(stitching PROPERTIES IMPORTED_LOCATION ${OPENCV_STATIC_LIB_DIR}/libopencv_stitching.a)

include(AndroidNdkModules)
android_ndk_import_module_cpufeatures()

set(CMAKE_THREAD_PREFER_PTHREAD TRUE)
set(THREADS_PREFER_PTHREAD_FLAG TRUE)
find_package(Threads REQUIRED)

add_library(tbb STATIC IMPORTED)
set_target_properties(tbb PROPERTIES IMPORTED_LOCATION ${OPENCV_3RDPARTY_STATIC_LIB_DIR}/libtbb.a)

add_library(tegra_hal STATIC IMPORTED)
set_target_properties(tegra_hal PROPERTIES IMPORTED_LOCATION ${OPENCV_3RDPARTY_STATIC_LIB_DIR}/libtegra_hal.a)

add_library(ittnotify STATIC IMPORTED)
set_target_properties(ittnotify PROPERTIES IMPORTED_LOCATION ${OPENCV_3RDPARTY_STATIC_LIB_DIR}/libittnotify.a)

add_library(native_with_opencv

        # Sets the library as a shared library.
        SHARED

        # Provides a relative path to your source file(s).
        ../ios/Classes/native_add.cpp
        )

target_link_libraries(native_with_opencv
        ${log-lib}
        core
        tbb # note: need to be placed *after* "core"
        cpufeatures
        ittnotify
        tegra_hal # NOTE if still have error, check abiFilters, since tegra does *not* exist in x86.
        Threads::Threads
        -lz
        )
