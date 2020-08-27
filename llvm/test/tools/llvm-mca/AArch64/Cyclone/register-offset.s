# NOTE: Assertions have been autogenerated by utils/update_mca_test_checks.py
# RUN: llvm-mca -march=aarch64 -mcpu=cyclone -resource-pressure=false < %s | FileCheck %s

  ldr	x7, [x1, #8]
  ldr	x6, [x1, x2]
  ldr	x4, [x1, x2, sxtx]

# CHECK:      Iterations:        100
# CHECK-NEXT: Instructions:      300
# CHECK-NEXT: Total Cycles:      157
# CHECK-NEXT: Total uOps:        500

# CHECK:      Dispatch Width:    6
# CHECK-NEXT: uOps Per Cycle:    3.18
# CHECK-NEXT: IPC:               1.91
# CHECK-NEXT: Block RThroughput: 1.5

# CHECK:      Instruction Info:
# CHECK-NEXT: [1]: #uOps
# CHECK-NEXT: [2]: Latency
# CHECK-NEXT: [3]: RThroughput
# CHECK-NEXT: [4]: MayLoad
# CHECK-NEXT: [5]: MayStore
# CHECK-NEXT: [6]: HasSideEffects (U)

# CHECK:      [1]    [2]    [3]    [4]    [5]    [6]    Instructions:
# CHECK-NEXT:  1      4     0.50    *                   ldr	x7, [x1, #8]
# CHECK-NEXT:  2      5     0.50    *                   ldr	x6, [x1, x2]
# CHECK-NEXT:  2      5     0.50    *                   ldr	x4, [x1, x2, sxtx]
