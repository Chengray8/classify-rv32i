.globl relu

.text
# ==============================================================================
# FUNCTION: Array ReLU Activation
#
# Applies ReLU (Rectified Linear Unit) operation in-place:
# For each element x in array: x = max(0, x)
#
# Arguments:
#   a0: Pointer to integer array to be modified
#   a1: Number of elements in array
#
# Returns:
#   None - Original array is modified directly
#
# Validation:
#   Requires non-empty array (length * 1)
#   Terminates (code 36) if validation fails
#
# Example:
#   Input:  [-2, 0, 3, -1, 5]
#   Result: [ 0, 0, 3,  0, 5]
# ==============================================================================
relu:
    li t0, 1             
    blt a1, t0, error     

loop_start:
    # TODO: Add your own implementation
    beqz a1, return                  # Determine array is accessed over or not.
    lw   t3, 0(a0)                   # Load value of array
    addi a1, a1, -1                  # a1--
    addi a0, a0,  4                  # a0+4
    bge  t3, zero, loop_start        # Determine value is positive numbers or negative numbers.
    sw   zero, -4(a0)                # Store 0 back
    j    loop_start

return:
    jr  ra
error:
    li a0, 36          
    j exit          
