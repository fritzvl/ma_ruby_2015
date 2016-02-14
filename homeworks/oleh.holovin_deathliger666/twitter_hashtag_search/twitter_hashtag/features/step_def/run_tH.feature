Feature: Run twitter_hashtag

  twitter_hashtag is a command line tool that allows you to
  view tweets that contain the given hashtag.

  Scenario: View tweets that contain the given hashtag
    When I run "twitter_hashtag dog"
    Then the output should contain:
			"""
			#dog
			http://twitter.com
			"""

  Scenario: Pass a hashtag with a pound symbol
    When I run "twitter_hashtag #dog"
    Then the output should contain "#dog"

  Scenario: Pass a hashtag with a rpp (limit) option of 5
    When I run "twitter_hashtag dog --rpp 5"
    Then the output should contain 5 tweets

  Scenario: Pass a hashtag with a rpp (limit) option of 1
    When I run "twitter_hashtag #dog --rpp 1"
    Then the output should contain 1 tweet

  Scenario: Pass a hashtag that returns zero tweets
    When I run "twitter_hashtag thisdoesnotexistnopenosir"
    Then the output should contain "None found."

  Scenario: Run twitter_hashtag help
    When I run "twitter_hashtag help"
    Then the output should contain exactly:
			"""
			Pass a hashtag (with or without #) as an argument to twitter_hashtag.
			Example: twitter_hashtag #dog OR twitter_hashtag dog
			You may pass --rpp to limit the number of returned tweets.
			Enjoy!

			"""

  Scenario: Forget to pass a hashtag
    When I run "twitter_hashtag"
    Then the output should contain "Pass a hashtag"