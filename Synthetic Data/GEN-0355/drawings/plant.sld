sld "GEN-0355 — MARINA FACILITY / ELECTRICAL DISTRIBUTION"
# SHORE POWER SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-432", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_yd [label: "TX-1664", rating: "550 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-365", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-735", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1088", rating: "kW / kWh"]
f1cb = breaker [label: "CB-338", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-750", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1046", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1420", rating: "DOCK LIGHTING / 19 kW"]
f2cb = breaker [label: "CB-367", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-739", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1034", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-375", rating: "MCCB / 20 A / 3P"]
f2l1m = motor [label: "MTR-1162", rating: "9 kW / EF"]
f3cb = breaker [label: "CB-324", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-799", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1014", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-360", rating: "MCCB / 20 A / 3P"]
f3l1m = motor [label: "MTR-1171", rating: "9 kW / EF"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
busA -> f3cb [cable: "3#1/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
