module MakerHelper

	def verify_maker(params)
		maker = Maker.new(name: params[:maker_name], division_id: params[:division], identifier: params[:identifier])

		if maker.valid?
			maker.save
		else
			maker = Maker.find_by identifier: params[:identifier]
		end
		
		maker
	end

	module_function :verify_maker;

end
