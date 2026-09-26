sld "GEN-0406 — CAMPUS ELECTRICAL DISTRIBUTION / RENEWABLE INTEGRATION"
# SINGLE-LINE DIAGRAM WITH PV ARRAY
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-445", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_yd [label: "TX-1601", rating: "690 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-386", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-778", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1031", rating: "kW / kWh"]
f1cb = breaker [label: "CB-358", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-798", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1006", rating: "kW / kWh"]
f1pnl = hub [label: "FD-963", rating: "3P+N"]
f1l1ld = load [label: "PNL-1490", rating: "ACADEMIC BLOCK PANEL / 87 kW"]
f1l2ld = load [label: "PNL-1412", rating: "ACADEMIC BLOCK PANEL / 80 kW"]
f2cb = breaker [label: "CB-331", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-790", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1092", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-314", rating: "MCCB / 50 A / 3P"]
f2l1drv = vfd [label: "DRV-874", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1110", rating: "22 kW / AHU"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
