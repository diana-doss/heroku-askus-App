class Question < ApplicationRecord 
      acts_as_votable

	 validates_presence_of :question
	 validates_presence_of :description
     validates_presence_of :skills

	 	 has_many :answers, dependent: :destroy
  # validates :title, presence: true,
  #                   length: { minimum: 5 }

 has_many :votes
 #     validates :description, presence: true,
 #                    length: { minimum: 5 }

end
 