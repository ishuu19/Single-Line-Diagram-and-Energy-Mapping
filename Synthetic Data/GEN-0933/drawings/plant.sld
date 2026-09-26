sld "GEN-0933 — CONVEYOR TRANSFER STATION / ELECTRICAL DISTRIBUTION"
# MEDIUM-VOLTAGE DRIVE SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-411", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
mcbA1 = breaker [label: "CB-377", rating: "ACB / 2500 A / 3P"]
mctA1 = ct [label: "TA-787", rating: "3 CTs / 2500/5 A"]
mpmA1 = watthour_meter [label: "PM-1098", rating: "kW / kWh"]
busB = bus [label: "BUS-496", voltage: "208Y/120V"]
srcB1 = utility [label: "12.47kV SUPPLY B", voltage: "12.47kV"]
txB1 = transformer_yd [label: "TX-1606", rating: "720 kVA", voltage: "12.47kV / 208Y/120V"]
mcbB1 = breaker [label: "CB-350", rating: "MCCB / 2000 A / 3P"]
mctB1 = ct [label: "TA-752", rating: "3 CTs / 2000/5 A"]
mpmB1 = watthour_meter [label: "PM-1030", rating: "kW / kWh"]
tie = bus_tie [label: "CB-306", rating: "1600 A / 3P / NORMALLY OPEN / INTERLOCKED"]
f1cb = breaker [label: "CB-357", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-742", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1001", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1483", rating: "AUXILIARY PANEL / 110 kW"]
f2cb = breaker [label: "CB-313", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-726", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1089", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1421", rating: "AUXILIARY PANEL / 149 kW"]
f3cb = breaker [label: "CB-372", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-712", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1011", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1492", rating: "MCC AUXILIARY BOARD / 65 kW"]

srcA1 -> mcbA1
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
busB -> f3cb [cable: "3#2/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
