load './classes.rb'

File.open('marshal_dump') {|file| @structured = Marshal.load file}

p ''

ap '============================================='
ap 'Structured:'
ap @structured.body
ap "By #{@structured.author.name}"
ap "It's class is: '#{@structured.class}'"
ap '============================================='
