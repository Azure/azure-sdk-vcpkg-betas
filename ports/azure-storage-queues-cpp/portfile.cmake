vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF azure-storage-queues_12.2.0-beta.1
    SHA512 28424808c33d8040980781f080bdf09599ea049f92a641a34bc1626e02577c33145bfe6bc16382b0d3e213a471d2f230b1eb8b28cfc9ac519e582d7b10c1f6c1
)

if(EXISTS "${SOURCE_PATH}/sdk/storage/azure-storage-queues")
  file(REMOVE_RECURSE "${SOURCE_PATH}/sdk/storage/_")
  file(REMOVE_RECURSE "${SOURCE_PATH}/sdk/_")
  file(REMOVE_RECURSE "${SOURCE_PATH}/_")

  file(RENAME "${SOURCE_PATH}/sdk/storage/azure-storage-queues" "${SOURCE_PATH}/sdk/storage/_")
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
