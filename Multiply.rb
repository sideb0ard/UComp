class Multiply < Struct.new(:left, :right)

  def to_s
    "#{left} * #{right}"
  end

  def inspect
    "<<#{self}>>"
  end

  def reducible?
    #puts "MULT REDUCIBLE? val = #{left} and #{right}"
    true
  end

  def reduce
    if left.reducible?
      #puts "LEFT MULT REDUCIBLE"
      Multiply.new(left.reduce(environment), right)
    elsif right.reducible?
      #puts "RIGHT MULT REDUCIBLE"
      Multiply.new(left, right.reduce(environment))
    else
      #puts "MULT NUMBER"
      Number.new(left.value * right.value)
    end
  end

end
