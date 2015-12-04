class Search < ActiveRecord::Base

	def search_pets

		pets = Pet.all

		pets = pets.where(["age LIKE ?",age]) if age.present?
		pets = pets.where(["gender LIKE ?",gender]) if gender.present?
		pets = pets.where(["breeds LIKE ?",breeds]) if breeds.present?
		pets = pets.where(["city LIKE ?",city]) if city.present?

		return pets
	end

end
