#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "FAudio::FAudio" for configuration "Release"
set_property(TARGET FAudio::FAudio APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(FAudio::FAudio PROPERTIES
  IMPORTED_LOCATION_RELEASE "/app/lib32/libFAudio.so.0.21.03"
  IMPORTED_SONAME_RELEASE "libFAudio.so.0"
  )

list(APPEND _IMPORT_CHECK_TARGETS FAudio::FAudio )
list(APPEND _IMPORT_CHECK_FILES_FOR_FAudio::FAudio "/app/lib32/libFAudio.so.0.21.03" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
