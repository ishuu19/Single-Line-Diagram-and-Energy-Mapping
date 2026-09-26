sld "GEN-0744 — RETAIL FACILITY / ELECTRICAL DISTRIBUTION"
# STORE SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-478", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_yd [label: "TX-1644", rating: "440 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-302", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-725", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1009", rating: "kW / kWh"]
srcA2 = utility [label: "6.6kV STANDBY", voltage: "6.6kV"]
txA2 = transformer_dy [label: "TX-1641", rating: "280 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA2 = breaker [label: "CB-371", rating: "MCCB / 400 A / 3P"]
mctA2 = ct [label: "TA-731", rating: "3 CTs / 400/5 A"]
mpmA2 = watthour_meter [label: "PM-1074", rating: "kW / kWh"]
f1cb = breaker [label: "CB-307", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-761", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1058", rating: "kW / kWh"]
f1pnl = hub [label: "FD-956", rating: "3P+N"]
f1l1ld = load [label: "PNL-1494", rating: "SALES FLOOR LIGHTING / 47 kW"]
f1l2ld = load [label: "PNL-1495", rating: "SALES FLOOR LIGHTING / 55 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> txA2
txA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1ld
f1pnl -> f1l2ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
