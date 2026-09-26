sld "GEN-1496 — TELECOM SITE / ELECTRICAL DISTRIBUTION"
# SHELTER POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-444", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_dy [label: "TX-1612", rating: "440 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-363", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-710", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1085", rating: "kW / kWh"]
f1cb = breaker [label: "CB-383", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-789", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1005", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1492", rating: "SHELTER LIGHTING / 11 kW"]
f2cb = breaker [label: "CB-302", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-771", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1035", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-301", rating: "MCCB / 40 A / 3P"]
f2l1drv = vfd [label: "DRV-869", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1135", rating: "17 kW / CRAC"]

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
