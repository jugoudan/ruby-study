class Book < ApplicationRecord
    mount_uploader :avatar, AvatarUploader
end
