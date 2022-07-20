vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF azure-template_1.1.0-beta.1
    SHA512 45533c2940c50831c5d874596a9dcbdedb009018ff2ef99655280b5fb99b4278f99bca37d1827e5d855d59a3956a089fa37408819f23b574e77698207dad1bfd
)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}/sdk/template/azure-template/
    OPTIONS
        -DWARNINGS_AS_ERRORS=OFF
)

vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_cmake_config_fixup()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
vcpkg_copy_pdbs()
