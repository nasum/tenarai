class ArticleDecorator < Draper::Decorator
  delegate_all

  def title_line
    h.content_tag :span, class: 'title' do
      model.content.lines[0]
    end
  end

end
