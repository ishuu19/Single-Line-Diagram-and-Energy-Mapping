sld "GEN-0308 — WATER PUMP STATION / ELECTRICAL DISTRIBUTION"
# PUMPING PLANT SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-498", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_yd [label: "TX-1672", rating: "550 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-306", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-726", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1009", rating: "kW / kWh"]
f1cb = breaker [label: "CB-305", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-761", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1040", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1476", rating: "DOSING PANEL / 22 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
mctA1 -> mpmA1
f1ct -> f1pm
