class Contestant
  attr_reader :name, :color

  def initialize(name)
    @name = name
    @color = "black"
  end

  def to_s
    @name
  end

  def to_s_with_color
    @name.capitalize.send(@color)
  end

  def add_color(color)
    @color = color
  end

end
