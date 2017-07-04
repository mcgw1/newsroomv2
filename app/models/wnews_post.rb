class WnewsPost < ApplicationRecord
    
        acts_as_votable    
        
    # to avoid url injection I set a default user role to eace post model - devise docs on githum https://github.com/plataformatec/devise/wiki/How-To:-Add-a-default-role-to-a-User  
        belongs_to :user
        
        has_attached_file :post_img, styles: { medium: "400x300>", thumb: "100x100#" }
    validates_attachment_content_type :post_img, content_type: /\Aimage\/.*\z/
        
 
end
