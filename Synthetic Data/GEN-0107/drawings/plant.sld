sld "GEN-0107 — OFFICE TOWER / ELECTRICAL DISTRIBUTION"
# BUILDING SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-451", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_yd [label: "TX-1680", rating: "690 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-319", rating: "MCCB / 1000 A / 3P"]
mctA1 = ct [label: "TA-758", rating: "3 CTs / 1000/5 A"]
mpmA1 = watthour_meter [label: "PM-1032", rating: "kW / kWh"]
busB = bus [label: "BUS-447", voltage: "400Y/230V"]
srcB1 = utility [label: "33kV SUPPLY B", voltage: "33kV"]
txB1 = transformer_yd [label: "TX-1699", rating: "170 kVA", voltage: "33kV / 400Y/230V"]
mcbB1 = breaker [label: "CB-308", rating: "ACB / 250 A / 3P"]
mctB1 = ct [label: "TA-769", rating: "3 CTs / 250/5 A"]
mpmB1 = watthour_meter [label: "PM-1080", rating: "kW / kWh"]
tie = bus_tie [label: "CB-318", rating: "1000 A / 3P / NORMALLY OPEN / INTERLOCKED"]
f1cb = breaker [label: "CB-397", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-789", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1001", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1499", rating: "TENANT PANEL / 53 kW"]
f2cb = breaker [label: "CB-399", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-729", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1053", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1469", rating: "TENANT PANEL / 61 kW"]

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
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busB -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
mctB1 -> mpmB1
f1ct -> f1pm
f2ct -> f2pm
