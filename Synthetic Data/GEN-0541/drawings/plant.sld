sld "GEN-0541 — COLD STORAGE UNIT / ELECTRICAL DISTRIBUTION"
# REFRIGERATION SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-407", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_dy [label: "TX-1604", rating: "690 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-383", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-798", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1066", rating: "kW / kWh"]
srcA2 = utility [label: "11kV STANDBY", voltage: "11kV"]
txA2 = transformer_yd [label: "TX-1643", rating: "550 kVA", voltage: "11kV / 400Y/230V"]
mcbA2 = breaker [label: "CB-349", rating: "ACB / 800 A / 3P"]
mctA2 = ct [label: "TA-742", rating: "3 CTs / 800/5 A"]
mpmA2 = watthour_meter [label: "PM-1074", rating: "kW / kWh"]
f1cb = breaker [label: "CB-308", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-736", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1046", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-319", rating: "MCCB / 32 A / 3P"]
f1l1m = motor [label: "MTR-1120", rating: "13 kW / EF"]

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
f1ct -> f1l1cb
f1l1cb -> f1l1m
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
