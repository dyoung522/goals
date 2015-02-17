require 'rails_helper'

RSpec.describe GoalsController, :type => :controller do

  # This should return the minimal set of attributes required to create a valid
  # Goal. As you add validations to Goal, be sure to adjust the attributes here as well.
  let(:valid_attributes) {
    {
        topic: 'Topic',
        date_start: DateTime.now,
        date_due: nil,
        date_completed: nil,
    }
  }

  let(:invalid_attributes) {
    {
        topic: '',
        date_start: nil,
        date_due: nil,
        date_completed: nil,
    }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # GoalsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe 'GET index' do
    it 'assigns all goals as @goals' do
      goal = Goal.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:goals)).to eq([goal])
    end
  end

  describe 'GET show' do
    it 'assigns the requested goal as @goal' do
      goal = Goal.create! valid_attributes
      get :show, {:id => goal.to_param}, valid_session
      expect(assigns(:goal)).to eq(goal)
    end
  end

  describe 'GET new' do
    it 'assigns a new goal as @goal' do
      get :new, {}, valid_session
      expect(assigns(:goal)).to be_a_new(Goal)
    end
  end

  describe 'GET edit' do
    it 'assigns the requested goal as @goal' do
      goal = Goal.create! valid_attributes
      get :edit, {:id => goal.to_param}, valid_session
      expect(assigns(:goal)).to eq(goal)
    end
  end

  describe 'POST create' do
    describe 'with valid params' do
      it 'creates a new Goal' do
        expect {
          post :create, {:goal => valid_attributes}, valid_session
        }.to change(Goal, :count).by(1)
      end

      it 'assigns a newly created goal as @goal' do
        post :create, {:goal => valid_attributes}, valid_session
        expect(assigns(:goal)).to be_a(Goal)
        expect(assigns(:goal)).to be_persisted
      end

      it 'redirects to the created goal' do
        post :create, {:goal => valid_attributes}, valid_session
        expect(response).to redirect_to(Goal.last)
      end
    end

    describe 'with invalid params' do
      it 'assigns a newly created but unsaved goal as @goal' do
        post :create, {:goal => invalid_attributes}, valid_session
        expect(assigns(:goal)).to be_a_new(Goal)
      end

      it 're-renders the "new" template' do
        post :create, {:goal => invalid_attributes}, valid_session
        expect(response).to render_template('new')
      end
    end
  end

  describe 'PUT update' do
    describe 'with valid params' do
      let(:new_attributes) {
        {
            topic: 'new topic',
            date_start: nil,
            date_due: DateTime.new + 1.week,
            date_completed: nil
        }
      }

      it 'updates the requested goal' do
        goal = Goal.create! valid_attributes
        put :update, {:id => goal.to_param, :goal => new_attributes}, valid_session
        goal.reload
        expect(goal.topic).to eq new_attributes[:topic]
        expect(goal.date_due).to eq new_attributes[:date_due]
        expect(goal.date_start).to eq valid_attributes[:date_start]
      end

      it 'assigns the requested goal as @goal' do
        goal = Goal.create! valid_attributes
        put :update, {:id => goal.to_param, :goal => valid_attributes}, valid_session
        expect(assigns(:goal)).to eq(goal)
      end

      it 'redirects to the goal' do
        goal = Goal.create! valid_attributes
        put :update, {:id => goal.to_param, :goal => valid_attributes}, valid_session
        expect(response).to redirect_to(goal)
      end
    end

    describe 'with invalid params' do
      it 'assigns the goal as @goal' do
        goal = Goal.create! valid_attributes
        put :update, {:id => goal.to_param, :goal => invalid_attributes}, valid_session
        expect(assigns(:goal)).to eq(goal)
      end

      it 're-renders the "edit" template' do
        goal = Goal.create! valid_attributes
        put :update, {:id => goal.to_param, :goal => invalid_attributes}, valid_session
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE destroy' do
    it 'destroys the requested goal' do
      goal = Goal.create! valid_attributes
      expect {
        delete :destroy, {:id => goal.to_param}, valid_session
      }.to change(Goal, :count).by(-1)
    end

    it 'redirects to the goals list' do
      goal = Goal.create! valid_attributes
      delete :destroy, {:id => goal.to_param}, valid_session
      expect(response).to redirect_to(goals_url)
    end
  end

end
