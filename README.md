# Assignment 2: Classify
## Abs
It turns the value into its absolute value. Thus, sub t0, zero, t0, where t0 was originally a negative.

## Argmax
It returns the position of the maximum value. I use a sequential access method to search the array values from `array[0]` to `array[n-1]`, where n is the number of elements to search.


## Dot
Dot product is a type of matrix operation. The algorithm involves multiplying corresponding elements from two vectors and then summing the results.

Test fail, debug: I forgot to shift a3 and a4 by 2.
After debug, test OK.

## Matmul
`matmul` is short for matrix multiplication, a mathematical operation used to multiply two matrices.
This operation has `inner_loop` and `outer_loop`.
For example, in A ∗ B, the inner_loop primarily performs the dot product operation between a specific row of A and the columns `0` to `N−1` of B, where N is the number of columns in B.

Fail, debug: the pointer must point to the correct address.

## Read_matrix Write_matrix
mul instruction can be converted by the column form of multiplication.

## ReLU
#### Define

\begin{split}ReLU(x) = (0,x)\end{split}

ReLU (Rectified Linear Unit) is an activation function used in neural networks that outputs the input directly if it’s positive, and outputs zero if it’s negative.

## Classify.s
mul instruction can be converted by the column form of multiplication.
Fail: Attempting to access uninitialized memory between the stack and heap. Attempting to access '4' bytes at address '0x10008180'.
Trace: In test_classify_slient, the value of a0 is 0x1, result in 'blt a0,5,error_arg' branch.
Using mul instruction to test function.There has same fail, so I know the problem is not in classify.s. Then, I check other function where are falut. At the end. I replacing all instruction of relu.s. I found original code have additional loop time. But in the test function of relu.s, they didn't detect the loop running one extra time.

---
In test, 46 functions are ok states. Then I checked my code to see if I was using mul, and I found that there was a mul instruction in `dot.s`. I then modified it to match my code, but after running the tests, only test_chain_1 failed. I checked everything again to see where the issue might be, but after searching for a long time, I couldn't find the problem. Then I ran it on my Mac laptop, and it worked correctly. It was very strange.