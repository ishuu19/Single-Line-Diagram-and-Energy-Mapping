sld "GEN-1046 — REEFER YARD / ELECTRICAL DISTRIBUTION"
# CONTAINER YARD SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-412", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
mcbA1 = breaker [label: "CB-394", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-724", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1014", rating: "kW / kWh"]
f1cb = breaker [label: "CB-334", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-789", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1099", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-366", rating: "MCCB / 25 A / 3P"]
f1l1m = motor [label: "MTR-1188", rating: "12 kW / EF"]
f2cb = breaker [label: "CB-306", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-730", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1043", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1484", rating: "YARD LIGHTING / 31 kW"]
f3cb = breaker [label: "CB-392", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-738", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1072", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1408", rating: "REEFER RACK PANEL / 119 kW"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#1/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
