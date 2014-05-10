require "rubygems"
require "byebug"

%w(messung7 messung8).each do |file|
  content = File.open("./data/#{file}.txt"){|fh| fh.read}
  data = content.split("\n").map do |line|
    # Skip to data
    next unless line =~ /^[0-9],/

    # Read values as floats
    t, x, v = line.split(/ +/).map{|val| val.sub(",",".").to_f}

    [t, x, v]
  end

  # Numerical differentiation: Replace values of v with new values
  data.each_with_index do |index, (t, x, v)|
    byebug
    if v
      delta_t = data[index][0] - data[index-1][0]
      delta_x = data[index][1] - data[index-1][1]
      v = (delta_x/delta_t)

      data[index][2] = v
    end
  end

  # Output t vs v data for gnuplot
  File.open("./data/#{file}.dat", "w") do |fh|
    data.each do |(t, x, v)|
      fh.write("#{t}\t#{v}\n") if v
    end
  end
end
