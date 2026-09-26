sld "GEN-0712 — MARINA FACILITY / ELECTRICAL DISTRIBUTION"
# SHORE POWER SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-402", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_yd [label: "TX-1679", rating: "720 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-352", rating: "ACB / 2000 A / 3P"]
mctA1 = ct [label: "TA-785", rating: "3 CTs / 2000/5 A"]
mpmA1 = watthour_meter [label: "PM-1085", rating: "kW / kWh"]
f1cb = breaker [label: "CB-371", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-701", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1002", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1489", rating: "DOCK LIGHTING / 19 kW"]
f2cb = breaker [label: "CB-362", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-736", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1082", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1480", rating: "DOCK LIGHTING / 12 kW"]

srcA1 -> txA1
txA1 -> mcbA1
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
