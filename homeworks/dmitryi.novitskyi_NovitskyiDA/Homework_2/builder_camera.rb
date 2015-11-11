class Camera
	attr_accessor :megapixels, :monitor_size, :type, :memory, :video_recording, :case
end

class BuilderCamera
	attr_reader :camera

	def create_new_camera
		@camera = Camera.new
	end

	def get_camera
		puts "Take your camera!!!"
		puts "Megapixels: #{@camera.megapixels}"
		puts "Monitor size: #{@camera.monitor_size} in diagonal"
		puts "Type: #{@camera.type}"
		puts "Memory: #{@camera.memory} GB"
		puts "Video recording: #{@camera.video_recording}"
		puts "Case: #{@camera.case}"
	end
end

class BuilderNewCamera1 < BuilderCamera
	def build_megapixels
		@camera.megapixels = 13
	end

	def build_monitor_size
		@camera.monitor_size = 3.0
	end

	def build_type
		@camera.type = 'digital'
	end

	def build_memory
		@camera.memory = 16
	end

	def build_video_recording
		@camera.video_recording = true
	end

	def build_case
		@camera.case = 'waterproof'
	end
end

class BuilderNewCamera2 < BuilderCamera
	def build_megapixels
		@camera.megapixels = 21
	end

	def build_monitor_size
		@camera.monitor_size = 4.75
	end

	def build_type
		@camera.type = 'SLR'
	end

	def build_memory
		@camera.memory = 32
	end

	def build_video_recording
		@camera.video_recording = false
	end

	def build_case
		@camera.case = 'shock-proof'
	end
end

class Seller
	def describe_builder_camera(bc)
		@builder_camera = bc
	end

	def get_camera
		@builder_camera.get_camera
	end

	def create_camera
		@builder_camera.create_new_camera
		@builder_camera.build_megapixels
		@builder_camera.build_monitor_size
		@builder_camera.build_type
		@builder_camera.build_memory
		@builder_camera.build_video_recording
		@builder_camera.build_case
	end
end

seller = Seller.new

builder_new_camera1 = BuilderNewCamera1.new
builder_new_camera2 = BuilderNewCamera2.new

seller.describe_builder_camera(builder_new_camera1)
seller.create_camera

puts seller.get_camera


seller.describe_builder_camera(builder_new_camera2)
seller.create_camera

puts seller.get_camera
