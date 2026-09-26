sld "GEN-0984 — MARINA FACILITY / ELECTRICAL DISTRIBUTION"
# SHORE POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-496", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
mcbA1 = breaker [label: "CB-312", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-749", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1019", rating: "kW / kWh"]
f1cb = breaker [label: "CB-390", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-703", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1079", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-375", rating: "MCCB / 16 A / 3P"]
f1l1m = motor [label: "MTR-1119", rating: "5 kW / EF"]
f2cb = breaker [label: "CB-327", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-782", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1018", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1482", rating: "DOCK LIGHTING / 18 kW"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
