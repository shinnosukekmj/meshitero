class PostImage < ApplicationRecord
    has_one_attached:image
    belongs_to:user
    has_many:post_comments,dependent: :destroy
    has_many:favorites,dependent: :destroy
    
    def get_image
        unless image.attached?
            file_path = Rails.root.join('app/assets/images/no_image.png')
            image.attach(io: File.open(file_path), filename: 'default-image.png', content_type: 'image/png')
        end
        image
    end 
end
