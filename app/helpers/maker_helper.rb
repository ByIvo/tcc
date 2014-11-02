module MakerHelper

	def verify_maker(paramns)
		@maker = Maker.create(name: params[:maker_name])
	end

end
