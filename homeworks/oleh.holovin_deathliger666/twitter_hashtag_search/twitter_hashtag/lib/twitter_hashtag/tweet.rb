module TwitterHashtag
  class Tweet

    SEPARATOR = '~'*80

    def self.output(results)
      results.each do |result_line|
        new(result_line).output
      end
    end

    def initialize(tweet_hash)
      @tweet_hash = tweet_hash
    end

    attr_reader :tweet_hash

    def output
      puts [SEPARATOR, user, text, link].join("\n")
    end

    private

    def user
      tweet_hash['from_user']
    end

    def text
      tweet_hash['text']
    end

    def id
      tweet_hash['id_str']
    end

    def link
      "http://twitter.com/#{user}/status/#{id}"
    end

  end
end