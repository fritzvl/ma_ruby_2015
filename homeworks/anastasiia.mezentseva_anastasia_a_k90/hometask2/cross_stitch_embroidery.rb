require "./embroidery.rb"

class CrossStitchEmbroidery < Embroidery

  def draw_scheme
    p 'Draw scheme with a size 10x10 threads.'
  end

  def thread_needle
    p "Stretching two #{thread_color} threads the needle."
  end

end

woman = CrossStitchEmbroidery.new
woman.thread_color = 'pink'
woman.embroider
