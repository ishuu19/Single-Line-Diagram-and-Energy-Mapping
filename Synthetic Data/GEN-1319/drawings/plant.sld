sld "GEN-1319 — TELECOM SITE / ELECTRICAL DISTRIBUTION"
# SHELTER POWER SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-411", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_dy [label: "TX-1670", rating: "520 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-381", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-770", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1057", rating: "kW / kWh"]
f1cb = breaker [label: "CB-339", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-732", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1098", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1415", rating: "RECTIFIER PDU / 51 kW"]
f2cb = breaker [label: "CB-363", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-777", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1008", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-373", rating: "MCCB / 32 A / 3P"]
f2l1drv = vfd [label: "DRV-848", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1162", rating: "15 kW / CRAC"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
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
