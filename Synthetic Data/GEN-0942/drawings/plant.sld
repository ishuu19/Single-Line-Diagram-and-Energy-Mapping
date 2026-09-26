sld "GEN-0942 — RESIDENTIAL COMPLEX / ELECTRICAL DISTRIBUTION"
# HOUSE LOAD SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-442", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_yd [label: "TX-1670", rating: "690 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-343", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-776", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1027", rating: "kW / kWh"]
srcA2 = solar [label: "PV ARRAY 383 kW", voltage: "400Y/230V"]
mcbA2 = breaker [label: "CB-332", rating: "MCCB / 630 A / 3P"]
mctA2 = ct [label: "TA-767", rating: "3 CTs / 630/5 A"]
mpmA2 = watthour_meter [label: "PM-1005", rating: "kW / kWh"]
f1cb = breaker [label: "CB-360", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-742", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1086", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1442", rating: "RISER PANEL / 44 kW"]
f2cb = breaker [label: "CB-315", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-704", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1059", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-367", rating: "MCCB / 32 A / 3P"]
f2l1drv = vfd [label: "DRV-814", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1113", rating: "13 kW / CRAC"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
