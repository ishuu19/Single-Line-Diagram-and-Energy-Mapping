sld "GEN-0970 — RETAIL FACILITY / ELECTRICAL DISTRIBUTION"
# STORE SERVICES SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-454", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_yd [label: "TX-1673", rating: "670 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-313", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-773", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1032", rating: "kW / kWh"]
f1cb = breaker [label: "CB-317", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-731", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1028", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1417", rating: "HOUSE PANEL / 26 kW"]
f2cb = breaker [label: "CB-355", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-797", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1097", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1414", rating: "SALES FLOOR LIGHTING / 49 kW"]
f3cb = breaker [label: "CB-398", rating: "MCCB / 400 A / 3P"]
f3ct = ct [label: "TA-760", rating: "3 CTs / 400/5 A"]
f3pm = watthour_meter [label: "PM-1017", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1477", rating: "HOUSE PANEL / 55 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#4/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
