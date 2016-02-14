require 'twitter_hashtag/tweet'

module TwitterHashtag
  class Formatter

    def initialize(response)
      @results = response['results']
    end

    attr_reader :results

    def format
      if results.empty?
        puts 'None found.'
        exit 1
      else
        puts 'Results:'
        TwitterHashtag::Tweet.output(results)
      end
    end

  end
end