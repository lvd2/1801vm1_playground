onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -height 15 -radix hexadecimal /tb/clk
add wave -noupdate -height 15 -radix hexadecimal /tb/rst_n
add wave -noupdate -height 15 -radix hexadecimal /tb/dclo_n
add wave -noupdate -height 15 -radix hexadecimal /tb/aclo_n
add wave -noupdate -height 15 -radix hexadecimal /tb/init_n
add wave -noupdate -height 15 -radix octal /tb/ad_n
add wave -noupdate -height 15 -radix octal /tb/ad
add wave -noupdate -height 15 -radix hexadecimal /tb/ad
add wave -noupdate -height 15 -radix hexadecimal /tb/dout_n
add wave -noupdate -height 15 -radix hexadecimal /tb/din_n
add wave -noupdate -height 15 -radix hexadecimal /tb/wtbt_n
add wave -noupdate -height 15 -radix hexadecimal /tb/sync_n
add wave -noupdate -height 15 -radix hexadecimal /tb/rply_n
add wave -noupdate -height 15 -radix hexadecimal /tb/dmr_n
add wave -noupdate -height 15 -radix hexadecimal /tb/sack_n
add wave -noupdate -height 15 -radix hexadecimal /tb/dmgi_n
add wave -noupdate -height 15 -radix hexadecimal /tb/dmgo_n
add wave -noupdate -height 15 -radix hexadecimal /tb/iako_n
add wave -noupdate -height 15 -radix hexadecimal /tb/bsy_n
add wave -noupdate -height 15 /tb/sel_n
add wave -noupdate -height 15 -radix octal /tb/addr
add wave -noupdate -height 15 -radix hexadecimal /tb/addr
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {29037 ns} 0}
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 250
configure wave -griddelta 20
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {9601 ns} {20082 ns}
