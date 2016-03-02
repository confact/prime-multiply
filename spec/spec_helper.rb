require './calculate_prime'
# borrowed from terminal-table
class String
  def deindent
    strip.gsub(/^ */, '')
  end
end
