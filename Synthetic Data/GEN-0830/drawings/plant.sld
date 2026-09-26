sld "GEN-0830 — MARINA FACILITY / ELECTRICAL DISTRIBUTION"
# SHORE POWER SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-470", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_dy [label: "TX-1639", rating: "720 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-319", rating: "MCCB / 2000 A / 3P"]
mctA1 = ct [label: "TA-718", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1065", rating: "kW / kWh"]
f1cb = breaker [label: "CB-341", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-748", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1041", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1421", rating: "SHORE POWER PANEL / 76 kW"]
f2cb = breaker [label: "CB-365", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-705", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1062", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1417", rating: "SHORE POWER PANEL / 80 kW"]
f3cb = breaker [label: "CB-342", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-723", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1055", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1441", rating: "DOCK LIGHTING / 17 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#1/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
