

add_library(mod1 STATIC mod1.cpp)

AddHeader("All" "${CMAKE_CURRENT_SOURCE_DIR}/mod1.h")
AddHeader("dev" "${CMAKE_CURRENT_SOURCE_DIR}/mod1.h")

AddLibrary("All" "${CMAKE_CURRENT_BINARY_DIR}/libmod1.a")
AddLibrary("dev" "${CMAKE_CURRENT_BINARY_DIR}/libmod1.a")