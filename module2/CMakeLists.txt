


add_library(mod2 SHARED mod2.cpp)

AddHeader("All" "${CMAKE_CURRENT_SOURCE_DIR}/mod2.h")
AddHeader("dev" "${CMAKE_CURRENT_SOURCE_DIR}/mod2.h")

AddLibrary("All" "${CMAKE_CURRENT_BINARY_DIR}/libmod2.so")
AddLibrary("dev" "${CMAKE_CURRENT_BINARY_DIR}/libmod2.so")
AddLibrary("Runtime" "${CMAKE_CURRENT_BINARY_DIR}/libmod2.so")