sld "GEN-0818 — FOOD PROCESSING FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-403", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_dy [label: "TX-1684", rating: "830 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-318", rating: "MCCB / 1000 A / 3P"]
mctA1 = ct [label: "TA-700", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1042", rating: "kW / kWh"]
f1cb = breaker [label: "CB-386", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-785", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1010", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1451", rating: "PACKAGING PANEL / 18 kW"]
f2cb = breaker [label: "CB-316", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-792", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1085", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-361", rating: "MCCB / 125 A / 3P"]
f2l1drv = vfd [label: "DRV-876", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1181", rating: "67 kW / PROC"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
