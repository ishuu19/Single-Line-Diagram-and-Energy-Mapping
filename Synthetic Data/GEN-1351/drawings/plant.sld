sld "GEN-1351 — SCHOOL CAMPUS / ELECTRICAL DISTRIBUTION"
# CAMPUS SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-488", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_yd [label: "TX-1614", rating: "280 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-309", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-770", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1075", rating: "kW / kWh"]
busB = bus [label: "BUS-445", voltage: "400Y/230V"]
srcB1 = generator [label: "STANDBY GENERATOR", voltage: "400Y/230V", rating: "150 kW"]
mcbB1 = breaker [label: "CB-301", rating: "ACB / 250 A / 3P"]
mctB1 = ct [label: "TA-780", rating: "3 CTs / 250/5 A"]
mpmB1 = watthour_meter [label: "PM-1090", rating: "kW / kWh"]
tie = ats [label: "CB-338", rating: "800 A / 3P / AUTOMATIC TRANSFER / OPEN TRANSITION"]
f1cb = breaker [label: "CB-383", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-753", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1052", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1412", rating: "AUXILIARY PANEL / 9 kW"]
f2cb = breaker [label: "CB-326", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-790", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1065", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1415", rating: "ADMIN PANEL / 59 kW"]
f3cb = breaker [label: "CB-362", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-715", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1026", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-343", rating: "MCCB / 32 A / 3P"]
f3l1m = motor [label: "MTR-1120", rating: "13 kW / EF"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcB1 -> mcbB1
mcbB1 -> mctB1
mctB1 -> busB
busA -> tie
tie -> busB
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busB -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1m
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
