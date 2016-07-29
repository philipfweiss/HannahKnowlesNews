module ApplicationHelper
   def full_title(page_title='')
     base_title = "News By Hannah"
     if page_title.empty?
       base_title
     else
       page_title + ' | ' + base_title
     end
   end

   def link_to_image(image_path, target_link,options={})
     link_to(image_tag(image_path, :border => "0"), target_link, options)
   end
end
