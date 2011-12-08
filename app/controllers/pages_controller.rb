require 'faker'

class PagesController < ApplicationController

  def home
    @title = 'Home'
    @latin = Faker::Lorem
    @p_0 = @latin.sentence(4)
    @sub_title_0 = @latin.words(3).join(' ').capitalize + '.' 
    @sub_title_1 = @latin.words(3, true).join(' ').capitalize + '.' 
    @sub_title_2 = @latin.words(3).join(' ').capitalize + '.' 
    @sub_p_0 = @latin.paragraph(3)
    @sub_p_1 = @latin.paragraph(3)
    @sub_p_2 = @latin.paragraph(3)
  end

  def product
		@title = 'Product'
  end

  def price
		@title = 'Price'
  end

  def blog
		@title = 'Blog'
  end

  def press
		@title = 'Press'
  end

  def company
		@title = 'Company'
  end
end
