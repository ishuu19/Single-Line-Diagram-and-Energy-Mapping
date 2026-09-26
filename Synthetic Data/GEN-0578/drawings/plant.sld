sld "GEN-0578 — PRIMARY SUBSTATION / DISTRIBUTION FEEDER BAY"
# SINGLE-LINE DIAGRAM / POWER AND PROTECTION
# 13.8kV, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-494", voltage: "13.8kV"]
srcA1 = utility [label: "138kV SUPPLY A", voltage: "138kV"]
txA1 = transformer_yd [label: "TX-1677", rating: "15060 kVA", voltage: "138kV / 13.8kV"]
mcbA1 = breaker [label: "CB-338", rating: "MCCB / 630 A / 3P"]
mctA1 = ct [label: "TA-718", rating: "3 CTs / 630/5 A"]
mpmA1 = watthour_meter [label: "PM-1040", rating: "kW / kWh"]
srcA2 = utility [label: "138kV STANDBY", voltage: "138kV"]
txA2 = transformer_yd [label: "TX-1653", rating: "9560 kVA", voltage: "138kV / 13.8kV"]
mcbA2 = breaker [label: "CB-329", rating: "ACB / 400 A / 3P"]
mctA2 = ct [label: "TA-764", rating: "3 CTs / 400/5 A"]
mpmA2 = watthour_meter [label: "PM-1066", rating: "kW / kWh"]
f1cb = breaker [label: "CB-311", rating: "MCCB / 63 A / 3P"]
f1ct = ct [label: "TA-777", rating: "3 CTs / 63/5 A"]
f1pm = watthour_meter [label: "PM-1041", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1491", rating: "STATION SERVICE / 73 kW"]
f2cb = breaker [label: "CB-326", rating: "MCCB / 160 A / 3P"]
f2ct = ct [label: "TA-791", rating: "3 CTs / 160/5 A"]
f2pm = watthour_meter [label: "PM-1061", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1437", rating: "STATION SERVICE / 144 kW"]
f3cb = breaker [label: "CB-395", rating: "MCCB / 100 A / 3P"]
f3ct = ct [label: "TA-774", rating: "3 CTs / 100/5 A"]
f3pm = watthour_meter [label: "PM-1034", rating: "kW / kWh"]
f3l1ld = load [label: "PNL-1490", rating: "STATION SERVICE / 116 kW"]

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
f2ct -> f2l1ld
busA -> f3cb [cable: "3#4 AWG"]
f3cb -> f3ct
f3ct -> f3l1ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
f2ct -> f2pm
f3ct -> f3pm
