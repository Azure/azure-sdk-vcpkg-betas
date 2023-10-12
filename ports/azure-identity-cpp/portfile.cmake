vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Azure/azure-sdk-for-cpp
    REF azure-identity_1.6.0-beta.3
    SHA512 2077a647eeea62878db1b01e30f26aa0b17fc6845fc966e671ffb44514c092d677aef7ba964586ea135e708f45f53376d88e87d6f3c94f1d36e06c46ba38e548
)

if(EXISTS "${SOURCE_PATH}/sdk/identity/azure-identity")
  file(REMOVE_RECURSE "${SOURCE_PATH}/sdk/identity/_")
  file(REMOVE_RECURSE "${SOURCE_PATH}/sdk/_")
  file(REMOVE_RECURSE "${SOURCE_PATH}/_")

  file(RENAME "${SOURCE_PATH}/sdk/identity/azure-identity" "${SOURCE_PATH}/sdk/identity/_")
  file(RENAME "${SOURCE_PATH}/sdk/identity" "${SOURCE_PATH}/sdk/_")
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
