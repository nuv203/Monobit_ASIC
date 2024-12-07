# SPDX-FileCopyrightText: © 2024 Tiny Tapeout
# SPDX-License-Identifier: Apache-2.0

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles

@cocotb.test()
async def test_monobit(dut):
    """
    This testbench uses cocotb to replicate the logic from the provided C++ code.
    It will drive a sequence of bits into the DUT and after N_TESTS iterations,
    it will display the `valid` and `is_random` outputs.
    """
    N_TESTS = 65536

    # Reset the DUT
    dut.rst.value = 1
    await RisingEdge(dut.clk)
    dut.rst.value = 0

    # Run N_TESTS iterations, similar to the C++ code
    for i in range(N_TESTS):
        # Match the logic: rnd = i > 3 ? i%2 : 0
        rnd = (i % 2) if i > 3 else 0

        # Apply input to epsilon_rsc_dat
        dut.epsilon_rsc_dat.value = rnd

        # Advance one clock cycle
        await RisingEdge(dut.clk)

    # After N_TESTS, print out the final values of valid and is_random
    cocotb.log.info(f"valid: {int(dut.valid_rsc_dat.value)} \t random: {int(dut.is_random_rsc_dat.value)}")
