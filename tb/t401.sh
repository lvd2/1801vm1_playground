#!/bin/bash

vsim -gui -novopt -do 'change LOAD_FILE "../asm/t401.bin"; change START_ADDR 0; do wave.do' work.tb
