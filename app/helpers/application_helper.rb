module ApplicationHelper
  def markdown(text)
    options = {
      :no_intra_emphasis => true,
      :fenced_code_blocks => true,
      :autolink => true
    }
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML.new(:filter_html => true, :hard_wrap => true), options)
    syntax_highlighter(markdown.render(text)).html_safe
  end

  def syntax_highlighter(html)
    doc = Nokogiri::HTML(html)
    doc.search("//pre[@lang]").each do |pre|
      pre.replace Albino.colorize(pre.text.rstrip, pre[:lang])
    end
    doc.to_s
  end
end
