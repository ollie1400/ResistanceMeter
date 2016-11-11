#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-Simulator.mk)" "nbproject/Makefile-local-Simulator.mk"
include nbproject/Makefile-local-Simulator.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=Simulator
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/src.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/src.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=
else
COMPARISON_BUILD=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=D:/microchip_solutions_v2013-06-15/Microchip/USB/usb_device.c "D:/microchip_solutions_v2013-06-15/Microchip/USB/CDC Device Driver/usb_function_cdc.c" adc.c cdc_interrupts.c configuration_bits.c main.c pwm.c system.c usb_descriptors.c usb_interrupts.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/9348587/usb_device.o ${OBJECTDIR}/_ext/1419641456/usb_function_cdc.o ${OBJECTDIR}/adc.o ${OBJECTDIR}/cdc_interrupts.o ${OBJECTDIR}/configuration_bits.o ${OBJECTDIR}/main.o ${OBJECTDIR}/pwm.o ${OBJECTDIR}/system.o ${OBJECTDIR}/usb_descriptors.o ${OBJECTDIR}/usb_interrupts.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/9348587/usb_device.o.d ${OBJECTDIR}/_ext/1419641456/usb_function_cdc.o.d ${OBJECTDIR}/adc.o.d ${OBJECTDIR}/cdc_interrupts.o.d ${OBJECTDIR}/configuration_bits.o.d ${OBJECTDIR}/main.o.d ${OBJECTDIR}/pwm.o.d ${OBJECTDIR}/system.o.d ${OBJECTDIR}/usb_descriptors.o.d ${OBJECTDIR}/usb_interrupts.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/9348587/usb_device.o ${OBJECTDIR}/_ext/1419641456/usb_function_cdc.o ${OBJECTDIR}/adc.o ${OBJECTDIR}/cdc_interrupts.o ${OBJECTDIR}/configuration_bits.o ${OBJECTDIR}/main.o ${OBJECTDIR}/pwm.o ${OBJECTDIR}/system.o ${OBJECTDIR}/usb_descriptors.o ${OBJECTDIR}/usb_interrupts.o

# Source Files
SOURCEFILES=D:/microchip_solutions_v2013-06-15/Microchip/USB/usb_device.c D:/microchip_solutions_v2013-06-15/Microchip/USB/CDC Device Driver/usb_function_cdc.c adc.c cdc_interrupts.c configuration_bits.c main.c pwm.c system.c usb_descriptors.c usb_interrupts.c


CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-Simulator.mk dist/${CND_CONF}/${IMAGE_TYPE}/src.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=32MX250F128B
MP_LINKER_FILE_OPTION=
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/9348587/usb_device.o: D:/microchip_solutions_v2013-06-15/Microchip/USB/usb_device.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/9348587" 
	@${RM} ${OBJECTDIR}/_ext/9348587/usb_device.o.d 
	@${RM} ${OBJECTDIR}/_ext/9348587/usb_device.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/9348587/usb_device.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/microchip_solutions_v2013-06-15/Microchip/Include/USB" -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/Technical/Code - Git/MPLABX/ResistanceMeter/src" -MMD -MF "${OBJECTDIR}/_ext/9348587/usb_device.o.d" -o ${OBJECTDIR}/_ext/9348587/usb_device.o D:/microchip_solutions_v2013-06-15/Microchip/USB/usb_device.c    -DXPRJ_Simulator=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1419641456/usb_function_cdc.o: D:/microchip_solutions_v2013-06-15/Microchip/USB/CDC\ Device\ Driver/usb_function_cdc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1419641456" 
	@${RM} ${OBJECTDIR}/_ext/1419641456/usb_function_cdc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1419641456/usb_function_cdc.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1419641456/usb_function_cdc.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/microchip_solutions_v2013-06-15/Microchip/Include/USB" -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/Technical/Code - Git/MPLABX/ResistanceMeter/src" -MMD -MF "${OBJECTDIR}/_ext/1419641456/usb_function_cdc.o.d" -o ${OBJECTDIR}/_ext/1419641456/usb_function_cdc.o "D:/microchip_solutions_v2013-06-15/Microchip/USB/CDC Device Driver/usb_function_cdc.c"    -DXPRJ_Simulator=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/adc.o: adc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/adc.o.d 
	@${RM} ${OBJECTDIR}/adc.o 
	@${FIXDEPS} "${OBJECTDIR}/adc.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/microchip_solutions_v2013-06-15/Microchip/Include/USB" -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/Technical/Code - Git/MPLABX/ResistanceMeter/src" -MMD -MF "${OBJECTDIR}/adc.o.d" -o ${OBJECTDIR}/adc.o adc.c    -DXPRJ_Simulator=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/cdc_interrupts.o: cdc_interrupts.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/cdc_interrupts.o.d 
	@${RM} ${OBJECTDIR}/cdc_interrupts.o 
	@${FIXDEPS} "${OBJECTDIR}/cdc_interrupts.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/microchip_solutions_v2013-06-15/Microchip/Include/USB" -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/Technical/Code - Git/MPLABX/ResistanceMeter/src" -MMD -MF "${OBJECTDIR}/cdc_interrupts.o.d" -o ${OBJECTDIR}/cdc_interrupts.o cdc_interrupts.c    -DXPRJ_Simulator=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/configuration_bits.o: configuration_bits.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/configuration_bits.o.d 
	@${RM} ${OBJECTDIR}/configuration_bits.o 
	@${FIXDEPS} "${OBJECTDIR}/configuration_bits.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/microchip_solutions_v2013-06-15/Microchip/Include/USB" -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/Technical/Code - Git/MPLABX/ResistanceMeter/src" -MMD -MF "${OBJECTDIR}/configuration_bits.o.d" -o ${OBJECTDIR}/configuration_bits.o configuration_bits.c    -DXPRJ_Simulator=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/main.o: main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	@${FIXDEPS} "${OBJECTDIR}/main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/microchip_solutions_v2013-06-15/Microchip/Include/USB" -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/Technical/Code - Git/MPLABX/ResistanceMeter/src" -MMD -MF "${OBJECTDIR}/main.o.d" -o ${OBJECTDIR}/main.o main.c    -DXPRJ_Simulator=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/pwm.o: pwm.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/pwm.o.d 
	@${RM} ${OBJECTDIR}/pwm.o 
	@${FIXDEPS} "${OBJECTDIR}/pwm.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/microchip_solutions_v2013-06-15/Microchip/Include/USB" -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/Technical/Code - Git/MPLABX/ResistanceMeter/src" -MMD -MF "${OBJECTDIR}/pwm.o.d" -o ${OBJECTDIR}/pwm.o pwm.c    -DXPRJ_Simulator=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/system.o: system.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/system.o.d 
	@${RM} ${OBJECTDIR}/system.o 
	@${FIXDEPS} "${OBJECTDIR}/system.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/microchip_solutions_v2013-06-15/Microchip/Include/USB" -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/Technical/Code - Git/MPLABX/ResistanceMeter/src" -MMD -MF "${OBJECTDIR}/system.o.d" -o ${OBJECTDIR}/system.o system.c    -DXPRJ_Simulator=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/usb_descriptors.o: usb_descriptors.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/usb_descriptors.o.d 
	@${RM} ${OBJECTDIR}/usb_descriptors.o 
	@${FIXDEPS} "${OBJECTDIR}/usb_descriptors.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/microchip_solutions_v2013-06-15/Microchip/Include/USB" -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/Technical/Code - Git/MPLABX/ResistanceMeter/src" -MMD -MF "${OBJECTDIR}/usb_descriptors.o.d" -o ${OBJECTDIR}/usb_descriptors.o usb_descriptors.c    -DXPRJ_Simulator=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/usb_interrupts.o: usb_interrupts.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/usb_interrupts.o.d 
	@${RM} ${OBJECTDIR}/usb_interrupts.o 
	@${FIXDEPS} "${OBJECTDIR}/usb_interrupts.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/microchip_solutions_v2013-06-15/Microchip/Include/USB" -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/Technical/Code - Git/MPLABX/ResistanceMeter/src" -MMD -MF "${OBJECTDIR}/usb_interrupts.o.d" -o ${OBJECTDIR}/usb_interrupts.o usb_interrupts.c    -DXPRJ_Simulator=$(CND_CONF)    $(COMPARISON_BUILD) 
	
