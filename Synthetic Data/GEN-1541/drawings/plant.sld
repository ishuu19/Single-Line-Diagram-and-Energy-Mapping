sld "GEN-1541 — TELECOM SITE / ELECTRICAL DISTRIBUTION"
# SHELTER POWER SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-439", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_dy [label: "TX-1628", rating: "210 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-397", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-757", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1062", rating: "kW / kWh"]
f1cb = breaker [label: "CB-348", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-709", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1017", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1434", rating: "RECTIFIER PDU / 26 kW"]
f2cb = breaker [label: "CB-379", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-704", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1043", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1446", rating: "RECTIFIER PDU / 51 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
