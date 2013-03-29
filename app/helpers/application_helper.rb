module ApplicationHelper

  def build_meta_tags(description: "lorem ipsum", title: nil, image: path_to_image("opengraph.jpg"), page_type: :website)
    set_meta_tags :title => title,
                  :description => description,
                  :open_graph => {
      :title => "#{title} | #{ENV['title']}",
      :description => description,
      :type => page_type,
      :url => url_for(:only_path => false),
      :image => image
    } 
  end

end
