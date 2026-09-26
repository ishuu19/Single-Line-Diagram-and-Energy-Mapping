sld "GEN-0845 — FOOD PROCESSING FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-402", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_yd [label: "TX-1698", rating: "690 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-311", rating: "MCCB / 1000 A / 3P"]
mctA1 = ct [label: "TA-750", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1080", rating: "kW / kWh"]
srcA2 = utility [label: "6.6kV STANDBY", voltage: "6.6kV"]
txA2 = transformer_dy [label: "TX-1621", rating: "280 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA2 = breaker [label: "CB-386", rating: "MCCB / 400 A / 3P"]
mctA2 = ct [label: "TA-730", rating: "3 CTs / 400/5 A"]
mpmA2 = watthour_meter [label: "PM-1018", rating: "kW / kWh"]
f1cb = breaker [label: "CB-388", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-714", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1071", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1420", rating: "PACKAGING PANEL / 11 kW"]
f2cb = breaker [label: "CB-333", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-782", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1034", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-331", rating: "MCCB / 125 A / 3P"]
f2l1m = motor [label: "MTR-1102", rating: "54 kW / COMP"]
f3cb = breaker [label: "CB-312", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-793", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1007", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-327", rating: "MCCB / 100 A / 3P"]
f3l1m = motor [label: "MTR-1198", rating: "41 kW / COMP"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> txA2
txA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1m
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
