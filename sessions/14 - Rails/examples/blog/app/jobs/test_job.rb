class TestJob < ActiveJob::Base
  queue_as :default

  def perform
    puts 'Hello! Startiong your file processing'

    10.times do |i|
      puts "-= #{10-i} =-"
      sleep 1
    end

    'yay! Finished file processing'
  end
end
