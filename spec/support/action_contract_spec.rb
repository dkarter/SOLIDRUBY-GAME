shared_examples "action" do
	context "responds to" do
		it "action attributes" do
			expect(action).to respond_to(:action_attributes)
		end

		it "activate" do
			expect(action).to respond_to(:activate)
		end


		it "success" do
			expect(action).to respond_to(:success)
		end


		it "failure" do
			expect(action).to respond_to(:failure)
		end

		it "owner" do
			expect(action).to respond_to(:owner)
		end

		it "dicepool" do
			expect(action).to respond_to(:dicepool)
		end

		it "attribute" do
			expect(action).to respond_to(:attribute)
		end

		it "difficulty" do
			expect(action).to respond_to(:difficulty)
		end


	end
end
