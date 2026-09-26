sld "GEN-0768 — MARINA FACILITY / ELECTRICAL DISTRIBUTION"
# SHORE POWER SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-414", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_dy [label: "TX-1620", rating: "520 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-319", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-709", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1056", rating: "kW / kWh"]
f1cb = breaker [label: "CB-351", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-771", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1062", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-311", rating: "MCCB / 25 A / 3P"]
f1l1m = motor [label: "MTR-1125", rating: "13 kW / EF"]
f2cb = breaker [label: "CB-318", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-768", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1069", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-343", rating: "MCCB / 25 A / 3P"]
f2l1m = motor [label: "MTR-1115", rating: "12 kW / EF"]
f3cb = breaker [label: "CB-332", rating: "MCCB / 160 A / 3P"]
f3ct = ct [label: "TA-746", rating: "3 CTs / 160/5 A"]
f3pm = watthour_meter [label: "PM-1061", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1454", rating: "DOCK LIGHTING / 17 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
busA -> f3cb [cable: "3#1/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
