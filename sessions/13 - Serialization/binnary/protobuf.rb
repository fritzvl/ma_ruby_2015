#package foo;
#message User {
#  optional string first_name = 1;
#  optional string last_name = 2;
#}

module Foo
  class User < ::Protobuf::Message; end

  class User
    optional :string, :first_name, 1
    optional :string, :last_name, 2
  end
end
