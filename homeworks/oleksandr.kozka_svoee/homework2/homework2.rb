#Наче все зробив правильно, але шось не працюе вiн коректно. 

class Camera
  attr_accessor :body_size, :sensor_size, :processor_type, :lens
end

class CameraBuilder
  attr_reader :camera

  def build_new_camera
    @camera = Camera.new
  end

  def get_camera
      puts "camera build:"
      puts "body - #{body_size}"
      puts "sensor - #{sensor_size}"
      puts "processor - #{processor_type}"
      puts "lens - #{lens}"
  end
end

class FullFrameCameraBuilder < CameraBuilder
  def camera_body_size
    @camera.body_size = 'big'
  end

  def camera_sensor_size
    @camera.sensor_size = 'fullframe'
  end

  def camera_processor_type
    @camera.processor_type = '1'
  end

  def camera_lens
    @camera.lens = '18-105mm lens'
  end
end

class CropFrameCameraBuilder < CameraBuilder
  def camera_body_size
    @camera.body_size = 'small'
  end

  def camera_sensor_size
    @camera.sensor_size = 'cropframe'
  end

  def camera_processor_type
    @camera.processor_type = '2'
  end

  def camera_lens
    @camera.lens = '18-55mm lens'
  end
end

class Manufacturer
  def set_camera_builder(cb)
    @camera_builder = cb
  end

  def get_camera
    @camera_builder.get_camera
  end

  def build_camera
    @camera_builder.build_new_camera
    @camera_builder.camera_body_size
    @camera_builder.camera_sensor_size
    @camera_builder.camera_processor_type
    @camera_builder.camera_lens
  end
end

manufacturer = Manufacturer.new

builder_fullframe_camera = FullFrameCameraBuilder.new
builder_cropframe_camera = CropFrameCameraBuilder.new

manufacturer.set_camera_builder(builder_cropframe_camera)
manufacturer.build_camera

puts manufacturer.get_camera
