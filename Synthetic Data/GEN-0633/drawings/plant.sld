sld "GEN-0633 — TELECOM SITE / ELECTRICAL DISTRIBUTION"
# SHELTER POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-445", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_dy [label: "TX-1680", rating: "440 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-333", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-701", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1016", rating: "kW / kWh"]
srcA2 = generator [label: "STANDBY GENERATOR", voltage: "400Y/230V", rating: "400 kW"]
mcbA2 = breaker [label: "CB-368", rating: "MCCB / 630 A / 3P"]
mctA2 = ct [label: "TA-775", rating: "3 CTs / 630/5 A"]
mpmA2 = watthour_meter [label: "PM-1042", rating: "kW / kWh"]
f1cb = breaker [label: "CB-322", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-793", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1005", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1405", rating: "AUXILIARY PANEL / 16 kW"]
f2cb = breaker [label: "CB-319", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-786", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1023", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1486", rating: "AUXILIARY PANEL / 12 kW"]
f3cb = breaker [label: "CB-344", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-763", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1060", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-309", rating: "MCCB / 16 A / 3P"]
f3l1drv = vfd [label: "DRV-877", rating: "VFD / OL"]
f3l1m = motor [label: "MTR-1179", rating: "7 kW / CRAC"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#2/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1drv
f3l1drv -> f3l1m
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
