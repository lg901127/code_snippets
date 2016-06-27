require 'rails_helper'

RSpec.describe SnippetsController, type: :controller do
  let(:snippet) {FactoryGirl.create(:snippet)}
  let(:user) {FactoryGirl.create(:user)}
  let(:category) {Category.create(name: "Ruby")}
  describe "snippet_language" do
    it "returns the language name in symbol" do
      # byebug
      @s = Snippet.create(title: "1111", work: "1111", category_id: category.id)
      symbol = controller.snippet_language(@s)
      expect(symbol).to eq(:Ruby)
    end
  end

  describe "#create" do
    context "valid" do
      it "saves record" do
        count_before = Snippet.count
        post :create, snippet: {title: "a", work: "b", category_id: category, private: 0}
        count_after = Snippet.count
        expect(count_after).to eq(count_before + 1)
      end
      it "redirect to snippet page" do
        post :create, snippet: {title: "a", work: "b", category_id: category, private: 0}
        expect(response).to redirect_to(Snippet.last)
      end
    end
  end

  describe "#new" do
    before do
      get :new
    end
    it "renders new template" do
      expect(response).to render_template(:new)
    end
    it "instantiates a new snippet instance variable" do
      expect(assigns(:snippet)).to be_a_new(Snippet)
    end
  end
  describe "#show" do
    context "non-private" do
      before do
        @snippet = FactoryGirl.create(:snippet, {private: 0})
        get :show, id: @snippet.id
      end
      it "renders the show template" do
        expect(response).to render_template(:show)
      end
      it "sets an instance variable to snippet with snippet_id" do
        expect(assigns(:snippet)).to eq(@snippet)
      end
    end

    context "private" do
      before do
        @user_1 = user
        @user_2 = user
        @snippet = FactoryGirl.create(:snippet, {private: 1, user: @user_2})
        session[:user] = @user_1
        get :show, id: @snippet.id
      end
      it "renders the alert page" do
        expect(response).to render_template(:alert)
      end
    end
  end
end
