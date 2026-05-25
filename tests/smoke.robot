*** Settings ***
Suite Setup       Setup
Suite Teardown    Teardown
Test Setup        Reset Emulation
Resource          ${RENODEKEYWORDS}
Resource          ${EMBEDCI_KEYWORDS}

*** Variables ***
${ELF_PATH}       /tmp/firmware_run.elf

*** Test Cases ***
Firmware Boots And Drives LED
    [Documentation]    Boots STM32F4 firmware, asserts the UART banner and that
    ...                the green LED (PD12) is driven high via GPIOD ODR — a
    ...                behavioural assertion against emulated hardware.
    Execute Command           mach create "stm32f4"
    Execute Command           machine LoadPlatformDescription @platforms/boards/stm32f4_discovery.repl
    Execute Command           sysbus LoadELF @${ELF_PATH}
    Create Terminal Tester    sysbus.usart2
    Start Emulation
    Wait For Uart Line        Hello World!
    Wait For Uart Line        LED on    timeout=10
    Pin Should Be High        0x40020C14    12
