# GENERATED FILE. DO NOT EDIT.

###
### Begin CMakeLibraryFunctions.cmake
###

# Set the flags necessary to reach the given C/C++ compiler level
function (cdepRequireMinimumCxxCompilerStandard target level)
    target_compile_options(${target} PRIVATE $<$<COMPILE_LANGUAGE:CXX>:-std=c++${level}>)
endfunction()

###
### End CMakeLibraryFunctions.cmake
###

###
### Add dependency for CDep module: com.github.ggfan:shaderc:0.0.1
###
if(SHADERC_CDEP_COORDINATE)
  message(FATAL_ERROR "CDep module '${SHADERC_CDEP_COORDINATE}' was already defined")
endif(SHADERC_CDEP_COORDINATE)
set(SHADERC_CDEP_COORDINATE "com.github.ggfan:shaderc:0.0.1")
set(SHADERC_ROOT "/Users/glumes/.cdep/exploded/com.github.ggfan/shaderc/0.0.1/shaderc-headers.zip/include")
function(add_cdep_shaderc_dependency target)
  # Choose between Android NDK Toolchain and CMake Android Toolchain
  set(cdep_supports_compiler_features TRUE)
  if(NOT CMAKE_SYSTEM_VERSION EQUAL 1)
    set(cdep_determined_android_runtime ${CMAKE_ANDROID_STL_TYPE})
    set(cdep_determined_android_abi ${CMAKE_ANDROID_ARCH_ABI})
    set(cdep_determined_android_platform_level ${CMAKE_SYSTEM_VERSION})
  else()
    set(cdep_determined_android_runtime ${ANDROID_STL})
    set(cdep_determined_android_abi ${ANDROID_ABI})
    set(cdep_determined_android_platform_level ${ANDROID_PLATFORM_LEVEL})
    set(cdep_supports_compiler_features FALSE)
  endif()

  set(cdep_exploded_root "/Users/glumes/.cdep/exploded")
  set(coordinate_group_id "com.github.ggfan")
  set(coordinate_artifact_id "shaderc")
  set(coordinate_version "0.0.1")
  set(exploded_archive_tail "${coordinate_group_id}/${coordinate_artifact_id}/${coordinate_version}")
  set(exploded_archive_folder "${cdep_exploded_root}/${exploded_archive_tail}")

  execute_process(COMMAND /Library/Java/JavaVirtualMachines/jdk1.8.0_202.jdk/Contents/Home/jre/bin/java -classpath /Users/glumes/.cdep/bootstrap/downloads/969779654/cdep-0.8.30.jar io.cdep.CDep --working-folder /Users/glumes/mediacode/VulkanCameraPro/VulkanCamera/. fetch-archive com.github.ggfan:shaderc:0.0.1 https://github.com/ggfan/shaderc/releases/download/0.0.1/shaderc-headers.zip 23993 5bfdf4f2226fb3128127c72a6c199a0abcde38b9c797e0ccbe6d6e511112ab0d)
  target_include_directories(${target} PUBLIC "${exploded_archive_folder}/shaderc-headers.zip/include")

  if(CMAKE_SYSTEM_NAME STREQUAL "Android")
    if(cdep_determined_android_runtime STREQUAL "gnustl_shared")
      if(cdep_determined_android_platform_level GREATER 23)
        if(cdep_determined_android_abi STREQUAL "armeabi")
          execute_process(COMMAND /Library/Java/JavaVirtualMachines/jdk1.8.0_202.jdk/Contents/Home/jre/bin/java -classpath /Users/glumes/.cdep/bootstrap/downloads/969779654/cdep-0.8.30.jar io.cdep.CDep --working-folder /Users/glumes/mediacode/VulkanCameraPro/VulkanCamera/. fetch-archive com.github.ggfan:shaderc:0.0.1 https://github.com/ggfan/shaderc/releases/download/0.0.1/shaderc-armeabi-gnustl_static.zip 1979964 eb1bba9b9ce838571ffafde0829243755201b423b04e95af02a5df9ccb125ce4)
          target_link_libraries(${target} "${exploded_archive_folder}/shaderc-armeabi-gnustl_static.zip/lib/armeabi/libshaderc.a")
        elseif(cdep_determined_android_abi STREQUAL "armeabi-v7a")
          execute_process(COMMAND /Library/Java/JavaVirtualMachines/jdk1.8.0_202.jdk/Contents/Home/jre/bin/java -classpath /Users/glumes/.cdep/bootstrap/downloads/969779654/cdep-0.8.30.jar io.cdep.CDep --working-folder /Users/glumes/mediacode/VulkanCameraPro/VulkanCamera/. fetch-archive com.github.ggfan:shaderc:0.0.1 https://github.com/ggfan/shaderc/releases/download/0.0.1/shaderc-armeabi-v7a-gnustl_static.zip 1836774 c14ba98422ed8aa79ee71303d9c905cfcf0394a65a7816315fe4724f97e1fdd6)
          target_link_libraries(${target} "${exploded_archive_folder}/shaderc-armeabi-v7a-gnustl_static.zip/lib/armeabi-v7a/libshaderc.a")
        elseif(cdep_determined_android_abi STREQUAL "arm64-v8a")
          execute_process(COMMAND /Library/Java/JavaVirtualMachines/jdk1.8.0_202.jdk/Contents/Home/jre/bin/java -classpath /Users/glumes/.cdep/bootstrap/downloads/969779654/cdep-0.8.30.jar io.cdep.CDep --working-folder /Users/glumes/mediacode/VulkanCameraPro/VulkanCamera/. fetch-archive com.github.ggfan:shaderc:0.0.1 https://github.com/ggfan/shaderc/releases/download/0.0.1/shaderc-arm64-v8a-gnustl_static.zip 1573978 35e9ed7a691d091b0fdd0ce6960de1eb210e66e794917f2ee55f8434a372b7e0)
          target_link_libraries(${target} "${exploded_archive_folder}/shaderc-arm64-v8a-gnustl_static.zip/lib/arm64-v8a/libshaderc.a")
        elseif(cdep_determined_android_abi STREQUAL "x86")
          execute_process(COMMAND /Library/Java/JavaVirtualMachines/jdk1.8.0_202.jdk/Contents/Home/jre/bin/java -classpath /Users/glumes/.cdep/bootstrap/downloads/969779654/cdep-0.8.30.jar io.cdep.CDep --working-folder /Users/glumes/mediacode/VulkanCameraPro/VulkanCamera/. fetch-archive com.github.ggfan:shaderc:0.0.1 https://github.com/ggfan/shaderc/releases/download/0.0.1/shaderc-x86-gnustl_static.zip 1581901 7088420e7e2d1c97aa311244450873a0d4ca7d005122dc901776ecc7a382b6b7)
          target_link_libraries(${target} "${exploded_archive_folder}/shaderc-x86-gnustl_static.zip/lib/x86/libshaderc.a")
        elseif(cdep_determined_android_abi STREQUAL "x86_64")
          execute_process(COMMAND /Library/Java/JavaVirtualMachines/jdk1.8.0_202.jdk/Contents/Home/jre/bin/java -classpath /Users/glumes/.cdep/bootstrap/downloads/969779654/cdep-0.8.30.jar io.cdep.CDep --working-folder /Users/glumes/mediacode/VulkanCameraPro/VulkanCamera/. fetch-archive com.github.ggfan:shaderc:0.0.1 https://github.com/ggfan/shaderc/releases/download/0.0.1/shaderc-x86_64-gnustl_static.zip 1576458 ad017064dac7504641a60b4b95ef0db7095280f6e2c7b356d1f43dda268d13fe)
          target_link_libraries(${target} "${exploded_archive_folder}/shaderc-x86_64-gnustl_static.zip/lib/x86_64/libshaderc.a")
        else()
          message(FATAL_ERROR "Android ABI ${cdep_determined_android_abi} is not supported by com.github.ggfan:shaderc:0.0.1 for platform ${cdep_determined_android_platform_level}. Supported: armeabi armeabi-v7a arm64-v8a x86 x86_64  CMAKE_SYSTEM_VERSION=${CMAKE_SYSTEM_VERSION} ANDROID_SYSTEM_VERSION=${ANDROID_SYSTEM_VERSION} CMAKE_ANDROID_STL_TYPE=${CMAKE_ANDROID_STL_TYPE} ANDROID_STL=${ANDROID_STL}")
        endif()
      else()
        message(FATAL_ERROR "Android API level ${cdep_determined_android_platform_level} is not supported by com.github.ggfan:shaderc:0.0.1 CMAKE_SYSTEM_VERSION=${CMAKE_SYSTEM_VERSION} ANDROID_SYSTEM_VERSION=${ANDROID_SYSTEM_VERSION} CMAKE_ANDROID_STL_TYPE=${CMAKE_ANDROID_STL_TYPE} ANDROID_STL=${ANDROID_STL}")
      endif()
    elseif(cdep_determined_android_runtime STREQUAL "gnustl_static")
      if(cdep_determined_android_platform_level GREATER 23)
        if(cdep_determined_android_abi STREQUAL "armeabi")
          execute_process(COMMAND /Library/Java/JavaVirtualMachines/jdk1.8.0_202.jdk/Contents/Home/jre/bin/java -classpath /Users/glumes/.cdep/bootstrap/downloads/969779654/cdep-0.8.30.jar io.cdep.CDep --working-folder /Users/glumes/mediacode/VulkanCameraPro/VulkanCamera/. fetch-archive com.github.ggfan:shaderc:0.0.1 https://github.com/ggfan/shaderc/releases/download/0.0.1/shaderc-armeabi-gnustl_static.zip 1979964 eb1bba9b9ce838571ffafde0829243755201b423b04e95af02a5df9ccb125ce4)
          target_link_libraries(${target} "${exploded_archive_folder}/shaderc-armeabi-gnustl_static.zip/lib/armeabi/libshaderc.a")
        elseif(cdep_determined_android_abi STREQUAL "armeabi-v7a")
          execute_process(COMMAND /Library/Java/JavaVirtualMachines/jdk1.8.0_202.jdk/Contents/Home/jre/bin/java -classpath /Users/glumes/.cdep/bootstrap/downloads/969779654/cdep-0.8.30.jar io.cdep.CDep --working-folder /Users/glumes/mediacode/VulkanCameraPro/VulkanCamera/. fetch-archive com.github.ggfan:shaderc:0.0.1 https://github.com/ggfan/shaderc/releases/download/0.0.1/shaderc-armeabi-v7a-gnustl_static.zip 1836774 c14ba98422ed8aa79ee71303d9c905cfcf0394a65a7816315fe4724f97e1fdd6)
          target_link_libraries(${target} "${exploded_archive_folder}/shaderc-armeabi-v7a-gnustl_static.zip/lib/armeabi-v7a/libshaderc.a")
        elseif(cdep_determined_android_abi STREQUAL "arm64-v8a")
          execute_process(COMMAND /Library/Java/JavaVirtualMachines/jdk1.8.0_202.jdk/Contents/Home/jre/bin/java -classpath /Users/glumes/.cdep/bootstrap/downloads/969779654/cdep-0.8.30.jar io.cdep.CDep --working-folder /Users/glumes/mediacode/VulkanCameraPro/VulkanCamera/. fetch-archive com.github.ggfan:shaderc:0.0.1 https://github.com/ggfan/shaderc/releases/download/0.0.1/shaderc-arm64-v8a-gnustl_static.zip 1573978 35e9ed7a691d091b0fdd0ce6960de1eb210e66e794917f2ee55f8434a372b7e0)
          target_link_libraries(${target} "${exploded_archive_folder}/shaderc-arm64-v8a-gnustl_static.zip/lib/arm64-v8a/libshaderc.a")
        elseif(cdep_determined_android_abi STREQUAL "x86")
          execute_process(COMMAND /Library/Java/JavaVirtualMachines/jdk1.8.0_202.jdk/Contents/Home/jre/bin/java -classpath /Users/glumes/.cdep/bootstrap/downloads/969779654/cdep-0.8.30.jar io.cdep.CDep --working-folder /Users/glumes/mediacode/VulkanCameraPro/VulkanCamera/. fetch-archive com.github.ggfan:shaderc:0.0.1 https://github.com/ggfan/shaderc/releases/download/0.0.1/shaderc-x86-gnustl_static.zip 1581901 7088420e7e2d1c97aa311244450873a0d4ca7d005122dc901776ecc7a382b6b7)
          target_link_libraries(${target} "${exploded_archive_folder}/shaderc-x86-gnustl_static.zip/lib/x86/libshaderc.a")
        elseif(cdep_determined_android_abi STREQUAL "x86_64")
          execute_process(COMMAND /Library/Java/JavaVirtualMachines/jdk1.8.0_202.jdk/Contents/Home/jre/bin/java -classpath /Users/glumes/.cdep/bootstrap/downloads/969779654/cdep-0.8.30.jar io.cdep.CDep --working-folder /Users/glumes/mediacode/VulkanCameraPro/VulkanCamera/. fetch-archive com.github.ggfan:shaderc:0.0.1 https://github.com/ggfan/shaderc/releases/download/0.0.1/shaderc-x86_64-gnustl_static.zip 1576458 ad017064dac7504641a60b4b95ef0db7095280f6e2c7b356d1f43dda268d13fe)
          target_link_libraries(${target} "${exploded_archive_folder}/shaderc-x86_64-gnustl_static.zip/lib/x86_64/libshaderc.a")
        else()
          message(FATAL_ERROR "Android ABI ${cdep_determined_android_abi} is not supported by com.github.ggfan:shaderc:0.0.1 for platform ${cdep_determined_android_platform_level}. Supported: armeabi armeabi-v7a arm64-v8a x86 x86_64  CMAKE_SYSTEM_VERSION=${CMAKE_SYSTEM_VERSION} ANDROID_SYSTEM_VERSION=${ANDROID_SYSTEM_VERSION} CMAKE_ANDROID_STL_TYPE=${CMAKE_ANDROID_STL_TYPE} ANDROID_STL=${ANDROID_STL}")
        endif()
      else()
        message(FATAL_ERROR "Android API level ${cdep_determined_android_platform_level} is not supported by com.github.ggfan:shaderc:0.0.1 CMAKE_SYSTEM_VERSION=${CMAKE_SYSTEM_VERSION} ANDROID_SYSTEM_VERSION=${ANDROID_SYSTEM_VERSION} CMAKE_ANDROID_STL_TYPE=${CMAKE_ANDROID_STL_TYPE} ANDROID_STL=${ANDROID_STL}")
      endif()
    elseif(cdep_determined_android_runtime STREQUAL "c++_shared")
      if(cdep_determined_android_platform_level GREATER 23)
        if(cdep_determined_android_abi STREQUAL "armeabi")
          execute_process(COMMAND /Library/Java/JavaVirtualMachines/jdk1.8.0_202.jdk/Contents/Home/jre/bin/java -classpath /Users/glumes/.cdep/bootstrap/downloads/969779654/cdep-0.8.30.jar io.cdep.CDep --working-folder /Users/glumes/mediacode/VulkanCameraPro/VulkanCamera/. fetch-archive com.github.ggfan:shaderc:0.0.1 https://github.com/ggfan/shaderc/releases/download/0.0.1/shaderc-armeabi-cxx_static.zip 2298739 15fb63a9234fd774f9db3b7b77873045b9ce7b0798b31ecdaa820ab4cae60245)
          target_link_libraries(${target} "${exploded_archive_folder}/shaderc-armeabi-cxx_static.zip/lib/armeabi/libshaderc.a")
        elseif(cdep_determined_android_abi STREQUAL "armeabi-v7a")
          execute_process(COMMAND /Library/Java/JavaVirtualMachines/jdk1.8.0_202.jdk/Contents/Home/jre/bin/java -classpath /Users/glumes/.cdep/bootstrap/downloads/969779654/cdep-0.8.30.jar io.cdep.CDep --working-folder /Users/glumes/mediacode/VulkanCameraPro/VulkanCamera/. fetch-archive com.github.ggfan:shaderc:0.0.1 https://github.com/ggfan/shaderc/releases/download/0.0.1/shaderc-armeabi-v7a-cxx_static.zip 2125369 0c33c10c79287df8e13af138e79ab99fae62c6cd2f50784394deaf5612c7865e)
          target_link_libraries(${target} "${exploded_archive_folder}/shaderc-armeabi-v7a-cxx_static.zip/lib/armeabi-v7a/libshaderc.a")
        elseif(cdep_determined_android_abi STREQUAL "arm64-v8a")
          execute_process(COMMAND /Library/Java/JavaVirtualMachines/jdk1.8.0_202.jdk/Contents/Home/jre/bin/java -classpath /Users/glumes/.cdep/bootstrap/downloads/969779654/cdep-0.8.30.jar io.cdep.CDep --working-folder /Users/glumes/mediacode/VulkanCameraPro/VulkanCamera/. fetch-archive com.github.ggfan:shaderc:0.0.1 https://github.com/ggfan/shaderc/releases/download/0.0.1/shaderc-arm64-v8a-cxx_static.zip 1841721 83cff66a1a3e8827d93d763554216a8e9f550e32ff8f5f8981787fc7eed050a7)
          target_link_libraries(${target} "${exploded_archive_folder}/shaderc-arm64-v8a-cxx_static.zip/lib/arm64-v8a/libshaderc.a")
        elseif(cdep_determined_android_abi STREQUAL "x86")
          execute_process(COMMAND /Library/Java/JavaVirtualMachines/jdk1.8.0_202.jdk/Contents/Home/jre/bin/java -classpath /Users/glumes/.cdep/bootstrap/downloads/969779654/cdep-0.8.30.jar io.cdep.CDep --working-folder /Users/glumes/mediacode/VulkanCameraPro/VulkanCamera/. fetch-archive com.github.ggfan:shaderc:0.0.1 https://github.com/ggfan/shaderc/releases/download/0.0.1/shaderc-x86-cxx_static.zip 1836574 033c09cd981fb79fc04c480083ccb763abc31ed0a392ecaaad69ada42cc2342d)
          target_link_libraries(${target} "${exploded_archive_folder}/shaderc-x86-cxx_static.zip/lib/x86/libshaderc.a")
        elseif(cdep_determined_android_abi STREQUAL "x86_64")
          execute_process(COMMAND /Library/Java/JavaVirtualMachines/jdk1.8.0_202.jdk/Contents/Home/jre/bin/java -classpath /Users/glumes/.cdep/bootstrap/downloads/969779654/cdep-0.8.30.jar io.cdep.CDep --working-folder /Users/glumes/mediacode/VulkanCameraPro/VulkanCamera/. fetch-archive com.github.ggfan:shaderc:0.0.1 https://github.com/ggfan/shaderc/releases/download/0.0.1/shaderc-x86_64-cxx_static.zip 1875032 c350cb1b064056f37500c4b9d1d8b11541fa907ea2992e0f5aa97d9105a0032f)
          target_link_libraries(${target} "${exploded_archive_folder}/shaderc-x86_64-cxx_static.zip/lib/x86_64/libshaderc.a")
        else()
          message(FATAL_ERROR "Android ABI ${cdep_determined_android_abi} is not supported by com.github.ggfan:shaderc:0.0.1 for platform ${cdep_determined_android_platform_level}. Supported: armeabi armeabi-v7a arm64-v8a x86 x86_64  CMAKE_SYSTEM_VERSION=${CMAKE_SYSTEM_VERSION} ANDROID_SYSTEM_VERSION=${ANDROID_SYSTEM_VERSION} CMAKE_ANDROID_STL_TYPE=${CMAKE_ANDROID_STL_TYPE} ANDROID_STL=${ANDROID_STL}")
        endif()
      else()
        message(FATAL_ERROR "Android API level ${cdep_determined_android_platform_level} is not supported by com.github.ggfan:shaderc:0.0.1 CMAKE_SYSTEM_VERSION=${CMAKE_SYSTEM_VERSION} ANDROID_SYSTEM_VERSION=${ANDROID_SYSTEM_VERSION} CMAKE_ANDROID_STL_TYPE=${CMAKE_ANDROID_STL_TYPE} ANDROID_STL=${ANDROID_STL}")
      endif()
    elseif(cdep_determined_android_runtime STREQUAL "c++_static")
      if(cdep_determined_android_platform_level GREATER 23)
        if(cdep_determined_android_abi STREQUAL "armeabi")
          execute_process(COMMAND /Library/Java/JavaVirtualMachines/jdk1.8.0_202.jdk/Contents/Home/jre/bin/java -classpath /Users/glumes/.cdep/bootstrap/downloads/969779654/cdep-0.8.30.jar io.cdep.CDep --working-folder /Users/glumes/mediacode/VulkanCameraPro/VulkanCamera/. fetch-archive com.github.ggfan:shaderc:0.0.1 https://github.com/ggfan/shaderc/releases/download/0.0.1/shaderc-armeabi-cxx_static.zip 2298739 15fb63a9234fd774f9db3b7b77873045b9ce7b0798b31ecdaa820ab4cae60245)
          target_link_libraries(${target} "${exploded_archive_folder}/shaderc-armeabi-cxx_static.zip/lib/armeabi/libshaderc.a")
        elseif(cdep_determined_android_abi STREQUAL "armeabi-v7a")
          execute_process(COMMAND /Library/Java/JavaVirtualMachines/jdk1.8.0_202.jdk/Contents/Home/jre/bin/java -classpath /Users/glumes/.cdep/bootstrap/downloads/969779654/cdep-0.8.30.jar io.cdep.CDep --working-folder /Users/glumes/mediacode/VulkanCameraPro/VulkanCamera/. fetch-archive com.github.ggfan:shaderc:0.0.1 https://github.com/ggfan/shaderc/releases/download/0.0.1/shaderc-armeabi-v7a-cxx_static.zip 2125369 0c33c10c79287df8e13af138e79ab99fae62c6cd2f50784394deaf5612c7865e)
          target_link_libraries(${target} "${exploded_archive_folder}/shaderc-armeabi-v7a-cxx_static.zip/lib/armeabi-v7a/libshaderc.a")
        elseif(cdep_determined_android_abi STREQUAL "arm64-v8a")
          execute_process(COMMAND /Library/Java/JavaVirtualMachines/jdk1.8.0_202.jdk/Contents/Home/jre/bin/java -classpath /Users/glumes/.cdep/bootstrap/downloads/969779654/cdep-0.8.30.jar io.cdep.CDep --working-folder /Users/glumes/mediacode/VulkanCameraPro/VulkanCamera/. fetch-archive com.github.ggfan:shaderc:0.0.1 https://github.com/ggfan/shaderc/releases/download/0.0.1/shaderc-arm64-v8a-cxx_static.zip 1841721 83cff66a1a3e8827d93d763554216a8e9f550e32ff8f5f8981787fc7eed050a7)
          target_link_libraries(${target} "${exploded_archive_folder}/shaderc-arm64-v8a-cxx_static.zip/lib/arm64-v8a/libshaderc.a")
        elseif(cdep_determined_android_abi STREQUAL "x86")
          execute_process(COMMAND /Library/Java/JavaVirtualMachines/jdk1.8.0_202.jdk/Contents/Home/jre/bin/java -classpath /Users/glumes/.cdep/bootstrap/downloads/969779654/cdep-0.8.30.jar io.cdep.CDep --working-folder /Users/glumes/mediacode/VulkanCameraPro/VulkanCamera/. fetch-archive com.github.ggfan:shaderc:0.0.1 https://github.com/ggfan/shaderc/releases/download/0.0.1/shaderc-x86-cxx_static.zip 1836574 033c09cd981fb79fc04c480083ccb763abc31ed0a392ecaaad69ada42cc2342d)
          target_link_libraries(${target} "${exploded_archive_folder}/shaderc-x86-cxx_static.zip/lib/x86/libshaderc.a")
        elseif(cdep_determined_android_abi STREQUAL "x86_64")
          execute_process(COMMAND /Library/Java/JavaVirtualMachines/jdk1.8.0_202.jdk/Contents/Home/jre/bin/java -classpath /Users/glumes/.cdep/bootstrap/downloads/969779654/cdep-0.8.30.jar io.cdep.CDep --working-folder /Users/glumes/mediacode/VulkanCameraPro/VulkanCamera/. fetch-archive com.github.ggfan:shaderc:0.0.1 https://github.com/ggfan/shaderc/releases/download/0.0.1/shaderc-x86_64-cxx_static.zip 1875032 c350cb1b064056f37500c4b9d1d8b11541fa907ea2992e0f5aa97d9105a0032f)
          target_link_libraries(${target} "${exploded_archive_folder}/shaderc-x86_64-cxx_static.zip/lib/x86_64/libshaderc.a")
        else()
          message(FATAL_ERROR "Android ABI ${cdep_determined_android_abi} is not supported by com.github.ggfan:shaderc:0.0.1 for platform ${cdep_determined_android_platform_level}. Supported: armeabi armeabi-v7a arm64-v8a x86 x86_64  CMAKE_SYSTEM_VERSION=${CMAKE_SYSTEM_VERSION} ANDROID_SYSTEM_VERSION=${ANDROID_SYSTEM_VERSION} CMAKE_ANDROID_STL_TYPE=${CMAKE_ANDROID_STL_TYPE} ANDROID_STL=${ANDROID_STL}")
        endif()
      else()
        message(FATAL_ERROR "Android API level ${cdep_determined_android_platform_level} is not supported by com.github.ggfan:shaderc:0.0.1 CMAKE_SYSTEM_VERSION=${CMAKE_SYSTEM_VERSION} ANDROID_SYSTEM_VERSION=${ANDROID_SYSTEM_VERSION} CMAKE_ANDROID_STL_TYPE=${CMAKE_ANDROID_STL_TYPE} ANDROID_STL=${ANDROID_STL}")
      endif()
    elseif(cdep_determined_android_runtime STREQUAL "none")
      if(cdep_determined_android_platform_level GREATER 23)
        if(cdep_determined_android_abi STREQUAL "armeabi")
          execute_process(COMMAND /Library/Java/JavaVirtualMachines/jdk1.8.0_202.jdk/Contents/Home/jre/bin/java -classpath /Users/glumes/.cdep/bootstrap/downloads/969779654/cdep-0.8.30.jar io.cdep.CDep --working-folder /Users/glumes/mediacode/VulkanCameraPro/VulkanCamera/. fetch-archive com.github.ggfan:shaderc:0.0.1 https://github.com/ggfan/shaderc/releases/download/0.0.1/shaderc-armeabi-cxx_static.zip 2298739 15fb63a9234fd774f9db3b7b77873045b9ce7b0798b31ecdaa820ab4cae60245)
          target_link_libraries(${target} "${exploded_archive_folder}/shaderc-armeabi-cxx_static.zip/lib/armeabi/libshaderc.a")
        elseif(cdep_determined_android_abi STREQUAL "armeabi-v7a")
          execute_process(COMMAND /Library/Java/JavaVirtualMachines/jdk1.8.0_202.jdk/Contents/Home/jre/bin/java -classpath /Users/glumes/.cdep/bootstrap/downloads/969779654/cdep-0.8.30.jar io.cdep.CDep --working-folder /Users/glumes/mediacode/VulkanCameraPro/VulkanCamera/. fetch-archive com.github.ggfan:shaderc:0.0.1 https://github.com/ggfan/shaderc/releases/download/0.0.1/shaderc-armeabi-v7a-cxx_static.zip 2125369 0c33c10c79287df8e13af138e79ab99fae62c6cd2f50784394deaf5612c7865e)
          target_link_libraries(${target} "${exploded_archive_folder}/shaderc-armeabi-v7a-cxx_static.zip/lib/armeabi-v7a/libshaderc.a")
        elseif(cdep_determined_android_abi STREQUAL "arm64-v8a")
          execute_process(COMMAND /Library/Java/JavaVirtualMachines/jdk1.8.0_202.jdk/Contents/Home/jre/bin/java -classpath /Users/glumes/.cdep/bootstrap/downloads/969779654/cdep-0.8.30.jar io.cdep.CDep --working-folder /Users/glumes/mediacode/VulkanCameraPro/VulkanCamera/. fetch-archive com.github.ggfan:shaderc:0.0.1 https://github.com/ggfan/shaderc/releases/download/0.0.1/shaderc-arm64-v8a-cxx_static.zip 1841721 83cff66a1a3e8827d93d763554216a8e9f550e32ff8f5f8981787fc7eed050a7)
          target_link_libraries(${target} "${exploded_archive_folder}/shaderc-arm64-v8a-cxx_static.zip/lib/arm64-v8a/libshaderc.a")
        elseif(cdep_determined_android_abi STREQUAL "x86")
          execute_process(COMMAND /Library/Java/JavaVirtualMachines/jdk1.8.0_202.jdk/Contents/Home/jre/bin/java -classpath /Users/glumes/.cdep/bootstrap/downloads/969779654/cdep-0.8.30.jar io.cdep.CDep --working-folder /Users/glumes/mediacode/VulkanCameraPro/VulkanCamera/. fetch-archive com.github.ggfan:shaderc:0.0.1 https://github.com/ggfan/shaderc/releases/download/0.0.1/shaderc-x86-cxx_static.zip 1836574 033c09cd981fb79fc04c480083ccb763abc31ed0a392ecaaad69ada42cc2342d)
          target_link_libraries(${target} "${exploded_archive_folder}/shaderc-x86-cxx_static.zip/lib/x86/libshaderc.a")
        elseif(cdep_determined_android_abi STREQUAL "x86_64")
          execute_process(COMMAND /Library/Java/JavaVirtualMachines/jdk1.8.0_202.jdk/Contents/Home/jre/bin/java -classpath /Users/glumes/.cdep/bootstrap/downloads/969779654/cdep-0.8.30.jar io.cdep.CDep --working-folder /Users/glumes/mediacode/VulkanCameraPro/VulkanCamera/. fetch-archive com.github.ggfan:shaderc:0.0.1 https://github.com/ggfan/shaderc/releases/download/0.0.1/shaderc-x86_64-cxx_static.zip 1875032 c350cb1b064056f37500c4b9d1d8b11541fa907ea2992e0f5aa97d9105a0032f)
          target_link_libraries(${target} "${exploded_archive_folder}/shaderc-x86_64-cxx_static.zip/lib/x86_64/libshaderc.a")
        else()
          message(FATAL_ERROR "Android ABI ${cdep_determined_android_abi} is not supported by com.github.ggfan:shaderc:0.0.1 for platform ${cdep_determined_android_platform_level}. Supported: armeabi armeabi-v7a arm64-v8a x86 x86_64  CMAKE_SYSTEM_VERSION=${CMAKE_SYSTEM_VERSION} ANDROID_SYSTEM_VERSION=${ANDROID_SYSTEM_VERSION} CMAKE_ANDROID_STL_TYPE=${CMAKE_ANDROID_STL_TYPE} ANDROID_STL=${ANDROID_STL}")
        endif()
      else()
        message(FATAL_ERROR "Android API level ${cdep_determined_android_platform_level} is not supported by com.github.ggfan:shaderc:0.0.1 CMAKE_SYSTEM_VERSION=${CMAKE_SYSTEM_VERSION} ANDROID_SYSTEM_VERSION=${ANDROID_SYSTEM_VERSION} CMAKE_ANDROID_STL_TYPE=${CMAKE_ANDROID_STL_TYPE} ANDROID_STL=${ANDROID_STL}")
      endif()
    else()
      message(FATAL_ERROR "Android runtime '${cdep_determined_android_runtime}' is not supported by com.github.ggfan:shaderc:0.0.1. Supported: gnustl c++  CMAKE_SYSTEM_VERSION=${CMAKE_SYSTEM_VERSION} ANDROID_SYSTEM_VERSION=${ANDROID_SYSTEM_VERSION} CMAKE_ANDROID_STL_TYPE=${CMAKE_ANDROID_STL_TYPE} ANDROID_STL=${ANDROID_STL}")
    endif()
  else()
    message(FATAL_ERROR "Target platform ${CMAKE_SYSTEM_NAME} is not supported by com.github.ggfan:shaderc:0.0.1. Supported: Android CMAKE_SYSTEM_VERSION=${CMAKE_SYSTEM_VERSION} ANDROID_SYSTEM_VERSION=${ANDROID_SYSTEM_VERSION} CMAKE_ANDROID_STL_TYPE=${CMAKE_ANDROID_STL_TYPE} ANDROID_STL=${ANDROID_STL}")
  endif()
endfunction(add_cdep_shaderc_dependency)

function(add_all_cdep_dependencies target)
  add_cdep_shaderc_dependency(${target})
endfunction(add_all_cdep_dependencies)
