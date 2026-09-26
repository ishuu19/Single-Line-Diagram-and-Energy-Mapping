sld "GEN-1281 — GREENHOUSE COMPLEX / ELECTRICAL DISTRIBUTION"
# CULTIVATION SERVICES SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-402", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_yd [label: "TX-1688", rating: "210 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-331", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-766", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1031", rating: "kW / kWh"]
srcA2 = solar [label: "PV ARRAY 570 kW", voltage: "480Y/277V"]
mcbA2 = breaker [label: "CB-379", rating: "MCCB / 630 A / 3P"]
mctA2 = ct [label: "TA-755", rating: "3 CTs / 630/5 A"]
mpmA2 = watthour_meter [label: "PM-1054", rating: "kW / kWh"]
f1cb = breaker [label: "CB-336", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-763", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1050", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1429", rating: "GROW LIGHTING / 43 kW"]
f2cb = breaker [label: "CB-339", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-725", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1081", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1475", rating: "GROW LIGHTING / 38 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
