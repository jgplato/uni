g = 9.81282
delta_m = 0.1

measurements = {
  "Messung 1" => {m_G: [91.4, 100.2],                m_Z: [0.3, 14.9]},
  "Messung 2" => {m_G: [91.4, 100.2, 100.9],         m_Z: [0.3, 14.9]},
  "Messung 3" => {m_G: [91.4, 100.2, 100.9, 100.3],  m_Z: [0.3, 14.9]},
  "Messung 4" => {m_G: [91.4, 100.2],                m_Z: [0.3, 1.8]},
  "Messung 5" => {m_G: [91.4, 100.2],                m_Z: [0.3, 1.8]},
  "Messung 6" => {m_G: [91.4, 100.2],                m_Z: [0.3, 1.1, 1.8]}
}

measurements.each do |name, measurement|
  m_G = measurement[:m_G].inject(:+)
  m_Z = measurement[:m_Z].inject(:+)
  n_G = measurement[:m_G].count
  n_Z = measurement[:m_Z].count

  a = g/(1+m_G/m_Z)
  delta_a = g*delta_m*Math.sqrt(n_Z*(m_Z**2) + n_G*(m_G**2))/(m_G + m_Z)**2

  puts "#{name}: #{a}+-#{delta_a}"
end
