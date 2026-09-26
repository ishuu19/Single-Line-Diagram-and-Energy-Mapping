sld "GEN-0990 — REEFER YARD / ELECTRICAL DISTRIBUTION"
# CONTAINER YARD SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-459", voltage: "400Y/230V"]
srcA1 = utility [label: "22kV SUPPLY A", voltage: "22kV"]
txA1 = transformer_yd [label: "TX-1621", rating: "280 kVA", voltage: "22kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-387", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-729", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1061", rating: "kW / kWh"]
f1cb = breaker [label: "CB-396", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-705", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1024", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1495", rating: "YARD LIGHTING / 30 kW"]
f2cb = breaker [label: "CB-356", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-726", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1080", rating: "kW / kWh"]
f2l1cb = breaker [label: "CB-364", rating: "MCCB / 20 A / 3P"]
f2l1m = motor [label: "MTR-1162", rating: "9 kW / EF"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1cb
f2l1cb -> f2l1m
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
