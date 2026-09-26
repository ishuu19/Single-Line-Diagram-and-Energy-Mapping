sld "GEN-0814 — RESIDENTIAL COMPLEX / ELECTRICAL DISTRIBUTION"
# HOUSE LOAD SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-446", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_yd [label: "TX-1640", rating: "330 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-376", rating: "MCCB / 400 A / 3P"]
mctA1 = ct [label: "TA-775", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1015", rating: "kW / kWh"]
busB = bus [label: "BUS-417", voltage: "480Y/277V"]
srcB1 = utility [label: "13.8kV SUPPLY B", voltage: "13.8kV"]
txB1 = transformer_yd [label: "TX-1611", rating: "1660 kVA", voltage: "13.8kV / 480Y/277V"]
mcbB1 = breaker [label: "CB-333", rating: "MCCB / 2000 A / 3P"]
mctB1 = ct [label: "TA-764", rating: "3 CTs / 2000/5 A"]
mpmB1 = watthour_meter [label: "PM-1025", rating: "kW / kWh"]
tie = bus_tie [label: "CB-345", rating: "630 A / 3P / NORMALLY OPEN / AUTO CLOSE ON LOSS"]
f1cb = breaker [label: "CB-330", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-755", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1056", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-316", rating: "MCCB / 16 A / 3P"]
f1l1m = motor [label: "MTR-1101", rating: "5 kW / EF"]
f2cb = breaker [label: "CB-386", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-722", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1082", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1400", rating: "RISER PANEL / 95 kW"]

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
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busB -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
