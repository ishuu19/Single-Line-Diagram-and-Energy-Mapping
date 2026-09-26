sld "GEN-0117 — WATER PUMP STATION / ELECTRICAL DISTRIBUTION"
# PUMPING PLANT SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-462", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_yd [label: "TX-1611", rating: "690 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-333", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-714", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1004", rating: "kW / kWh"]
srcA2 = utility [label: "20kV STANDBY", voltage: "20kV"]
txA2 = transformer_dy [label: "TX-1695", rating: "440 kVA", voltage: "20kV / 400Y/230V"]
mcbA2 = breaker [label: "CB-313", rating: "ACB / 630 A / 3P"]
mctA2 = ct [label: "TA-707", rating: "3 CTs / 630/5 A"]
mpmA2 = watthour_meter [label: "PM-1010", rating: "kW / kWh"]
f1cb = breaker [label: "CB-383", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-741", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1095", rating: "kW / kWh"]
f1pnl = hub [label: "FD-940", rating: "3P+N"]
f1l1ld = load [label: "PNL-1462", rating: "DOSING PANEL / 36 kW"]
f1l2ld = load [label: "PNL-1453", rating: "DOSING PANEL / 33 kW"]

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
