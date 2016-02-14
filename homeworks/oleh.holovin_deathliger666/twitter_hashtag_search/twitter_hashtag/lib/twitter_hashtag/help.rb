module TwitterHashtag
  class Help

    def self.output
      puts <<-STR
Pass a hashtag (with or without #) as an argument to twitter_hashtag.
Example: twitter_hashtag #dog OR twitter_hashtag dog
You may pass --rpp to limit the number of returned tweets.
Enjoy!
      STR
    end

  end
end