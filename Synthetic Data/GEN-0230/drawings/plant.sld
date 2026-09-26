sld "GEN-0230 — MARINA FACILITY / ELECTRICAL DISTRIBUTION"
# SHORE POWER SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-454", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_yd [label: "TX-1618", rating: "1660 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-355", rating: "MCCB / 2000 A / 3P"]
mctA1 = ct [label: "TA-782", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1075", rating: "kW / kWh"]
srcA2 = generator [label: "STANDBY GENERATOR", voltage: "480Y/277V", rating: "1490 kW"]
mcbA2 = breaker [label: "CB-345", rating: "ACB / 2000 A / 3P"]
mctA2 = ct [label: "TA-700", rating: "3 CTs / 2000/5 A"]
mpmA2 = watthour_meter [label: "PM-1005", rating: "kW / kWh"]
f1cb = breaker [label: "CB-335", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-727", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1050", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1413", rating: "SHORE POWER PANEL / 35 kW"]

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
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
