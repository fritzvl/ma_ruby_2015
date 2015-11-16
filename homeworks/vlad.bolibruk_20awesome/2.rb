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
    @input.freeze
    @input.jump('QUEU_ADDRESS')
    @input.answer
  end
end

# Client
callcenter_facade = CallcenterFacade.new
callcenter_facade.start
