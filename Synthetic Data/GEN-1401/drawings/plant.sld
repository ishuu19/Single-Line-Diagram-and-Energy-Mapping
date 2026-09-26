sld "GEN-1401 — COLD STORAGE UNIT / ELECTRICAL DISTRIBUTION"
# REFRIGERATION SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-460", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_dy [label: "TX-1647", rating: "210 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-398", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-709", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1055", rating: "kW / kWh"]
busB = bus [label: "BUS-493", voltage: "480Y/277V"]
srcB1 = utility [label: "13.8kV SUPPLY B", voltage: "13.8kV"]
txB1 = transformer_dy [label: "TX-1611", rating: "830 kVA", voltage: "13.8kV / 480Y/277V"]
mcbB1 = breaker [label: "CB-319", rating: "ACB / 1000 A / 3P"]
mctB1 = ct [label: "TA-765", rating: "3 CTs / 1000/5 A"]
mpmB1 = watthour_meter [label: "PM-1088", rating: "kW / kWh"]
tie = bus_tie [label: "CB-310", rating: "1600 A / 3P / NORMALLY OPEN / AUTO CLOSE ON LOSS"]
f1cb = breaker [label: "CB-327", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-799", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1085", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1428", rating: "AUXILIARY PANEL / 35 kW"]
f2cb = breaker [label: "CB-303", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-779", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1004", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1438", rating: "DOCK PANEL / 25 kW"]
f3cb = breaker [label: "CB-339", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-713", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1012", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1479", rating: "DOCK PANEL / 29 kW"]

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
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busB -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
