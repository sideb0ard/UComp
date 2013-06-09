class Add < Struct.new(:left, :right)

  def to_s
    "#{left} + #{right}"
  end

  def inspect
    "<<#{self}>>"
  end

  def reducible?
    #puts "ADD REDUCIBLE? val - #{left} and #{right}"
    true
  end

  def reduce(environment)
    if left.reducible?
      #puts "LEFT ADD REDUCIBLE"
      Add.new(left.reduce(environment), right)
    elsif right.reducible?
      #puts "RIGHT ADD REDUCIBLE"
      Add.new(left, right.reduce(environment))
    else
      #puts "ADD NUMBER"
      Number.new(left.value + right.value)
    end
  end

end
