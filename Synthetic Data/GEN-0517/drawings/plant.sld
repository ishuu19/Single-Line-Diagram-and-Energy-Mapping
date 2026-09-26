sld "GEN-0517 — TELECOM SITE / ELECTRICAL DISTRIBUTION"
# SHELTER POWER SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-453", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_dy [label: "TX-1697", rating: "330 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-346", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-746", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1096", rating: "kW / kWh"]
busB = bus [label: "BUS-457", voltage: "480Y/277V"]
srcB1 = utility [label: "13.8kV SUPPLY B", voltage: "13.8kV"]
txB1 = transformer_yd [label: "TX-1634", rating: "130 kVA", voltage: "13.8kV / 480Y/277V"]
mcbB1 = breaker [label: "CB-305", rating: "MCCB / 160 A / 3P"]
mctB1 = ct [label: "TA-763", rating: "3 CTs / 160/5 A"]
mpmB1 = watthour_meter [label: "PM-1057", rating: "kW / kWh"]
tie = bus_tie [label: "CB-301", rating: "2000 A / 3P / NORMALLY OPEN / INTERLOCKED"]
f1cb = breaker [label: "CB-362", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-771", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1011", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1490", rating: "SHELTER LIGHTING / 9 kW"]
f2cb = breaker [label: "CB-306", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-730", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1080", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1438", rating: "RECTIFIER PDU / 49 kW"]
f3cb = breaker [label: "CB-349", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-737", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1049", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1458", rating: "SHELTER LIGHTING / 9 kW"]

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
