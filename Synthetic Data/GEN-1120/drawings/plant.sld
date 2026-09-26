sld "GEN-1120 — SCHOOL CAMPUS / ELECTRICAL DISTRIBUTION"
# CAMPUS SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-408", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_yd [label: "TX-1683", rating: "550 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-304", rating: "MCCB / 800 A / 3P"]
mctA1 = ct [label: "TA-706", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1007", rating: "kW / kWh"]
f1cb = breaker [label: "CB-370", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-716", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1082", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-347", rating: "MCCB / 32 A / 3P"]
f1l1m = motor [label: "MTR-1191", rating: "15 kW / EF"]
f2cb = breaker [label: "CB-365", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-750", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1019", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-355", rating: "MCCB / 32 A / 3P"]
f2l1m = motor [label: "MTR-1122", rating: "14 kW / EF"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
