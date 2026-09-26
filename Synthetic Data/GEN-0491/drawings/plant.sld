sld "GEN-0491 — OFFICE TOWER / ELECTRICAL DISTRIBUTION"
# BUILDING SERVICES SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-412", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_yd [label: "TX-1652", rating: "1330 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-327", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-743", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1097", rating: "kW / kWh"]
busB = bus [label: "BUS-493", voltage: "480Y/277V"]
srcB1 = utility [label: "13.8kV SUPPLY B", voltage: "13.8kV"]
txB1 = transformer_dy [label: "TX-1683", rating: "670 kVA", voltage: "13.8kV / 480Y/277V"]
mcbB1 = breaker [label: "CB-360", rating: "MCCB / 800 A / 3P"]
mctB1 = ct [label: "TA-756", rating: "3 CTs / 800/5 A"]
mpmB1 = watthour_meter [label: "PM-1070", rating: "kW / kWh"]
tie = bus_tie [label: "CB-355", rating: "1600 A / 3P / NORMALLY OPEN / KEY INTERLOCKED"]
f1cb = breaker [label: "CB-334", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-785", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1042", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1437", rating: "FLOOR LIGHTING / 85 kW"]
f2cb = breaker [label: "CB-396", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-762", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1089", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1476", rating: "FLOOR LIGHTING / 47 kW"]

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
