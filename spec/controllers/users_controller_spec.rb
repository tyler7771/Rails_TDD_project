require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET #new" do
    it "renders new users page" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    it "creates new user with valid params" do
      post :create, user: { username: "Jim", password: "123456"}
      expect(response).to redirect_to(user_path(User.find_by(username: "Jim")))
    end

    it "does not create new user with invalid params" do
      post :create, user: {username: "John"}
      expect(response).to render_template(:new)
    end
  end

  describe "GET #show" do
    before(:each) { create_user }

    it "renders user's page" do
      get :show, id: User.find_by(username: "Jim").id
      expect(response).to redirect_to(user_path(User.find_by(username: "Jim")))
    end
  end

  describe "GET #index" do
    it "renders all users page" do
      get :index
      expect(response).to render_template(:index)
    end
  end
end
