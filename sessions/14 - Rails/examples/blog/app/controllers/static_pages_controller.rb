class StaticPagesController < ApplicationController
  def contacts
  end

  def some_long_task_strait
    puts 'Hello! Startiong your file processing'

    10.times do |i|
      puts "-= #{10-i} =-"
      sleep 1
    end

    'yay! Finished file processing'

    redirect_to result_path(time: 'after waiting')
  end

  def some_long_task_sidekiq
    TestJob.perform_later

    redirect_to result_path(time: 'immediately')
  end


  def result

  end
end
