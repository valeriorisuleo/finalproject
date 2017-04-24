class ContentSerializer < ActiveModel::Serializer
  attributes :id, :body, :html_body, :language, :title
  belongs_to :post
  belongs_to :user

  Parser = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)

  def html_body
    # body converted into HTML
    object.body.nil? ? nil : Parser.render(object.body)
  end
end
