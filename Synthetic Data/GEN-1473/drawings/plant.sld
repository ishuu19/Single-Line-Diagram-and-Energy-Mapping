sld "GEN-1473 — TELECOM SITE / ELECTRICAL DISTRIBUTION"
# SHELTER POWER SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-496", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_dy [label: "TX-1696", rating: "130 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-329", rating: "ACB / 160 A / 3P"]
mctA1 = ct [label: "TA-791", rating: "3 CTs / 160/5 A"]
mpmA1 = watthour_meter [label: "PM-1069", rating: "kW / kWh"]
srcA2 = generator [label: "STANDBY GENERATOR", voltage: "480Y/277V", rating: "470 kW"]
mcbA2 = breaker [label: "CB-395", rating: "ACB / 630 A / 3P"]
mctA2 = ct [label: "TA-786", rating: "3 CTs / 630/5 A"]
mpmA2 = watthour_meter [label: "PM-1062", rating: "kW / kWh"]
f1cb = breaker [label: "CB-389", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-721", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1005", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1485", rating: "RECTIFIER PDU / 36 kW"]
f2cb = breaker [label: "CB-325", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-758", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1021", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1446", rating: "SHELTER LIGHTING / 7 kW"]

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
