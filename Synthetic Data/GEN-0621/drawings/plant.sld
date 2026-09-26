sld "GEN-0621 — CAMPUS ELECTRICAL DISTRIBUTION / RENEWABLE INTEGRATION"
# SINGLE-LINE DIAGRAM WITH PV ARRAY
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-436", voltage: "400Y/230V"]
srcA1 = utility [label: "6.6kV SUPPLY A", voltage: "6.6kV"]
txA1 = transformer_dy [label: "TX-1623", rating: "1110 kVA", voltage: "6.6kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-310", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-771", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1075", rating: "kW / kWh"]
srcA2 = solar [label: "PV ARRAY 422 kW", voltage: "400Y/230V"]
mcbA2 = breaker [label: "CB-387", rating: "MCCB / 160 A / 3P"]
mctA2 = ct [label: "TA-764", rating: "3 CTs / 160/5 A"]
mpmA2 = watthour_meter [label: "PM-1098", rating: "kW / kWh"]
f1cb = breaker [label: "CB-301", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-769", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1048", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1411", rating: "SITE LIGHTING / 25 kW"]
f2cb = breaker [label: "CB-357", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-789", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1008", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-330", rating: "MCCB / 80 A / 3P"]
f2l1drv = vfd [label: "DRV-821", rating: "VFD / OL"]
f2l1m = motor [label: "MTR-1100", rating: "32 kW / AHU"]

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
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1drv
f2l1drv -> f2l1m
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
