#У нас есть мастерская которая собирает компы под заказ. Выдилим главные его части: Материнская плата, видеокарта, блок питания, кулеры, жёсткий диск, разные провода для соединения, процессор.
require "builder"
class CreateComputer

  attr_accessor :hdd, :powerBlock, :motherBoard, :videoCard, :processor, :cabels, :coolers 

end

# Builder - класс строитель.Создаем класс BuilderComputer который имеет всё выше перечисленное.

class BuilderComputer

  attr_reader :computer

  def create_new_computer
    @computer = CreateComputer.new
  end

  def get_computer
    "Your ECM. HDD: #{@computer.hdd}, Power supply: #{@computer.powerBlock}, Video card: #{@computer.videoCard}, Processor: #{@computer.processor},Type of cabels: #{@computer.cabels},Coolers: #{@computer.coolers},Motherboard: #{@computer.motherBoard}"
  end
end

# Builder of computer for work(#1)
#Пусть материнка будет от Zalman бюджетной модели, видеокарта АМД, самые дешёвые кулера и блок питания, HDD Toshiba, провода, интел atom.
class WorkComputer < BuilderComputer
  def build_hdd
    @computer.hdd = 'Toshiba 250Gb'
  end

  def build_powerBlock
    @computer.powerBlock = 'FSP Qdion'
  end

def build_videoCard
    @computer.videoCard = 'AMD Vision'
  end
def build_processor
    @computer.processor = 'Intel Atom'
  end
def build_cabels
    @computer.cabels = 'Not strong to electrical jump over 230V'
  end
def build_coolers
    @computer.coolers = 'Zalman ZM-F3 (SF) '
  end
def build_motherBoard
    @computer.motherBoard = 'ASRock AM1B-M '
  end
end


# Builder for game Computer
# делаем всё тоже что и для робочего компа, но запчасти по мощнее и по дороже)
class GameComputer < BuilderComputer
  def build_hdd
    @computer.hdd = 'Western Digital 1Tb'
  end

  def build_motherBoard
    @computer.motherBoard = 'Asus Rampage V Extreme'
  end

def build_videoCard
    @computer.videoCard = 'Asus PCI-Ex GeForce GTX TITAN X'
  end
def build_processor
    @computer.processor = 'Intel Core i7'
  end
def build_cabels
    @computer.cabels = 'Strong to electrical jump over 250V+-5V'
  end
def build_coolers
    @computer.coolers = 'Thermaltake Water 3.0 Ultimate'
  end
def build_powerBlock
    @computer.powerBlock = 'Seasonic P-1200 Platinum '
  end

end



class Worker
  def set_builder_computer(bc)
    @builder_computer = bc
  end

  def get_computer
    @builder_computer.get_computer
  end

  def construct_computer
    @builder_computer.create_new_computer
    @builder_computer.build_hdd
    @builder_computer.build_motherBoard
    @builder_computer.build_processor
    @builder_computer.build_powerBlock
    @builder_computer.build_coolers
    @builder_computer.build_videoCard
    @builder_computer.build_cabels
  end
end

worker = Worker.new

builder_work_computer  = WorkComputer.new
worker.set_builder_computer(builder_work_computer)
worker.construct_computer

puts worker.get_computer
