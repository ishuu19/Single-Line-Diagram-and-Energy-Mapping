sld "GEN-0592 — RETAIL FACILITY / ELECTRICAL DISTRIBUTION"
# STORE SERVICES SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-422", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_dy [label: "TX-1686", rating: "830 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-320", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-714", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1047", rating: "kW / kWh"]
busB = bus [label: "BUS-425", voltage: "480Y/277V"]
srcB1 = utility [label: "13.8kV SUPPLY B", voltage: "13.8kV"]
txB1 = transformer_dy [label: "TX-1664", rating: "1330 kVA", voltage: "13.8kV / 480Y/277V"]
mcbB1 = breaker [label: "CB-352", rating: "ACB / 1600 A / 3P"]
mctB1 = ct [label: "TA-743", rating: "3 CTs / 1600/5 A"]
mpmB1 = watthour_meter [label: "PM-1088", rating: "kW / kWh"]
tie = bus_tie [label: "CB-326", rating: "630 A / 3P / NORMALLY OPEN / INTERLOCKED"]
f1cb = breaker [label: "CB-347", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-722", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1026", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1485", rating: "HOUSE PANEL / 70 kW"]
f2cb = breaker [label: "CB-397", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-793", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1094", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-330", rating: "MCCB / 40 A / 3P"]
f2l1drv = vfd [label: "DRV-875", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1135", rating: "21 kW / AHU"]

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
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busB -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
