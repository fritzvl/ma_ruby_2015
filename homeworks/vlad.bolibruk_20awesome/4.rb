#module
module PlaySound

  def play_sound
    "some_sound"
  end

end


# Complex Parts
class Router 
  def freeze; end
  def jump(position); end
  def answer; end
end


class Queu
  def load(position, data); end
end


class RecordCall
  def write(number, size); end
  #including module
  include PlaySound
end




#heritage
class QueuCustom < Queu

  def mycreator(name)
    return name
  end

end

#class_eval rewrite for children
Router.class_eval do
  def freeze(time)
      sleep time.to_i
  end

end

# Facade
class CallcenterFacade

  def initialize
    @input = Router.new
    @queu = Queu.new
    @record = RecordCall.new
  end

  def start
    @queu.load('QUEU_ADDRESS', @record.write('QUEU_ADDRESS', 'SECTOR_SIZE'))
    @input.freeze(0.001)
    @input.jump('QUEU_ADDRESS')
    @input.answer
  end
end

# Client
callcenter_facade = CallcenterFacade.new
callcenter_facade.start


#.instance_eval with attr_accessor
callcenter_facade.instance_eval do
    def start
      @input.freeze(time)
    end
    
    class << self
      attr_accessor :time
    end

end
callcenter_facade.time=1
callcenter_facade.start
