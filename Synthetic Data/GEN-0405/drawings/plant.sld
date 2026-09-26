sld "GEN-0405 — TELECOM SITE / ELECTRICAL DISTRIBUTION"
# SHELTER POWER SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-468", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_yd [label: "TX-1664", rating: "130 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-371", rating: "ACB / 160 A / 3P"]
mctA1 = ct [label: "TA-776", rating: "3 CTs / 160/5 A"]
mpmA1 = watthour_meter [label: "PM-1049", rating: "kW / kWh"]
srcA2 = generator [label: "STANDBY GENERATOR", voltage: "480Y/277V", rating: "120 kW"]
mcbA2 = breaker [label: "CB-373", rating: "ACB / 160 A / 3P"]
mctA2 = ct [label: "TA-750", rating: "3 CTs / 160/5 A"]
mpmA2 = watthour_meter [label: "PM-1098", rating: "kW / kWh"]
f1cb = breaker [label: "CB-352", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-773", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1084", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1490", rating: "SHELTER LIGHTING / 8 kW"]
f2cb = breaker [label: "CB-398", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-744", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1097", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-322", rating: "MCCB / 32 A / 3P"]
f2l1drv = vfd [label: "DRV-893", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1126", rating: "16 kW / CRAC"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
