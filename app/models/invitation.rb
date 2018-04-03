class Invitation < ApplicationRecord

	validates :email, length: {minimum: 3}, format: {with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i, message: "is in invalid format!"}
end
