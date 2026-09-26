sld "GEN-1199 — TELECOM SITE / ELECTRICAL DISTRIBUTION"
# SHELTER POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-412", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_yd [label: "TX-1640", rating: "280 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-350", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-728", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1048", rating: "kW / kWh"]
f1cb = breaker [label: "CB-343", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-779", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1070", rating: "kW / kWh"]
f1pnl = hub [label: "FD-969", rating: "3P+N"]
f1l1ld = load [label: "PNL-1402", rating: "RECTIFIER PDU / 40 kW"]
f1l2ld = load [label: "PNL-1434", rating: "RECTIFIER PDU / 47 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
mctA1 -> mpmA1
f1ct -> f1pm
