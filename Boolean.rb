class Boolean < Struct.new(:value)

  def to_s
    value.to_s
  end

  def inspect
    "<<#{self}>>"
  end

  def reducible?
    #puts "NUMBER - REDUCIBLE? val - #{value}"
    false
  end

end
