sld "GEN-1301 — PRINT SHOP / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-433", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_yd [label: "TX-1620", rating: "440 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-317", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-787", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1085", rating: "kW / kWh"]
srcA2 = utility [label: "33kV STANDBY", voltage: "33kV"]
txA2 = transformer_yd [label: "TX-1628", rating: "550 kVA", voltage: "33kV / 400Y/230V"]
mcbA2 = breaker [label: "CB-319", rating: "ACB / 800 A / 3P"]
mctA2 = ct [label: "TA-717", rating: "3 CTs / 800/5 A"]
mpmA2 = watthour_meter [label: "PM-1039", rating: "kW / kWh"]
f1cb = breaker [label: "CB-369", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-741", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1094", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1430", rating: "SHOP LIGHTING / 16 kW"]
f2cb = breaker [label: "CB-305", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-774", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1096", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1451", rating: "PRESS FLOOR PANEL / 34 kW"]
f3cb = breaker [label: "CB-391", rating: "MCCB / 400 A / 3P"]
f3ct = ct [label: "TA-716", rating: "3 CTs / 400/5 A"]
f3pm = watthour_meter [label: "PM-1034", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1480", rating: "PRESS FLOOR PANEL / 40 kW"]

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
f1ct -> f1l1ld
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#4/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
