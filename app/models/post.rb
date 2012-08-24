class Post < ActiveRecord::Base
  attr_accessible :content, :date, :title

  has_and_belongs_to_many :tags

  def to_html
    highlight(markdown.render(self.content))
  end

  private

  markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, options)
  options = {
    :autolink => true,
    :no_intra_emphasis => true,
    :fenced_code_blocks => true
  }

  def highlight(html)
    doc.search("//pre[@lang]").each do |pre|
      pre.replace Albino.colorize(pre.text.rstrip, pre[:lang])
    end
    doc.to_s
  end
end
