sld "GEN-0554 — LAUNDRY FACILITY / ELECTRICAL DISTRIBUTION"
# PROCESS SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-459", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_dy [label: "TX-1602", rating: "1110 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-376", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-777", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1073", rating: "kW / kWh"]
f1cb = breaker [label: "CB-331", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-702", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1031", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-313", rating: "MCCB / 32 A / 3P"]
f1l1m = motor [label: "MTR-1167", rating: "15 kW / EF"]
f2cb = breaker [label: "CB-340", rating: "MCCB / 63 A / 3P"]
f2ct = ct [label: "TA-746", rating: "3 CTs / 63/5 A"]
f2pm = watthour_meter [label: "PM-1038", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1444", rating: "UTILITY PANEL / 20 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busA -> f2cb [cable: "3#4 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
