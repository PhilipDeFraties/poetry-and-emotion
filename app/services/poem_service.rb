class PoemService

  def poems_with_analysis(author)
    poems = PoemFacade.new.search_by_author(author)
    AnalysisFacade.new.fetch_analyses(poems[0..9])
  end
end
