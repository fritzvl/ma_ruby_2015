class Embroidery
  attr_accessor :thread_color

  def embroider
    draw_scheme
    thread_needle
    finish_embroider
  end

  def draw_scheme
    p 'Draw scheme with a pencil.'
  end

  def thread_needle
    p "Stretching one #{thread_color} thread the needle."
  end

  def finish_embroider
    p 'Embroider the picture.'
  end
end

# woman = Embroidery.new
# woman.thread_color = 'blue'
# woman.embroider
