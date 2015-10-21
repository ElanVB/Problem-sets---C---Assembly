################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
ASM_SRCS += \
..\src/bubblesort.asm \
..\src/findNumber.asm \
..\src/reset_program.asm 

C_SRCS += \
..\src/Prac5.c \
..\src/hardware_setup.c \
..\src/interrupt_handlers.c \
..\src/vector_table.c 

OBJS += \
./src/Prac5.o \
./src/bubblesort.o \
./src/findNumber.o \
./src/hardware_setup.o \
./src/interrupt_handlers.o \
./src/reset_program.o \
./src/vector_table.o 

C_DEPS += \
./src/Prac5.d \
./src/hardware_setup.d \
./src/interrupt_handlers.d \
./src/vector_table.d 

ASM_DEPS += \
./src/bubblesort.d \
./src/findNumber.d \
./src/reset_program.d 


# Each subdirectory must supply rules for building sources it contributes
src/%.o: ../src/%.c
	@echo 'Scanning and building file: $<'
	@echo 'Invoking: Scanner and Compiler'
	@rl78-elf-gcc -MM -MP -MF ""$(@:%.o=%.d)"" -MT"$(@:%.o=%.o)" -MT""$(@:%.o=%.d)"" @"src/c.depsub" "$<"
	@echo	rl78-elf-gcc -MM -MP -MF "$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)"  -nostdinc -I"C:\PROGRA~2\KPIT\GNURL7~1.01-\rl78-ELF/rl78-elf/optlibinc" -g2 -g -mmul=g13 -x c "$<"
	@rl78-elf-gcc @"src/c.sub" -c -x c -o "$(@:%.d=%.o)" "$<"
	@echo rl78-elf-gcc -Wa,-adlhn="$(basename $(notdir $<)).lst" -nostdinc -I"C:\PROGRA~2\KPIT\GNURL7~1.01-\rl78-ELF/rl78-elf/optlibinc" -g2 -g -mmul=g13 -c -x c -o "$(@:%.d=%.o)" "$<"
	@echo 'Finished scanning and building: $<'
	@echo.

src/%.o: ../src/%.asm
	@echo 'Scanning and building file: $<'
	@echo 'Invoking: Scanner and Compiler'
	@rl78-elf-gcc -MM -MP -MF ""$(@:%.o=%.d)"" -MT"$(@:%.o=%.o)" -MT""$(@:%.o=%.d)"" @"src/asm.depsub" -o"$@" "$<"
	@echo	rl78-elf-gcc -MM -MP -MF "$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)"  -nostdinc -I"C:\PROGRA~2\KPIT\GNURL7~1.01-\rl78-ELF/rl78-elf/optlibinc" -g2 -g -mmul=g13 -Wa,-gdwarf2 -x assembler-with-cpp -o"$@" "$<"
	@rl78-elf-gcc @"src/asm.sub" -c -x assembler-with-cpp  -o "$(@:%.d=%.o)" "$<"
	@echo rl78-elf-gcc -Wa,-adlhn="$(basename $(notdir $<)).lst" -nostdinc -I"C:\PROGRA~2\KPIT\GNURL7~1.01-\rl78-ELF/rl78-elf/optlibinc" -g2 -g -mmul=g13 -Wa,-gdwarf2 -c -x assembler-with-cpp  -o "$(@:%.d=%.o)" "$<"
	@echo 'Finished scanning and building: $<'
	@echo.

