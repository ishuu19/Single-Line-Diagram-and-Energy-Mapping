sld "GEN-0629 — FOOD PROCESSING FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-467", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_yd [label: "TX-1676", rating: "690 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-384", rating: "ACB / 1000 A / 3P"]
mctA1 = ct [label: "TA-745", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1024", rating: "kW / kWh"]
busB = bus [label: "BUS-453", voltage: "400Y/230V"]
srcB1 = utility [label: "33kV SUPPLY B", voltage: "33kV"]
txB1 = transformer_yd [label: "TX-1626", rating: "690 kVA", voltage: "33kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-341", rating: "ACB / 1000 A / 3P"]
mctB1 = ct [label: "TA-755", rating: "3 CTs / 1000/5 A"]
mpmB1 = watthour_meter [label: "PM-1091", rating: "kW / kWh"]
tie = bus_tie [label: "CB-310", rating: "630 A / 3P / NORMALLY OPEN / KEY INTERLOCKED"]
f1cb = breaker [label: "CB-387", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-731", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1037", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1494", rating: "AUXILIARY PANEL / 35 kW"]
f2cb = breaker [label: "CB-312", rating: "MCCB / 400 A / 3P"]
f2ct = ct [label: "TA-756", rating: "3 CTs / 400/5 A"]
f2pm = watthour_meter [label: "PM-1014", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1400", rating: "AUXILIARY PANEL / 50 kW"]
f3cb = breaker [label: "CB-370", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-783", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1064", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1438", rating: "PACKAGING PANEL / 21 kW"]

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
busA -> f2cb [cable: "3#4/0 AWG"]
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
