sld "GEN-0333 — REEFER YARD / ELECTRICAL DISTRIBUTION"
# CONTAINER YARD SINGLE-LINE DIAGRAM
# 400Y/230V, 3PH, 4W, 50 Hz

busA = bus [label: "BUS-445", voltage: "400Y/230V"]
srcA1 = utility [label: "11kV SUPPLY A", voltage: "11kV"]
txA1 = transformer_yd [label: "TX-1647", rating: "280 kVA", voltage: "11kV / 400Y/230V"]
mcbA1 = breaker [label: "CB-340", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-736", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1087", rating: "kW / kWh"]
f1cb = breaker [label: "CB-356", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-788", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1054", rating: "kW / kWh"]
f1l1cb = breaker [label: "CB-312", rating: "MCCB / 20 A / 3P"]
f1l1m = motor [label: "MTR-1177", rating: "9 kW / EF"]
f2cb = breaker [label: "CB-343", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-787", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1022", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1453", rating: "REEFER RACK PANEL / 130 kW"]
f3cb = breaker [label: "CB-330", rating: "MCCB / 63 A / 3P"]
f3ct = ct [label: "TA-719", rating: "3 CTs / 63/5 A"]
f3pm = watthour_meter [label: "PM-1093", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1464", rating: "REEFER RACK PANEL / 69 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#4 AWG"]
f1cb -> f1ct
f1ct -> f1l1cb
f1l1cb -> f1l1m
busA -> f2cb [cable: "3#1/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
