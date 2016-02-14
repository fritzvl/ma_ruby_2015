require 'twitter_hashtag/help'
require 'twitter_hashtag/request'
require 'twitter_hashtag/formatter'

module TwitterHashtag
  class CLI

    def initialize(hashtag, args)
      @hashtag = hashtag
      @args = args
    end

    attr_reader :hashtag, :args

    def process
      hashtag == 'help' ? render_help : search
    end

    private

    def search
      format TwitterHashtag::Request.new(self).issue
    end

    def format(response)
      TwitterHashtag::Formatter.new(response).format
    end

    def render_help
      TwitterHashtag::Help.output
    end

  end
end