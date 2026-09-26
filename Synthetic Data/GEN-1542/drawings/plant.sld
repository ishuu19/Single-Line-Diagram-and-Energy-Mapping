sld "GEN-1542 — CAMPUS ELECTRICAL DISTRIBUTION / RENEWABLE INTEGRATION"
# SINGLE-LINE DIAGRAM WITH PV ARRAY
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-433", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_dy [label: "TX-1697", rating: "1110 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-385", rating: "MCCB / 1600 A / 3P"]
mctA1 = ct [label: "TA-701", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1085", rating: "kW / kWh"]
srcA2 = solar [label: "PV ARRAY 227 kW", voltage: "400Y/230V"]
mcbA2 = breaker [label: "CB-386", rating: "MCCB / 400 A / 3P"]
mctA2 = ct [label: "TA-713", rating: "3 CTs / 400/5 A"]
mpmA2 = watthour_meter [label: "PM-1066", rating: "kW / kWh"]
f1cb = breaker [label: "CB-310", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-766", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1047", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1422", rating: "AUXILIARY PANEL / 32 kW"]
f2cb = breaker [label: "CB-342", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-755", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1095", rating: "kW / kWh"]
f2pnl = hub [label: "FD-926", rating: "3P+N"]
f2l1cb = breaker [label: "CB-364", rating: "MCCB / 80 A / 3P"]
f2l1drv = vfd [label: "DRV-849", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1186", rating: "36 kW / AHU"]
f2l2cb = breaker [label: "CB-398", rating: "MCCB / 63 A / 3P"]
f2l2drv = vfd [label: "DRV-886", rating: "VFD / OL"]
f2l2m = motor [label: "MTR-1170", rating: "30 kW / AHU"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
f2pnl -> f2l2cb
f2l2cb -> f2l2drv
f2l2drv -> f2l2m
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
