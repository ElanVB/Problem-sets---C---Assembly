################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

RM := rm -rf *.lst *.lis *.lpp *.map

# All of the sources participating in the build are defined here
-include sources.mk
-include src/subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(C++_UPPER_DEPS)),)
-include $(C++_UPPER_DEPS)
endif
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
ifneq ($(strip $(S_DEPS)),)
-include $(S_DEPS)
endif
ifneq ($(strip $(CXX_DEPS)),)
-include $(CXX_DEPS)
endif
ifneq ($(strip $(S_UPPER_DEPS)),)
-include $(S_UPPER_DEPS)
endif
ifneq ($(strip $(C++_DEPS)),)
-include $(C++_DEPS)
endif
ifneq ($(strip $(SRC_DEPS)),)
-include $(SRC_DEPS)
endif
ifneq ($(strip $(ASM_DEPS)),)
-include $(ASM_DEPS)
endif
ifneq ($(strip $(CC_DEPS)),)
-include $(CC_DEPS)
endif
ifneq ($(strip $(SRC_UPPER_DEPS)),)
-include $(SRC_UPPER_DEPS)
endif
ifneq ($(strip $(CPP_UPPER_DEPS)),)
-include $(CPP_UPPER_DEPS)
endif
ifneq ($(strip $(CPP_DEPS)),)
-include $(CPP_DEPS)
endif
ifneq ($(strip $(CC_UPPER_DEPS)),)
-include $(CC_UPPER_DEPS)
endif
ifneq ($(strip $(C_UPPER_DEPS)),)
-include $(C_UPPER_DEPS)
endif
ifneq ($(strip $(CXX_UPPER_DEPS)),)
-include $(CXX_UPPER_DEPS)
endif
endif

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 
LIBRARY_GENERATOR_OUTPUTTYPE_OUTPUTS += \
libPrac2.a \

LINKER_OUTPUT_OUTPUTS += \
Prac2.x \


# All Target
# Main-build Target
all: Prac2.mot
	@echo 'Build complete.'

# Tool invocations
Prac2.mot: $(LINKER_OUTPUT_OUTPUTS)
	@echo 'Invoking: Objcopy'
	rl78-elf-objcopy -O srec  $(LINKER_OUTPUT_OUTPUTS)"Prac2.mot"
	@echo 'Finished building target:'
	@echo.

libPrac2.a: 
	@echo 'Invoking: Library Generator'
	rl78-elf-libgen --select-lib=optlib --header-files=stdio,stdlib,string --compiler-options=-Os,-mmul=g13,-ffunction-sections,-fdata-sections,-fno-function-cse,-falign-jumps,-funit-at-a-time -o "libPrac2.a"
	@echo 'Finished building:'
	@echo.

Prac2.x: $(OBJS) $(LIBRARY_GENERATOR_OUTPUTTYPE_OUTPUTS) $(ALL_ASMS)
	@echo 'Invoking: Linker'
	@echo 'Building target:'
	rl78-elf-ld -o "Prac2.x" -T"E:\Google Drive\Second Year Engineering\E en E\Computer systems semseter 2\Prakties\2015\Code\Prac2\HardwareDebug\Prac2_HardwareDebug_auto.gsi" -T"E:\Google Drive\Second Year Engineering\E en E\Computer systems semseter 2\Prakties\2015\Code\Prac2\HardwareDebug\LinkerSubCommand.tmp" $(USER_OBJS) $(LIBS) $(LIBRARY_GENERATOR_OUTPUTTYPE_OUTPUTS) -M=Prac2.map -e_PowerON_Reset -L"E:\Google Drive\Second Year Engineering\E en E\Computer systems semseter 2\Prakties\2015\Code\Prac2\HardwareDebug" -L"C:\PROGRA~2\KPIT\GNURL7~1.01-\rl78-ELF/lib/gcc/rl78-elf/4.8-GNURL78_v14.01" --start-group -lPrac2 -lgcc --end-group
	@echo 'Finished building:'
	@echo.

# Other Targets
clean:
	-$(RM) $(LINKER_OUTPUT_OUTPUTS)$(OBJCOPY_OUTPUTTYPE_OUTPUTS)$(LIBRARY_GENERATOR_OUTPUTTYPE_OUTPUTS)
	rm -rf ./"src"/*.o ./"src"/*.d  Prac2.mot
	@echo.
	@echo 'Clean complete.'

.PHONY: all clean dependents
.SECONDARY:

-include ../makefile.targets
