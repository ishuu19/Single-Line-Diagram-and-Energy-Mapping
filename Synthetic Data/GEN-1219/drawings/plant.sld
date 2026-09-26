sld "GEN-1219 — WATER PUMP STATION / ELECTRICAL DISTRIBUTION"
# PUMPING PLANT SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-473", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_yd [label: "TX-1697", rating: "1110 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-382", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-703", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1002", rating: "kW / kWh"]
srcA2 = utility [label: "22kV STANDBY", voltage: "22kV"]
txA2 = transformer_dy [label: "TX-1695", rating: "550 kVA", voltage: "22kV / 400Y/230V"]
mcbA2 = breaker [label: "CB-369", rating: "ACB / 800 A / 3P"]
mctA2 = ct [label: "TA-744", rating: "3 CTs / 800/5 A"]
mpmA2 = watthour_meter [label: "PM-1028", rating: "kW / kWh"]
f1cb = breaker [label: "CB-357", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-796", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1089", rating: "kW / kWh"]
f1pnl = hub [label: "FD-969", rating: "3P+N"]
f1l1ld = load [label: "PNL-1408", rating: "DOSING PANEL / 37 kW"]
f1l2cb = breaker [label: "CB-340", rating: "MCCB / 100 A / 3P"]
f1l2drv = vfd [label: "DRV-815", rating: "VFD / OL"]
f1l2m = motor [label: "MTR-1188", rating: "44 kW / BLOW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> txA2
txA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2cb
f1l2cb -> f1l2drv
f1l2drv -> f1l2m
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
