sld "GEN-1284 — CONVEYOR TRANSFER STATION / ELECTRICAL DISTRIBUTION"
# MEDIUM-VOLTAGE DRIVE SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-499", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_yd [label: "TX-1697", rating: "830 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-317", rating: "MCCB / 1000 A / 3P"]
mctA1 = ct [label: "TA-756", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1092", rating: "kW / kWh"]
f1cb = breaker [label: "CB-367", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-753", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1065", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1449", rating: "MCC AUXILIARY BOARD / 49 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
mctA1 -> mpmA1
f1ct -> f1pm
