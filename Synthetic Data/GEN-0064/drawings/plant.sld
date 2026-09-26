sld "GEN-0064 — COLD STORAGE UNIT / ELECTRICAL DISTRIBUTION"
# REFRIGERATION SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-493", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_yd [label: "TX-1693", rating: "690 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-308", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-778", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1075", rating: "kW / kWh"]
busB = bus [label: "BUS-480", voltage: "400Y/230V"]
srcB1 = generator [label: "STANDBY GENERATOR", voltage: "400Y/230V", rating: "620 kW"]
mcbB1 = breaker [label: "CB-386", rating: "ACB / 1000 A / 3P"]
mctB1 = ct [label: "TA-749", rating: "3 CTs / 1000/5 A"]
mpmB1 = watthour_meter [label: "PM-1047", rating: "kW / kWh"]
tie = ats [label: "CB-380", rating: "800 A / 3P / AUTOMATIC TRANSFER / OPEN TRANSITION"]
f1cb = breaker [label: "CB-367", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-704", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1012", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-381", rating: "MCCB / 32 A / 3P"]
f1l1m = motor [label: "MTR-1164", rating: "15 kW / EF"]
f2cb = breaker [label: "CB-395", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-732", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1053", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1406", rating: "DOCK PANEL / 15 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcB1 -> mcbB1
mcbB1 -> mctB1
mctB1 -> busB
busA -> tie
tie -> busB
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busB -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
