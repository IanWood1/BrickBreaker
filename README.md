# Brickbreaker
I built a Brick Breaker game for my computer engineering class. The program was written in 32-bit Arm assembly specifically for an intel De1-Soc board. I thought it would be fun to rewrite parts of the game in C, and then compare the performance and look at the difference in generated binary.


Note: the original binary is not included




### Running the game:
Compile the source with `make debug` or `make release`. This will generate game.s which is an assembly file containing all the functions. These functions were written in C to match the original design of my assembly project. Therefore, functions in the original project can be replaced by the functions in game.s. 


The game was run/tested with this [emulator] which compiles, runs the code, and provides I\O.


### Results
1. `clear_vga_buffers()` is probably the most expensive function because each frame the function would write `320 x 240` halfwords to the vga buffer. The C compiler was better at using registers and minimizing instructions but emitted assembly with a similar control flow.
2. `clear_text_buffer()` is also expensive since it is writing spaces to the entire buffer. However, this buffer is contiguous so the compiler was able to generate vector instructions (not supported on the emulator)
3. Writing these functions in C code made it clear that most of the performance gains would come from changes to the design of the game rather than compiler optimizations. For example
    1. The code to check for collisions has a runtime of `O(n^2)` where `n` is the number of sprites. However this could be optimized by only computing collisions between balls and the other blocks leading to a runtime of `O(m*k)` where `m` is the number of ball sprites and `k=n-m`. 
    2. Additionally, alternatives to clearing the entire screen could be considered because a lot of time is wasted writing to pixels that havn't changed. 














[emulator]: https://cpulator.01xz.net/?sys=arm-de1soc