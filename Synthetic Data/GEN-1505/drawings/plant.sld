sld "GEN-1505 — REEFER YARD / ELECTRICAL DISTRIBUTION"
# CONTAINER YARD SINGLE-LINE DIAGRAM
# 208Y/120V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-494", voltage: "208Y/120V"]
srcA1 = utility [label: "12.47kV SUPPLY A", voltage: "12.47kV"]
txA1 = transformer_yd [label: "TX-1615", rating: "290 kVA", voltage: "12.47kV / 208Y/120V"]
mcbA1 = breaker [label: "CB-386", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-709", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1037", rating: "kW / kWh"]
f1cb = breaker [label: "CB-397", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-787", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1094", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-390", rating: "MCCB / 20 A / 3P"]
f1l1m = motor [label: "MTR-1134", rating: "5 kW / EF"]
f2cb = breaker [label: "CB-362", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-771", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1077", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1461", rating: "REEFER RACK PANEL / 66 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busA -> f2cb [cable: "3#4/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
