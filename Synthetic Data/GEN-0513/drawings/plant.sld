sld "GEN-0513 — RETAIL FACILITY / ELECTRICAL DISTRIBUTION"
# STORE SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-437", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_dy [label: "TX-1619", rating: "1390 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-327", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-728", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1058", rating: "kW / kWh"]
f1cb = breaker [label: "CB-337", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-775", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1063", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1448", rating: "SALES FLOOR LIGHTING / 50 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
mctA1 -> mpmA1
f1ct -> f1pm
