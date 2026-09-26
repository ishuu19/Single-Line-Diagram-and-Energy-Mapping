sld "GEN-1403 — PRINT SHOP / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-454", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_dy [label: "TX-1645", rating: "440 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-315", rating: "MCCB / 630 A / 3P"]
mctA1 = ct [label: "TA-761", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1023", rating: "kW / kWh"]
f1cb = breaker [label: "CB-397", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-782", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1073", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1471", rating: "SHOP LIGHTING / 16 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
mctA1 -> mpmA1
f1ct -> f1pm
