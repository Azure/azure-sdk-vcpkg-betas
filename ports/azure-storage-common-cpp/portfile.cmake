# NOTE: All changes made to this file will get overwritten by the next port release.
# Please contribute your changes to https://github.com/Azure/azure-sdk-for-cpp.

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF "azure-storage-common_${VERSION}"
    SHA512 3cb6a941c58420a8c283be81526407d5ebfa5a666492542693474039474dcb3b5687a4b22c53ab880e4af4a6e16c3d3fc4d04312356e6166ab5452e78d9ed5a5
    HEAD_REF main
)

if(EXISTS "${SOURCE_PATH}/sdk/storage/azure-storage-common")
  file(REMOVE_RECURSE "${SOURCE_PATH}/sdk/storage/_")
  file(REMOVE_RECURSE "${SOURCE_PATH}/sdk/_")
  file(REMOVE_RECURSE "${SOURCE_PATH}/_")

  file(RENAME "${SOURCE_PATH}/sdk/storage/azure-storage-common" "${SOURCE_PATH}/sdk/storage/_")
  file(RENAME "${SOURCE_PATH}/sdk/storage" "${SOURCE_PATH}/sdk/_")
  file(RENAME "${SOURCE_PATH}/sdk" "${SOURCE_PATH}/_")
endif()

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}/_/_/_"
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
        -DBUILD_TESTING=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
