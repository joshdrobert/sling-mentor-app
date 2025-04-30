require 'rails_helper'

RSpec.describe AdminController, type: :controller do
  let(:regular_user) { create(:user, isAdmin: false) }
  let(:admin_user) { create(:user, isAdmin: true) }
  let(:student_user) { create(:user, role: 'student', isAdmin: false) }
  let(:mentor_user) { create(:user, role: 'mentor', isAdmin: false) }

  # We need to simulate authentication in our tests
  # Adjust this based on your actual authentication system
  def login_as(user)
    allow(controller).to receive(:current_user).and_return(user)
  end

  describe 'GET #index' do
    context 'when logged in as admin' do
      before { login_as(admin_user) }

      it 'assigns all users to @users' do
        get :index
        expect(assigns(:users)).to eq(User.order(:last_name, :first_name))
      end

      it 'filters users by search term' do
        user1 = create(:user, first_name: 'John', last_name: 'Smith')
        user2 = create(:user, first_name: 'Jane', last_name: 'Doe')

        get :index, params: { search: 'john' }
        expect(assigns(:users)).to include(user1)
        expect(assigns(:users)).not_to include(user2)
      end

      it 'filters users by role' do
        student = create(:user, role: 'student')
        mentor = create(:user, role: 'mentor')

        get :index, params: { role: 'student' }
        expect(assigns(:users)).to include(student)
        expect(assigns(:users)).not_to include(mentor)
      end

      it 'filters users by admin status' do
        admin = create(:user, isAdmin: true)
        non_admin = create(:user, isAdmin: false)

        get :index, params: { isAdmin: 'true' }
        expect(assigns(:users)).to include(admin)
        expect(assigns(:users)).not_to include(non_admin)
      end

      it 'renders the index template' do
        get :index
        expect(response).to render_template(:index)
      end
    end

    context 'when logged in as non-admin' do
      before { login_as(regular_user) }

      it 'redirects to root path' do
        get :index
        expect(response).to redirect_to(root_path)
      end

      it 'sets an alert message' do
        get :index
        expect(flash[:alert]).to eq('You are not authorized to access this page.')
      end
    end
  end

  describe 'GET #show' do
    let(:user) { create(:user) }

    context 'when logged in as admin' do
      before { login_as(admin_user) }

      it 'assigns the requested user to @user' do
        get :show, params: { id: user.id }
        expect(assigns(:user)).to eq(user)
      end

      it 'assigns the user role to @userSubtype' do
        get :show, params: { id: user.id }
        expect(assigns(:userSubtype)).to eq(user.role)
      end

      it 'renders the show template' do
        get :show, params: { id: user.id }
        expect(response).to render_template(:show)
      end
    end

    context 'when logged in as non-admin' do
      before { login_as(regular_user) }

      it 'redirects to root path' do
        get :show, params: { id: user.id }
        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe 'GET #new' do
    context 'when logged in as admin' do
      before { login_as(admin_user) }

      it 'assigns a new user to @user' do
        get :new
        expect(assigns(:user)).to be_a_new(User)
      end

      it 'renders the new template' do
        get :new
        expect(response).to render_template(:new)
      end
    end

    context 'when logged in as non-admin' do
      before { login_as(regular_user) }

      it 'redirects to root path' do
        get :new
        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe 'POST #create' do
    context 'when logged in as admin' do
      before { login_as(admin_user) }

      context 'with valid parameters' do
        let(:valid_student_attributes) do
          {
            first_name: 'John',
            last_name: 'Doe',
            email: 'john.doe@example.com',
            role: 'student',
            phone_number: '123-456-7890'
          }
        end

        let(:valid_student_params) do
          {
            major: 'Computer Science',
            specialty_ids: [create(:specialty).id]
            # classification: 'Junior'
          }
        end

        it 'creates a new user' do
          expect do
            post :create, params: { user: valid_student_attributes, student: valid_student_params }
          end.to change(User, :count).by(1)
        end

        it 'creates associated student record when role is student' do
          expect do
            post :create, params: { user: valid_student_attributes, student: valid_student_params }
          end.to change(Student, :count).by(1)
        end

        it 'creates associated mentor record when role is mentor' do
          mentor_attributes = valid_student_attributes.merge(role: 'mentor')
          mentor_params = { profession: 'Software Engineer' }

          expect do
            post :create, params: { user: mentor_attributes, mentor: mentor_params }
          end.to change(Mentor, :count).by(1)
        end

        it 'redirects to the created user' do
          post :create, params: { user: valid_student_attributes, student: valid_student_params }
          expect(response).to redirect_to(admin_path(User.last))
        end

        it 'sets a success notice' do
          post :create, params: { user: valid_student_attributes, student: valid_student_params }
          expect(flash[:notice]).to eq('User was successfully created.')
        end
      end
    end

    context 'when logged in as non-admin' do
      before { login_as(regular_user) }

      it 'redirects to root path' do
        post :create, params: { user: { first_name: 'Test' } }
        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe 'GET #edit' do
    let(:user) { create(:user) }

    context 'when logged in as admin' do
      before { login_as(admin_user) }

      it 'assigns the requested user to @user' do
        get :edit, params: { id: user.id }
        expect(assigns(:user)).to eq(user)
      end

      it 'assigns user role to @userSubtype' do
        get :edit, params: { id: user.id }
        expect(assigns(:userSubtype)).to eq(user.role)
      end

      it 'renders the edit template' do
        get :edit, params: { id: user.id }
        expect(response).to render_template(:edit)
      end
    end

    context 'when logged in as non-admin' do
      before { login_as(regular_user) }

      it 'redirects to root path' do
        get :edit, params: { id: user.id }
        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe 'PATCH #update' do
    context 'when logged in as admin' do
      before { login_as(admin_user) }

      context 'when updating a student' do
        let(:student_user) { create(:user, role: 'student') }
        let(:student) { create(:student, user: student_user) }

        context 'with valid parameters' do
          let(:new_attributes) do
            {
              first_name: 'Updated',
              last_name: 'Name',
              email: 'updated@example.com'
            }
          end

          let(:student_attributes) do
            {
              major: 'Updated Major'
            }
          end

          it 'updates the user' do
            patch :update, params: { id: student_user.id, user: new_attributes, student: student_attributes }
            student_user.reload
            expect(student_user.first_name).to eq('Updated')
            expect(student_user.last_name).to eq('Name')
            expect(student_user.email).to eq('updated@example.com')
          end

          it 'updates the associated student' do
            puts "Before update - Student major: #{student.major}"
            puts "Student user ID: #{student.user_id}, User ID: #{student_user.id}"
            patch :update, params: { id: student_user.id, user: new_attributes, student: student_attributes }
            student.reload
            puts "After update - Student major: #{student.major}"
            puts "Student params sent: #{student_attributes.inspect}"
            expect(student.major).to eq('Updated Major')
          end

          it 'redirects to the user' do
            patch :update, params: { id: student_user.id, user: new_attributes, student: student_attributes }
            expect(response).to redirect_to(admin_path(student_user))
          end

          it 'sets a success notice' do
            patch :update, params: { id: student_user.id, user: new_attributes, student: student_attributes }
            expect(flash[:notice]).to eq('User was successfully updated.')
          end
        end
      end
    end

    context 'when logged in as non-admin' do
      before { login_as(regular_user) }
      let(:user) { create(:user) }

      it 'redirects to root path' do
        patch :update, params: { id: user.id, user: { first_name: 'Updated' } }
        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:user) { create(:user) }

    context 'when logged in as admin' do
      before { login_as(admin_user) }

      it 'destroys the requested user' do
        expect do
          delete :destroy, params: { id: user.id }
        end.to change(User, :count).by(0)
      end

      it 'redirects to the users list' do
        delete :destroy, params: { id: user.id }
        expect(response).to redirect_to(admin_index_path)
      end

      it 'sets a success notice' do
        delete :destroy, params: { id: user.id }
        expect(flash[:notice]).to eq('User was successfully deleted.')
      end
    end

    context 'when logged in as non-admin' do
      before { login_as(regular_user) }

      it 'does not destroy the user' do
        expect do
          delete :destroy, params: { id: user.id }
        end.not_to change(User, :count)
      end

      it 'redirects to root path' do
        delete :destroy, params: { id: user.id }
        expect(response).to redirect_to(root_path)
      end
    end
  end
end
