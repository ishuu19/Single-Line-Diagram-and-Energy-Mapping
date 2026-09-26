sld "GEN-0912 — RETAIL FACILITY / ELECTRICAL DISTRIBUTION"
# STORE SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-400", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_yd [label: "TX-1674", rating: "170 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-342", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-793", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1060", rating: "kW / kWh"]
f1cb = breaker [label: "CB-332", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-753", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1070", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1448", rating: "HOUSE PANEL / 31 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
mctA1 -> mpmA1
f1ct -> f1pm
