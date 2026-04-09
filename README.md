## Totem Keyboard Configuration

This repository contains a custom keymap for the [Totem keyboard](https://github.com/GEIGEIGEIST/TOTEM). The keymap is optimized for macOS usage with simplified layer access and macOS-specific modifier placement.

### Prerequisites

1. **QMK Setup**: Follow the [official QMK setup guide](https://docs.qmk.fm/#/newbs_getting_started) to install QMK Toolbox and set up the QMK development environment.

2. **Clone QMK Firmware**: If you haven't already, clone the QMK firmware repository:

   ```bash
   git clone --recurse-submodules https://github.com/qmk/qmk_firmware.git
   cd qmk_firmware
   ```

### Adding Totem Keyboard Support

The Totem keyboard firmware needs to be added to your QMK installation:

1. **Copy the Totem firmware** from the [official Totem repository](https://github.com/GEIGEIGEIST/TOTEM/tree/main/firmware/QMK/VIAL_source/totem) to your QMK keyboards directory:

   ```bash
   # From your QMK firmware directory
   cp -r path/to/TOTEM/firmware/QMK/VIAL_source/totem keyboards/
   ```

   Or clone the Totem repository and copy the keyboard definition:

   ```bash
   git clone https://github.com/GEIGEIGEIST/TOTEM.git
   cp -r TOTEM/firmware/QMK/VIAL_source/totem keyboards/
   ```

2. **Copy this keymap** to your QMK installation:

   ```bash
   # From the dotfiles repository root
   cp -r qmk_firmware/qmk_firmware/keyboards/totem/keymaps/castares path/to/qmk_firmware/keyboards/totem/keymaps/
   ```

### Compiling the Firmware

Compile the keymap using QMK:

```bash
# From your QMK firmware directory
qmk compile -kb totem -km castares
```

This will generate a `.hex` or `.uf2` file in the `qmk_firmware/.build/` directory.

### Flashing the Keyboard

1. **Put the keyboard into bootloader mode**:
   - Press the reset button on the keyboard (usually located on the back or bottom)
   - Or use the key combination defined in your current keymap (if available)

2. **Flash using QMK Toolbox**:
   - Open QMK Toolbox
   - Select the compiled firmware file (`.hex` or `.uf2`)
   - Select the correct microcontroller (usually `ATmega32U4` or `RP2040` depending on your Totem version)
   - Click "Flash" and wait for the process to complete

   Alternatively, use the command line:

   ```bash
   qmk flash -kb totem -km castares
   ```

### Keymap Features

This keymap includes:

- macOS-optimized layout with swapped Ctrl/Cmd positions
- Layer access on G/H keys (easier to reach than outer pinky keys)
- MEH modifiers on V/M for application shortcuts
- One-Shot Shift for capitalization
- Euro symbol (€) support via Unicode
- Zoom shortcuts in navigation layer
- Arrow macros (-> and >>) for programming
- Screenshot shortcuts in system config layer

For more information about customizing the keymap, see the [QMK documentation](https://docs.qmk.fm/#/).
