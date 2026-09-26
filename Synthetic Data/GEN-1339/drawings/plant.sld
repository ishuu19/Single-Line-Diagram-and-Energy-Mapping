sld "GEN-1339 — CONVEYOR TRANSFER STATION / ELECTRICAL DISTRIBUTION"
# MEDIUM-VOLTAGE DRIVE SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-453", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_dy [label: "TX-1674", rating: "720 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-339", rating: "MCCB / 2000 A / 3P"]
mctA1 = ct [label: "TA-705", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1010", rating: "kW / kWh"]
busB = bus [label: "BUS-460", voltage: "208Y/120V"]
srcB1 = utility [label: "12.47kV SUPPLY B", voltage: "12.47kV"]
txB1 = transformer_dy [label: "TX-1608", rating: "900 kVA", voltage: "12.47kV / 208Y/120V"]
mcbB1 = breaker [label: "CB-365", rating: "ACB / 2500 A / 3P"]
mctB1 = ct [label: "TA-742", rating: "3 CTs / 2500/5 A"]
mpmB1 = watthour_meter [label: "PM-1075", rating: "kW / kWh"]
tie = bus_tie [label: "CB-350", rating: "2000 A / 3P / NORMALLY OPEN / AUTO CLOSE ON LOSS"]
f1cb = breaker [label: "CB-340", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-793", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1028", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1410", rating: "MCC AUXILIARY BOARD / 60 kW"]
f2cb = breaker [label: "CB-357", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-707", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1085", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1408", rating: "AUXILIARY PANEL / 120 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcB1 -> txB1
txB1 -> mcbB1
mcbB1 -> mctB1
mctB1 -> busB
busA -> tie
tie -> busB
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busB -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
