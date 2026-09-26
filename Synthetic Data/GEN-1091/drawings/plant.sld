sld "GEN-1091 — TELECOM SITE / ELECTRICAL DISTRIBUTION"
# SHELTER POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-418", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_yd [label: "TX-1614", rating: "440 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-325", rating: "MCCB / 630 A / 3P"]
mctA1 = ct [label: "TA-710", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1034", rating: "kW / kWh"]
f1cb = breaker [label: "CB-364", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-779", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1093", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-358", rating: "MCCB / 40 A / 3P"]
f1l1drv = vfd [label: "DRV-819", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1168", rating: "16 kW / CRAC"]
f2cb = breaker [label: "CB-370", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-701", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1062", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1463", rating: "RECTIFIER PDU / 40 kW"]
f3cb = breaker [label: "CB-322", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-704", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1053", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-335", rating: "MCCB / 32 A / 3P"]
f3l1drv = vfd [label: "DRV-893", rating: "VFD / OL"]
f3l1m = motor [label: "MTR-1159", rating: "13 kW / CRAC"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
busA -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1drv
f3l1drv -> f3l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
