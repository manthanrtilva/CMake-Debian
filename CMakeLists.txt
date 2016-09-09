
CMAKE_MINIMUM_REQUIRED(VERSION 3.2)
PROJECT(TestProject VERSION 1.0.1)

SET(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_CURRENT_SOURCE_DIR}/cmake/")

include(BuildPackage)

AddPackage("All")
AddPackage("dev")
AddPackage("Config")
AddPackage("Runtime")

ADD_EXECUTABLE(main main.cpp)

add_subdirectory(module1)
add_subdirectory(module2)

AddFile("All" "${CMAKE_CURRENT_SOURCE_DIR}/myConfig.conf" "etc/")
AddFile("Config" "${CMAKE_CURRENT_SOURCE_DIR}/myConfig.conf" "etc/")

AddBinary("All" "${CMAKE_CURRENT_BINARY_DIR}/main")
AddBinary("Runtime" "${CMAKE_CURRENT_BINARY_DIR}/main")