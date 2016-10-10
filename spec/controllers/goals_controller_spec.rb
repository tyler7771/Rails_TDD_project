require 'rails_helper'

RSpec.describe GoalsController, type: :controller do
  describe "GET #new" do
    it "renders new goals page" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    before :each do
      sign_up_user
    end
    
    it "creates new goal with valid params" do
      post :create, goal: { title: "Title", details: "this is a detail", user_id: 1 }
      expect(response).to redirect_to(user_path(User.find(goal.user_id)))
    end

    it "does not create new goal with invalid params" do
      post :create, goal: {title: "John"}
      expect(response).to render_template(:new)
    end
  end

  describe "GET #show" do
    before(:each) { create_goal }

    it "renders goal's page" do
      get :show, id: Goal.find_by(title: "Lose 500 pounds").id
      expect(response).to redirect_to(goal_path(Goal.find_by(title: "Lose 500 pounds")))
    end
  end

  describe "GET #edit" do
    it "renders edit goals page" do
      get :edit
      expect(response).to render_template(:edit)
    end
  end

  describe "Patch #update" do
    it "updates goal with valid params" do
      patch :update, goal: { title: "Title2", details: "this is another detail", user_id:1 }
      expect(response).to redirect_to(user_path(User.find(goal.user_id)))
    end

    it "does not update goal with invalid params" do
      patch :update, goal: {title: "John"}
      expect(response).to render_template(:new)
    end
  end

  describe "DELETE #destroy" do
    before(:each) { create_goal }

    it "deletes a goal" do
      delete :destroy, id: Goal.find_by(title: "Lose 500 pounds").id
      expect(response).to redirect_to(user_path(User.find(goal.user_id)))
    end
  end
end
