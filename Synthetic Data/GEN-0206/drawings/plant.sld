sld "GEN-0206 — TELECOM SITE / ELECTRICAL DISTRIBUTION"
# SHELTER POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-443", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
mcbA1 = breaker [label: "CB-363", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-761", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1007", rating: "kW / kWh"]
f1cb = breaker [label: "CB-344", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-710", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1030", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1440", rating: "RECTIFIER PDU / 20 kW"]
f2cb = breaker [label: "CB-314", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-756", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1094", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1411", rating: "SHELTER LIGHTING / 7 kW"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
