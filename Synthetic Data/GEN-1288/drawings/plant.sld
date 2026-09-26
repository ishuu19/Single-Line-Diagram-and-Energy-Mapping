sld "GEN-1288 — MARINA FACILITY / ELECTRICAL DISTRIBUTION"
# SHORE POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-409", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_yd [label: "TX-1699", rating: "1110 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-386", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-773", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1039", rating: "kW / kWh"]
f1cb = breaker [label: "CB-351", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-782", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1048", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1431", rating: "SHORE POWER PANEL / 75 kW"]
f2cb = breaker [label: "CB-345", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-752", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1054", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-311", rating: "MCCB / 32 A / 3P"]
f2l1m = motor [label: "MTR-1193", rating: "14 kW / EF"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
