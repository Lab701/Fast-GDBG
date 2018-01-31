# Fast-GDBG
This is a fast implement of the GDBG.

# File Structure

    -- /Original-GDBG : The original implemention of GDBG.
    -- /GDBG : our Fast implementation of GDBG.
    -- evaluate.m : Function to help easily call the benchmak evaluation function of GDBG.
    -- testGDBG.m : A script for test and compare the modified GDBG and the original GDBG.

# Properties
1. The fast GDBG supports evaluating the fitness of more than one point at one call.
2. Some more matrix operations supported by Matlab are adopted to accelarate the program.


# Bug fixed
1. In the original implementation of GDBG, the variables 'x_peaks' and 'o', which represent positions of peaks, may be out of the boundary after a environment change.
In our modified edition, this bug is fixed by applying boundary check after the change.