class Skill < ApplicationRecord

	def self.all_skills
		skills = { collection: [] }
		Skill.find_each do |skill|
			skills[:collection] << { id: skill.value , name: skill.name }
		end
		skills.to_json
	end

end
