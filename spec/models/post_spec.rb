require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "titleが空の場合" do
    before do
      @post = Post.create(title: nil, body: "aaa")
    end

    it "validationがfalseになること" do
      expect(@post.valid?).to be false
    end
  end

  describe "bodyが空の場合" do
    before do
      @post = Post.create(title: "aaa", body: nil)
    end

    it "validationがfalseになること" do
      expect(@post.valid?).to be false
    end
  end
end
