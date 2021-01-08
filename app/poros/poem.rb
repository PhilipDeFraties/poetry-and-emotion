class Poem
  attr_reader :title,
              :author,
              :tones
  def initialize(poem_attrs, analysis)
    @title = poem_attrs[:title]
    @author = poem_attrs[:author]
    @tones = tones_array(analysis)
  end

  def tones_array(analysis)
    analysis[:document_tone][:tones].map do |tone|
      tone[:tone_name]
    end
  end
end
