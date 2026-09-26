sld "GEN-0259 — MARINA FACILITY / ELECTRICAL DISTRIBUTION"
# SHORE POWER SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-480", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_yd [label: "TX-1692", rating: "520 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-301", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-765", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1049", rating: "kW / kWh"]
f1cb = breaker [label: "CB-321", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-785", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1006", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1485", rating: "SHORE POWER PANEL / 61 kW"]
f2cb = breaker [label: "CB-323", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-774", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1011", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1462", rating: "DOCK LIGHTING / 18 kW"]
f3cb = breaker [label: "CB-386", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-714", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1080", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1459", rating: "DOCK LIGHTING / 11 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
