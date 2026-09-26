sld "GEN-1114 — REEFER YARD / ELECTRICAL DISTRIBUTION"
# CONTAINER YARD SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-463", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
mcbA1 = breaker [label: "CB-386", rating: "ACB / 800 A / 3P"]
mctA1 = ct [label: "TA-778", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1033", rating: "kW / kWh"]
busB = bus [label: "BUS-420", voltage: "400Y/230V"]
srcB1 = utility [label: "20kV SUPPLY B", voltage: "20kV"]
txB1 = transformer_yd [label: "TX-1655", rating: "690 kVA", voltage: "20kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-396", rating: "ACB / 1000 A / 3P"]
mctB1 = ct [label: "TA-712", rating: "3 CTs / 1000/5 A"]
mpmB1 = watthour_meter [label: "PM-1074", rating: "kW / kWh"]
tie = bus_tie [label: "CB-392", rating: "400 A / 3P / NORMALLY OPEN / AUTO CLOSE ON LOSS"]
f1cb = breaker [label: "CB-337", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-741", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1008", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1424", rating: "REEFER RACK PANEL / 107 kW"]
f2cb = breaker [label: "CB-308", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-779", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1081", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1421", rating: "YARD LIGHTING / 18 kW"]
f3cb = breaker [label: "CB-315", rating: "MCCB / 250 A / 3P"]
f3ct = ct [label: "TA-745", rating: "3 CTs / 250/5 A"]
f3pm = watthour_meter [label: "PM-1065", rating: "kW / kWh"]
f3l1cb = breaker [label: "CB-324", rating: "MCCB / 25 A / 3P"]
f3l1m = motor [label: "MTR-1187", rating: "12 kW / EF"]

srcA1 -> mcbA1
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
busB -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busB -> f3cb [cable: "3#2/0 AWG"]
f3cb -> f3ct
f3ct -> f3l1cb
f3l1cb -> f3l1m
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
