sld "GEN-0272 — LAUNDRY FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-499", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_dy [label: "TX-1623", rating: "690 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-324", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-772", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1067", rating: "kW / kWh"]
srcA2 = utility [label: "33kV STANDBY", voltage: "33kV"]
txA2 = transformer_yd [label: "TX-1695", rating: "1110 kVA", voltage: "33kV / 400Y/230V"]
mcbA2 = breaker [label: "CB-397", rating: "ACB / 1600 A / 3P"]
mctA2 = ct [label: "TA-770", rating: "3 CTs / 1600/5 A"]
mpmA2 = watthour_meter [label: "PM-1093", rating: "kW / kWh"]
f1cb = breaker [label: "CB-355", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-700", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1019", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-346", rating: "MCCB / 16 A / 3P"]
f1l1m = motor [label: "MTR-1103", rating: "6 kW / EF"]
f2cb = breaker [label: "CB-371", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-788", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1010", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-327", rating: "MCCB / 100 A / 3P"]
f2l1drv = vfd [label: "DRV-822", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1184", rating: "47 kW / PROC"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> txA2
txA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
