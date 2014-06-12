require "rubygems"
require "byebug"

g = 9.8182 # FIXME
r = 0.2874 # Aus Zoll

# m1...m5
M = [
  0.1130,
  0.2738,
  0.5410,
  0.7485,
  0.9867
]

def mass(number_of_exp)
  case number_of_exp
  when (1..6), (30..36)
    M[1]
  when (7..12), (37..42)
    M[2]
  when (13..18), (43..48)
    M[3]
  when (19..24), (49..54)
    M[4]
  when (25..30), (55..60)
    M[5]
  else
    raise "Unknown"
  end
end

# Read csv
data = File.open("./exp-fitting.csv", "r") do |fh|
  fh.read
end.split("\n").map do
  |line| line.split(";")
end.map do |num,a,a_err,b,b_err,c,c_err|
  [num.to_i, a.to_f, a_err.to_f, b.to_f, b_err.to_f, c.to_f, c_err.to_f]
end

data.each do |num,a,a_err,b,b_err,c,c_err|
# Compute I
  m = mass(num)
  i = m*r*(g/(b*c) - r)
  mu = m*g*r/c
  puts "#{num} I = #{i}"
  #puts "#{num} mu = #{mu}"
end

