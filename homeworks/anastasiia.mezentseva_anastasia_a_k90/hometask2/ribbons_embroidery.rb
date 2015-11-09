require "./embroidery.rb"

class RibbonsEmbroidery < Embroidery

  def thread_needle
    p "Stretching one #{thread_color} ribbon the needle."
  end

end

# woman = RibbonsEmbroidery.new
# woman.thread_color = 'yellow'
# woman.embroider
