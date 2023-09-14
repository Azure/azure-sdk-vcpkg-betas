vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF azure-identity_1.6.0-beta.2
    SHA512 7325ccd04f3d29922f1a6cf7015035fd84c468fad40bbd5e5380e0e469e2dcdf877d26b1bbc571cc0289d8e3dcf08d2c281dbce53aab4a7d20b5cd9cab54df9a
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}/sdk/identity/azure-identity/"
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
        -DBUILD_TESTING=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
