sld "GEN-0402 — LAUNDRY FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-488", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_dy [label: "TX-1670", rating: "830 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-376", rating: "MCCB / 1000 A / 3P"]
mctA1 = ct [label: "TA-792", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1077", rating: "kW / kWh"]
srcA2 = utility [label: "13.8kV STANDBY", voltage: "13.8kV"]
txA2 = transformer_dy [label: "TX-1678", rating: "1330 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA2 = breaker [label: "CB-317", rating: "ACB / 1600 A / 3P"]
mctA2 = ct [label: "TA-754", rating: "3 CTs / 1600/5 A"]
mpmA2 = watthour_meter [label: "PM-1057", rating: "kW / kWh"]
f1cb = breaker [label: "CB-398", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-714", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1015", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-372", rating: "MCCB / 80 A / 3P"]
f1l1drv = vfd [label: "DRV-874", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1197", rating: "43 kW / PROC"]
f2cb = breaker [label: "CB-399", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-727", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1027", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-361", rating: "MCCB / 40 A / 3P"]
f2l1m = motor [label: "MTR-1157", rating: "20 kW / COMP"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> txA2
txA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
