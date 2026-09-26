sld "GEN-1156 — REEFER YARD / ELECTRICAL DISTRIBUTION"
# CONTAINER YARD SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-427", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_yd [label: "TX-1692", rating: "280 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-345", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-798", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1063", rating: "kW / kWh"]
busB = bus [label: "BUS-451", voltage: "400Y/230V"]
srcB1 = utility [label: "11kV SUPPLY B", voltage: "11kV"]
txB1 = transformer_yd [label: "TX-1661", rating: "440 kVA", voltage: "11kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-351", rating: "ACB / 630 A / 3P"]
mctB1 = ct [label: "TA-796", rating: "3 CTs / 630/5 A"]
mpmB1 = watthour_meter [label: "PM-1013", rating: "kW / kWh"]
tie = bus_tie [label: "CB-383", rating: "1000 A / 3P / NORMALLY OPEN / INTERLOCKED"]
f1cb = breaker [label: "CB-370", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-711", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1064", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1418", rating: "YARD LIGHTING / 24 kW"]
f2cb = breaker [label: "CB-336", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-717", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1006", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1447", rating: "AUXILIARY PANEL / 5 kW"]
f3cb = breaker [label: "CB-382", rating: "MCCB / 400 A / 3P"]
f3ct = ct [label: "TA-779", rating: "3 CTs / 400/5 A"]
f3pm = watthour_meter [label: "PM-1046", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1499", rating: "YARD LIGHTING / 30 kW"]

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
busB -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busB -> f3cb [cable: "3#4/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
