# Generates all plots
template = File.open("./templates/exp.gnuplot", "r"){|fh| fh.read}

files = Dir["./data/*.csv"]
nums = []

files.sort! do |a,b|
  def h(str)
    File.basename(str, ".csv").gsub(/^clean-/,"").to_i
  end
  h(a) <=> h(b)
end

files.each do |filename|
  num = File.basename(filename, ".csv").gsub(/^clean-/,"")
  out = template.gsub("__NUM__", num)
  File.open("./plot/plot-#{num}-exp.gnuplot", "w"){|fh| fh.write(out)}
  %x{gnuplot ./plot/plot-#{num}-exp.gnuplot}
  nums << num
end

# Generate file listing all plots
File.open("plots-exp.tex", "w") do |fh|
  nums.each do |num|
    fh.write("\\newpage
\\label{plot:#{num}-exp}
\\begin{landscape}
  % gnuplot ./plot/plot-#{num}-exp.gnuplot
  \\input{plot-#{num}-exp.tex}
\\end{landscape}\n\n")
  end
end

