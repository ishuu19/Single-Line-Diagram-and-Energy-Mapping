sld "GEN-0993 — RETAIL FACILITY / ELECTRICAL DISTRIBUTION"
# STORE SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-414", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_dy [label: "TX-1681", rating: "550 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-301", rating: "MCCB / 800 A / 3P"]
mctA1 = ct [label: "TA-710", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1080", rating: "kW / kWh"]
srcA2 = utility [label: "22kV STANDBY", voltage: "22kV"]
txA2 = transformer_dy [label: "TX-1691", rating: "170 kVA", voltage: "22kV / 400Y/230V"]
mcbA2 = breaker [label: "CB-354", rating: "ACB / 250 A / 3P"]
mctA2 = ct [label: "TA-725", rating: "3 CTs / 250/5 A"]
mpmA2 = watthour_meter [label: "PM-1014", rating: "kW / kWh"]
f1cb = breaker [label: "CB-391", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-726", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1053", rating: "kW / kWh"]
f1pnl = hub [label: "FD-996", rating: "3P+N"]
f1l1cb = breaker [label: "CB-329", rating: "MCCB / 32 A / 3P"]
f1l1m = motor [label: "MTR-1197", rating: "14 kW / EF"]
f1l2ld = load [label: "PNL-1441", rating: "HOUSE PANEL / 30 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> txA2
txA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1pnl
f1pnl -> f1l1cb
f1l1cb -> f1l1m
f1pnl -> f1l2ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
