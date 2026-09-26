sld "GEN-0916 — TELECOM SITE / ELECTRICAL DISTRIBUTION"
# SHELTER POWER SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-402", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_yd [label: "TX-1681", rating: "520 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-343", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-732", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1036", rating: "kW / kWh"]
srcA2 = generator [label: "STANDBY GENERATOR", voltage: "480Y/277V", rating: "470 kW"]
mcbA2 = breaker [label: "CB-316", rating: "ACB / 630 A / 3P"]
mctA2 = ct [label: "TA-779", rating: "3 CTs / 630/5 A"]
mpmA2 = watthour_meter [label: "PM-1006", rating: "kW / kWh"]
f1cb = breaker [label: "CB-364", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-748", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1012", rating: "kW / kWh"]
f1pnl = hub [label: "FD-993", rating: "3P+N"]
f1l1ld = load [label: "PNL-1492", rating: "AUXILIARY PANEL / 12 kW"]
f1l2ld = load [label: "PNL-1436", rating: "SHELTER LIGHTING / 9 kW"]
f2cb = breaker [label: "CB-327", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-706", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1027", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1497", rating: "RECTIFIER PDU / 50 kW"]
f3cb = breaker [label: "CB-390", rating: "MCCB / 400 A / 3P"]
f3ct = ct [label: "TA-743", rating: "3 CTs / 400/5 A"]
f3pm = watthour_meter [label: "PM-1075", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1498", rating: "SHELTER LIGHTING / 12 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#4/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
