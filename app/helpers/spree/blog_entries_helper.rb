module Spree
  module BlogEntriesHelper
    def post_link_list
     link = Struct.new(:name,:url)
     BlogEntry.recent.collect { |post| link.new( post.title, blog_entry_permalink(post)) }
    end

    def blog_entry_permalink(e)
      blog_entry_permalink_path slug: e.permalink
    end

    def blog_entry_url_permalink(e)
      blog_entry_permalink_url slug: e.permalink
    end

    def blog_full_article_html(blog_entry)
      "<br><br>Read the full article #{link_to blog_entry.title, blog_entry_url_permalink(blog_entry)} at #{link_to "#{Spree::Store.current.name} Blog", blog_url}."
    end

    def blog_first_appeared_html(blog_entry)
      "<br><br>The article #{link_to blog_entry.title, blog_entry_url_permalink(blog_entry)} first appeared on #{link_to "#{Spree::Store.current.name} Blog", blog_url}."
    end

    def blog_entry_tag_list_html blog_entry
      blog_entry.tag_list.map {|tag| link_to tag, blog_tag_path(tag) }.join(", ").html_safe
    end

    def blog_entry_category_list_html blog_entry
      blog_entry.category_list.map {|category| link_to category, blog_category_path(category) }.join(", ").html_safe
    end

    def tag_cloud(tags, classes)
      return [] if tags.blank?
      max_count = tags.sort_by(&:count).last.count.to_f
      tags.each do |tag|
        index = ((tag.count / max_count) * (classes.size - 1))
        yield tag, classes[index.nan? ? 0 : index.round]
      end
    end

    def blog_entries_slider(blog_entries)
      items=""

      blog_entries.each do |i|
        if i.blog_entry_image.present?
          items += "<a class='no-a' href='#{blog_entry_permalink(i)}'><div class='im' style='background-image: url(#{(main_app.url_for(i.blog_entry_image.url(:large)))})'></div><div class='half-card-carousel'><h2 class='text-center itle-carousel'>#{i.title}</h2></div></a>"
        end
      end

      content="
              <div class='container' data-hook='itsites_simple_slider'>
                <div class='row'>
                  <div class='slii'>
                    #{items}
                  </div>
                </div>
              </div>
            "
      return raw content
    end
  end
end
