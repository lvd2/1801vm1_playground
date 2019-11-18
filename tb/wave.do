onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Logic -radix hexadecimal /tb/clk
add wave -noupdate -format Logic -radix hexadecimal /tb/rst_n
add wave -noupdate -format Logic -radix hexadecimal /tb/dclo_n
add wave -noupdate -format Logic -radix hexadecimal /tb/aclo_n
add wave -noupdate -format Logic -radix hexadecimal /tb/init_n
add wave -noupdate -format Literal -radix octal /tb/ad_n
add wave -noupdate -format Literal -radix octal /tb/ad
add wave -noupdate -format Literal -radix hexadecimal /tb/ad
add wave -noupdate -format Logic -radix hexadecimal /tb/dout_n
add wave -noupdate -format Logic -radix hexadecimal /tb/din_n
add wave -noupdate -format Logic -radix hexadecimal /tb/wtbt_n
add wave -noupdate -format Logic -radix hexadecimal /tb/sync_n
add wave -noupdate -format Logic -radix hexadecimal /tb/rply_n
add wave -noupdate -format Logic -radix hexadecimal /tb/dmr_n
add wave -noupdate -format Logic -radix hexadecimal /tb/sack_n
add wave -noupdate -format Logic -radix hexadecimal /tb/dmgi_n
add wave -noupdate -format Logic -radix hexadecimal /tb/dmgo_n
add wave -noupdate -format Logic -radix hexadecimal /tb/iako_n
add wave -noupdate -format Logic -radix hexadecimal /tb/bsy_n
add wave -noupdate -format Literal -radix octal /tb/addr
add wave -noupdate -format Literal -radix hexadecimal /tb/addr
add wave -noupdate -format Literal /tb/sel_n
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {5036 ns} 0}
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 1120
configure wave -gridperiod 4480
configure wave -griddelta 20
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {45548 ns} {48654 ns}
