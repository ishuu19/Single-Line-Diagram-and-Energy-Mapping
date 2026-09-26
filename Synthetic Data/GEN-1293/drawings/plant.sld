sld "GEN-1293 — MARINA FACILITY / ELECTRICAL DISTRIBUTION"
# SHORE POWER SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-453", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_yd [label: "TX-1605", rating: "670 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-317", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-749", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1057", rating: "kW / kWh"]
busB = bus [label: "BUS-446", voltage: "480Y/277V"]
srcB1 = utility [label: "13.8kV SUPPLY B", voltage: "13.8kV"]
txB1 = transformer_dy [label: "TX-1671", rating: "330 kVA", voltage: "13.8kV / 480Y/277V"]
mcbB1 = breaker [label: "CB-315", rating: "ACB / 400 A / 3P"]
mctB1 = ct [label: "TA-715", rating: "3 CTs / 400/5 A"]
mpmB1 = watthour_meter [label: "PM-1067", rating: "kW / kWh"]
tie = bus_tie [label: "CB-375", rating: "1000 A / 3P / NORMALLY OPEN / AUTO CLOSE ON LOSS"]
f1cb = breaker [label: "CB-354", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-757", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1028", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1442", rating: "SHORE POWER PANEL / 71 kW"]
f2cb = breaker [label: "CB-335", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-761", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1081", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1439", rating: "AUXILIARY PANEL / 5 kW"]
f3cb = breaker [label: "CB-396", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-708", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1079", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1454", rating: "SHORE POWER PANEL / 50 kW"]

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
busB -> f2cb [cable: "3#1/0 AWG"]
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
