sld "GEN-0995 — CAMPUS ELECTRICAL DISTRIBUTION / RENEWABLE INTEGRATION"
# SINGLE-LINE DIAGRAM WITH PV ARRAY
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-406", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_dy [label: "TX-1618", rating: "280 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-375", rating: "MCCB / 400 A / 3P"]
mctA1 = ct [label: "TA-707", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1037", rating: "kW / kWh"]
srcA2 = solar [label: "PV ARRAY 258 kW", voltage: "400Y/230V"]
mcbA2 = breaker [label: "CB-317", rating: "MCCB / 250 A / 3P"]
mctA2 = ct [label: "TA-722", rating: "3 CTs / 250/5 A"]
mpmA2 = watthour_meter [label: "PM-1047", rating: "kW / kWh"]
f1cb = breaker [label: "CB-387", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-719", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1061", rating: "kW / kWh"]
f1pnl = hub [label: "FD-948", rating: "3P+N"]
f1l1cb = breaker [label: "CB-381", rating: "MCCB / 80 A / 3P"]
f1l1drv = vfd [label: "DRV-859", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1196", rating: "35 kW / AHU"]
f1l2ld = load [label: "PNL-1456", rating: "ACADEMIC BLOCK PANEL / 79 kW"]
f2cb = breaker [label: "CB-394", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-750", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1075", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-364", rating: "MCCB / 63 A / 3P"]
f2l1drv = vfd [label: "DRV-808", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1156", rating: "30 kW / AHU"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
