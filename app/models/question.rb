class Question < ApplicationRecord 
	resourcify
	 has_many :replies, dependent: :destroy
	  belongs_to :user
      acts_as_votable

	 validates_presence_of :question
	 validates_presence_of :description
     validates_presence_of :skills

	 	
  # validates :title, presence: true,
  #                   length: { minimum: 5 }

 has_many :votes
 #     validates :description, presence: true,
 #                    length: { minimum: 5 }

 def votes_count
 	self.get_upvotes.size - self.get_downvotes.size
 end

end
 