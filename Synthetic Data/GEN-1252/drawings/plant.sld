sld "GEN-1252 — MARINA FACILITY / ELECTRICAL DISTRIBUTION"
# SHORE POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-404", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_yd [label: "TX-1656", rating: "550 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-322", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-756", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1058", rating: "kW / kWh"]
srcA2 = generator [label: "STANDBY GENERATOR", voltage: "400Y/230V", rating: "150 kW"]
mcbA2 = breaker [label: "CB-361", rating: "MCCB / 250 A / 3P"]
mctA2 = ct [label: "TA-797", rating: "3 CTs / 250/5 A"]
mpmA2 = watthour_meter [label: "PM-1035", rating: "kW / kWh"]
f1cb = breaker [label: "CB-375", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-742", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1032", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1454", rating: "DOCK LIGHTING / 14 kW"]
f2cb = breaker [label: "CB-359", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-721", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1001", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1426", rating: "SHORE POWER PANEL / 45 kW"]
f3cb = breaker [label: "CB-330", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-774", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1063", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1475", rating: "SHORE POWER PANEL / 33 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#2/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
