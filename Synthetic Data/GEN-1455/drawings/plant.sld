sld "GEN-1455 — WATER PUMP STATION / ELECTRICAL DISTRIBUTION"
# PUMPING PLANT SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-425", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_yd [label: "TX-1683", rating: "580 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-350", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-721", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1075", rating: "kW / kWh"]
srcA2 = utility [label: "12.47kV STANDBY", voltage: "12.47kV"]
txA2 = transformer_dy [label: "TX-1689", rating: "290 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA2 = breaker [label: "CB-399", rating: "ACB / 800 A / 3P"]
mctA2 = ct [label: "TA-764", rating: "3 CTs / 800/5 A"]
mpmA2 = watthour_meter [label: "PM-1064", rating: "kW / kWh"]
f1cb = breaker [label: "CB-396", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-781", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1043", rating: "kW / kWh"]
f1pnl = hub [label: "FD-911", rating: "3P+N"]
f1l1ld = load [label: "PNL-1466", rating: "AUXILIARY PANEL / 74 kW"]
f1l2ld = load [label: "PNL-1400", rating: "AUXILIARY PANEL / 40 kW"]
f2cb = breaker [label: "CB-349", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-701", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1057", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1426", rating: "DOSING PANEL / 38 kW"]
f3cb = breaker [label: "CB-384", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-797", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1065", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1407", rating: "DOSING PANEL / 18 kW"]

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
f1pnl -> f1l2ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#1/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
