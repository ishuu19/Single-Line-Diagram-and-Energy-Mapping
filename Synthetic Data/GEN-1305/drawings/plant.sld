sld "GEN-1305 — COLD STORAGE UNIT / ELECTRICAL DISTRIBUTION"
# REFRIGERATION SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-434", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_yd [label: "TX-1613", rating: "1110 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-333", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-731", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1067", rating: "kW / kWh"]
f1cb = breaker [label: "CB-370", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-710", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1018", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-390", rating: "MCCB / 16 A / 3P"]
f1l1m = motor [label: "MTR-1150", rating: "5 kW / EF"]

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
