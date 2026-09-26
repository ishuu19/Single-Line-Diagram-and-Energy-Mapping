sld "GEN-1466 — CAMPUS ELECTRICAL DISTRIBUTION / RENEWABLE INTEGRATION"
# SINGLE-LINE DIAGRAM WITH PV ARRAY
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-461", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_yd [label: "TX-1629", rating: "690 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-378", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-744", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1075", rating: "kW / kWh"]
f1cb = breaker [label: "CB-381", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-712", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1036", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1499", rating: "AUXILIARY PANEL / 27 kW"]
f2cb = breaker [label: "CB-336", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-709", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1061", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-361", rating: "MCCB / 40 A / 3P"]
f2l1drv = vfd [label: "DRV-841", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1147", rating: "17 kW / AHU"]
f3cb = breaker [label: "CB-339", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-769", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1007", rating: "kW / kWh"]
f3pnl = hub [label: "FD-979", rating: "3P+N"]
f3l1ld = load [label: "PNL-1480", rating: "ACADEMIC BLOCK PANEL / 46 kW"]
f3l2cb = breaker [label: "CB-319", rating: "MCCB / 50 A / 3P"]
f3l2drv = vfd [label: "DRV-846", rating: "VFD / OL"]
f3l2m = motor [label: "MTR-1111", rating: "24 kW / AHU"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3pnl
f3pnl -> f3l1ld
f3pnl -> f3l2cb
f3l2cb -> f3l2drv
f3l2drv -> f3l2m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
