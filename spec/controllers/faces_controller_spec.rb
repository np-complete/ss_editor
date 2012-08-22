require 'spec_helper'

describe FacesController do
  let(:user) { FactoryGirl.create(:user) }
  let!(:character) { FactoryGirl.create(:character) }

  before { sign_in user }

  describe "GET index" do
    it "assigns all faces as @faces" do
      get :index, :character_id => character.id
      assigns(:faces).should == character.faces
    end
  end

  describe "GET show" do
    let(:face) { FactoryGirl.create(:face, character: character) }
    it "assigns the requested face as @face" do
      get :show, :id => face.id, :character_id => character.id
      assigns(:face).should == face
    end
  end

  describe "GET new" do
    it "assigns a new face as @face" do
      get :new, :character_id => character.id
      assigns(:face).should be_new_record
    end
  end

  describe "GET edit" do
    let(:face) { FactoryGirl.create(:face, character: character) }
    it "assigns the requested face as @face" do
      get :edit, :id => face.id, :character_id => character.id
      assigns(:face).should == face
    end
  end

  describe "POST create" do
    context "with valid params" do
      before { Face.any_instance.stub(:save).and_return(true) }

      it "assigns a newly created face as @face" do
        face = Face.new
        Face.should_receive(:new).with({'these' => 'params'}).and_return(face)

        post :create, :face => {'these' => 'params'}, :character_id => character.id
        assigns(:face).should == face
      end

      it "assing character and user" do
        post :create, :face => {}, :character_id => character.id
        face = assigns(:face)
        face.character.should == character
        face.user.should == user
      end

      it "redirects to the created face" do
        post :create, :face => {}, :character_id => character.id
        response.should redirect_to([character, assigns(:face)])
      end
    end

    context "with invalid params" do
      before { Face.any_instance.stub(:save).and_return(false) }

      it "assigns a newly created but unsaved face as @face" do
        post :create, :face => {}, :character_id => character.id
        face = assigns(:face)
        face.should be_new_record
      end

      it "re-renders the 'new' template" do
        post :create, :face => {}, :character_id => character.id
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    let(:face) { FactoryGirl.create(:face, character: character) }
    context "with valid params" do
      before { Face.any_instance.stub(:update_attributes).and_return(true) }
      it "assigns the face as @face" do
        put :update, :id => face.id, :face => {}, :character_id => character.id
        assigns(:face).should == face
      end

      it "updates the requested face" do
        Face.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => face.id, :face => {'these' => 'params'}, :character_id => character.id
      end

      it "redirects to the face" do
        put :update, :id => face.id, :character_id => character.id
        response.should redirect_to([character, face])
      end
    end

    context "with invalid params" do
      before { Face.any_instance.stub(:update_attributes).and_return(false) }

      it "re-renders the 'edit' template" do
        put :update, :id => face.id, :character_id => character.id
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    let(:face) { FactoryGirl.create(:face, character: character) }
    it "destroys the requested face" do
      Face.any_instance.should_receive(:destroy)
      delete :destroy, :id => face.id, :character_id => character.id
      assigns(:face).should == face
    end

    it "redirects to the faces list" do
      delete :destroy, :id => face.id, :character_id => character.id
      response.should redirect_to([character, :faces])
    end
  end
end
