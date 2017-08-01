class SwipesController < ApplicationController

	def index
		if session[:current_pet_id].nil?
			@pet = Pet.find(params[:id])
			session[:current_pet_id] = @pet.id
		end

		current_pet = Pet.find_by(id: session[:current_pet_id])
		possible_match_ids = current_pet.find_pets_ids(session)
		swipe_ids = Swipe.where(swiper_id: current_pet.id).map {|swipe| swipe.swipee_id}
		possible_matches = possible_match_ids - swipe_ids
		@random_possible_match = possible_matches.sample.to_i
		
	end

	def new
	end

	def create
		@swipe = Swipe.create(swipe_params)
		swipee_swipes = Swipe.where(swiper_id: swipe_params[:swipee_id])
		perfect_match = swipee_swipes.find_by(swipee_id: swipe_params[:swiper_id])

		if perfect_match
			Match.create(pet1_id: swipe_params[:swipee_id].to_i, pet2_id: swipe_params[:swiper_id].to_i)
		end
		redirect_to swipes_path
		
	end

	private

	def swipe_params
		params.require(:swipe).permit(:swiper_id, :swipee_id)
	end
end
