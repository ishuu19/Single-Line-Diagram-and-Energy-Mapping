sld "GEN-0647 — MARINA FACILITY / ELECTRICAL DISTRIBUTION"
# SHORE POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-461", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_yd [label: "TX-1685", rating: "170 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-396", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-746", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1049", rating: "kW / kWh"]
busB = bus [label: "BUS-465", voltage: "400Y/230V"]
srcB1 = utility [label: "20kV SUPPLY B", voltage: "20kV"]
mcbB1 = breaker [label: "CB-322", rating: "ACB / 1000 A / 3P"]
mctB1 = ct [label: "TA-790", rating: "3 CTs / 1000/5 A"]
mpmB1 = watthour_meter [label: "PM-1044", rating: "kW / kWh"]
tie = bus_tie [label: "CB-372", rating: "630 A / 3P / NORMALLY OPEN / INTERLOCKED"]
f1cb = breaker [label: "CB-375", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-729", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1061", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1498", rating: "AUXILIARY PANEL / 10 kW"]
f2cb = breaker [label: "CB-350", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-780", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1008", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1442", rating: "SHORE POWER PANEL / 33 kW"]
f3cb = breaker [label: "CB-336", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-712", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1068", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1419", rating: "DOCK LIGHTING / 14 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcB1 -> mcbB1
mcbB1 -> mctB1
mctB1 -> busB
busA -> tie
tie -> busB
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busB -> f2cb [cable: "3#4/0 AWG"]
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
