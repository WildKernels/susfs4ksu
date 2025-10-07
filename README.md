## Introduction ##
This branch is exclusive for pixel8 (Shiba) only, it is based on latest sultan zuma kernel branch 16.0.0-sultan and 5ec1cff's KernelSU fork

- Sultan kernel for zuma: https://github.com/kerneltoast/android_kernel_google_zuma

- 5ec1cff's KernelSU aka MKSU: https://github.com/5ec1cff/KernelSU

- Based on Factory Images with Security Patch 2025-09-05

## Requirements ##
- Full Stock Factory Pixel 8 (Shiba) images

- 16.0.0-sultan supported boot.img and vendor_kernel_boot.img

## Features ##
- Minimal SUSFS features which by default enables only the following:
    * CONFIG_KSU_SUSFS_SUS_MOUNT
    * CONFIG_KSU_SUSFS_AUTO_ADD_SUS_KSU_DEFAULT_MOUNT
    * CONFIG_KSU_SUSFS_AUTO_ADD_SUS_BIND_MOUNT
    * CONFIG_KSU_SUSFS_TRY_UMOUNT
    * CONFIG_KSU_SUSFS_AUTO_ADD_TRY_UMOUNT_FOR_BIND_MOUNT
    * CONFIG_KSU_SUSFS_ENABLE_LOG
    * CONFIG_KSU_SUSFS_HIDE_KSU_SUSFS_SYMBOLS
    * CONFIG_KSU_SUSFS_SPOOF_CMDLINE_OR_BOOTCONFIG

- Users may enable the disabled features by themselves such as SUS_PATH, SUS_KSTAT, OPEN_REDIRECT, etc..

- Manually hooks ported from SUS_SU and offical KSU

- Reverted the original uname spoof, a stock uname is already spoofed during compile time

- MKSU based, so no overlayfs is required

## Apply SUSFS patches ##
1. Clone this susfs branch with a **tag / release tag** or up to a commit message containing **"Bump version to vX.X.X"**, as they are more stable in general.
2. Run `cp ./kernel_patches/KernelSU/10_enable_susfs_for_ksu.patch $KERNEL_REPO/KernelSU/`
3. Run `cp ./kernel_patches/50_add_susfs_in_kernel-<kernel_version>.patch $KERNEL_REPO/`
4. Run `cp ./kernel_patches/fs/* $KERNEL_REPO/fs/`
5. Run `cp ./kernel_patches/include/linux/* $KERNEL_REPO/include/linux/`
6. Run `cd $KERNEL_REPO/KernelSU` and then `patch -p1 < 10_enable_susfs_for_ksu.patch`
7. Run `cd $KERNEL_REPO` and then `patch -p1 < 50_add_susfs_in_kernel.patch`, **if there are failed patches, you may try to patch them manually by yourself.**
8. If you want to make your kernel support other KSU manager variant, you can add its own hash size and hash in `ksu_is_manager_apk()` function in `KernelSU/kernel/apk_sign.c`
9. Make sure again to have `CONFIG_KSU` and `CONFIG_KSU_SUSFS` enabled before building the kernel, some other SUSFS feature may be disabled by default, you may enable/disable them via `menuconfig`, `kernel defconfig`, or change the `default [y|n]` option under each `config KSU_SUSFS_` option in `$KernelSU_repo/kernel/Kconfig` if you build with a new defconfig every time.

## Prebuilt AnyKernel3 Zip ##
- My prebuilt anykernel3 zip is provided if users just want to use it directly, but again be reminded to back up your own data first as always.

## Credits ##
- KernelSU: https://github.com/tiann/KernelSU
- KernelSU fork: https://github.com/5ec1cff/KernelSU
- @Kartatz: for ideas and original commit from https://github.com/Dominium-Apum/kernel_xiaomi_chime/pull/1/commits/74f8d4ecacd343432bb8137b7e7fbe3fd9fef189
- Sultan Kernel: https://github.com/kerneltoast/android_kernel_google_zuma

## Telegram ##
- @simonpunk

## Buy me a coffee ##
- PayPal: kingjeffkimo@yahoo.com.tw
- BTC: bc1qgkwvsfln02463zpjf7z6tds8xnpeykggtgk4kw
