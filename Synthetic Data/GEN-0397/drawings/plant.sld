sld "GEN-0397 — PRIMARY SUBSTATION / DISTRIBUTION FEEDER BAY"
# SINGLE-LINE DIAGRAM / POWER AND PROTECTION
# 13.8kV, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-491", voltage: "13.8kV"]
srcA1 = utility [label: "138kV SUPPLY A", voltage: "138kV"]
txA1 = transformer_yd [label: "TX-1635", rating: "9560 kVA", voltage: "138kV / 13.8kV"]
mcbA1 = breaker [label: "CB-371", rating: "ACB / 400 A / 3P"]
mctA1 = ct [label: "TA-768", rating: "3 CTs / 400/5 A"]
mpmA1 = watthour_meter [label: "PM-1058", rating: "kW / kWh"]
f1cb = breaker [label: "CB-379", rating: "MCCB / 250 A / 3P"]
f1ct = ct [label: "TA-759", rating: "3 CTs / 250/5 A"]
f1pm = watthour_meter [label: "PM-1065", rating: "kW / kWh"]
f1l1ld = load [label: "PNL-1441", rating: "DISTRIBUTION FEEDER / 482 kW"]
f2cb = breaker [label: "CB-315", rating: "MCCB / 250 A / 3P"]
f2ct = ct [label: "TA-700", rating: "3 CTs / 250/5 A"]
f2pm = watthour_meter [label: "PM-1050", rating: "kW / kWh"]
f2l1ld = load [label: "PNL-1448", rating: "DISTRIBUTION FEEDER / 495 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
busA -> f1cb [cable: "3#2/0 AWG"]
f1cb -> f1ct
f1ct -> f1l1ld
busA -> f2cb [cable: "3#2/0 AWG"]
f2cb -> f2ct
f2ct -> f2l1ld
mctA1 -> mpmA1
f1ct -> f1pm
f2ct -> f2pm
