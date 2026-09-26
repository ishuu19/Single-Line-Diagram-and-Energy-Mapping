sld "GEN-0456 — TELECOM SITE / ELECTRICAL DISTRIBUTION"
# SHELTER POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-467", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_yd [label: "TX-1662", rating: "280 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-361", rating: "MCCB / 400 A / 3P"]
mctA1 = ct [label: "TA-754", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1040", rating: "kW / kWh"]
busB = bus [label: "BUS-452", voltage: "400Y/230V"]
srcB1 = utility [label: "11kV SUPPLY B", voltage: "11kV"]
txB1 = transformer_yd [label: "TX-1643", rating: "170 kVA", voltage: "11kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-354", rating: "MCCB / 250 A / 3P"]
mctB1 = ct [label: "TA-716", rating: "3 CTs / 250/5 A"]
mpmB1 = watthour_meter [label: "PM-1084", rating: "kW / kWh"]
tie = bus_tie [label: "CB-327", rating: "2000 A / 3P / NORMALLY OPEN / AUTO CLOSE ON LOSS"]
f1cb = breaker [label: "CB-344", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-798", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1079", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1461", rating: "SHELTER LIGHTING / 9 kW"]
f2cb = breaker [label: "CB-324", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-725", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1006", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1425", rating: "SHELTER LIGHTING / 6 kW"]
f3cb = breaker [label: "CB-346", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-713", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1007", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1444", rating: "AUXILIARY PANEL / 11 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcB1 -> txB1
txB1 -> mcbB1
mcbB1 -> mctB1
mctB1 -> busB
busA -> tie
tie -> busB
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busB -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busB -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
