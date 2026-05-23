*** Settings ***
Suite Setup       Setup
Suite Teardown    Teardown
Test Setup        Reset Emulation
Resource          ${RENODEKEYWORDS}

*** Variables ***
${ELF_PATH}       /tmp/firmware_run.elf

*** Test Cases ***
Hello World Prints To UART
    [Documentation]    Boots STM32F4 firmware, asserts "Hello World!" on USART2 within 10s.
    Execute Command           mach create "stm32f4"
    Execute Command           machine LoadPlatformDescription @platforms/boards/stm32f4_discovery.repl
    Execute Command           sysbus LoadELF @${ELF_PATH}
    Create Terminal Tester    sysbus.usart2
    Start Emulation
    Wait For Line On Uart     Hello World!    timeout=10
