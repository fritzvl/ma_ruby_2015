require 'bundler/setup'
Bundler.require(:default)

require 'sinatra'

class CustomRackApp
  def call(env)
    [200, {"Content-Type" => "text/html"}, ["Rack low-level application"]]
  end
end

#
class RootRackApp
  def call(env)
    [200, {"Content-Type" => "text/html"}, ["Welcome to root"]]
  end
end
#

class ExampleRackApp
  def call(env)
    [200, {"Content-Type" => "text/html"},
     [
       '
       <html>
         <head>
           <title>Example Domain</title>

           <meta charset="utf-8">
           <meta http-equiv="Content-type" content="text/html; charset=utf-8">
           <meta name="viewport" content="width=device-width, initial-scale=1">
           <style type="text/css">
             body {
               background-color: #f0f0f2;
               margin: 0;
               padding: 0;
               font-family: "Open Sans", "Helvetica Neue", Helvetica, Arial, sans-serif;

             }
             div {
               width: 600px;
               margin: 5em auto;
               padding: 50px;
               background-color: #fff;
               border-radius: 1em;
             }
             a:link, a:visited {
               color: #38488f;
               text-decoration: none;
             }
             @media (max-width: 700px) {
               body {
                   background-color: #fff;
               }
               div {
                  width: auto;
                  margin: 0 auto;
                  border-radius: 0;
                  padding: 1em;
               }
             }
           </style>
         </head>

         <body>
           <div>
            <h1>Example Domain</h1>
            <p>This domain is established to be used for illustrative examples in documents. You may use this
            domain in examples without prior coordination or asking for permission.</p>
            <p><a href="http://www.iana.org/domains/example">More information...</a></p>
           </div>

          </body>
        </html>
      '
    ]]
  end
end

class ExampleSingleLineRackApp
  def call(env)
    [200, {"Content-Type" => "text/html"}, ['<html><head><title>Example Domain</title><meta charset="utf-8"><meta http-equiv="Content-type" content="text/html; charset=utf-8"><meta name="viewport" content="width=device-width, initial-scale=1"><style type="text/css">body {background-color: #f0f0f2;margin: 0;padding: 0;font-family: "Open Sans", "Helvetica Neue", Helvetica, Arial, sans-serif;}div {width: 600px;margin: 5em auto;padding: 50px;background-color: #fff;border-radius: 1em;}a:link, a:visited {color: #38488f;text-decoration: none;}@media (max-width: 700px) {body {background-color: #fff;}div {width: auto;margin: 0 auto;border-radius: 0;padding: 1em;}}</style></head><body><div><h1>Example Domain Single Line</h1><p>This domain is established to be used for illustrative examples in documents. You may use this domain in examples without prior coordination or asking for permission.</p><p><a href="http://www.iana.org/domains/example">More information...</a></p></div></body></html>']]
  end
end



class MyMiddleware
  def initialize(appl)
    @appl = appl
  end

  def call(env)

    start = Time.now
    status, headers, body = @appl.call(env) # call our Rack or Sinatra app
    stop = Time.now

    middleware_addition="<br /><br /><br />Test string added by middleware | Response Time: #{stop-start}"
    headers["Content-Length"]=(body[0].length+middleware_addition.length).to_s

    [status, headers, body<<middleware_addition ]
  end
end


#
get '/' do
  "Hello World from Sinatra!"
end
#

get '/time' do
  "Current time is: #{Time.now}"
end