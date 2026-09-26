sld "GEN-0853 — COLD STORAGE UNIT / ELECTRICAL DISTRIBUTION"
# REFRIGERATION SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-469", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_yd [label: "TX-1643", rating: "170 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-301", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-725", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1063", rating: "kW / kWh"]
f1cb = breaker [label: "CB-376", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-773", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1049", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-377", rating: "MCCB / 200 A / 3P"]
f1l1drv = vfd [label: "DRV-853", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1166", rating: "85 kW / COMP"]
f2cb = breaker [label: "CB-355", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-796", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1033", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1454", rating: "DOCK PANEL / 16 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
