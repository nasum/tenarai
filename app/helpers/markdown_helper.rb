module MarkdownHelper
  def markdown(text)
    unless @markdown
      renderer = Redcarpet::Render::HTML.new(hard_wrap: true, filter_html: true)
      @markdown = Redcarpet::Markdown.new(renderer,  tables: true, autolink: true)
    end

    @markdown.render(text).html_safe
  end
end
