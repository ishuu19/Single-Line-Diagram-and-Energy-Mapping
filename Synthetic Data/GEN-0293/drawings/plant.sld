sld "GEN-0293 — PRIMARY SUBSTATION / DISTRIBUTION FEEDER BAY"
# SINGLE-LINE DIAGRAM / POWER AND PROTECTION
# 13.8kV, 3PH, 4W, 60 Hz

busA = bus [label: "BUS-459", voltage: "13.8kV"]
srcA1 = utility [label: "138kV SUPPLY A", voltage: "138kV"]
txA1 = transformer_yd [label: "TX-1614", rating: "38240 kVA", voltage: "138kV / 13.8kV"]
mcbA1 = breaker [label: "CB-325", rating: "ACB / 1600 A / 3P"]
mctA1 = ct [label: "TA-793", rating: "3 CTs / 1600/5 A"]
mpmA1 = watthour_meter [label: "PM-1047", rating: "kW / kWh"]
srcA2 = utility [label: "138kV STANDBY", voltage: "138kV"]
txA2 = transformer_dy [label: "TX-1687", rating: "38240 kVA", voltage: "138kV / 13.8kV"]
mcbA2 = breaker [label: "CB-376", rating: "ACB / 1600 A / 3P"]
mctA2 = ct [label: "TA-717", rating: "3 CTs / 1600/5 A"]
mpmA2 = watthour_meter [label: "PM-1005", rating: "kW / kWh"]
f1cb = breaker [label: "CB-338", rating: "MCCB / 160 A / 3P"]
f1ct = ct [label: "TA-754", rating: "3 CTs / 160/5 A"]
f1pm = watthour_meter [label: "PM-1054", rating: "kW / kWh"]
f1pr = fuse [label: "CB-345", rating: "160 A"]
f1l1ld = load [label: "PNL-1482", rating: "STATION SERVICE / 142 kW"]

srcA1 -> txA1
txA1 -> mcbA1
mcbA1 -> mctA1
mctA1 -> busA
srcA2 -> txA2
txA2 -> mcbA2
mcbA2 -> mctA2
mctA2 -> busA
busA -> f1cb [cable: "3#1/0 AWG"]
f1cb -> f1ct
f1ct -> f1pr
f1pr -> f1l1ld
mctA1 -> mpmA1
mctA2 -> mpmA2
f1ct -> f1pm
