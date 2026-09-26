sld "GEN-0153 — OFFICE TOWER / ELECTRICAL DISTRIBUTION"
# BUILDING SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-426", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_dy [label: "TX-1663", rating: "280 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-386", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-748", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1063", rating: "kW / kWh"]
f1cb = breaker [label: "CB-346", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-706", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1059", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1483", rating: "TENANT PANEL / 55 kW"]
f2cb = breaker [label: "CB-351", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-779", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1082", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-391", rating: "MCCB / 80 A / 3P"]
f2l1drv = vfd [label: "DRV-815", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1188", rating: "32 kW / CRAC"]

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
