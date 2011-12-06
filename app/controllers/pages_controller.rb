require 'faker'

class PagesController < ApplicationController

  def home
    @latin = Faker::Lorem
    $p_0 = @latin.sentence(4)
    $sub_title_0 = @latin.words(3).join(' ').capitalize + '.' 
    $sub_title_1 = @latin.words(3, true).join(' ').capitalize + '.' 
    $sub_title_2 = @latin.words(3).join(' ').capitalize + '.' 
    $sub_p_0 = @latin.paragraph(3)
    $sub_p_1 = @latin.paragraph(3)
    $sub_p_2 = @latin.paragraph(3)
  end

  def product
  end

  def product_feature_1
  end

  def price
  end

  def blog
  end

  def press
  end

  def company
  end
end
