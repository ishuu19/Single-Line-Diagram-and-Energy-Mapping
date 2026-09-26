sld "GEN-1090 — CONVEYOR TRANSFER STATION / ELECTRICAL DISTRIBUTION"
# MEDIUM-VOLTAGE DRIVE SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-481", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_yd [label: "TX-1637", rating: "2490 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-357", rating: "MCCB / 3000 A / 3P"]
mctA1 = ct [label: "TA-766", rating: "3 CTs / 3000/5 A"]
mpmA1 = watthour_meter [label: "PM-1063", rating: "kW / kWh"]
f1cb = breaker [label: "CB-371", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-701", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1050", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1486", rating: "MCC AUXILIARY BOARD / 77 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
mctA1 -> mpmA1
f1ct -> f1pm
