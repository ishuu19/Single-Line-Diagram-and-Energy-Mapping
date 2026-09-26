sld "GEN-0245 — MARINA FACILITY / ELECTRICAL DISTRIBUTION"
# SHORE POWER SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-491", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_yd [label: "TX-1652", rating: "720 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-384", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-790", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1078", rating: "kW / kWh"]
f1cb = breaker [label: "CB-358", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-744", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1014", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-346", rating: "MCCB / 63 A / 3P"]
f1l1m = motor [label: "MTR-1148", rating: "15 kW / EF"]
f2cb = breaker [label: "CB-318", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-779", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1054", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1493", rating: "SHORE POWER PANEL / 39 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
