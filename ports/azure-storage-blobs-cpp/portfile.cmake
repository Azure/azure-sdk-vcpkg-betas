vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF azure-storage-blobs_12.8.0-beta.1
    SHA512 1bf04af2c5be3ba5fa09e7523d9e40b00267d0a43cc52aa6ce102b5298bca17bb312960fe8d1c7addd5ee26ef6a06dd66653a5175e8a4bd10845a8b759fdd4de
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}/sdk/storage/azure-storage-blobs/"
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
