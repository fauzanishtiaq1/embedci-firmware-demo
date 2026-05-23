# EmbedCI Firmware Demo

This is a sample Zephyr firmware project for testing EmbedCI. Copy the contents of this directory into your GitHub repo, install the EmbedCI GitHub App, and open a PR to see automated firmware CI in action.

## What's included

- `src/main.c` — minimal Zephyr app that prints "Hello World! EmbedCI" over UART
- `CMakeLists.txt` / `prj.conf` — standard Zephyr build configuration
- `.embedci.yml` — EmbedCI configuration (board, app path, test file)
- `tests/smoke.robot` — Robot Framework test that boots the firmware in Renode and asserts UART output

## Quick start

1. Copy this directory into your GitHub repository.
2. Install the [EmbedCI GitHub App](https://github.com/apps/embedci) on your repo.
3. Open a pull request — EmbedCI will automatically build the firmware, run it in the Renode emulator, and report pass/fail on the PR.
