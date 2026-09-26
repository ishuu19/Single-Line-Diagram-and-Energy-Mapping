sld "GEN-1269 — CONVEYOR TRANSFER STATION / ELECTRICAL DISTRIBUTION"
# MEDIUM-VOLTAGE DRIVE SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-486", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_yd [label: "TX-1686", rating: "2490 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-352", rating: "ACB / 3000 A / 3P"]
mctA1 = ct [label: "TA-778", rating: "3 CTs / 3000/5 A"]
mpmA1 = watthour_meter [label: "PM-1055", rating: "kW / kWh"]
f1cb = breaker [label: "CB-304", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-770", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1024", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-319", rating: "MCCB / 250 A / 3P"]
f1l1m = motor [label: "MTR-1105", rating: "131 kW / BLOW"]
f2cb = breaker [label: "CB-335", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-716", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1087", rating: "kW / kWh"]
f2pnl = hub [label: "FD-921", rating: "3P+N"]
f2l1ld = load [label: "PNL-1477", rating: "MCC AUXILIARY BOARD / 48 kW"]
f2l2cb = breaker [label: "CB-345", rating: "MCCB / 160 A / 3P"]
f2l2m = motor [label: "MTR-1178", rating: "85 kW / BLOW"]
f2x = harmonic_filter [label: "HF-572", rating: "5th / 7th"]
f3cb = breaker [label: "CB-355", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-750", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1023", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-399", rating: "MCCB / 160 A / 3P"]
f3l1m = motor [label: "MTR-1138", rating: "93 kW / BLOW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2pnl
f2pnl -> f2l1ld
f2pnl -> f2l2cb
f2l2cb -> f2l2m
f2pnl -> f2x
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
