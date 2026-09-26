sld "GEN-0904 — OFFICE TOWER / ELECTRICAL DISTRIBUTION"
# BUILDING SERVICES SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-418", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_yd [label: "TX-1674", rating: "330 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-391", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-775", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1028", rating: "kW / kWh"]
f1cb = breaker [label: "CB-382", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-747", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1048", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1427", rating: "FLOOR LIGHTING / 75 kW"]
f2cb = breaker [label: "CB-336", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-701", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1008", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1437", rating: "TENANT PANEL / 94 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
