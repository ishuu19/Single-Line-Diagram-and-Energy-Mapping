sld "GEN-1031 — LAUNDRY FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-496", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_dy [label: "TX-1604", rating: "210 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-361", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-726", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1035", rating: "kW / kWh"]
srcA2 = utility [label: "13.8kV STANDBY", voltage: "13.8kV"]
txA2 = transformer_yd [label: "TX-1609", rating: "210 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA2 = breaker [label: "CB-363", rating: "MCCB / 250 A / 3P"]
mctA2 = ct [label: "TA-718", rating: "3 CTs / 250/5 A"]
mpmA2 = watthour_meter [label: "PM-1011", rating: "kW / kWh"]
f1cb = breaker [label: "CB-375", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-755", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1040", rating: "kW / kWh"]
f1pnl = hub [label: "FD-996", rating: "3P+N"]
f1l1ld = load [label: "PNL-1414", rating: "UTILITY PANEL / 22 kW"]
f1l2cb = breaker [label: "CB-337", rating: "MCCB / 63 A / 3P"]
f1l2drv = vfd [label: "DRV-896", rating: "VFD / OL"]
f1l2m = motor [label: "MTR-1155", rating: "33 kW / PROC"]

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
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2cb
f1l2cb -> f1l2drv
f1l2drv -> f1l2m
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
