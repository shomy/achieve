module MarkdownHelper
  def markdown(text)
    unless @markdown
      renderer = Redcarpet::Render::HTML.new(hard_wrap: true,autolink: true)
      @markdown = Redcarpet::Markdown.new(renderer, autolink: true,fenced_code_blocks: true)
    end

    @markdown.render(text).html_safe
  end
end 