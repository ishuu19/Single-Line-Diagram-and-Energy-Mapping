sld "GEN-1024 — GREENHOUSE COMPLEX / ELECTRICAL DISTRIBUTION"
# CULTIVATION SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-474", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_yd [label: "TX-1615", rating: "280 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-353", rating: "MCCB / 400 A / 3P"]
mctA1 = ct [label: "TA-713", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1012", rating: "kW / kWh"]
f1cb = breaker [label: "CB-305", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-772", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1003", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-310", rating: "MCCB / 50 A / 3P"]
f1l1m = motor [label: "MTR-1115", rating: "23 kW / RWP"]
f2cb = breaker [label: "CB-357", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-709", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1070", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1466", rating: "GROW LIGHTING / 66 kW"]
f3cb = breaker [label: "CB-303", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-742", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1090", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1464", rating: "CONTROL PANEL / 14 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#2/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
