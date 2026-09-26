sld "GEN-0102 — RETAIL FACILITY / ELECTRICAL DISTRIBUTION"
# STORE SERVICES SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-445", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_yd [label: "TX-1673", rating: "440 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-393", rating: "ACB / 630 A / 3P"]
mctA1 = ct [label: "TA-750", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1041", rating: "kW / kWh"]
f1cb = breaker [label: "CB-398", rating: "MCCB / 400 A / 3P"]
f1ct = ct [label: "TA-763", rating: "3 CTs / 400/5 A"]
f1pm = watthour_meter [label: "PM-1071", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-308", rating: "MCCB / 25 A / 3P"]
f1l1m = motor [label: "MTR-1120", rating: "12 kW / EF"]
f2cb = breaker [label: "CB-395", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-736", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1091", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1453", rating: "SALES FLOOR LIGHTING / 37 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
