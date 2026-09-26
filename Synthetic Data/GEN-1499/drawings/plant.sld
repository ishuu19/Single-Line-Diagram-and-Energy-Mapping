sld "GEN-1499 — COLD STORAGE UNIT / ELECTRICAL DISTRIBUTION"
# REFRIGERATION SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-424", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_yd [label: "TX-1613", rating: "1110 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-394", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-761", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1056", rating: "kW / kWh"]
f1cb = breaker [label: "CB-327", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-795", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1009", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-365", rating: "MCCB / 50 A / 3P"]
f1l1m = motor [label: "MTR-1122", rating: "21 kW / COND"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
mctA1 -> mpmA1
f1ct -> f1pm
