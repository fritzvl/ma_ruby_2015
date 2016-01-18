load './classes.rb'

u = User.new('some', 'user')
p = Post.new 'Some great text.', u

ap '============================================='
ap '\'Post\' class:'
ap p.body
ap "By #{p.author.name}"
ap "It's class is: '#{p.class}'"
ap '============================================='

serialized = Marshal.dump p

p ''

ap '============================================='
ap 'Serialized:'
ap serialized
ap "It's class is: '#{serialized.class}'"
ap '============================================='

File.open('./marshal_dump', 'w') { |file| Marshal.dump(p, file) }
