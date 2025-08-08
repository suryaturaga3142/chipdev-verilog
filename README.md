# chipdev-verilog

The following website has a very nice set of SystemVerilog questions to practice one's skills in programming and coming up with some neat source code.

### https://chipdev.io/question-list

Here's the HDLBits website as well just for reference. You might see a couple things from there.

### https://hdlbits.01xz.net/wiki/Problem_sets

This repository is just my collection of solutions. I didn't _just_ want to write something that works. I focused on writing very neat and elegant solutions that use less lines of code and are easier to understand. With the right coding style and sufficient optimizations, this translates to better hardware. For example, small multipliers can be faster than large multiplexers.

### Note about the content

Each file is named after the corresponding question in the website. It also has the prompt in it for quick reference. Some of the input-output ports seem "unoptimized" but I have no control over that. If it were up to me, I'd probably name them a bit differently. For example, using ```dout[3:0]``` is better than ```dout3```, ... ```dout0```. Since the questions are fixed, I didn't mess with such things. But, you might see a comment or 2 of mine just pointing this out in my files. 

I should also add that none of the questions related to testbenching. It was all source code writing and hitting run. I play around with verilog enough to know testbenching on my own, so you might see one of my own testbenches in this repo every now and then. Look for ```<filename>_tb.sv```. Not for everything, just the nice ones ;)

### Why this website

Honestly, I just saw a couple of interesting questions especially in the hard levels. They didn't look unsolvable, but they look like they could use some optimized code. I like the feeling when I simpify a complicated piece of code into something nicer. Not ignoring HDLBits tho, they have more testbenching which is cool.
