require 'faker'

module PagesHelper
  def active(cntrl_name)
    if cntrl_name == controller.action_name then
      return 'active'
    end
  end

  def latin_sentence(word_cnt)
    return Faker::Lorem.words(word_cnt).join(' ').capitalize + '.'
  end

  def latin_paragraph(sentence_cnt)
    return Faker::Lorem.paragraph(sentence_cnt)
  end
end
