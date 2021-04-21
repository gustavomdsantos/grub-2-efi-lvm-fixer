# GRUB 2 EFI+LVM fixer

This script do or undo the forced 30 seconds of the _default boot entry timeout_ on GRUB 2 installed on Linux systems with EFI boot in logical partitions (LVM). If GRUB is run in a local storage that has two or more operating systems, running this script will make the 30 seconds timeout go to the default 10 seconds or to the user-defined timeout set in `/etc/default/grub` file or in the `grub-customizer` app. Otherwise, GRUB 2 will not be shown and the only Linux installation will be booted instantly.

## Download

Click [here](http://bit.ly/GRUB2fixer) to download the script.

## Usage

1. Open a Terminal in the folder you downloaded the script and give execute permissions to it (if it has not been done before):

```
chmod +x EFI-LVM_GRUB2_fixer.sh
```

2. Execute the script as root:

```
sudo ./EFI-LVM_GRUB2_fixer.sh
```

3. Restart your computer.

## Contributing

Do you want to contribute to this simple project? You can Fork this repository, make commits and later, make a Pull Request. You can report a bug or suggest anything in Issues section too.

Licenced with GNU GPL 3.0 @2021 Gustavo Moraes.
