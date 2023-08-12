vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF azure-storage-blobs_12.9.0-beta.2
    SHA512 82bad39e8bce1f176e3d4cd985570561a70e3c0c74c0d96a88a4477b0240e93ceba174716657c9eefebbceb8248bdb06523bb7b277305d24bcda47b469b4090e
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}/sdk/storage/azure-storage-blobs/"
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
        -DBUILD_TESTING=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
