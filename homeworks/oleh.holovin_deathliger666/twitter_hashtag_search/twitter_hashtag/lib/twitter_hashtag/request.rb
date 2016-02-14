require 'net/http'
require 'cgi'
require 'json'

module TwitterHashtag
  class Request

    SEARCH_URI = 'search.twitter.com'

    def initialize(cli)
      @cli = cli
    end

    attr_reader :cli

    def issue
      JSON.parse Net::HTTP.get(SEARCH_URI, path)
    end

    private

    def path
      "/search.json?#{params}"
    end

    def params
      to_url_params default_params.merge(clean_args_hash)
    end

    def default_params
      {'q' => formatted_hashtag, 'rpp' => 100}
    end

    def clean_args_hash
      Hash[*cli.args.map {|a| a.delete('--')}]
    end

    def formatted_hashtag
      CGI.escape '#'.concat(cli.hashtag.delete('#'))
    end

    def to_url_params(params_hash)
      params_hash.to_a.map {|key, value|
        "#{key}=#{value}"
      }.join('&')
    end
  end
end