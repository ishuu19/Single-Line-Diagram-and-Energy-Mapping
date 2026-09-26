sld "GEN-0825 — MANUFACTURING WORKSHOP / ELECTRICAL DISTRIBUTION"
# PROCESS POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-402", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_dy [label: "TX-1685", rating: "280 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-398", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-705", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1035", rating: "kW / kWh"]
busB = bus [label: "BUS-430", voltage: "400Y/230V"]
srcB1 = utility [label: "20kV SUPPLY B", voltage: "20kV"]
txB1 = transformer_dy [label: "TX-1603", rating: "440 kVA", voltage: "20kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-304", rating: "ACB / 630 A / 3P"]
mctB1 = ct [label: "TA-731", rating: "3 CTs / 630/5 A"]
mpmB1 = watthour_meter [label: "PM-1051", rating: "kW / kWh"]
tie = bus_tie [label: "CB-373", rating: "630 A / 3P / NORMALLY OPEN / INTERLOCKED"]
f1cb = breaker [label: "CB-328", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-730", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1065", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-382", rating: "MCCB / 125 A / 3P"]
f1l1m = motor [label: "MTR-1172", rating: "55 kW / COMP"]
f2cb = breaker [label: "CB-308", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-783", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1009", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-355", rating: "MCCB / 160 A / 3P"]
f2l1drv = vfd [label: "DRV-892", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1160", rating: "76 kW / PROC"]
f2x = harmonic_filter [label: "HF-503", rating: "5th / 7th"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcB1 -> txB1
txB1 -> mcbB1
mcbB1 -> mctB1
mctB1 -> busB
busA -> tie
tie -> busB
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busB -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
f2ct -> f2x
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
