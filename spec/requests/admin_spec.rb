require 'rails_helper'

RSpec.describe AdminController, type: :controller do
  let(:admin_user) { create(:user, isAdmin: true) }
  let(:regular_user) { create(:user, isAdmin: false) }
  let!(:user1) { create(:user, first_name: "John", last_name: "Doe", email: "john@example.com", role: 'mentor') }
  let!(:user2) { create(:user, first_name: "Jane", last_name: "Smith", email: "jane@example.com", role: 'student') }

  before do
    session[:user_id] = admin_user.id
  end

  describe "GET #index" do
    it "assigns all users to @users and renders the index template" do
      get :index, params: {}
      expect(assigns(:users)).to include(user1, user2)
      expect(response).to render_template(:index)
    end

    it "filters users by search term" do
      get :index, params: { search: "John" }
      expect(assigns(:users)).to include(user1)
      expect(assigns(:users)).not_to include(user2)
    end

    it "filters users by role" do
      get :index, params: { role: "mentor" }
      expect(assigns(:users)).to include(user1)
      expect(assigns(:users)).not_to include(user2)
    end

    it "paginates the result" do
      # Create additional users to force pagination
      25.times { create(:user) }
      get :index, params: { page: 2 }
      expect(assigns(:users).current_page).to eq(2)
    end
  end

  describe "GET #new_specialty" do
    it "assigns a new Specialty and all MentorTypes, and renders the new_specialty template" do
      get :new_specialty
      expect(assigns(:specialty)).to be_a_new(Specialty)
      expect(assigns(:mentor_types)).to eq(MentorType.all)
      expect(response).to render_template(:new_specialty)
    end
  end

  describe "POST #create_specialty" do
    let!(:mentor_type) { create(:mentor_type) }
    let(:valid_attributes) { { name: "Cardiology", short_name: "cardio", mentor_type_id: mentor_type.id } }
    let(:invalid_attributes) { { name: "", short_name: "", mentor_type_id: nil } }

    context "with valid attributes" do
      it "creates a new Specialty" do
        expect {
          post :create_specialty, params: { specialty: valid_attributes }
        }.to change(Specialty, :count).by(1)
      end

      it "redirects to admin index with a success notice" do
        post :create_specialty, params: { specialty: valid_attributes }
        expect(response).to redirect_to(admin_index_path)
        expect(flash[:notice]).to eq('Specialty was successfully created.')
      end
    end

    context "with invalid attributes" do
      it "does not create a Specialty" do
        expect {
          post :create_specialty, params: { specialty: invalid_attributes }
        }.not_to change(Specialty, :count)
      end

      it "renders the new_specialty template with status unprocessable_entity" do
        post :create_specialty, params: { specialty: invalid_attributes }
        expect(response).to render_template(:new_specialty)
        expect(response.status).to eq(422)
      end
    end
  end

  describe "GET #edit_specialty" do
    let!(:specialty) { create(:specialty) }
    it "assigns the requested Specialty and renders the edit_specialty template" do
      get :edit_specialty, params: { id: specialty.id }
      expect(assigns(:specialty)).to eq(specialty)
      expect(response).to render_template(:edit_specialty)
    end
  end

  describe "PATCH #update_specialty" do
    let!(:mentor_type) { create(:mentor_type) }
    let!(:specialty) { create(:specialty, name: "Old Name", mentor_type: mentor_type) }
    let(:new_attributes) { { name: "New Name", short_name: specialty.short_name, mentor_type_id: specialty.mentor_type_id } }

    it "updates the Specialty" do
      patch :update_specialty, params: { id: specialty.id, specialty: new_attributes }
      specialty.reload
      expect(specialty.name).to eq("New Name")
    end

    it "redirects to admin index on success" do
      patch :update_specialty, params: { id: specialty.id, specialty: new_attributes }
      expect(response).to redirect_to(admin_index_path)
    end
  end

  describe "DELETE #destroy_specialty" do
    let!(:specialty) { create(:specialty) }
    it "destroys the Specialty" do
      expect {
        delete :destroy_specialty, params: { id: specialty.id }
      }.to change(Specialty, :count).by(-1)
    end

    it "redirects to admin index with a success notice" do
      delete :destroy_specialty, params: { id: specialty.id }
      expect(response).to redirect_to(admin_index_path)
      expect(flash[:notice]).to eq('Specialty was successfully deleted.')
    end
  end
end