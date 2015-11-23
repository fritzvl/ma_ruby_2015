class Book
  attr_accessor :number_of_pages, :cover_type, :type_of_printing
end

class BuilderBook
  attr_reader :book

  def create_new_book
    @book = Book.new
  end

  def get_book
    "Your piece of art, please. Number of pages: #{@book.number_of_pages}, cover type: #{@book.cover_type}, type of printing: #{@book.type_of_printing}."
  end
end

module NewModule
    def goodbye
        "It was a pleasure to cooperate with you!"
    end
end

class BuilderBudgetBook < BuilderBook
  def build_number_of_pages
    @book.number_of_pages = 144
  end

  def build_cover_type
    @book.cover_type = 'paperback'
  end

  def build_type_of_printing
    @book.type_of_printing = 'black and white'
  end

  include NewModule

end

class BuilderExpensiveBook < BuilderBook
  def build_number_of_pages
    @book.number_of_pages = 288
  end

  def build_cover_type
    @book.cover_type = 'hard cover'
  end

  def build_type_of_printing
    @book.type_of_printing = 'color'
  end
end

class Constructor
  def set_builder_book(bb)
    @builder_book = bb
  end

  def get_book
    @builder_book.get_book
  end

  def creating_book
    @builder_book.create_new_book
    @builder_book.build_number_of_pages
    @builder_book.build_cover_type
    @builder_book.build_type_of_printing
  end
end

builder_budget_book = BuilderBudgetBook.new
builder_expencive_book  = BuilderExpensiveBook.new

constructor1 = Constructor.new

constructor1.instance_eval do
    puts "You are welcome, dear customer!"
end

constructor1.set_builder_book(builder_expencive_book)
constructor1.creating_book
puts constructor1.get_book

puts

constructor2 = Constructor.new

constructor2.set_builder_book(builder_budget_book)
constructor2.creating_book
puts constructor2.get_book
puts builder_budget_book.goodbye
