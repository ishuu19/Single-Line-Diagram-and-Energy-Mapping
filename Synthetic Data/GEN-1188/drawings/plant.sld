sld "GEN-1188 — MARINA FACILITY / ELECTRICAL DISTRIBUTION"
# SHORE POWER SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-498", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_yd [label: "TX-1683", rating: "210 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-396", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-749", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1028", rating: "kW / kWh"]
srcA2 = generator [label: "STANDBY GENERATOR", voltage: "480Y/277V", rating: "1490 kW"]
mcbA2 = breaker [label: "CB-371", rating: "MCCB / 2000 A / 3P"]
mctA2 = ct [label: "TA-726", rating: "3 CTs / 2000/5 A"]
mpmA2 = watthour_meter [label: "PM-1039", rating: "kW / kWh"]
f1cb = breaker [label: "CB-365", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-714", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1009", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1469", rating: "SHORE POWER PANEL / 36 kW"]

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
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
