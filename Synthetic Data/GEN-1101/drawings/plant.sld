sld "GEN-1101 — HOSPITAL WING / ELECTRICAL DISTRIBUTION"
# NORMAL AND ESSENTIAL SERVICES SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-445", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_yd [label: "TX-1642", rating: "520 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-306", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-760", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1006", rating: "kW / kWh"]
srcA2 = utility [label: "13.8kV STANDBY", voltage: "13.8kV"]
txA2 = transformer_yd [label: "TX-1672", rating: "210 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA2 = breaker [label: "CB-392", rating: "ACB / 250 A / 3P"]
mctA2 = ct [label: "TA-771", rating: "3 CTs / 250/5 A"]
mpmA2 = watthour_meter [label: "PM-1086", rating: "kW / kWh"]
f1cb = breaker [label: "CB-367", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-765", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1085", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-322", rating: "MCCB / 32 A / 3P"]
f1l1drv = vfd [label: "DRV-839", rating: "VFD / OL"]
f1l1m = motor [label: "MTR-1174", rating: "19 kW / AHU"]
f2cb = breaker [label: "CB-304", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-702", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1046", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1466", rating: "WARD LIGHTING / 22 kW"]

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
f1ct -> f1l1cb
f1l1cb -> f1l1drv
f1l1drv -> f1l1m
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
