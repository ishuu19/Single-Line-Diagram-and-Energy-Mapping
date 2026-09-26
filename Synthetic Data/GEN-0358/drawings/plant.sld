sld "GEN-0358 — MARINA FACILITY / ELECTRICAL DISTRIBUTION"
# SHORE POWER SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-459", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_dy [label: "TX-1681", rating: "1660 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-338", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-789", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1037", rating: "kW / kWh"]
busB = bus [label: "BUS-490", voltage: "480Y/277V"]
srcB1 = utility [label: "13.8kV SUPPLY B", voltage: "13.8kV"]
txB1 = transformer_dy [label: "TX-1611", rating: "830 kVA", voltage: "13.8kV / 480Y/277V"]
mcbB1 = breaker [label: "CB-384", rating: "ACB / 1000 A / 3P"]
mctB1 = ct [label: "TA-797", rating: "3 CTs / 1000/5 A"]
mpmB1 = watthour_meter [label: "PM-1051", rating: "kW / kWh"]
tie = bus_tie [label: "CB-357", rating: "400 A / 3P / NORMALLY OPEN / KEY INTERLOCKED"]
f1cb = breaker [label: "CB-320", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-753", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1043", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1418", rating: "SHORE POWER PANEL / 38 kW"]
f2cb = breaker [label: "CB-312", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-726", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1050", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1451", rating: "SHORE POWER PANEL / 43 kW"]
f3cb = breaker [label: "CB-316", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-709", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1085", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1481", rating: "DOCK LIGHTING / 11 kW"]

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
busA -> f1cb [cable: "3#4/0 AWG"]
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
