# In this file we will discuss how to make a system that is capable of doing 2 main things:
Since the creator of this stupid tutorial is using Arch btw and is suggesting you to do that(switch to Linux if you haven't already) if you have windows still you are likely to have other issues...So if you have windows just get a full package(this file is not for you)
1. Turn C files into MIPS assembly(with clang flags)   
2. Turn MIPS assembly into executable  
3. Use other useful packages  

## For the First objective:  
1. Download clang for your computer  
2. Run:
Caution for the first to work you need to have other dependencies as well...(see below)  
   a. clang --target=mips64-linux-gnuabi64 code.c -o code (Big Endian machine)
   b. clang clang --target=mips64el-linux-gnuabi64 code.c -o code (Little Endian machine)
These two commands make C into MIPS executables. But how can we make C into assembly for MIPS?
Use this flag:  
Little endian: clang --target=mipsel-linux-gnu code.c -o code  
Big endian(32): clang --target=mips32-linux-gnu code.c -o code  
Big endian(64): clang --target=mips64-linux-gnu code.c -o code  
For the moment for obvious reasons we are going to focus on MIPS 64 assembly.
This is for various reasons and especially making MIPS into actual executables.

## For the second objective:  
Get the GNU MIPS assembler  
Yay AUR: yay -S mips64-linux-gnu   
And to run we do 2 tasks:  
1. MAKE THE OBJETIVE FILE:  
Run: mips64-linux-gnu-as -march=mips64(change this if you like to what you need) -mabi=64 -EB (Big endian) -o output_1.o inputs.  
2. LINK THE FILE TO AN EXECUTABLE(Same .o file we created)  
Run: mips64-linux-gnu-ld -march=mips64(change this if you like to what you need) -mabi=64 -EB (Big endian) -o output output_1.o(or whatever the o file is)  
Now eventually this is the same with the clang command.
But we still have another issue:  

## How to run the MIPS64 executable  
1. Use a vm or use this(or a similar package) qemu(pacman package)  
So get qemu and then run:  
qemu-mips64 ./executable_for_mips  
And this will run.  

# The complete package:
As an Arch user you might get into hell just out of curiosity.
But if you want to visualize the pipeline and just live in peace away from the box that scares you so much(and is called TERMINAL) OR if you are one of the other guys(user of the worst OS in existence by far) download QtSpim.


*WARNING: THE AUTHOR HAS NEVER HAD ENOUGH EXPERIENCE WITH ASSEMBLY SO IT IS POSSIBLE THAT THE REPO CONATINS MISTAKES!*  
*IN THIS CASE DO NOT FORGET TO MAKE AN ISSUE ON GIT_HUB AND THE MISTAKE WILL BE FIXED SHORTLY*  
*NOTE THAT ALL ADVICE IS BASED ON A PERSONAL EXPERIENCE. THE CONTRIBUTOR IS NOT AFFILIATED IN ANY WAY WITH THE SOFTWARE PRESENTED*  
