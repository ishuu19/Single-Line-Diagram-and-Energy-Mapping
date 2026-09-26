sld "GEN-0157 — CAMPUS ELECTRICAL DISTRIBUTION / RENEWABLE INTEGRATION"
# SINGLE-LINE DIAGRAM WITH PV ARRAY
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-494", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
mcbA1 = breaker [label: "CB-348", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-768", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1073", rating: "kW / kWh"]
busB = bus [label: "BUS-422", voltage: "400Y/230V"]
srcB1 = utility [label: "11kV SUPPLY B", voltage: "11kV"]
txB1 = transformer_yd [label: "TX-1675", rating: "550 kVA", voltage: "11kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-350", rating: "ACB / 800 A / 3P"]
mctB1 = ct [label: "TA-710", rating: "3 CTs / 800/5 A"]
mpmB1 = watthour_meter [label: "PM-1078", rating: "kW / kWh"]
tie = bus_tie [label: "CB-382", rating: "630 A / 3P / NORMALLY OPEN / INTERLOCKED"]
f1cb = breaker [label: "CB-395", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-744", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1098", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1453", rating: "SITE LIGHTING / 16 kW"]
f2cb = breaker [label: "CB-341", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-717", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1031", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1436", rating: "SITE LIGHTING / 31 kW"]
f3cb = breaker [label: "CB-384", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-799", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1052", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1448", rating: "SITE LIGHTING / 22 kW"]

srcA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcB1 -> txB1
txB1 -> mcbB1
mcbB1 -> mctB1
mctB1 -> busB
busA -> tie
tie -> busB
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busB -> f2cb [cable: "3#1/0 AWG"]
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
