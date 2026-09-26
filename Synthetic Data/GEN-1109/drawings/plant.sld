sld "GEN-1109 — BREWERY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 480Y/277V, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-472", voltage: "480Y/277V"]
srcA1 = utility [label: "13.8kV SUPPLY A", voltage: "13.8kV"]
txA1 = transformer_yd [label: "TX-1614", rating: "520 kVA", voltage: "13.8kV / 480Y/277V"]
mcbA1 = breaker [label: "CB-309", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-707", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1052", rating: "kW / kWh"]
busB = bus [label: "BUS-493", voltage: "480Y/277V"]
srcB1 = utility [label: "13.8kV SUPPLY B", voltage: "13.8kV"]
txB1 = transformer_yd [label: "TX-1684", rating: "210 kVA", voltage: "13.8kV / 480Y/277V"]
mcbB1 = breaker [label: "CB-388", rating: "ACB / 250 A / 3P"]
mctB1 = ct [label: "TA-714", rating: "3 CTs / 250/5 A"]
mpmB1 = watthour_meter [label: "PM-1039", rating: "kW / kWh"]
tie = bus_tie [label: "CB-308", rating: "1000 A / 3P / NORMALLY OPEN / AUTO CLOSE ON LOSS"]
f1cb = breaker [label: "CB-339", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-771", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1094", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1402", rating: "AUXILIARY PANEL / 32 kW"]
f2cb = breaker [label: "CB-327", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-767", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1001", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1498", rating: "CELLAR PANEL / 25 kW"]
f3cb = breaker [label: "CB-336", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-796", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1031", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1477", rating: "AUXILIARY PANEL / 15 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcB1 -> txB1
txB1 -> mcbB1
mcbB1 -> mctB1
mctB1 -> busB
busA -> tie
tie -> busB
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busB -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busB -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
