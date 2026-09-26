sld "GEN-0172 — REEFER YARD / ELECTRICAL DISTRIBUTION"
# CONTAINER YARD SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-461", voltage: "400Y/230V"]
srcA1 = utility [label: "20kV SUPPLY A", voltage: "20kV"]
txA1 = transformer_dy [label: "TX-1636", rating: "550 kVA", voltage: "20kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-395", rating: "MCCB / 800 A / 3P"]
mctA1 = ct [label: "TA-722", rating: "3 CTs / 800/5 A"]
mpmA1 = watthour_meter [label: "PM-1038", rating: "kW / kWh"]
busB = bus [label: "BUS-457", voltage: "400Y/230V"]
srcB1 = utility [label: "20kV SUPPLY B", voltage: "20kV"]
txB1 = transformer_yd [label: "TX-1607", rating: "690 kVA", voltage: "20kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-331", rating: "ACB / 1000 A / 3P"]
mctB1 = ct [label: "TA-709", rating: "3 CTs / 1000/5 A"]
mpmB1 = watthour_meter [label: "PM-1073", rating: "kW / kWh"]
tie = bus_tie [label: "CB-370", rating: "630 A / 3P / NORMALLY OPEN / AUTO CLOSE ON LOSS"]
f1cb = breaker [label: "CB-355", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-776", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1083", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1487", rating: "YARD LIGHTING / 17 kW"]
f2cb = breaker [label: "CB-329", rating: "MCCB / 100 A / 3P"]
f2ct = ct [label: "TA-798", rating: "3 CTs / 100/5 A"]
f2pm = watthour_meter [label: "PM-1063", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1491", rating: "YARD LIGHTING / 18 kW"]
f3cb = breaker [label: "CB-313", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-775", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1076", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1463", rating: "REEFER RACK PANEL / 85 kW"]

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
busA -> f1cb [cable: "3#4/0 AWG"]
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