else
${OBJECTDIR}/_ext/9348587/usb_device.o: D:/microchip_solutions_v2013-06-15/Microchip/USB/usb_device.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/9348587" 
	@${RM} ${OBJECTDIR}/_ext/9348587/usb_device.o.d 
	@${RM} ${OBJECTDIR}/_ext/9348587/usb_device.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/9348587/usb_device.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/microchip_solutions_v2013-06-15/Microchip/Include/USB" -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/Technical/Code - Git/MPLABX/ResistanceMeter/src" -MMD -MF "${OBJECTDIR}/_ext/9348587/usb_device.o.d" -o ${OBJECTDIR}/_ext/9348587/usb_device.o D:/microchip_solutions_v2013-06-15/Microchip/USB/usb_device.c    -DXPRJ_Simulator=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/_ext/1419641456/usb_function_cdc.o: D:/microchip_solutions_v2013-06-15/Microchip/USB/CDC\ Device\ Driver/usb_function_cdc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1419641456" 
	@${RM} ${OBJECTDIR}/_ext/1419641456/usb_function_cdc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1419641456/usb_function_cdc.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1419641456/usb_function_cdc.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/microchip_solutions_v2013-06-15/Microchip/Include/USB" -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/Technical/Code - Git/MPLABX/ResistanceMeter/src" -MMD -MF "${OBJECTDIR}/_ext/1419641456/usb_function_cdc.o.d" -o ${OBJECTDIR}/_ext/1419641456/usb_function_cdc.o "D:/microchip_solutions_v2013-06-15/Microchip/USB/CDC Device Driver/usb_function_cdc.c"    -DXPRJ_Simulator=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/adc.o: adc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/adc.o.d 
	@${RM} ${OBJECTDIR}/adc.o 
	@${FIXDEPS} "${OBJECTDIR}/adc.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/microchip_solutions_v2013-06-15/Microchip/Include/USB" -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/Technical/Code - Git/MPLABX/ResistanceMeter/src" -MMD -MF "${OBJECTDIR}/adc.o.d" -o ${OBJECTDIR}/adc.o adc.c    -DXPRJ_Simulator=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/cdc_interrupts.o: cdc_interrupts.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/cdc_interrupts.o.d 
	@${RM} ${OBJECTDIR}/cdc_interrupts.o 
	@${FIXDEPS} "${OBJECTDIR}/cdc_interrupts.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/microchip_solutions_v2013-06-15/Microchip/Include/USB" -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/Technical/Code - Git/MPLABX/ResistanceMeter/src" -MMD -MF "${OBJECTDIR}/cdc_interrupts.o.d" -o ${OBJECTDIR}/cdc_interrupts.o cdc_interrupts.c    -DXPRJ_Simulator=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/configuration_bits.o: configuration_bits.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/configuration_bits.o.d 
	@${RM} ${OBJECTDIR}/configuration_bits.o 
	@${FIXDEPS} "${OBJECTDIR}/configuration_bits.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/microchip_solutions_v2013-06-15/Microchip/Include/USB" -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/Technical/Code - Git/MPLABX/ResistanceMeter/src" -MMD -MF "${OBJECTDIR}/configuration_bits.o.d" -o ${OBJECTDIR}/configuration_bits.o configuration_bits.c    -DXPRJ_Simulator=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/main.o: main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	@${FIXDEPS} "${OBJECTDIR}/main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/microchip_solutions_v2013-06-15/Microchip/Include/USB" -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/Technical/Code - Git/MPLABX/ResistanceMeter/src" -MMD -MF "${OBJECTDIR}/main.o.d" -o ${OBJECTDIR}/main.o main.c    -DXPRJ_Simulator=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/pwm.o: pwm.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/pwm.o.d 
	@${RM} ${OBJECTDIR}/pwm.o 
	@${FIXDEPS} "${OBJECTDIR}/pwm.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/microchip_solutions_v2013-06-15/Microchip/Include/USB" -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/Technical/Code - Git/MPLABX/ResistanceMeter/src" -MMD -MF "${OBJECTDIR}/pwm.o.d" -o ${OBJECTDIR}/pwm.o pwm.c    -DXPRJ_Simulator=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/system.o: system.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/system.o.d 
	@${RM} ${OBJECTDIR}/system.o 
	@${FIXDEPS} "${OBJECTDIR}/system.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/microchip_solutions_v2013-06-15/Microchip/Include/USB" -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/Technical/Code - Git/MPLABX/ResistanceMeter/src" -MMD -MF "${OBJECTDIR}/system.o.d" -o ${OBJECTDIR}/system.o system.c    -DXPRJ_Simulator=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/usb_descriptors.o: usb_descriptors.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/usb_descriptors.o.d 
	@${RM} ${OBJECTDIR}/usb_descriptors.o 
	@${FIXDEPS} "${OBJECTDIR}/usb_descriptors.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/microchip_solutions_v2013-06-15/Microchip/Include/USB" -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/Technical/Code - Git/MPLABX/ResistanceMeter/src" -MMD -MF "${OBJECTDIR}/usb_descriptors.o.d" -o ${OBJECTDIR}/usb_descriptors.o usb_descriptors.c    -DXPRJ_Simulator=$(CND_CONF)    $(COMPARISON_BUILD) 
	
${OBJECTDIR}/usb_interrupts.o: usb_interrupts.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/usb_interrupts.o.d 
	@${RM} ${OBJECTDIR}/usb_interrupts.o 
	@${FIXDEPS} "${OBJECTDIR}/usb_interrupts.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION) -I"D:/microchip_solutions_v2013-06-15/Microchip/Include/USB" -I"D:/microchip_solutions_v2013-06-15/Microchip/Include" -I"D:/Technical/Code - Git/MPLABX/ResistanceMeter/src" -MMD -MF "${OBJECTDIR}/usb_interrupts.o.d" -o ${OBJECTDIR}/usb_interrupts.o usb_interrupts.c    -DXPRJ_Simulator=$(CND_CONF)    $(COMPARISON_BUILD) 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/src.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mdebugger -D__MPLAB_DEBUGGER_SIMULATOR=1 -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/src.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_Simulator=$(CND_CONF)    $(COMPARISON_BUILD)      -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_SIMULATOR=1,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map"
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/src.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/src.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_Simulator=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map"
	${MP_CC_DIR}\\xc32-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/src.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/Simulator
	${RM} -r dist/Simulator

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
