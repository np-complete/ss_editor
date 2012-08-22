require 'spec_helper'

describe StoriesController do
  let(:user) { FactoryGirl.create(:user) }
  let(:story) { FactoryGirl.create(:story, user: user) }
  before { sign_in user }

  describe "GET index" do
    it "assigns all stories as @stories" do
      @obj = Object.new
      Story.stub(:where).with(:published => true) { @obj }
      @obj.stub(:all).with(:include => [:user]).and_return(:stories)
      get :index
      assigns(:stories).should == :stories
    end
  end

  describe "GET show" do
    it "assigns the requested story as @story" do
      get :show, :id => story.id
      assigns(:story).should == story
    end
  end

  describe "GET new" do
    it "assigns a new story as @story" do
      get :new
      assigns(:story).should be_new_record
    end
  end

  describe "GET edit" do
    it "assigns the requested story as @story" do
      get :edit, :id => story.id
      assigns(:story).should == story
    end
  end

  describe "POST create" do
    let!(:new_story) { FactoryGirl.build(:story) }
    before { Story.stub(:new).and_return(new_story) }
    describe "with valid params" do
      it "assigns a newly created story as @story" do
        Story.should_receive(:new).with({'these' => 'params'}).and_return(new_story)
        new_story.should_receive(:user=).with(user)
        post :create, :story => {'these' => 'params'}
        assigns(:story).should == new_story
      end

      it "redirects to the created story" do
        post :create, :story => {}
        response.should redirect_to([new_story, :dialogs])
      end
    end

    describe "with invalid params" do
      before { Story.any_instance.stub(:save).and_return(false) }
      it "not saved" do
        post :create, :story => {}
        assigns(:story).should be_new_record
      end

      it "re-renders the 'new' template" do
        post :create, :story => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      before { Story.any_instance.stub(:update_attributes).and_return(true) }
      it "updates the requested story" do
        Story.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => story.id, :story => {'these' => 'params'}
        assigns(:story).should == story
      end

      it "redirects to the story" do
        put :update, :id => story.id
        response.should redirect_to([story])
      end
    end

    describe "with invalid params" do
      before { Story.any_instance.stub(:update_attributes).and_return(false) }
      it "assigns the story as @story" do
        put :update, :id => story.id
        assigns(:story).should == story
      end

      it "re-renders the 'edit' template" do
        put :update, :id => story.id
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    before { Story.any_instance.stub(:destroy).and_return(true) }
    it "destroys the requested story" do
      Story.any_instance.should_receive(:destroy)
      delete :destroy, :id => story.id
      assigns(:story).should == story
    end

    it "redirects to the stories list" do
      delete :destroy, :id => story.id
      response.should redirect_to(dashboard_url)
    end
  end

end
