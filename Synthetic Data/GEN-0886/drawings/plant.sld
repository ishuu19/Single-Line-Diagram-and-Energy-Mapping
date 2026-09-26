sld "GEN-0886 — COLD STORAGE UNIT / ELECTRICAL DISTRIBUTION"
# REFRIGERATION SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-464", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_yd [label: "TX-1680", rating: "550 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-325", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-729", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1040", rating: "kW / kWh"]
f1cb = breaker [label: "CB-300", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-747", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1094", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-372", rating: "MCCB / 32 A / 3P"]
f1l1m = motor [label: "MTR-1122", rating: "15 kW / EF"]
f2cb = breaker [label: "CB-324", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-778", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1036", rating: "kW / kWh"]
f2pnl = hub [label: "FD-946", rating: "3P+N"]
f2l1cb = breaker [label: "CB-390", rating: "MCCB / 16 A / 3P"]
f2l1m = motor [label: "MTR-1173", rating: "5 kW / EF"]
f2l2cb = breaker [label: "CB-330", rating: "MCCB / 200 A / 3P"]
f2l2drv = vfd [label: "DRV-891", rating: "VFD / OL"]
f2l2m = motor [label: "MTR-1110", rating: "80 kW / COMP"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1cb
f2l1cb -> f2l1m
f2pnl -> f2l2cb
f2l2cb -> f2l2drv
f2l2drv -> f2l2m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
