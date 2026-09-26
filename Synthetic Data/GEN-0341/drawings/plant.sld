sld "GEN-0341 — REEFER YARD / ELECTRICAL DISTRIBUTION"
# CONTAINER YARD SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-466", voltage: "400Y/230V"]
srcA1 = utility [label: "33kV SUPPLY A", voltage: "33kV"]
txA1 = transformer_dy [label: "TX-1695", rating: "170 kVA", voltage: "33kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-310", rating: "ACB / 250 A / 3P"]
mctA1 = ct [label: "TA-788", rating: "3 CTs / 250/5 A"]
mpmA1 = watthour_meter [label: "PM-1097", rating: "kW / kWh"]
srcA2 = utility [label: "33kV STANDBY", voltage: "33kV"]
txA2 = transformer_dy [label: "TX-1691", rating: "1110 kVA", voltage: "33kV / 400Y/230V"]
mcbA2 = breaker [label: "CB-318", rating: "MCCB / 1600 A / 3P"]
mctA2 = ct [label: "TA-785", rating: "3 CTs / 1600/5 A"]
mpmA2 = watthour_meter [label: "PM-1071", rating: "kW / kWh"]
f1cb = breaker [label: "CB-338", rating: "MCCB / 100 A / 3P"]
f1ct = ct [label: "TA-766", rating: "3 CTs / 100/5 A"]
f1pm = watthour_meter [label: "PM-1002", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1453", rating: "REEFER RACK PANEL / 139 kW"]
f2cb = breaker [label: "CB-345", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-733", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1010", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-359", rating: "MCCB / 20 A / 3P"]
f2l1m = motor [label: "MTR-1163", rating: "8 kW / EF"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> txA2
txA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
