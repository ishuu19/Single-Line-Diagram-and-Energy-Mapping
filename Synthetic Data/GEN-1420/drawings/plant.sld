sld "GEN-1420 — LAUNDRY FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-417", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_yd [label: "TX-1635", rating: "1330 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-334", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-791", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1079", rating: "kW / kWh"]
f1cb = breaker [label: "CB-348", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-703", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1046", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1454", rating: "UTILITY PANEL / 24 kW"]
f2cb = breaker [label: "CB-315", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-775", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1051", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1476", rating: "UTILITY PANEL / 18 kW"]
f3cb = breaker [label: "CB-329", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-735", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1067", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1430", rating: "UTILITY PANEL / 23 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
