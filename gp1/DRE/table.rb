require "rubygems"
require "byebug"

g = 9.8182 # FIXME
r = 0.0400
r_err = 0.0001

# m1...m5
M = [
  [0.1130, 0.0001],
  [0.2738, 0.00023],
  [0.5410, 0.0001],
  [0.7485, 0.00023],
  [0.9867, 0.00023]
]

def mass(number_of_exp)
  case number_of_exp
  when (1..6)
    M[0]
  when (7..12)
    M[1]
  when (13..18)
    M[2]
  when (19..24)
    M[3]
  when (25..30)
    M[4]
  when (30..36)
    M[4]
  when (37..42)
    M[3]
  when (43..48)
    M[2]
  when (49..54)
    M[1]
  when (55..60)
    M[0]
  else
    raise "Unknown"
  end
end

# Read csv
data = File.open("./exp-fitting.csv", "r") do |fh|
  fh.read
end.split("\n").map do
  |line| line.split(";")
end.map do |num,k,k_err,w,w_err|
  [num.to_i, k.to_f, k_err.to_f, w.to_f, w_err.to_f]
end

def round2(val,err)
  err = ("%.2g" % err).to_f # Round error to two significant places
  d = (Math.log(err)/Math.log(10)) # Get number of digits
  d = d > 0 ? d.ceil : d.floor
  val = val.round(-d) # Round value to same number of digits
  # Works in most cases, should be formatted
  [val,err]
end

def f(val, err)
  val, err = round2(val,err)
  "$\\num{#{val}+-#{err}}$"
end
is1 = []
i_errs1 = []
is2 = []
i_errs2 = []
File.open("./results.tex", "w") do |fh|
  fh.write "\\begin{tabular}{l|r|r|r|r}\n"
  fh.write "Messung & $A$ & $B$ & $I$ & $\\mu$ \\\\\n"
  data.each do |num,k,k_err,w,w_err|
    m, m_err = mass(num)
    byebug if m.nil?
    mu = m*g*r/w
    i  = m*g*r/(w*k) - m*r**2

    # FIXME
    mu_err = Math.sqrt((m_err*g*r/w)**2 + (r_err*m*g/w)**2 + (w_err*m*g*r/w**2)**2)
    i_err  = Math.sqrt(
      ((g*r/(w*k) - r**2)*m_err)**2 +
      ((m*g/(w*k) - 2*m*r)*r_err)**2 +
      (m*g*r/(w**2*k)*w_err)**2 +
      (m*g*r/(w*k**2)*k_err)**2
    )
    puts "#{num} I = #{i}+-#{i_err}"
    fh.write "#{num} & #{f(k,k_err)} & #{f(w,w_err)} & #{f(i,i_err)} & #{f(mu, mu_err)} \\\\\n"

    if num <= 30
      is1  << i
      i_errs1 << i_err
    elsif num > 30 && num <= 59
      is2 << i
      i_errs2 << i_err
    end
  end
  fh.write "\\end{tabular}\n"
end

def avg(is, i_errs)
  i = is.reduce(&:+)/is.size
  i_err = 1/is.size.to_f*Math.sqrt(i_errs.map{|e| e**2}.reduce(&:+))
  [i,i_err]
end

puts "Avg 1...30:"
puts avg(is1, i_errs1).join("+-")
puts "Avg 1...30:"
puts avg(is2, i_errs2).join("+-")
