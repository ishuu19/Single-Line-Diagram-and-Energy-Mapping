sld "GEN-0085 — GREENHOUSE COMPLEX / ELECTRICAL DISTRIBUTION"
# CULTIVATION SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-430", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_yd [label: "TX-1622", rating: "1110 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-376", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-718", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1063", rating: "kW / kWh"]
f1cb = breaker [label: "CB-379", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-766", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1042", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-355", rating: "MCCB / 25 A / 3P"]
f1l1m = motor [label: "MTR-1145", rating: "12 kW / RWP"]
f2cb = breaker [label: "CB-302", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-710", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1041", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1448", rating: "CONTROL PANEL / 25 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busA -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
