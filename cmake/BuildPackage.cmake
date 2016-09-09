
macro(AddPackage name)
	MESSAGE("Package name:${name}")
	SET(${name}_BUILD_DIR ${CMAKE_BINARY_DIR}/${name})
	FILE(MAKE_DIRECTORY ${${name}_BUILD_DIR})
	if(EXISTS ${${name}_BUILD_DIR}/IncludeInstallList.cmake)
		FILE(REMOVE ${${name}_BUILD_DIR}/IncludeInstallList	.cmake)
	endif()
	# FILE(REMOVE)
	ADD_CUSTOM_TARGET(${CMAKE_PROJECT_NAME}-${name}
		COMMAND ${CMAKE_COMMAND} -DSOURCE=${CMAKE_SOURCE_DIR}/cmake/PackageCMakeLists.txt.in
		-DTARGET=${${name}_BUILD_DIR}/CMakeLists.txt
		-DPNAME=${CMAKE_PROJECT_NAME}-${name}
		-DPVERSION=${PROJECT_VERSION}
		-P ${CMAKE_SOURCE_DIR}/cmake/ConfigFile.cmake
		COMMAND ${CMAKE_COMMAND} .
		COMMAND ${CMAKE_CPACK_COMMAND} -G DEB ${${name}_BUILD_DIR}
		#COMMAND ${CMAKE_COMMAND} -E echo ${CMAKE_PROJECT_NAME}-${CPACK_PACKAGE_VERSION}_${name}
		COMMENT "Building Package ${CMAKE_PROJECT_NAME}-${CPACK_PACKAGE_VERSION}_${name}"
		WORKING_DIRECTORY ${${name}_BUILD_DIR})
endmacro()

macro(AddFile package file dest)
	FILE(APPEND ${CMAKE_BINARY_DIR}/${package}/IncludeInstallList.cmake "INSTALL(FILES ${file} DESTINATION ${dest})\n")
endmacro()

macro(AddHeader package file)
	SET(EXTRA_ARG "${ARGN}")
	AddFile(${package} "${file}" "include/${EXTRA_ARG}")
endmacro()

macro(AddBinary package file)
	SET(EXTRA_ARG ${ARGN})
	AddFile(${package} ${file} "bin/${EXTRA_ARG}")
endmacro()

macro(AddLibrary package file)
	SET(EXTRA_ARG ${ARGN})
	AddFile(${package} ${file} "lib/${EXTRA_ARG}")
endmacro()


